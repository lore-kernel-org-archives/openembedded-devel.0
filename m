Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNBE7-0003zQ-EM
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 22:25:38 +0100
Received: by yxd5 with SMTP id 5so2395679yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 13:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=CuZaKs85XisoJpi701VyAVCvYwSdsDo6s5Z3Nae04vo=;
	b=CM961jjfG41jCP+LumB1exir97QuIHxIdscVHVr0bh3hY0ow/O2Ge/CLnY4np8v3Z+
	gRcB9kQyXW26pYkEhZuhPVAqU5RTa+0+zhCUSMjXwbukFGnYcZWkhc+ODLcsALy5f/qV
	zhYXv6TWxBb5i8HwtxahgiMZDlmdXMQA98s+U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=YQyo0V4V0nxSWfxuBoXu5M0zS5KDeJ35mtRpAU1o8hq5plRDSXxVj5v8QBw+VoWgRw
	7AZ5l/OBg1AQeGqFsTurBIqqqN7GaddBHu+jKP6o+HmOSdmUC85RDX/ehHfPnV65TCNT
	CQqX5WhmF69pFpRj0BVP2TLXxUqIwDQXUZDNc=
Received: by 10.91.87.20 with SMTP id p20mr3745045agl.129.1291065854255; Mon,
	29 Nov 2010 13:24:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Mon, 29 Nov 2010 13:23:54 -0800 (PST)
In-Reply-To: <1291049553-8442-1-git-send-email-msmith@cbnco.com>
References: <1291049553-8442-1-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Nov 2010 13:23:54 -0800
Message-ID: <AANLkTinst=Y1PMamwfmWNhLiYFanxTS_V-rJAmGbnTOt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xf86-input-tslib 0.0.6: move udev rule to /etc/udev/rules.d
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
X-List-Received-Date: Mon, 29 Nov 2010 21:25:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2010 at 8:52 AM, Michael Smith <msmith@cbnco.com> wrote:
> /lib/udev/rules.d is a symlink to /etc/udev/rules.d.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>

Will it upgrade seemlessly on deployed systems ?
patch looks ok otherwise

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/xorg-driver/xf86-input-tslib_0.0.6.bb | =C2=A0 =C2=A06 +++-=
--
> =C2=A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb b/recipes/xorg=
-driver/xf86-input-tslib_0.0.6.bb
> index a1cecaa..4b910dd 100644
> --- a/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
> +++ b/recipes/xorg-driver/xf86-input-tslib_0.0.6.bb
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "X.Org X server -- tslib input driver"
> =C2=A0DEPENDS +=3D "tslib"
> =C2=A0RRECOMMENDS_${PN} +=3D "tslib-calibrate"
> =C2=A0RSUGGESTS_${PN} +=3D "hal"
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
>
> =C2=A0SRC_URI =3D "http://www.pengutronix.de/software/xf86-input-tslib/do=
wnload/xf86-input-tslib-${PV}.tar.bz2;name=3Darchive \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://double-free-crash.patch \
> @@ -20,8 +20,8 @@ do_configure_prepend() {
> =C2=A0do_install_append() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${datadir}/hal/fdi/policy/20t=
hirdparty
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/10-x11-input-tslib=
.fdi ${D}/${datadir}/hal/fdi/policy/20thirdparty
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/lib/udev/rules.d
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/99-xf86-input-tsl=
ib.rules ${D}/lib/udev/rules.d/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${sysconfdir}/udev/rules.d
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/99-xf86-input-tsl=
ib.rules ${D}/${sysconfdir}/udev/rules.d/
> =C2=A0}
>
> =C2=A0FILES_${PN} +=3D "${datadir}/hal /lib/udev"
> --
> 1.6.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


