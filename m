Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Msvb9-0003Il-Ql for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 11:35:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MsvaR-0000oR-7w
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 11:35:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 11:35:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 11:35:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 30 Sep 2009 11:34:08 +0200
Message-ID: <h9v8mg$ivq$2@ger.gmane.org>
References: <1254297107-3475-1-git-send-email-dp@xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1254297107-3475-1-git-send-email-dp@xora.org.uk>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: core glibc. Without this oabi compile of glibc doesnt work.
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
X-List-Received-Date: Wed, 30 Sep 2009 09:35:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@openembedded.org>


On 30-09-09 09:51, Graeme Gregory wrote:
> Graeme
>
>  From 74bad1b44410e3df4d13db286e008b5777146340 Mon Sep 17 00:00:00 2001
> From: Graeme Gregory<dp@xora.org.uk>
> Date: Wed, 30 Sep 2009 08:50:17 +0100
> Subject: [PATCH] glibc_2.9.bb : add already existing OE patch arm-lowlevellock-include-tls.patch
>
> This is required to get glibc 2.9 to build on arm oabi. eglibc already
> includes this patch and the patch is already in OE
>
> Signed-off-by: Graeme Gregory<dp@xora.org.uk>
> ---
>   recipes/glibc/glibc_2.9.bb |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
> index c3ebc16..56a6ff8 100644
> --- a/recipes/glibc/glibc_2.9.bb
> +++ b/recipes/glibc/glibc_2.9.bb
> @@ -64,6 +64,7 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
>              file://march-i686.patch;patch=1;pnum=0 \
>   	   file://tls_i486.patch;patch=1 \
>   	   file://glibc-2.9-use-_begin.patch;patch=1 \
> +           file://arm-lowlevellock-include-tls.patch;patch=1 \
>              "
>
>   # Build fails on sh3 and sh4 without additional patches




