Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id A02B575CF1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:50:45 +0000 (UTC)
Received: by igvg19 with SMTP id g19so67394930igv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 01:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=z5vs1oB22E39Rto2OoQ5gog/urQKxAjSE7RejkZCB0U=;
	b=MO+s/zDHc4DpOM9iKhDtCMM1OVEFfOuZl+3iT0omJOpgHV1nRokm3QryTz9fbOhjKl
	8fBgGkygRPx+dXyVA1mDlUBuEBbZ8W78AjiFkZVmT0KE0cSCHANe563qA4AniePpiaTL
	joUj7orRxKK03wQ3sR2F025hg2TGJus4T/nUD44yaR1xlW7XlRfo9Vu7Mo6LQr1ciXha
	+4yp8KDLiTi5CkZDfWDOnI/MxvI86GqCLUFm6jOopQIophnQDiJJd/CRX4aDV5Aa1qE2
	VeJnvRiTS3eVLJrY1JrROGbHnrwYiAcTryu2Jufsr6J/LKLUvc3Cu+/Sfcu/ZeyCO9UA
	6VCg==
MIME-Version: 1.0
X-Received: by 10.50.112.99 with SMTP id ip3mr32409152igb.78.1447235445324;
	Wed, 11 Nov 2015 01:50:45 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Wed, 11 Nov 2015 01:50:45 -0800 (PST)
In-Reply-To: <1447235265-5602-1-git-send-email-jackie.huang@windriver.com>
References: <1447235265-5602-1-git-send-email-jackie.huang@windriver.com>
Date: Wed, 11 Nov 2015 10:50:45 +0100
Message-ID: <CALbNGRTQuQ2s=0a6CS_i60KK0y5x+eYBWh2LR9N0uEAYEM-a8g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] networkmanager: upgrade to 1.0.6
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
X-List-Received-Date: Wed, 11 Nov 2015 09:50:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 11, 2015 at 10:47 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Changes:
> - add packageconfig for libnewt but not enable by default.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../{networkmanager_1.0.4.bb => networkmanager_1.0.6.bb}             | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.4.bb => networkmanager_1.0.6.bb} (92%)
>
> diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> similarity index 92%
> rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
> rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> index 310a83b..5bb3cc8 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.4.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> @@ -12,8 +12,8 @@ SRC_URI = " \
>      ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
>      file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
>  "
> -SRC_URI[md5sum] = "7eabef7bd3bbdd6dc0473dd32aeac924"
> -SRC_URI[sha256sum] = "e4099fa2f4f4b8d95d0ad9fdd03ec20960845085fa500bf79aecbf54cee018c9"
> +SRC_URI[md5sum] = "00f5f9ec69725a9f9b99366853c6f73e"
> +SRC_URI[sha256sum] = "38ea002403e3b884ffa9aae25aea431d2a8420f81f4919761c83fb92648254bd"
>
>  S = "${WORKDIR}/NetworkManager-${PV}"
>
> @@ -42,6 +42,7 @@ PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
>  PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
>  PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
>  PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
> +PACKAGECONFIG[nmtui] = "--with-nmtui=yes,--with-nmtui=no,libnewt"
>  PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
>
>  PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion"
> --
> 1.9.1
There was already a series sent yesterday updating networkmanager to 1.06

Andreas

