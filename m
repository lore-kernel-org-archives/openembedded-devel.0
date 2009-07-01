Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MM5c7-0003ls-TD
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:37:03 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MM5QU-0005jn-MM
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 19:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Jul 2009 19:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Jul 2009 21:16:11 +0200
Message-ID: <h2gclr$bts$6@ger.gmane.org>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
	<1246474461-16671-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090622 Shredder/3.0b3pre
In-Reply-To: <1246474461-16671-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 006/125] base.bbclass: check_gcc3 needs to check for gcc-3.4.6 first. Comment on what this function is used for primarily. The default gcc3-native that we build is called 'gcc-3.4.6' so look for that one first.
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
X-List-Received-Date: Wed, 01 Jul 2009 19:37:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-07-09 20:54, Marcin Juszkiewicz wrote:
> From: Tom Rini<trini@embeddedalley.com>
>
>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   classes/base.bbclass |    5 ++++-
>   1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 270b05d..0baf0e0 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -1236,8 +1236,11 @@ def check_app_exists(app, d):
>   	return len(which(path, app)) != 0
>
>   def check_gcc3(data):
> +	# Primarly used by qemu to make sure we have a workable gcc-3.4.x.
> +	# Start by checking for the program name as we build it, was not
> +	# all host-provided gcc-3.4's will work.
>
> -	gcc3_versions = 'gcc-3.4 gcc34 gcc-3.4.4 gcc-3.4.6 gcc-3.4.7 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
> +	gcc3_versions = 'gcc-3.4.6 gcc-3.4.4 gcc34 gcc-3.4.7 gcc-3.3 gcc33 gcc-3.3.6 gcc-3.2 gcc32'
>
>   	for gcc3 in gcc3_versions.split():
>   		if check_app_exists(gcc3, data):




