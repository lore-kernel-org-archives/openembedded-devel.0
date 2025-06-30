Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA76C83030
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 20:47:53 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.51487.1751316470617258078
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 13:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout03.t-online.de (Postfix) with SMTP id C2B54E687;
	Mon, 30 Jun 2025 22:47:47 +0200 (CEST)
Received: from [192.168.178.20] ([84.163.38.244]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uWLPn-25Dbuq0; Mon, 30 Jun 2025 22:47:47 +0200
Date: Mon, 30 Jun 2025 22:47:42 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] tk: add INCLUDEDIR for tcl9.0
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	"Alper Ak via lists.openembedded.org"
	<alperyasinak1=gmail.com@lists.openembedded.org>
Message-Id: <IFSOYS.BIX2QGYJTWUW@t-online.de>
In-Reply-To: <25294.1751306716982813583@lists.openembedded.org>
References: <20250630151655.3505250-1-f_l_k@t-online.de>
	<25294.1751306716982813583@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-O7shqe1emIlwhyzfxOe0"
X-TOI-EXPURGATEID: 150726::1751316467-CE7FA544-2F1B4119/0/0 CLEAN NORMAL
X-TOI-MSGID: 291ef4ed-409c-45d9-8d38-642da1c2f267
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 20:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118184

--=-O7shqe1emIlwhyzfxOe0
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,
as I understand it, tcl is configured in tk by using tclConfig.sh=20
crosscript instead of
pkgconfig (at least to some extent) and takes the path specified for=20
TLC_SRC_DIR to include tcl.h.

This can be overridden by editing the tk recipe, e.g.
EXTRA_OEMAKE +=3D "TCLDIR=3D${STAGING_INCDIR}/tcl$whatever"

But this does not solve the problem that tcl $PV must match whatever is=20
set in the tk recipe
Maybe we can edit tcl in oe-core like this, but I'm not sure if this=20
would break things:

 From c2e5e1e4cb9fb1107db4632c4428607931a1b3b9 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
Date: Mon, 30 Jun 2025 22:03:17 +0200
Subject: [PATCH] tcl: dont use version in includedir

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tcltk/tcl/0004-tcl-update-the-header-location.patch   | 8 ++++----
 meta/recipes-devtools/tcltk/tcl_9.0.1.bb                  | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git=20
a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch=
=20
b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
index 50a4a27256..1bcdfb3c22 100644
---=20
a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
+++=20
b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
@@ -34,7 +34,7 @@ index b5f9ab7..fbc87a2 100644

  # Directory in which to install the include file tcl.h:
 -INCLUDE_INSTALL_DIR	=3D $(INSTALL_ROOT)$(includedir)
-+INCLUDE_INSTALL_DIR	=3D $(INSTALL_ROOT)$(includedir)/tcl$(VERSION)
++INCLUDE_INSTALL_DIR	=3D $(INSTALL_ROOT)$(includedir)/tcl

  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	=3D @PRIVATE_INCLUDE_DIR@
@@ -47,7 +47,7 @@ index 43ec7e4..19524d1 100644

  test -z "$TCL_LIBRARY" && TCL_LIBRARY=3D'$(libdir)/tcl$(VERSION)'
 -PRIVATE_INCLUDE_DIR=3D'$(includedir)'
-+PRIVATE_INCLUDE_DIR=3D'$(includedir)/tcl$(VERSION)'
++PRIVATE_INCLUDE_DIR=3D'$(includedir)/tcl'
  HTML_DIR=3D'$(DISTDIR)/html'

  # Note:  in the following variable, it's important to use the absolute
@@ -56,7 +56,7 @@ index 43ec7e4..19524d1 100644

  # Install time header dir can be set via --includedir
 -eval "TCL_INCLUDE_SPEC=3D\"-I${includedir}\""
-+eval "TCL_INCLUDE_SPEC=3D\"-I${includedir}/tcl${VERSION}\""
++eval "TCL_INCLUDE_SPEC=3D\"-I${includedir}/tcl\""

 =20
#------------------------------------------------------------------------
  # tclConfig.sh refers to this by a different name
