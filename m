Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 467 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Mar 2015 09:20:30 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2614E65C88
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id AC06F31513A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 10:12:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id tSKI2rObmMEN
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 10:12:41 +0100 (CET)
Received: from [172.22.22.61] (55d473d5.access.ecotel.net [85.212.115.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D871B31513A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 10:12:40 +0100 (CET)
Message-ID: <54F6CC88.8080402@opendreambox.org>
Date: Wed, 04 Mar 2015 10:12:40 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1425449908-22847-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1425449908-22847-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH][meta-oe] samba: disable services for sysvinit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2015 09:20:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Dear Wenzong Fan,

On 04.03.2015 07:18, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> The smb, nmb, winbind services have been disabled for systemd system
> by default, disable them for sysvinit as well.

why would anybody install these services without the desire for using
them? Did the patch disabling them for systemd get merged by mistake? I
remember Paul objecting to it.

Regards,
Andreas

> 
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta-oe/recipes-connectivity/samba/samba.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
> index abfd5ca..99216ce 100644
> --- a/meta-oe/recipes-connectivity/samba/samba.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
> @@ -69,7 +69,7 @@ INITSCRIPT_NAME_winbind = "winbind"
>  # No dependencies, goes in at level 20 (NOTE: take care with the
>  # level, later levels put the shutdown later too - see the links
>  # in rc6.d, the shutdown must precede network shutdown).
> -INITSCRIPT_PARAMS = "defaults"
> +INITSCRIPT_PARAMS = "disable"
>  CONFFILES_${PN} = "${sysconfdir}/samba/smb.conf"
>  
>  do_configure_prepend () {
> 


