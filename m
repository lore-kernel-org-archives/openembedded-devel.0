Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwEJz-0004Pt-Aj
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 13:39:28 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwEFj-0001qS-6r
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 11:35:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 11:35:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 11:35:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 13:30:49 +0200
Message-ID: <gskap9$bg$2@ger.gmane.org>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-12-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240241104-21935-12-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 1/1] uclibc: use LDFLAGS for ldd and ldconfig (fixes QA error)
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
X-List-Received-Date: Tue, 21 Apr 2009 11:39:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@openembedded.org>

On 20-04-09 17:25, Marcin Juszkiewicz wrote:
> From: Dirk Opfer<dirk@do13.de>
>
> ---
>   recipes/uclibc/uclibc.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
> index be085ab..f2f3e9b 100644
> --- a/recipes/uclibc/uclibc.inc
> +++ b/recipes/uclibc/uclibc.inc
> @@ -208,7 +208,7 @@ do_install() {
>   		rmdir ${D}/usr/bin
>   	fi
>
> -        oe_runmake utils
> +        oe_runmake "SSP_ALL_CFLAGS=${TARGET_LINK_HASH_STYLE}" utils
>           oe_runmake STRIPTOOL=true PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
>                   install_utils
>   	




