Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6933AC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:43:36 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41074.1789137811096829458
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K2lWQe1m;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4ddd17a0so299797b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137810; cv=none;
        d=google.com; s=arc-20260327;
        b=lL/AKEIYZ0Ot0TKVzty3vvxvK4ARFgv0a8jcoFrYwfZn5hhVlhQPilPZA/mgFNWW4r
         zmFxdXt52BZqeEvrbyaXx8BJ+PPa5xQFY85+TQYp8UK4/bTWDjpKPUaiWBWanSXANIZa
         Ud9Py3ydH1c17lx7vVcu9jpTKabZ3mfj070jFH9zsw3+PJNnBqwl7l5//1YZGDObFS/E
         tWyDlLILW5P445tYAUb3nht1zNQZuifsc9ARvxIpFQC5INpBhNOt5gLQSoijDtu4dGLz
         bJNs/L0Ht6PcPxGZlHR/Hy6zj1tUrYdU5QE/ymuvo1s8Avbvb4sDOs0qe3Gx6Llr2fTF
         Dc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZGC7uJ8V0fU5OE/iZ9clN5B5WjsPJDk7h7qJtzFfYk0=;
        fh=/fX/h2LjTtUCGS/hlAZB7ZqjbZYt4w0AG98/qobobvU=;
        b=GJp4hDzBuxV9YJp8e9D4y4jqb72z2oRWQoc8AMLOD2l5cy45PMzx/wIBJXp0c9uB89
         jnHbL562gCO59g6fjDEWKJ7dyHXL0bPjYu8w2vvT88744ogzSf1uQWCh639zP0XcrAVx
         42xOUoifp3F17sVhnZLvFW5Oi82t8LfDpos03z1vSkH5/i26Xh7f2Znmv9DI5ZZmd4UO
         LFeKxgxbLhrIMcBVOmLL3QXjlYxg73N76Zoi1Jex8sCnALZMPSpamumlfWdmY92Kdt4F
         t0Y2sh4HYTsggblkoSBbQhofmjbtQBBUEm5pOecgZ2iEwJFkgcSnlr9Hllz33MM/tmbK
         0PtA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137810; x=1789742610; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGC7uJ8V0fU5OE/iZ9clN5B5WjsPJDk7h7qJtzFfYk0=;
        b=K2lWQe1mirlzbZbhpZDXQ5Rt1gMEgOo6KT2gOb+6Cq2uCHnvRgFH44wZayTzxxDOBO
         Zjz3EiMXYPBJH4dREjDe5j+GA9/bZN4f+xcbO8CM2StQNrI9K2ThcKPK7+RaLUWcK1Xs
         6l5+deO0xQ6mnjt4HeCcPAb7aHiOWExN9foHZLEUbgCrLExt4PSHUev+7iZ4fYMME7Wi
         yE366MqJH4MCaHcLAkNU7sIB3dzRdGdRD53ZoWRQMNt548TQi0d0KsuSRFEFTwzEzdng
         BlKLjiQzYbN2gudskWgSXBDJAKs94szOch9aK5K6Jcms1IQnWNDLqvcqUh81ZG6er6Wh
         RYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137810; x=1789742610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZGC7uJ8V0fU5OE/iZ9clN5B5WjsPJDk7h7qJtzFfYk0=;
        b=QQlpm6eRn5oTzi3951+gbfDpImoS2HBoA/f0089NR8m3qWLOZUgHhTbufX2VR5gIzS
         8LMoWux7dBpIYozbLHWQamNuzrAnxRT2omHygWYW8sj+cK/sjP8Zh6bs7XvO4Ws9UhdF
         XmJbCmVrsEBDbT3O5VaMuhx6IIuC1VGKBoiY8G8zX6NkxJebb7ge3ZgdQPyS1yanUMnC
         TcXgjwjMdYqaOjHpmMJPUWl4Ur86tEn2QrIezuBr0mxcNXEqxdIzkWQzqTNnr/u8H/l1
         N0jpYjlrwKG2iFn/qrfYGhHf3VfGmrwvka6wfucMFs+Z8VC8E3+nbvr3dWlik/N8rux2
         XfYA==
