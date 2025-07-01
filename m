Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB72C8302F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 10:29:22 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.7429.1751365756415209740
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout04.t-online.de (Postfix) with SMTP id E05C7E3AA;
	Tue,  1 Jul 2025 12:29:14 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.169.229]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uWYEh-4PuuWG0; Tue, 1 Jul 2025 12:29:11 +0200
Date: Tue, 01 Jul 2025 12:29:05 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] tk: add INCLUDEDIR for tcl9.0
To: alperyasinak1@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Message-Id: <HGUPYS.61H1F4LSJUJ82@t-online.de>
In-Reply-To: <184DED0D44CD195B.28277@lists.openembedded.org>
References: <20250630151655.3505250-1-f_l_k@t-online.de>
	<25294.1751306716982813583@lists.openembedded.org>
	<184DED0D44CD195B.28277@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-RQd5yfWorvn8NaCpgQGu"
X-TOI-EXPURGATEID: 150726::1751365751-B97F8505-21D213CA/0/0 CLEAN NORMAL
X-TOI-MSGID: 13b16001-fe96-463b-b74e-5f5df4233813
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 10:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118193

--=-RQd5yfWorvn8NaCpgQGu
Content-Type: text/plain; charset=us-ascii; format=flowed

I have sent a patch for the issue to oe-core. It fixes the issue in a 
better way inside tcl.
This patch should be dropped

