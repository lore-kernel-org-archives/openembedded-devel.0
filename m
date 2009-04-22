Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LwfJS-0006Qe-Q4
	for openembedded-devel@openembedded.org; Wed, 22 Apr 2009 18:28:43 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090422162408.ZSG6112.fed1rmmtao102.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Apr 2009 12:24:08 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id igQ61b0014dMFYL04gQ6HK; Wed, 22 Apr 2009 12:24:08 -0400
X-Authority-Analysis: v=1.0 c=1 a=n9qIqJPtQNMA:10 a=YnjJ1TpyyGYA:10
	a=Q4-j1AaZAAAA:8 a=4HVRqb_MAAAA:8 a=0gcC27t9AAAA:8 a=22pK5S-mAAAA:8
	a=QGiNEF9uRetAHR_qvK0A:9 a=obOB9Gc7f0T4DzvR9fO3Z0coZU8A:4
	a=UcWZWmDdwLsA:10
	a=k-kO48AawpMA:10 a=4KgpRpU3nOMA:10 a=4LlnTlE8C9c-eeOY:21
	a=Lp8_gCkHJCDEDPYB:21
X-CM-Score: 0.00
Date: Wed, 22 Apr 2009 09:24:05 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090422162405.GS17629@smtp.west.cox.net>
References: <1240380414-8068-1-git-send-email-denis@denix.org>
	<gsmd3q$62k$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gsmd3q$62k$2@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [STABLE][PATCH] base.bbclass: Combine all checksum.ini	files found in BBPATH
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Apr 2009 16:28:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2009 at 08:22:50AM +0200, Koen Kooi wrote:
> On 22-04-09 08:06, Denys Dmytriyenko wrote:
>> From: Petri Lehtinen<petri.lehtinen@inoi.fi>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Tom Rini <trini@embeddedalley.com>

>
>>
>> This makes it possible for overlays to have checksum.ini.
>>
>> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
>> ---
>>   classes/base.bbclass |   22 +++++++++++++---------
>>   1 files changed, 13 insertions(+), 9 deletions(-)
>>
>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>> index 9ec705b..e5fd814 100644
>> --- a/classes/base.bbclass
>> +++ b/classes/base.bbclass
>> @@ -40,12 +40,11 @@ def base_path_relative(src, dest):
>>       return sep.join(relpath)
>>
>>   # for MD5/SHA handling
>> -def base_chk_load_parser(config_path):
>> +def base_chk_load_parser(config_paths):
>>       import ConfigParser, os, bb
>>       parser = ConfigParser.ConfigParser()
>> -    if not len(parser.read(config_path)) == 1:
>> -        bb.note("Can not open the '%s' ini file" % config_path)
>> -        raise Exception("Can not open the '%s'" % config_path)
>> +    if len(parser.read(config_paths))<  1:
>> +        raise ValueError("no ini files could be found")
>>
>>       return parser
>>
>> @@ -620,13 +619,18 @@ python base_do_fetch() {
>>
>>   	# Verify the SHA and MD5 sums we have in OE and check what do
>>   	# in
>> -	check_sum = bb.which(bb.data.getVar('BBPATH', d, True), "conf/checksums.ini")
>> -	if not check_sum:
>> -		bb.note("No conf/checksums.ini found, not checking checksums")
>> -		return
>> +	checksum_paths = bb.data.getVar('BBPATH', d, True).split(":")
>> +
>> +	# reverse the list to give precedence to directories that
>> +	# appear first in BBPATH
>> +	checksum_paths.reverse()
>>
>> +	checksum_files = ["%s/conf/checksums.ini" % path for path in checksum_paths]
>>   	try:
>> -		parser = base_chk_load_parser(check_sum)
>> +		parser = base_chk_load_parser(checksum_files)
>> +	except ValueError:
>> +		bb.note("No conf/checksums.ini found, not checking checksums")
>> +		return
>>   	except:
>>   		bb.note("Creating the CheckSum parser failed")
>>   		return
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Tom Rini


