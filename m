Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwVxd-00030Q-3A
	for openembedded-devel@openembedded.org; Wed, 22 Apr 2009 08:29:33 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwVtG-00056M-H0
	for openembedded-devel@openembedded.org; Wed, 22 Apr 2009 06:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 22 Apr 2009 06:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Apr 2009 06:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Apr 2009 08:22:50 +0200
Message-ID: <gsmd3q$62k$2@ger.gmane.org>
References: <1240380414-8068-1-git-send-email-denis@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240380414-8068-1-git-send-email-denis@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] base.bbclass: Combine all checksum.ini files found in BBPATH
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
X-List-Received-Date: Wed, 22 Apr 2009 06:29:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-04-09 08:06, Denys Dmytriyenko wrote:
> From: Petri Lehtinen<petri.lehtinen@inoi.fi>

Acked-by: Koen Kooi <koen@openembedded.org>

>
> This makes it possible for overlays to have checksum.ini.
>
> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
> ---
>   classes/base.bbclass |   22 +++++++++++++---------
>   1 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 9ec705b..e5fd814 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -40,12 +40,11 @@ def base_path_relative(src, dest):
>       return sep.join(relpath)
>
>   # for MD5/SHA handling
> -def base_chk_load_parser(config_path):
> +def base_chk_load_parser(config_paths):
>       import ConfigParser, os, bb
>       parser = ConfigParser.ConfigParser()
> -    if not len(parser.read(config_path)) == 1:
> -        bb.note("Can not open the '%s' ini file" % config_path)
> -        raise Exception("Can not open the '%s'" % config_path)
> +    if len(parser.read(config_paths))<  1:
> +        raise ValueError("no ini files could be found")
>
>       return parser
>
> @@ -620,13 +619,18 @@ python base_do_fetch() {
>
>   	# Verify the SHA and MD5 sums we have in OE and check what do
>   	# in
> -	check_sum = bb.which(bb.data.getVar('BBPATH', d, True), "conf/checksums.ini")
> -	if not check_sum:
> -		bb.note("No conf/checksums.ini found, not checking checksums")
> -		return
> +	checksum_paths = bb.data.getVar('BBPATH', d, True).split(":")
> +
> +	# reverse the list to give precedence to directories that
> +	# appear first in BBPATH
> +	checksum_paths.reverse()
>
> +	checksum_files = ["%s/conf/checksums.ini" % path for path in checksum_paths]
>   	try:
> -		parser = base_chk_load_parser(check_sum)
> +		parser = base_chk_load_parser(checksum_files)
> +	except ValueError:
> +		bb.note("No conf/checksums.ini found, not checking checksums")
> +		return
>   	except:
>   		bb.note("Creating the CheckSum parser failed")
>   		return