@@ -69,7 +69,7 @@ index 9c6da82..8aa5ae8 100644
  exec_prefix=3D@exec_prefix@
  libdir=3D@libdir@
 -includedir=3D@includedir@
-+includedir=3D@includedir@/tcl@PACKAGE_VERSION@
++includedir=3D@includedir@/tcl
  libfile=3D@TCL_LIB_FILE@

  Name: Tool Command Language
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb=20
b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
index 70aa9b606c..bafea067ed 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
@@ -51,13 +51,13 @@ do_install() {
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
 	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
-	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
+	sed -i "s;'${WORKDIR};'${STAGING_INCDIR}/tcl;g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
 	for dir in compat generic unix; do
-		install -d ${D}${includedir}/${BPN}${VER}/$dir
-		install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
+		install -d ${D}${includedir}/${BPN}/$dir
+		install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}/$dir/
 	done
 }

--=20
2.49.0

On Mon, Jun 30 2025 at 11:05:16 -07:00:00, Alper Ak via=20
lists.openembedded.org <alperyasinak1=3Dgmail.com@lists.openembedded.org>=20
wrote:
> Hi Markus,
>=20
> I recently sent a patch similar to yours. Yes, this really solves the=20
> problem, but there seem to be two things to think about:
>=20
> 1) if tcl and tk can be upgraded independently (tcl recipe is in=20
> poky, tk is in meta-oe), this may cause failure if tcl is upgraded=20
> without upgrading tk. We are telling him to look at=20
> =E2=80=9C-I${STAGING_INCDIR}/tcl${VER}=E2=80=9D but when tcl is upgraded,=
 if tk=20
> isn't upgraded to the same version, it will probably fail.
>=20
> 2) tk uses pkgconfig that's the way for tcl to tell tk where to find=20
> its headers. When I look at the compile logs, it really tells but=20
> there is a situation like this in include path:
>=20
> -I.../recipe-sysroot/usr/include/sources/tcl9.0.1/generic
>=20
> Somehow, the "sources" is added to the path from somewhere, and it=20
> must be /usr/include/tcl9.0.1/generic
>=20
> I know that the "tcl.h" file is available in both=20
> ../recipe-sysroot/usr/include/tcl9.0/ and=20
> ../recipe-sysroot/usr/include/tcl9.0.1/generic/  but considering the=20
> path provided to the compiler as an include, we should use the=20
> generic one.
>=20
> I have been sick for a while and haven't had much time to look at the=20
> situation with pkgconfig. I wanted to write to see if it might help=20
> you.


--=-O7shqe1emIlwhyzfxOe0
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div><div>Hi,</div><div>as I under=
stand it, tcl is configured in tk by using tclConfig.sh crosscript instead =
of</div><div>pkgconfig (at least to some extent) and takes the path specifi=
ed for TLC_SRC_DIR to include tcl.h.</div><div><br></div><div>This can be o=
verridden by editing the tk recipe, e.g.</div><div>EXTRA_OEMAKE +=3D "TCLDI=
R=3D${STAGING_INCDIR}/tcl$whatever"</div><div><br></div><div>But this does =
not solve the problem that tcl $PV must match whatever is set in the tk rec=
ipe</div></div><div>Maybe we can edit tcl in oe-core like this, but I'm not=
 sure if this would break things:</div><div><br></div><div><div>From c2e5e1=
e4cb9fb1107db4632c4428607931a1b3b9 Mon Sep 17 00:00:00 2001</div><div>From:=
 Markus Volk &lt;f_l_k@t-online.de&gt;</div><div>Date: Mon, 30 Jun 2025 22:=