On Mon, Jun 30 2025 at 22:47:42 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Hi,
> as I understand it, tcl is configured in tk by using tclConfig.sh 
> crosscript instead of
> pkgconfig (at least to some extent) and takes the path specified for 
> TLC_SRC_DIR to include tcl.h.
> 
> This can be overridden by editing the tk recipe, e.g.
> EXTRA_OEMAKE += "TCLDIR=${STAGING_INCDIR}/tcl$whatever"
> 
> But this does not solve the problem that tcl $PV must match whatever 
> is set in the tk recipe
> Maybe we can edit tcl in oe-core like this, but I'm not sure if this 
> would break things:
> 
> From c2e5e1e4cb9fb1107db4632c4428607931a1b3b9 Mon Sep 17 00:00:00 2001
> From: Markus Volk <f_l_k@t-online.de>
> Date: Mon, 30 Jun 2025 22:03:17 +0200
> Subject: [PATCH] tcl: dont use version in includedir
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../tcltk/tcl/0004-tcl-update-the-header-location.patch   | 8 
> ++++----
>  meta/recipes-devtools/tcltk/tcl_9.0.1.bb                  | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git 
> a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch 
> b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
> index 50a4a27256..1bcdfb3c22 100644
> --- 
> a/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
> +++ 
> b/meta/recipes-devtools/tcltk/tcl/0004-tcl-update-the-header-location.patch
> @@ -34,7 +34,7 @@ index b5f9ab7..fbc87a2 100644
> 
>   # Directory in which to install the include file tcl.h:
>  -INCLUDE_INSTALL_DIR	= $(INSTALL_ROOT)$(includedir)
> -+INCLUDE_INSTALL_DIR	= $(INSTALL_ROOT)$(includedir)/tcl$(VERSION)
> ++INCLUDE_INSTALL_DIR	= $(INSTALL_ROOT)$(includedir)/tcl
> 
>   # Path to the private tcl header dir:
>   PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
> @@ -47,7 +47,7 @@ index 43ec7e4..19524d1 100644
> 
>   test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
>  -PRIVATE_INCLUDE_DIR='$(includedir)'
> -+PRIVATE_INCLUDE_DIR='$(includedir)/tcl$(VERSION)'
> ++PRIVATE_INCLUDE_DIR='$(includedir)/tcl'
>   HTML_DIR='$(DISTDIR)/html'
> 
>   # Note:  in the following variable, it's important to use the 
> absolute
> @@ -56,7 +56,7 @@ index 43ec7e4..19524d1 100644
> 
>   # Install time header dir can be set via --includedir
>  -eval "TCL_INCLUDE_SPEC=\"-I${includedir}\""
> -+eval "TCL_INCLUDE_SPEC=\"-I${includedir}/tcl${VERSION}\""
> ++eval "TCL_INCLUDE_SPEC=\"-I${includedir}/tcl\""
> 
>   
> #------------------------------------------------------------------------
>   # tclConfig.sh refers to this by a different name
> @@ -69,7 +69,7 @@ index 9c6da82..8aa5ae8 100644
>   exec_prefix=@exec_prefix@
>   libdir=@libdir@
>  -includedir=@includedir@
> -+includedir=@includedir@/tcl@PACKAGE_VERSION@
> ++includedir=@includedir@/tcl
>   libfile=@TCL_LIB_FILE@
> 
>   Name: Tool Command Language
> diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb 
> b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> index 70aa9b606c..bafea067ed 100644
> --- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> @@ -51,13 +51,13 @@ do_install() {
>  	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
>  	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
>  	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
> -	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
> +	sed -i "s;'${WORKDIR};'${STAGING_INCDIR}/tcl;g" tclConfig.sh
>  	install -d ${D}${bindir_crossscripts}
>  	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
>  	install -m 0755 tclConfig.sh ${D}${libdir}
>  	for dir in compat generic unix; do
> -		install -d ${D}${includedir}/${BPN}${VER}/$dir
> -		install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
> +		install -d ${D}${includedir}/${BPN}/$dir
> +		install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}/$dir/
>  	done
>  }
> 
> --
> 2.49.0
> 
> On Mon, Jun 30 2025 at 11:05:16 -07:00:00, Alper Ak via 
> lists.openembedded.org 
> <alperyasinak1=gmail.com@lists.openembedded.org> wrote:
>> Hi Markus,
>> 
>> I recently sent a patch similar to yours. Yes, this really solves 
>> the problem, but there seem to be two things to think about:
>> 
>> 1) if tcl and tk can be upgraded independently (tcl recipe is in 
>> poky, tk is in meta-oe), this may cause failure if tcl is upgraded 
>> without upgrading tk. We are telling him to look at 
>> -I${STAGING_INCDIR}/tcl${VER} but when tcl is upgraded, if tk isn't 
>> upgraded to the same version, it will probably fail.
>> 
>> 2) tk uses pkgconfig that's the way for tcl to tell tk where to find 
>> its headers. When I look at the compile logs, it really tells but 
>> there is a situation like this in include path:
>> 
>> -I.../recipe-sysroot/usr/include/sources/tcl9.0.1/generic
>> 
>> Somehow, the "sources" is added to the path from somewhere, and it 
>> must be /usr/include/tcl9.0.1/generic
>> 
>> I know that the "tcl.h" file is available in both 
>> ../recipe-sysroot/usr/include/tcl9.0/ and 
>> ../recipe-sysroot/usr/include/tcl9.0.1/generic/  but considering the 
>> path provided to the compiler as an include, we should use the 
>> generic one.
>> 
>> I have been sick for a while and haven't had much time to look at 
>> the situation with pkgconfig. I wanted to write to see if it might 
>> help you.


--=-RQd5yfWorvn8NaCpgQGu
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">I have sent a patch for the issue to oe=
-core. It fixes the issue in a better way inside tcl.<div>This patch should=
 be dropped</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Mon, Jun=
 30 2025 at 22:47:42 +02:00:00, Markus Volk via lists.openembedded.org &lt;=