X-Gm-Message-State: AFuF++mMKHBOaevQfSLBEPIyxkyuO23k3LST0AeGKVsVHxda53iY/ejq
	6MNpSOeR5BM4uH8V9Fl5wa0B8e5MGRItCL+YKcl/207rFNUtorsNZUAkzyoTnTewBOU8roM7Otc
	VP/mREcX8VhDl8v6teDPm/8ACsFob0jY=
X-Gm-Gg: AYBFou0jMSsFUceZCkbv+rRN7XIesEfWN8N/04FZwulCagoQrXxPyRCLR4heoPrttO2
	bTOqb4ZpKNa/Jr+F8gPwQaVJK8tCxjIv6SaZWGi/sxSwglZd8ew5dmMahurwxFTKtnzTuntgpOd
	IThFupvU5pmq1eBDdUCb2/tH1S6qF5kVT+h0pEsAa3kdKxE4jFH7Q04+7dM9wG35QY4odVgT5Zd
	rvZoKU+N5sUs5TlYk9h0xVhzCC2Tm8FC49gymXyMCG4jeLK+F30mp4PU3B/GTV2uQNeOJ5Kl50U
	jl62XbOPUE3W5Y/Z/rgnp3qNl41J1dPksrj28tP4T522tU5B83d0EKLIngc/UJOGKjfXum13YbH
	0meFh2ZRfma2zM4Ph+t4l2T9o9oWm0r2AkRvY7p+Ioygad6QHfnOMrIARv2JmdzFrZtg1W1i0NZ
	LCfjmxBzB1LSXQGKwk3ba5Qv6H98CDwMiLfhoovPCpxq+vh2ay1rbN/V+RnEoUbNDmFYQbi0IMn
	jJWVPsUp6fMJI01BBN6yrYd
X-Received: by 2002:a05:690c:e0d4:20b0:7db:ccda:a409 with SMTP id
 00721157ae682-884afc1c768mr16689967b3.9.1789137809961; Fri, 11 Sep 2026
 07:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260911045624.4072516-1-alistair.francis@wdc.com>
In-Reply-To: <20260911045624.4072516-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Sep 2026 07:43:02 -0700
X-Gm-Features: AcwNN1XLY7D2BvBwtJbb15JFr64R0qQQObs8BAqfMeZ4U4n7w0al6X3wrUvV2ek
Message-ID: <CAMKF1sr-M=kiTZhuOsy0sfuXHpC8ge8Yh7tBc-3uTuojmdLkhA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] tcmu-runner: Initial commit
To: alistair23@gmail.com
Cc: openembedded-devel@lists.openembedded.org, alistair@alistair23.me, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: multipart/alternative; boundary="0000000000009df831065b361b76"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 14:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129973

--0000000000009df831065b361b76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails on AB with

stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: QA Issue: File
/usr/src/debug/tcmu-runner/1.6.0/tcmuhandler-generated.c in package
tcmu-runner-src contains reference to TMPDIR [buildpaths]
stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: QA Issue: File
/usr/src/debug/tcmu-runner/1.6.0/tcmuhandler-generated.c in package
tcmu-runner-src contains a reference to the build host HOME directory.
If upstream hardcodes a directory path that matches your home, you can
set OEQA_BUILDPATHS_SKIP =3D "/srv/pokybuild" in the recipe.
[buildpaths]
stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: Fatal QA errors were
found, failing task.



On Thu, Sep 10, 2026 at 9:56=E2=80=AFPM Alistair Francis via lists.openembe=
dded.org
<alistair23=3Dgmail.com@lists.openembedded.org> wrote:

> From: Alistair Francis <alistair.francis@wdc.com>
>
> Initial support for verion 1.6.0 of tcmu-runner.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../tcmu-runner/tcmu-runner_1.6.0.bb          | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta-filesystems/recipes-utils/tcmu-runner/
> tcmu-runner_1.6.0.bb
>
> diff --git a/meta-filesystems/recipes-utils/tcmu-runner/
> tcmu-runner_1.6.0.bb b/meta-filesystems/recipes-utils/tcmu-runner/
> tcmu-runner_1.6.0.bb
> new file mode 100644
> index 0000000000..c851bb10f7
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.0.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "A daemon that handles the userspace side of the LIO TCM-Use=
r
> backstore"
> +LICENSE =3D "Apache-2.0 OR LGPLv2.1"
> +LIC_FILES_CHKSUM =3D " \
> +       file://LICENSE.LGPLv2.1;md5=3Da7ef827a98fa240d37910ac4e8ce3f53 \
> +       file://LICENSE.Apache2;md5=3D6c4db32a2fa8717faffa1d4f10136f47 \
> +       "
> +
> +SRCREV =3D "1bdb239fa183c84d2ace6b52aa33476968a0cef7"
> +
> +SRC_URI =3D "git://
> github.com/open-iscsi/tcmu-runner.git;protocol=3Dhttps;branch=3Dmain"
> +
> +inherit cmake pkgconfig systemd
> +
> +DEPENDS =3D "gtk4 libnl gperftools glib-2.0-native"
> +
> +EXTRA_OECMAKE =3D "-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 \
> +                -Dwith-rbd=3Dfalse \
> +                -Dwith-glfs=3Dfalse \
> +                "
> +
> +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}=
"
> +
> +PACKAGECONFIG[systemd] =3D "-DSUPPORT_SYSTEMD=3DON,,"
> +
> +SYSTEMD_SERVICE:${PN} =3D "tcmu-runner.service"
> +SYSTEMD_AUTO_ENABLE =3D "enable"
> +
> +FILES:${PN} +=3D " \
> +    ${systemd_user_unitdir}/lib \
> +    ${systemd_user_unitdir}/tcmu-runner \
> +    ${systemd_system_unitdir}/tcmu-runner.service \
> +    ${datadir}/dbus-1 \
> +"
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129952):
> https://lists.openembedded.org/g/openembedded-devel/message/129952
> Mute This Topic: https://lists.openembedded.org/mt/121193927/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009df831065b361b76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails on AB with=C2=A0<div><br></div><div><pre class=
=3D"gmail-bb-log-preview-contents gmail-select-content gmail-log" style=3D"=
box-sizing:border-box;font-family:SFMono-Regular,Menlo,Monaco,Consolas,&quo=
t;Liberation Mono&quot;,&quot;Courier New&quot;,monospace;font-size:12.25px=
;margin-top:0px;margin-bottom:0px;overflow:auto;color:rgb(238,238,238);padd=
ing:9.5px;background-color:rgb(0,0,0)"><div class=3D"gmail-logline" style=
=3D"box-sizing:border-box"><span class=3D"gmail-log_o" style=3D"box-sizing:=
border-box"><span style=3D"box-sizing:border-box">stdio: ERROR: tcmu-runner=
-1.6.0-r0 do_package_qa: QA Issue: File /usr/src/debug/tcmu-runner/1.6.0/tc=
muhandler-generated.c in package tcmu-runner-src contains reference to TMPD=
IR [buildpaths]</span></span></div><div class=3D"gmail-logline" style=3D"bo=
x-sizing:border-box"><span class=3D"gmail-log_o" style=3D"box-sizing:border=
-box"><span style=3D"box-sizing:border-box">stdio: ERROR: tcmu-runner-1.6.0=
-r0 do_package_qa: QA Issue: File /usr/src/debug/tcmu-runner/1.6.0/tcmuhand=
ler-generated.c in package tcmu-runner-src contains a reference to the buil=
d host HOME directory. If upstream hardcodes a directory path that matches =
your home, you can set OEQA_BUILDPATHS_SKIP =3D &quot;/srv/pokybuild&quot; =
in the recipe. [buildpaths]</span></span></div><div class=3D"gmail-logline"=
 style=3D"box-sizing:border-box"><span class=3D"gmail-log_o" style=3D"box-s=