03:17 +0200</div><div>Subject: [PATCH] tcl: dont use version in includedir<=
/div><div><br></div><div>Signed-off-by: Markus Volk &lt;f_l_k@t-online.de&g=
t;</div><div>---</div><div>&nbsp;.../tcltk/tcl/0004-tcl-update-the-header-l=
ocation.patch &nbsp; | 8 ++++----</div><div>&nbsp;meta/recipes-devtools/tcl=
tk/tcl_9.0.1.bb &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;| 6 +++---</div><div>&nbsp;2 files changed, 7 insertions(+), 7 deletions=
(-)</div><div><br></div><div>diff --git a/meta/recipes-devtools/tcltk/tcl/0=
004-tcl-update-the-header-location.patch b/meta/recipes-devtools/tcltk/tcl/=
0004-tcl-update-the-header-location.patch</div><div>index 50a4a27256..1bcdf=
b3c22 100644</div><div>--- a/meta/recipes-devtools/tcltk/tcl/0004-tcl-updat=
e-the-header-location.patch</div><div>+++ b/meta/recipes-devtools/tcltk/tcl=
/0004-tcl-update-the-header-location.patch</div><div>@@ -34,7 +34,7 @@ inde=
x b5f9ab7..fbc87a2 100644</div><div>&nbsp;&nbsp;</div><div>&nbsp; # Directo=
ry in which to install the include file tcl.h:</div><div>&nbsp;-INCLUDE_INS=
TALL_DIR<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>=
=3D $(INSTALL_ROOT)$(includedir)</div><div>-+INCLUDE_INSTALL_DIR<span class=
=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>=3D $(INSTALL_ROOT)=
$(includedir)/tcl$(VERSION)</div><div>++INCLUDE_INSTALL_DIR<span class=3D"A=
pple-tab-span" style=3D"white-space: pre;">	</span>=3D $(INSTALL_ROOT)$(inc=
ludedir)/tcl</div><div>&nbsp;&nbsp;</div><div>&nbsp; # Path to the private =
tcl header dir:</div><div>&nbsp; PRIVATE_INCLUDE_DIR<span class=3D"Apple-ta=
b-span" style=3D"white-space: pre;">	</span>=3D @PRIVATE_INCLUDE_DIR@</div>=
<div>@@ -47,7 +47,7 @@ index 43ec7e4..19524d1 100644</div><div>&nbsp;&nbsp;=
</div><div>&nbsp; test -z "$TCL_LIBRARY" &amp;&amp; TCL_LIBRARY=3D'$(libdir=
)/tcl$(VERSION)'</div><div>&nbsp;-PRIVATE_INCLUDE_DIR=3D'$(includedir)'</di=
v><div>-+PRIVATE_INCLUDE_DIR=3D'$(includedir)/tcl$(VERSION)'</div><div>++PR=
IVATE_INCLUDE_DIR=3D'$(includedir)/tcl'</div><div>&nbsp; HTML_DIR=3D'$(DIST=
DIR)/html'</div><div>&nbsp;&nbsp;</div><div>&nbsp; # Note: &nbsp;in the fol=
lowing variable, it's important to use the absolute</div><div>@@ -56,7 +56,=
7 @@ index 43ec7e4..19524d1 100644</div><div>&nbsp;&nbsp;</div><div>&nbsp; =
# Install time header dir can be set via --includedir</div><div>&nbsp;-eval=
 "TCL_INCLUDE_SPEC=3D\"-I${includedir}\""</div><div>-+eval "TCL_INCLUDE_SPE=
C=3D\"-I${includedir}/tcl${VERSION}\""</div><div>++eval "TCL_INCLUDE_SPEC=
=3D\"-I${includedir}/tcl\""</div><div>&nbsp;&nbsp;</div><div>&nbsp; #------=
------------------------------------------------------------------</div><di=
v>&nbsp; # tclConfig.sh refers to this by a different name</div><div>@@ -69=
,7 +69,7 @@ index 9c6da82..8aa5ae8 100644</div><div>&nbsp; exec_prefix=3D@e=
xec_prefix@</div><div>&nbsp; libdir=3D@libdir@</div><div>&nbsp;-includedir=
=3D@includedir@</div><div>-+includedir=3D@includedir@/tcl@PACKAGE_VERSION@<=
/div><div>++includedir=3D@includedir@/tcl</div><div>&nbsp; libfile=3D@TCL_L=
IB_FILE@</div><div>&nbsp;&nbsp;</div><div>&nbsp; Name: Tool Command Languag=
e</div><div>diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/re=
cipes-devtools/tcltk/tcl_9.0.1.bb</div><div>index 70aa9b606c..bafea067ed 10=
0644</div><div>--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb</div><div>+++=
 b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb</div><div>@@ -51,13 +51,13 @@ d=