f_l_k=3Dt-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type=
=3D"cite"><div id=3D"geary-body" dir=3D"auto"><div><div><div>Hi,</div><div>=
as I understand it, tcl is configured in tk by using tclConfig.sh crosscrip=
t instead of</div><div>pkgconfig (at least to some extent) and takes the pa=
th specified for TLC_SRC_DIR to include tcl.h.</div><div><br></div><div>Thi=
s can be overridden by editing the tk recipe, e.g.</div><div>EXTRA_OEMAKE +=
=3D "TCLDIR=3D${STAGING_INCDIR}/tcl$whatever"</div><div><br></div><div>But =
this does not solve the problem that tcl $PV must match whatever is set in =
the tk recipe</div></div><div>Maybe we can edit tcl in oe-core like this, b=
ut I'm not sure if this would break things:</div><div><br></div><div><div>F=
rom c2e5e1e4cb9fb1107db4632c4428607931a1b3b9 Mon Sep 17 00:00:00 2001</div>=
<div>From: Markus Volk &lt;f_l_k@t-online.de&gt;</div><div>Date: Mon, 30 Ju=
n 2025 22:03:17 +0200</div><div>Subject: [PATCH] tcl: dont use version in i=
ncludedir</div><div><br></div><div>Signed-off-by: Markus Volk &lt;f_l_k@t-o=
nline.de&gt;</div><div>---</div><div>&nbsp;.../tcltk/tcl/0004-tcl-update-th=
e-header-location.patch &nbsp; | 8 ++++----</div><div>&nbsp;meta/recipes-de=
vtools/tcltk/tcl_9.0.1.bb &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;| 6 +++---</div><div>&nbsp;2 files changed, 7 insertions(+), 7=
 deletions(-)</div><div><br></div><div>diff --git a/meta/recipes-devtools/t=
cltk/tcl/0004-tcl-update-the-header-location.patch b/meta/recipes-devtools/=
tcltk/tcl/0004-tcl-update-the-header-location.patch</div><div>index 50a4a27=
256..1bcdfb3c22 100644</div><div>--- a/meta/recipes-devtools/tcltk/tcl/0004=
-tcl-update-the-header-location.patch</div><div>+++ b/meta/recipes-devtools=
/tcltk/tcl/0004-tcl-update-the-header-location.patch</div><div>@@ -34,7 +34=
,7 @@ index b5f9ab7..fbc87a2 100644</div><div>&nbsp;&nbsp;</div><div>&nbsp;=
 # Directory in which to install the include file tcl.h:</div><div>&nbsp;-I=
