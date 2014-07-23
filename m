Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id AA637607E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 13:56:00 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so7625852wiw.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 06:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jNSeFy4oLXhBEwPL+iLc1V8XbeEUY5UoA+XaWPtqGF8=;
	b=KbI7/NSF3uRdTM4sMQzxoiUaM+EJ1CHKmnQpIZsIXBbsgfiRS95iLDTDYxKS7W2iM+
	jox5x8xcLZHNGnxVbf4ZskzOxOzwh/unGwQAiNDeF+HrNEO2p2YzWWLzwGrKRVGM2WBQ
	tVMLJfGQ/v495j5gpIZwnw9vyfeK/hUbQeSJax8LomtaJSi4+qEVfLMYmg490N0eUIUz
	G79NqEKgVbBXpx3DG0HnX6fDuUE8PoKwPPvrSS2wwSC/DtwF0Fvkq61QiY1bBVFfTvr0
	oRv4b+JMz/kAHaD1Wzj5MEFTGzacfrZL/xlH5FB7foaZZDP5mK/U7XqRy5uBECULD77k
	Y1Lg==
X-Received: by 10.194.92.177 with SMTP id cn17mr2031846wjb.71.1406123761175;
	Wed, 23 Jul 2014 06:56:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb8sm9757654wib.15.2014.07.23.06.55.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 06:55:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Jul 2014 15:56:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140723135616.GD22875@jama>
References: <1405981228-26871-1-git-send-email-akuster@mvista.com>
MIME-Version: 1.0
In-Reply-To: <1405981228-26871-1-git-send-email-akuster@mvista.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] v3] Wireshark: build fix and recipe update
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
X-List-Received-Date: Wed, 23 Jul 2014 13:56:08 -0000
X-Groupsio-MsgNum: 51210
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bda7maMjJbTZ4Ov1"
Content-Disposition: inline

--bda7maMjJbTZ4Ov1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 03:20:28PM -0700, Armin Kuster wrote:
> Backported Arm build fix
> Added gtk3 support
> Cleaned up PACKAGECONFIG options