o_install() {</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white=
-space: pre;">	</span>ln -sf ./tclsh${VER} ${D}${bindir}/tclsh</div><div>&n=
bsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>ln -=
sf tclsh9.0 ${D}${bindir}/tclsh${VER}</div><div>&nbsp;<span class=3D"Apple-=
tab-span" style=3D"white-space: pre;">	</span>sed -i "s;-L${B};-L${STAGING_=
LIBDIR};g" tclConfig.sh</div><div>-<span class=3D"Apple-tab-span" style=3D"=
white-space: pre;">	</span>sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclC=
onfig.sh</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space: pr=
e;">	</span>sed -i "s;'${WORKDIR};'${STAGING_INCDIR}/tcl;g" tclConfig.sh</d=
iv><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	<=
/span>install -d ${D}${bindir_crossscripts}</div><div>&nbsp;<span class=3D"=
Apple-tab-span" style=3D"white-space: pre;">	</span>install -m 0755 tclConf=
ig.sh ${D}${bindir_crossscripts}</div><div>&nbsp;<span class=3D"Apple-tab-s=
pan" style=3D"white-space: pre;">	</span>install -m 0755 tclConfig.sh ${D}$=
{libdir}</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-spac=
e: pre;">	</span>for dir in compat generic unix; do</div><div>-<span class=
=3D"Apple-tab-span" style=3D"white-space: pre;">		</span>install -d ${D}${i=
ncludedir}/${BPN}${VER}/$dir</div><div>-<span class=3D"Apple-tab-span" styl=
e=3D"white-space: pre;">		</span>install -m 0644 ${S}/$dir/*.h ${D}${includ=
edir}/${BPN}${VER}/$dir/</div><div>+<span class=3D"Apple-tab-span" style=3D=
"white-space: pre;">		</span>install -d ${D}${includedir}/${BPN}/$dir</div>=
<div>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">		</span>i=
nstall -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}/$dir/</div><div>&nbsp=
;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>done</d=
iv><div>&nbsp;}</div><div>&nbsp;</div><div>--&nbsp;</div><div>2.49.0</div><=
/div></div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Mon, Jun 30 20=
25 at 11:05:16 -07:00:00, Alper Ak via lists.openembedded.org &lt;alperyasi=
nak1=3Dgmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type=3D"c=
ite"><div>Hi Markus,<br><br>I recently sent a patch similar to yours. Yes, =
this really solves the problem, but there seem to be two things to think ab=
out:<br><br>1) if tcl and tk can be upgraded independently (tcl recipe is i=
n poky, tk is in meta-oe), this may cause failure if tcl is upgraded withou=
t upgrading tk. We are telling him to look at =E2=80=9C-I${STAGING_INCDIR}/=
tcl${VER}=E2=80=9D but when tcl is upgraded, if tk isn't upgraded to the sa=
me version, it will probably fail.<br><br>
<div>2) tk uses pkgconfig that's the way for tcl to tell tk where to find i=
ts headers. When I look at the compile logs, it really tells but there is a=
 situation like this in include path:<br><br></div>
<div>-I.../recipe-sysroot/usr/include/sources/tcl9.0.1/generic<br><br></div=
>
<div>Somehow, the "sources" is added to the path from somewhere, and it mus=
t be /usr/include/tcl9.0.1/generic<br><br></div>
<div>I know that the "tcl.h" file is available in both ../recipe-sysroot/us=
r/include/tcl9.0/ and ../recipe-sysroot/usr/include/tcl9.0.1/generic/&nbsp;=
 but considering the path provided to the compiler as an include, we should=
 use the generic one.<br><br>I have been sick for a while and haven't had m=
uch time to look at the situation with pkgconfig. I wanted to write to see =
if it might help you.</div>
</div>
</blockquote></div>
--=-O7shqe1emIlwhyzfxOe0--