NCLUDE_INSTALL_DIR<span class=3D"Apple-tab-span" style=3D"white-space: pre;=
">	</span>=3D $(INSTALL_ROOT)$(includedir)</div><div>-+INCLUDE_INSTALL_DIR<=
span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>=3D $(INS=
TALL_ROOT)$(includedir)/tcl$(VERSION)</div><div>++INCLUDE_INSTALL_DIR<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>=3D $(INSTALL_=
ROOT)$(includedir)/tcl</div><div>&nbsp;&nbsp;</div><div>&nbsp; # Path to th=
e private tcl header dir:</div><div>&nbsp; PRIVATE_INCLUDE_DIR<span class=
=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>=3D @PRIVATE_INCLUD=
E_DIR@</div><div>@@ -47,7 +47,7 @@ index 43ec7e4..19524d1 100644</div><div>=
&nbsp;&nbsp;</div><div>&nbsp; test -z "$TCL_LIBRARY" &amp;&amp; TCL_LIBRARY=
=3D'$(libdir)/tcl$(VERSION)'</div><div>&nbsp;-PRIVATE_INCLUDE_DIR=3D'$(incl=
udedir)'</div><div>-+PRIVATE_INCLUDE_DIR=3D'$(includedir)/tcl$(VERSION)'</d=
iv><div>++PRIVATE_INCLUDE_DIR=3D'$(includedir)/tcl'</div><div>&nbsp; HTML_D=
IR=3D'$(DISTDIR)/html'</div><div>&nbsp;&nbsp;</div><div>&nbsp; # Note: &nbs=
p;in the following variable, it's important to use the absolute</div><div>@=
@ -56,7 +56,7 @@ index 43ec7e4..19524d1 100644</div><div>&nbsp;&nbsp;</div>=
<div>&nbsp; # Install time header dir can be set via --includedir</div><div=
>&nbsp;-eval "TCL_INCLUDE_SPEC=3D\"-I${includedir}\""</div><div>-+eval "TCL=
_INCLUDE_SPEC=3D\"-I${includedir}/tcl${VERSION}\""</div><div>++eval "TCL_IN=
CLUDE_SPEC=3D\"-I${includedir}/tcl\""</div><div>&nbsp;&nbsp;</div><div>&nbs=
p; #-----------------------------------------------------------------------=
-</div><div>&nbsp; # tclConfig.sh refers to this by a different name</div><=
div>@@ -69,7 +69,7 @@ index 9c6da82..8aa5ae8 100644</div><div>&nbsp; exec_p=
refix=3D@exec_prefix@</div><div>&nbsp; libdir=3D@libdir@</div><div>&nbsp;-i=
ncludedir=3D@includedir@</div><div>-+includedir=3D@includedir@/tcl@PACKAGE_=
VERSION@</div><div>++includedir=3D@includedir@/tcl</div><div>&nbsp; libfile=
=3D@TCL_LIB_FILE@</div><div>&nbsp;&nbsp;</div><div>&nbsp; Name: Tool Comman=
d Language</div><div>diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb =
b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb</div><div>index 70aa9b606c..bafe=
a067ed 100644</div><div>--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb</div=
><div>+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb</div><div>@@ -51,13 +5=
1,13 @@ do_install() {</div><div>&nbsp;<span class=3D"Apple-tab-span" style=
=3D"white-space: pre;">	</span>ln -sf ./tclsh${VER} ${D}${bindir}/tclsh</di=
v><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</=
span>ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}</div><div>&nbsp;<span class=
=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>sed -i "s;-L${B};-L=
${STAGING_LIBDIR};g" tclConfig.sh</div><div>-<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>sed -i "s;'${WORKDIR};'${STAGING_INCDI=
R};g" tclConfig.sh</div><div>+<span class=3D"Apple-tab-span" style=3D"white=
-space: pre;">	</span>sed -i "s;'${WORKDIR};'${STAGING_INCDIR}/tcl;g" tclCo=
nfig.sh</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space=
: pre;">	</span>install -d ${D}${bindir_crossscripts}</div><div>&nbsp;<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>install -m 07=
55 tclConfig.sh ${D}${bindir_crossscripts}</div><div>&nbsp;<span class=3D"A=
pple-tab-span" style=3D"white-space: pre;">	</span>install -m 0755 tclConfi=
g.sh ${D}${libdir}</div><div>&nbsp;<span class=3D"Apple-tab-span" style=3D"=
white-space: pre;">	</span>for dir in compat generic unix; do</div><div>-<s=
pan class=3D"Apple-tab-span" style=3D"white-space: pre;">		</span>install -=
d ${D}${includedir}/${BPN}${VER}/$dir</div><div>-<span class=3D"Apple-tab-s=
pan" style=3D"white-space: pre;">		</span>install -m 0644 ${S}/$dir/*.h ${D=
}${includedir}/${BPN}${VER}/$dir/</div><div>+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">		</span>install -d ${D}${includedir}/${BPN}/$=
dir</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
	</span>install -m 0644 ${S}/$dir/*.h ${D}${includedir}/${BPN}/$dir/</div><=
div>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</spa=
n>done</div><div>&nbsp;}</div><div>&nbsp;</div><div>--&nbsp;</div><div>2.49=
.0</div></div></div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Mon, =
Jun 30 2025 at 11:05:16 -07:00:00, Alper Ak via lists.openembedded.org &lt;=
alperyasinak1=3Dgmail.com@lists.openembedded.org&gt; wrote:<br><blockquote =
type=3D"cite"><div>Hi Markus,<br><br>I recently sent a patch similar to you=
rs. Yes, this really solves the problem, but there seem to be two things to=
 think about:<br><br>1) if tcl and tk can be upgraded independently (tcl re=
cipe is in poky, tk is in meta-oe), this may cause failure if tcl is upgrad=
ed without upgrading tk. We are telling him to look at -I${STAGING_INCDIR}/=
tcl${VER} but when tcl is upgraded, if tk isn't upgraded to the same versio=
n, it will probably fail.<br><br>
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
</blockquote></div>
--=-RQd5yfWorvn8NaCpgQGu--


