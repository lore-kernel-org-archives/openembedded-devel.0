Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <xiaoxianghua@gmail.com>) id 1QBDAT-0004VV-Dk
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 23:36:37 +0200
Received: by fxm19 with SMTP id 19so2852015fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 14:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=j/REj2d9fsQhQqKEOk6Ah3ScBcl9MZgxgG43uy5d1Y8=;
	b=YI/gis6CqpFGjCausjVCqPfTYUz3UNBoPSzhHm6MyJK3kgBGopbvog8ph7mbVVNL2o
	5piVS70NBpdMOicjg9N6iNa/31mQ7CqNepWCePD0jCa2GAjJuN9hTe1x/LdUThNt9Kda
	e5a/s9Osjp0zP8xtpWrFzbwb7wC0TcD+AtV8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Db+bHl4yehE2e36rtkYd2hPXdvm0GtIgOY5wVP0b/DRN9t+dWl3JEzCc/BH9is8R8I
	PArFGnF10aVyomT9ZXybjZYf2rEVCRfPFlmdUVnAteVPxKE2FXVuvwCYGUk7FKYBU5Rw
	F1+9IRfihRC3wPFwI+z+yY4Pi2MRfDY77vao4=
MIME-Version: 1.0
Received: by 10.223.55.78 with SMTP id t14mr923940fag.43.1302989658339; Sat,
	16 Apr 2011 14:34:18 -0700 (PDT)
Received: by 10.223.107.9 with HTTP; Sat, 16 Apr 2011 14:34:18 -0700 (PDT)
In-Reply-To: <1302319620-18223-5-git-send-email-heroor@gmail.com>
References: <1302319620-18223-1-git-send-email-heroor@gmail.com>
	<1302319620-18223-5-git-send-email-heroor@gmail.com>
Date: Sat, 16 Apr 2011 16:34:18 -0500
Message-ID: <BANLkTi=o8_=Wdpe=b+Ydo6iha7aiMszC0A@mail.gmail.com>
From: Xianghua Xiao <xiaoxianghua@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv3 5/5] ti-syslink-libs: Add Syslink version 02.00.00.68 Beta1
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
X-List-Received-Date: Sat, 16 Apr 2011 21:36:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This recipe includes a SRC URI that is not accessible for the public,
why is that?

On Fri, Apr 8, 2011 at 10:27 PM, Siddharth Heroor <heroor@gmail.com> wrote:
> From: Siddharth Heroor <heroor@ti.com>
>
>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
> =C2=A0...ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb | =C2=A0 24 ++++=
++++++++++++++++
> =C2=A01 files changed, 24 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.=
68beta1.bb
>
> diff --git a/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb b=
/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb
> new file mode 100644
> index 0000000..4a88f28
> --- /dev/null
> +++ b/recipes/ti/ti-syslink-libs_02.00.00.67+02.00.00.68beta1.bb
> @@ -0,0 +1,24 @@
> +require ti-syslink-libs.inc
> +
> +PV =3D "02_00_00_68"
> +PVExtra =3D "_beta1"
> +
> +S =3D "${WORKDIR}/syslink_${PV}${PVExtra}"
> +SYSLINK_ROOT =3D "${WORKDIR}/syslink_${PV}${PVExtra}"
> +
> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV}=
${PVExtra}/exports/syslink_${PV}${PVExtra}.tar.gz;name=3Dsyslinktarball"
> +SRC_URI[syslinktarball.md5sum] =3D "468034372124f70f82b60cfb5f11c8e8"
> +SRC_URI[syslinktarball.sha256sum] =3D "ed574dcb3a5477cfbc69a1c9e768d5197=
291cb057d19fd791e16e1c89af3e8e1"
> +
> +do_configure() {
> + =C2=A0 =C2=A0# Update config.bld
> + =C2=A0 =C2=A0sed -i \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:^C674_ELF.rootDir.*:C674_ELF.rootDir\ =
=3D\ \"${CODEGEN_INSTALL_DIR}\":g \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:C64P_COFF,://C64P_COFF:g \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:C64P_ELF,://C64P_ELF:g \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:C674_COFF,://C674P_COFF:g \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:M3_ELF,://M3_ELF:g \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0-e s:A8_ELF$://A8_ELF:g \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/config.bld
> +}
> +
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


