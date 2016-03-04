Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id ED7A6731F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 08:59:32 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id c3so47575371vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2016 00:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=6eDn899doN3a91H0aewfHnW3sdsLH4uP2+d82UeA4yg=;
	b=mcP434Y4fBK1QTc3pgTHNWWGJ04kzPCtCyrU79OLy1gj3PX/54K5Zlec/7YqjHcQ+z
	ytLHpw7wbHNblkpxqSdgcInjFhtRacyp5GRbzXrJdpShhePHkWmeKIs4di+8HMUMuzHm
	EtSVr1OCz1xg3rkAvnM37V5dPXHctfN8/9/S7odF53tCH35DZHCHo6uE2SfcApbVIGN/
	GnlHPhnOWd/MOL2iPACGTp6fSEeVJ1z4d1m0PSVOGJTDLWyxSc9icFklubNdoMjawL1V
	HDTNbTFUrDoKtxN16ned/v/AK91rn6V4Scd61U0UWmSvNDKkTPkECZcVkXDSlmQ4sha1
	xL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-transfer-encoding;
	bh=6eDn899doN3a91H0aewfHnW3sdsLH4uP2+d82UeA4yg=;
	b=brvgOK0mOj5dp2QI5yh4mb1t6yvsWKWLGykX8YKiMtB+IDdNJMYk7s1nly/olad1wC
	vzeHMdlqR3bY9OGSvr6QpFbfNea7anenyJLici+1NgTJ9ukrQDEpzHmhx6T6LPIGuMUQ
	0Yvm9szkVHyiWxBXGFh7YzOtQdBSctLP4VVZmv/vVXSLmGE6TgrC2zm6KJfqm0liCDJZ
	mS96Fb9n+YjkfcYTmU2aS1OvXOO6afoyRMtHs/9RkXWS5pygr/PBou+mnGWEOTdfIkR1
	oglKs5QZZUqOE3cv4tn/lmtSnK87IaN1HH3DHJkWoOv1LrPnJUHm8vwMpU4rQrNeu3C/
	oDmw==
X-Gm-Message-State: AD7BkJL7ljVvaaz+ZF2anRqujdxKDteYYvwdX/oN5hiaQ+63x8nkzxktefiNPax1yJzC1mJNrkhTVbrq/lxiJw==
MIME-Version: 1.0
X-Received: by 10.31.174.23 with SMTP id x23mr4699935vke.136.1457081973253;
	Fri, 04 Mar 2016 00:59:33 -0800 (PST)
Received: by 10.159.55.167 with HTTP; Fri, 4 Mar 2016 00:59:33 -0800 (PST)
In-Reply-To: <1456266340-30312-1-git-send-email-schnitzeltony@googlemail.com>
References: <1456266340-30312-1-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 4 Mar 2016 09:59:33 +0100
Message-ID: <CALbNGRQ9gmnVikWqrznBL757UXzPaVqnWRH8WEspTFNyFWcMRQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] firefox: fix install for oe-core master and cleanup packaging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Mar 2016 08:59:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2016 at 11:25 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Could build test only due to lack of building image
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  recipes-mozilla/firefox/firefox_38.6.1esr.bb | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/recipes-mozilla/firefox/firefox_38.6.1esr.bb b/recipes-mozil=
la/firefox/firefox_38.6.1esr.bb
> index 8356532..4e4a7aa 100644
> --- a/recipes-mozilla/firefox/firefox_38.6.1esr.bb
> +++ b/recipes-mozilla/firefox/firefox_38.6.1esr.bb
> @@ -68,7 +68,7 @@ do_install_append() {
>
>      install -m 0644 ${WORKDIR}/mozilla-firefox.desktop ${D}${datadir}/ap=
plications/
>      install -m 0644 ${WORKDIR}/mozilla-firefox.png ${D}${datadir}/pixmap=
s/
> -    install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}-${MOZ_APP_B=
ASE_VERSION}/defaults/pref/
> +    install -m 0644 ${WORKDIR}/vendor.js ${D}${libdir}/${PN}/defaults/pr=
ef/
>
>      # Fix ownership of files
>      chown root:root -R ${D}${datadir}
> @@ -78,19 +78,9 @@ do_install_append() {
>  FILES_${PN} =3D "${bindir}/${PN} \
>                 ${datadir}/applications/ \
>                 ${datadir}/pixmaps/ \
> -               ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/* \
> -               ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/.autoreg \
> +               ${libdir}/${PN}/* \
>                 ${bindir}/defaults"
> -FILES_${PN}-dev +=3D "${datadir}/idl ${bindir}/${PN}-config ${libdir}/${=
PN}-devel-*"
> -FILES_${PN}-staticdev +=3D "${libdir}/${PN}-devel-*/sdk/lib/*.a"
> -FILES_${PN}-dbg +=3D "${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/.debug \
> -                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/.debug \
> -                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/*/.debug \
> -                    ${libdir}/${PN}-${MOZ_APP_BASE_VERSION}/*/*/*/.debug=
 \
> -                    ${libdir}/${PN}-devel-*/*/.debug \
> -                    ${libdir}/${PN}-devel-*/*/*/.debug \
> -                    ${libdir}/${PN}-devel-*/*/*/*/.debug \
> -                    ${bindir}/.debug"
> +FILES_${PN}-dev +=3D "${datadir}/idl ${bindir}/${PN}-config"
>
>  # We don't build XUL as system shared lib, so we can mark all libs as pr=
ivate
>  PRIVATE_LIBS =3D "libmozjs.so \
> --
> 2.5.0
>
ping

