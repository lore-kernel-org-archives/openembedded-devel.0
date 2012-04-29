Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOcq1-0000Ds-9G
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 00:43:29 +0200
Received: by lbbgo4 with SMTP id go4so1507971lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 15:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=1bn0WFLbRs2NiaZXT+x+kilQuoHNpgRJNp2P0lmOc3I=;
	b=JVPOzAR1arDaIfF6OJIpBLQBYUB/IzZ2b449gSmBdPeFBzF7G1Z/FK0Z3Si2exwxhe
	iAaESx9sl+LYtCqwv4MMSIIPCRbOcoSGDKnj94ctcfNBl9sRQqAfjoYFE0yb3b4RuGFs
	vQzNqg1bDWKb5YIOVW8jR9iPe4LiR5WBaYHJcmTsqmuMOZKFc3FKD5SeYRRqNl3J/49R
	ASnGYpxXHOX5qZeuz7HdkyO9Q4DpLlgRpKKGrv1X0w/YbtznvZ/43rieC4cMhQCnOw7x
	PciWYNo3Z0nNUnEoftaapPcRCLg03LFbdj5J6aF7pI/wSZF7T6Y/9yOq/aGr7/ail/+Q
	76ow==
Received: by 10.112.103.8 with SMTP id fs8mr9384049lbb.29.1335738828117; Sun,
	29 Apr 2012 15:33:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 29 Apr 2012 15:33:17 -0700 (PDT)
In-Reply-To: <1335481339-4539-1-git-send-email-tasskjapp@gmail.com>
References: <1335472546-9653-1-git-send-email-tasskjapp@gmail.com>
	<1335481339-4539-1-git-send-email-tasskjapp@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Apr 2012 15:33:17 -0700
Message-ID: <CAMKF1sqPuudkP78FbnCR6cd0-RBEurcGScYms-3ZSmwQwsVU8Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] synergy: add synergy 1.3.8
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
X-List-Received-Date: Sun, 29 Apr 2012 22:43:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2012 at 4:02 PM, Tasslehoff Kjappfot
<tasskjapp@gmail.com> wrote:
>
> Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
> ---
> =C2=A0meta-oe/recipes-support/synergy/synergy_1.3.8.bb | =C2=A0 22 ++++++=
++++++++++++++++
> =C2=A01 file changed, 22 insertions(+)
> =C2=A0create mode 100644 meta-oe/recipes-support/synergy/synergy_1.3.8.bb
>
> diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-oe/r=
ecipes-support/synergy/synergy_1.3.8.bb
> new file mode 100644
> index 0000000..40efcb1
> --- /dev/null
> +++ b/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "Synergy - control multiple computers with one keyboard =
and mouse"
> +HOMEPAGE =3D "http://synergy.googlecode.com"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9772a11e3569985855e2ce450e56f=
991"
> +LICENSE =3D "GPLv2"

use GPL-2.0

> +SECTION =3D "x11/utils"
> +
> +DEPENDS =3D "libx11 libxtst"
> +
> +SRC_URI =3D "http://synergy.googlecode.com/files/synergy-${PV}-Source.ta=
r.gz"
> +
> +SRC_URI[md5sum] =3D "3534c65ecfa6e47d7899c57975442f03"
> +SRC_URI[sha256sum] =3D "0afc83e4ed0b46ed497d4229b2b2854e8d3c581a112f4da0=
5110943edbfacc03"
> +
> +S =3D "${WORKDIR}/${PN}-${PV}-Source"
> +
> +inherit cmake siteinfo
> +

why is siteinfo needed ?

> +do_install() {
> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}/usr/bin
> + =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/bin/synergy* ${D}/usr/bin/
> +}
> +
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


