Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 576 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Nov 2015 13:09:15 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6C475A31
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 2C632315C5F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:59:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id djBOMw42UxbO
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:59:35 +0100 (CET)
Received: from [172.22.22.61] (55d4588a.access.ecotel.net [85.212.88.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id CD923315C4B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:59:35 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1446722814-21435-1-git-send-email-funman@videolan.org>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <563B52B7.1000403@opendreambox.org>
Date: Thu, 5 Nov 2015 13:59:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446722814-21435-1-git-send-email-funman@videolan.org>
Subject: Re: [meta-multimedia][PATCH] VLC: make gnome-vfs configurable
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
X-List-Received-Date: Thu, 05 Nov 2015 13:09:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hello Rafaël,

On 05.11.2015 12:26, Rafaël Carré wrote:
> ---
> XXX: to be cherry-picked together with <1446652999-24545-3-git-send-email-funman@videolan.org>
> 
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> index bf08405..ce6e52d 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -60,6 +60,7 @@ PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
>  PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
>  PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
>  PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
> +PACKAGECONFIG[gnome-vfs] = "--enable-gnomevfs,--disable-gnome-vfs, gnome-vfs"

this looks like a typo (missing dash in enable switch?).

Regards,
Andreas

>  
>  do_configure_prepend() {
>      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
> 


