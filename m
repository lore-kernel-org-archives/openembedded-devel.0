Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Og1YZ-0005uC-E6
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 22:24:20 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Og1Y3-0005Qm-63 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 13:23:47 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 2 Aug 2010 13:23:46 -0700
Received: from [172.30.80.29] ([172.30.80.29]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 2 Aug 2010 14:23:45 -0600
Message-ID: <4C57294F.3030804@mentor.com>
Date: Mon, 02 Aug 2010 13:23:43 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1280309434.7083.8.camel@utx.lan>
	<4C503315.8090009@gmail.com>	<20100728140613.GB19135@mx.loc>
	<20100728143208.GC19135@mx.loc>	<20100802171317.GF29814@mx.loc>
	<20100802174910.GA1503@gmail.com>	<20100802180716.GG29814@mx.loc>
	<20100802181343.GA1513@gmail.com> <20100802182044.GA6299@mx.loc>
In-Reply-To: <20100802182044.GA6299@mx.loc>
X-OriginalArrivalTime: 02 Aug 2010 20:23:45.0801 (UTC)
	FILETIME=[9B9AD790:01CB3280]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC]: automatically depend xz compressed URIs on xz-native [was: Re: bitbake: staging of binary over symlink breaks sysroot (lzma x xz)]
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
X-List-Received-Date: Mon, 02 Aug 2010 20:24:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Bernhard Reutner-Fischer wrote:
> On Mon, Aug 02, 2010 at 11:13:43AM -0700, Khem Raj wrote:
>> On (02/08/10 20:07), Bernhard Reutner-Fischer wrote:
>>> On Mon, Aug 02, 2010 at 10:49:10AM -0700, Khem Raj wrote:
>>>> On (02/08/10 19:13), Bernhard Reutner-Fischer wrote:
>>>>> On Wed, Jul 28, 2010 at 04:32:08PM +0200, Bernhard Reutner-Fischer wrote:
>>>>>> On Wed, Jul 28, 2010 at 04:06:13PM +0200, Bernhard Reutner-Fischer wrote:
>>>>>>> On Wed, Jul 28, 2010 at 03:39:33PM +0200, Marco Cavallini wrote:
>>>>>>>> Stanislav Brabec ha scritto, Il 28/07/2010 11:30:
>>>>> comments on the attached RFC patch?
>>>>> TIA,
>>>> -snip-
>>>>> @@ -420,12 +424,16 @@ python () {
>>>>>  
>>>>>      # unzip-native should already be staged before unpacking ZIP recipes
>>>>>      need_unzip = bb.data.getVar('NEED_UNZIP_FOR_UNPACK', d, 1)
>>>>> -    src_uri = bb.data.getVar('SRC_URI', d, 1)
>>>>>  
>>>>> -    if ".zip" in src_uri or need_unzip == "1":
>>>>> +    if ".zip" in srcuri or need_unzip == "1":
>>>>>          depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
>>>>>          depends = depends + " unzip-native:do_populate_sysroot"
>>>>>          bb.data.setVarFlag('do_unpack', 'depends', depends, d)
>>>>> +    for ext in ['xz']: #['gzip', 'bzip2', 'xz']:
>>>>> +        if '.' + ext in srcuri:
>>>>> +            depends = bb.data.getVarFlag('do_unpack', 'depends', d) or ""
>>>>> +            depends += ' ' + ext + '-native:do_populate_sysroot'
>>>>> +            bb.data.setVarFlag('do_unpack', 'depends', depends, d)
>>>> what does above hunk do.
>>> srcuri=proto://some.thing.tar.xz
>>> if ".xz" in srcuri then depend do_unpack on '
>>> xz-native:do_populate_sysroot'
>>>
>>> Re-reading the hunk it should better read:
>>>   import re
>>>   for (ext,tool) in [('xz','xz')]: # ('gz','gzip'),('bz','bzip2')
>>                                     ^
>>
>> that will turn the rest into comment is that ok ?          
> 
> I didn't try the other two, so yes, it's ok.

Well, now that it's a tuple zip/unzip could go in there for sure, and we 
leave gz/gzip and bz/bzip2 commented out for now.  Later we could add 
them, and put them into the default ASSUME_PROVIDED list in local.conf 
or something...

-- 
Tom Rini
Mentor Graphics Corporation


