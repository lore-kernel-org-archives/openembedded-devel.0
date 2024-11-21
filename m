Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE2FD6E2CA
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 10:10:02 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.7424.1732183798927109148
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 02:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id EB95F42C;
	Thu, 21 Nov 2024 11:09:56 +0100 (CET)
Received: from [192.168.178.67] ([84.154.174.58]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tE48J-0WdauO0; Thu, 21 Nov 2024 11:09:56 +0100
Date: Thu, 21 Nov 2024 11:12:23 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] geary: Specify location of iso-codes xml
 files
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <NOPANS.EOTL1S9CQ69M@t-online.de>
In-Reply-To: <20241121093022.272900-1-raj.khem@gmail.com>
References: <20241121093022.272900-1-raj.khem@gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dWz1Cb1AkYRu4Uik/h59"
X-TOI-EXPURGATEID: 150726::1732183796-92FFAF73-467C39C7/0/0 CLEAN NORMAL
X-TOI-MSGID: 75c25fb5-877f-4e88-bb9c-63e6801dd6c6
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 10:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113964

--=-dWz1Cb1AkYRu4Uik/h59
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi Khem,
can your issue also be fixed like this?
                 -Diso_639_xml=${datadir}/xml/iso-codes/iso_639.xml \
                 -Diso_3166_xml=${datadir}/xml/iso-codes/iso_3166.xml \

When I include STAGING_DATADIR, I see this error:
ERROR: geary-46.0-r0 do_package_qa: QA Issue: File 
/usr/lib/geary/libgeary-client-46.0.so in package geary contains 
reference to TMPDIR [buildpaths]
ERROR: geary-46.0-r0 do_package_qa: Fatal QA errors were found, failing 
task.
ERROR: Logfile of failure stored in: 
/home/flk/poky/build/tmp/work/corei7-64-poky-linux/geary/46.0/temp/log.do_package_qa.232522
ERROR: Task 
(/home/flk/poky/meta-openembedded/meta-gnome/recipes-connectivity/geary/geary_46.0.bb:do_package_qa) 
failed with exit code '1'

On Thu, Nov 21 2024 at 01:30:22 AM -08:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> During cross-compiling it needs to know the location of
> staging area where these files are installed in RSS
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ---
>  meta-gnome/recipes-connectivity/geary/geary_46.0.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb 
> b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
> index 2ca27c4f36..6d6d9f5443 100644
> --- a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
> +++ b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
> @@ -47,7 +47,10 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data opengl"
> 
>  GIR_MESON_OPTION = ""
> -EXTRA_OEMESON = "-Dprofile=release"
> +EXTRA_OEMESON = "-Dprofile=release \
> +                 
> -Diso_639_xml=${STAGING_DATADIR}/xml/iso-codes/iso_639.xml \
> +                 
> -Diso_3166_xml=${STAGING_DATADIR}/xml/iso-codes/iso_3166.xml \
> +                 "
> 
>  PACKAGECONFIG[libunwind] = 
> "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
>  PACKAGECONFIG[tnef] = "-Dtnef=enabled,-Dtnef=disabled,libytnef"
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113963): 
> <https://lists.openembedded.org/g/openembedded-devel/message/113963>
> Mute This Topic: <https://lists.openembedded.org/mt/109700823/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-dWz1Cb1AkYRu4Uik/h59
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hi Khem,</div><div>can your issue =
also be fixed like this?</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;-Diso_639_xml=3D${datadir}/xml/iso-codes/iso_639.xml =
\</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-=
Diso_3166_xml=3D${datadir}/xml/iso-codes/iso_3166.xml \</div><div><br></div=
><div>When I include STAGING_DATADIR, I see this error:</div><div><div>ERRO=
R: geary-46.0-r0 do_package_qa: QA Issue: File /usr/lib/geary/libgeary-clie=
nt-46.0.so in package geary contains reference to TMPDIR [buildpaths]</div>=
<div>ERROR: geary-46.0-r0 do_package_qa: Fatal QA errors were found, failin=
g task.</div><div>ERROR: Logfile of failure stored in: /home/flk/poky/build=
/tmp/work/corei7-64-poky-linux/geary/46.0/temp/log.do_package_qa.232522</di=
v><div>ERROR: Task (/home/flk/poky/meta-openembedded/meta-gnome/recipes-con=
nectivity/geary/geary_46.0.bb:do_package_qa) failed with exit code '1'</div=
></div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Thu, Nov 21 2024 a=
t 01:30:22 AM -08:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=
=3Dgmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"=
><div class=3D"plaintext" style=3D"white-space: break-spaces;">During cross=
-compiling it needs to know the location of
staging area where these files are installed in RSS

Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;
---
 meta-gnome/recipes-connectivity/geary/geary_46.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb b/meta-gno=
me/recipes-connectivity/geary/geary_46.0.bb
index 2ca27c4f36..6d6d9f5443 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
@@ -47,7 +47,10 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data opengl"
=20
 GIR_MESON_OPTION =3D ""
-EXTRA_OEMESON =3D "-Dprofile=3Drelease"
+EXTRA_OEMESON =3D "-Dprofile=3Drelease \
+                 -Diso_639_xml=3D${STAGING_DATADIR}/xml/iso-codes/iso_639.=
xml \
+                 -Diso_3166_xml=3D${STAGING_DATADIR}/xml/iso-codes/iso_316=
6.xml \
+                 "
=20
 PACKAGECONFIG[libunwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled=
,libunwind"
 PACKAGECONFIG[tnef] =3D "-Dtnef=3Denabled,-Dtnef=3Ddisabled,libytnef"
</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#113963): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/113963">https://lists.openembedded.org/g/openembed=
ded-devel/message/113963</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109700823/361=
8223">https://lists.openembedded.org/mt/109700823/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-dWz1Cb1AkYRu4Uik/h59--