izing:border-box"><span style=3D"box-sizing:border-box">stdio: ERROR: tcmu-=
runner-1.6.0-r0 do_package_qa: Fatal QA errors were found, failing task.</s=
pan></span></div></pre></div><div><br></div></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, S=
ep 10, 2026 at 9:56=E2=80=AFPM Alistair Francis via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;alistair23=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" target=
=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Initial support for verion 1.6.0 of tcmu-runner.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0.../tcmu-runner/<a href=3D"http://tcmu-runner_1.6.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">tcmu-runner_1.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 33 +++++++++++++++++++<br>
=C2=A01 file changed, 33 insertions(+)<br>
=C2=A0create mode 100644 meta-filesystems/recipes-utils/tcmu-runner/<a href=
=3D"http://tcmu-runner_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">tcmu-=
runner_1.6.0.bb</a><br>
<br>
diff --git a/meta-filesystems/recipes-utils/tcmu-runner/<a href=3D"http://t=
cmu-runner_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">tcmu-runner_1.6.0=
.bb</a> b/meta-filesystems/recipes-utils/tcmu-runner/<a href=3D"http://tcmu=
-runner_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">tcmu-runner_1.6.0.bb=
</a><br>
new file mode 100644<br>
index 0000000000..c851bb10f7<br>
--- /dev/null<br>
+++ b/meta-filesystems/recipes-utils/tcmu-runner/<a href=3D"http://tcmu-run=
ner_1.6.0.bb" rel=3D"noreferrer" target=3D"_blank">tcmu-runner_1.6.0.bb</a>=
<br>
@@ -0,0 +1,33 @@<br>
+SUMMARY =3D &quot;A daemon that handles the userspace side of the LIO TCM-=
User backstore&quot;<br>
+LICENSE =3D &quot;Apache-2.0 OR LGPLv2.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://LICENSE.LGPLv2.1;md5=3Da7ef827a98fa240d3=
7910ac4e8ce3f53 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://LICENSE.Apache2;md5=3D6c4db32a2fa8717faf=
fa1d4f10136f47 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+SRCREV =3D &quot;1bdb239fa183c84d2ace6b52aa33476968a0cef7&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/open-iscsi/tcmu-runne=
r.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">=
github.com/open-iscsi/tcmu-runner.git;protocol=3Dhttps;branch=3Dmain</a>&qu=
ot;<br>
+<br>
+inherit cmake pkgconfig systemd<br>
+<br>
+DEPENDS =3D &quot;gtk4 libnl gperftools glib-2.0-native&quot;<br>
+<br>
+EXTRA_OECMAKE =3D &quot;-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dwith-rbd=3Dfalse=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -Dwith-glfs=3Dfals=
e \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+PACKAGECONFIG ?=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#3=
9;systemd&#39;, d)}&quot;<br>
+<br>
+PACKAGECONFIG[systemd] =3D &quot;-DSUPPORT_SYSTEMD=3DON,,&quot;<br>
+<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;tcmu-runner.service&quot;<br>
+SYSTEMD_AUTO_ENABLE =3D &quot;enable&quot;<br>
+<br>
+FILES:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${systemd_user_unitdir}/lib \<br>
+=C2=A0 =C2=A0 ${systemd_user_unitdir}/tcmu-runner \<br>
+=C2=A0 =C2=A0 ${systemd_system_unitdir}/tcmu-runner.service \<br>
+=C2=A0 =C2=A0 ${datadir}/dbus-1 \<br>
+&quot;<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129952): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129952" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129952</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121193927/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121193927/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009df831065b361b76--