You cannot use IMAGE_FEATURES to define PACKAGECONFIG, see what I did
with it in master-next (and confirm that you're ok with my changes).

Also please notice wrong number of ']' in subject, no big deal, but I
had to strip 'v3]" from subject lines manually when cherry-picking from
patchwork.

> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../files/va_list-can-t-be-NULL-on-ARM.patch       | 98 ++++++++++++++++=
++++++
>  .../wireshark/wireshark_1.12.0-rc2.bb              |  5 +-
>  2 files changed, 102 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/wireshark/files/va_li=
st-can-t-be-NULL-on-ARM.patch
>=20
> diff --git a/meta-networking/recipes-support/wireshark/files/va_list-can-=
t-be-NULL-on-ARM.patch b/meta-networking/recipes-support/wireshark/files/va=
_list-can-t-be-NULL-on-ARM.patch
> new file mode 100644
> index 0000000..301c381
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/files/va_list-can-t-be-NU=
LL-on-ARM.patch
> @@ -0,0 +1,98 @@
> +From 320c4f0d705a3ed94f710fb4b7b3eef897ff7bc4 Mon Sep 17 00:00:00 2001
> +From: Steev Klimaszewski <threeway@gmail.com>
> +Date: Thu, 19 Jun 2014 16:54:57 -0500
> +Subject: [PATCH] va_list can't be NULL on ARM.
> +
> +Bug: 10209
> +Change-Id: Ibd63a530450b7d2d4ec244e91c77caa731ba63aa
> +Signed-off-by: Steev Klimaszewski <threeway@gmail.com>
> +Signed-off-by: Balint Reczey <balint@balintreczey.hu>
> +Reviewed-on: https://code.wireshark.org/review/2464
> +Reviewed-by: Evan Huus <eapache@gmail.com>
> +Reviewed-by: Michael Mann <mmann78@netscape.net>
> +
> +The patch was imported from the wireshark git server
> +  (https://code.wireshark.org/review/p/wireshark.git) as of commit id
> +    320c4f0d705a3ed94f710fb4b7b3eef897ff7bc4.
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + epan/expert.c | 36 +++++++++++++++++++++++++++++-------
> + 1 file changed, 29 insertions(+), 7 deletions(-)
> +
> +diff --git a/epan/expert.c b/epan/expert.c
> +index 46be838..a69566d 100644
> +--- a/epan/expert.c
> ++++ b/epan/expert.c
> +@@ -381,15 +381,26 @@ expert_set_info_vformat(packet_info *pinfo, proto_=
item *pi, int group, int sever
> + 	tap_queue_packet(expert_tap, pinfo, ei);
> + }
> +=20
> +-void
> +-expert_add_info(packet_info *pinfo, proto_item *pi, expert_field *expin=
dex)
> ++/* Helper function for expert_add_info() to work around compiler's spec=
ial needs on ARM*/
> ++static inline void
> ++expert_add_info_internal(packet_info *pinfo, proto_item *pi, expert_fie=
ld *expindex, ...)
> + {
> ++	/* the va_list is ignored */
> ++	va_list unused;
> + 	expert_field_info* eiinfo;
> +=20
> + 	/* Look up the item */
> + 	EXPERT_REGISTRAR_GET_NTH(expindex->ei, eiinfo);
> +=20
> +-	expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *e=
iinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
> ++	va_start(unused, expindex);
> ++	expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *e=
iinfo->hf_info.p_id, FALSE, eiinfo->summary, unused);
> ++	va_end(unused);
> ++}
> ++
> ++void
> ++expert_add_info(packet_info *pinfo, proto_item *pi, expert_field *expin=
dex)
> ++{
> ++	expert_add_info_internal(pinfo, pi, expindex);
> + }
> +=20
> + void
> +@@ -406,22 +417,33 @@ expert_add_info_format(packet_info *pinfo, proto_i=
tem *pi, expert_field *expinde
> + 	va_end(ap);
> + }
> +=20
> +-proto_item *
> +-proto_tree_add_expert(proto_tree *tree, packet_info *pinfo, expert_fiel=
d* expindex,
> +-		tvbuff_t *tvb, gint start, gint length)
> ++/* Helper function for expert_add_expert() to work around compiler's sp=
ecial needs on ARM*/
> ++static inline proto_item *
> ++proto_tree_add_expert_internal(proto_tree *tree, packet_info *pinfo, ex=
pert_field* expindex,
> ++		tvbuff_t *tvb, gint start, gint length, ...)
> + {
> + 	expert_field_info* eiinfo;
> + 	proto_item *ti;
> ++	va_list unused;
> +=20
> + 	/* Look up the item */
> + 	EXPERT_REGISTRAR_GET_NTH(expindex->ei, eiinfo);
> +=20
> + 	ti =3D proto_tree_add_text(tree, tvb, start, length, "%s", eiinfo->sum=
mary);
> +-	expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *e=
iinfo->hf_info.p_id, FALSE, eiinfo->summary, NULL);
> ++	va_start(unused, length);
> ++	expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *e=
iinfo->hf_info.p_id, FALSE, eiinfo->summary, unused);
> ++	va_end(unused);
> + 	return ti;
> + }
> +=20
> + proto_item *
> ++proto_tree_add_expert(proto_tree *tree, packet_info *pinfo, expert_fiel=
d* expindex,
> ++		tvbuff_t *tvb, gint start, gint length)
> ++{
> ++	return proto_tree_add_expert_internal(tree, pinfo, expindex, tvb, star=
t, length);
> ++}
> ++
> ++proto_item *
> + proto_tree_add_expert_format(proto_tree *tree, packet_info *pinfo, expe=
rt_field* expindex,
> + 		tvbuff_t *tvb, gint start, gint length, const char *format, ...)
> + {
> +--=20
> +1.9.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-r=
c2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> index 66716c3..47e72f4 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> @@ -14,6 +14,7 @@ PACKAGECONFIG +=3D " ${@bb.utils.contains("IMAGE_FEATUR=
ES", "x11-base", "gtk2 grap
>  PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ip=
v6", "", d)}"
> =20
>  PACKAGECONFIG[gtk2] =3D "--with-gtk2=3Dyes,--with-gtk2=3Dno, gtk+"
> +PACKAGECONFIG[gtk3] =3D "--with-gtk3=3Dyes, --with-gtk3=3Dno, gtk+3"
>  PACKAGECONFIG[graphics] =3D "--enable-wireshark, --disable-wireshark,"
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
>  PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes,--with-gnutls=3Dno, gnutl=
s"
> @@ -22,7 +23,9 @@ PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes,--with-g=
crypt=3Dno, libgcrypt"
>  EXTRA_OECONF =3D "--with-gtk3=3Dno --with-qt=3Dno --enable-usr-local=3Dn=
o -enable-tshark"
> =20
>  LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb1491=
95e065b0"
> -SRC_URI =3D "http://wiresharkdownloads.riverbed.com/wireshark/src/wiresh=
ark-1.12.0-rc2.tar.bz2 "
> +SRC_URI =3D "http://wiresharkdownloads.riverbed.com/wireshark/src/wiresh=
ark-1.12.0-rc2.tar.bz2 \
> +    file://va_list-can-t-be-NULL-on-ARM.patch \
> +    "
>     =20
>  SRC_URI[md5sum] =3D "dc1149073066a29f91116c168558262e"
>  SRC_URI[sha256sum]=3D "31009bb450126e9b12808267419f31016d14e6fde7b5e39c8=
5ad37459908cffb"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bda7maMjJbTZ4Ov1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPPvwAACgkQN1Ujt2V2gBzDTgCfSgMDWM2nGl93eh2ncYaNNzfQ
SVIAnj8Ee8cJ4k8Va+wfmG03dOVb+JlY
=nt7Z
-----END PGP SIGNATURE-----

--bda7maMjJbTZ4Ov1--
