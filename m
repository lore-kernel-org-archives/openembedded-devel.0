Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEDDC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 06:18:20 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6085.1788329883978722840
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 23:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F0S6+TMJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-86cba60d4f2so1660387b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 23:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788329883; cv=none;
        d=google.com; s=arc-20260327;
        b=k1XCtWmXrAUY+x9kbQhA/crBZBT1kczawZx/dgRxSgB9dRIWS8r3LEY4l5+95vCvqB
         Tgq/oN9npREL2H0nNVl9er3WO3rvs/WF0DHFTmc6DpjceeoZc6LZETpeElg0JecFkl/e
         uGuoO0/p60mP0/2nOOD+HT7Jx2tmLpsjxrle5l7qDjos30mcCB3QPOBqw7AoMqcebM0D
         ObtndOF7eXRXwCWYOdv9yqbQg/sjA67DwiyZ+TzVI5xE+RPnjHgFYLa4ymBGLvqDYIXZ
         QLvUW93MOTBZ1ya9slzIgfKjknxuktRtXRGR5jsL/gzE9nAMzgBoxtuWAUZXRvE0fQ6l
         T9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kAqe81220j1eCiObq98rTG/bbfUc5ej6NLfeB1N4V5g=;
        fh=rxY9BjvkjVzIDrsDDwe4/Peo+8R42FUuRq/S3rGt4UU=;
        b=oQkEB7IlGJ/9qNGOnoaqoElcM2xrwlErGjax3LYUb3woqR2jSwerlREdvBY17poXyB
         ThdyUuyStTrrL8rGCrvMlVNt68GbQA9fg0MWnafipNCiR/9QbpyNrx1bvE1MY/lWM8ll
         rbLD0e1poBwaSsiRl1aaN8F2bjPKycKW+oEzIy4Z+c8QkA6qYk6QE7NRIDDZr77vONnc
         PeAzqOsy5zk3hdF8WnHGv39E9FFfeVwDmOtn8Y1N1J/vjMniv0Ox1/qICwUJRgBx10Bv
         J1wxDIWSWkdpRrNMwh2nleHK3dBPh12U5sA4Z2t9FevndLUMfhg/eoC+fJW7SZ5SDBfE
         BRjQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788329883; x=1788934683; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAqe81220j1eCiObq98rTG/bbfUc5ej6NLfeB1N4V5g=;
        b=F0S6+TMJJmyTK2UCYBDsF2wuxmh0epuItimG03tYxQQFarZLM3Rn1FYPpe41Gyd6Ql
         1X1jB+S3VoXD4VPeSDOwEi1LnRA/DTsDeX8IjZL2unYjs5CRJzNbUSFIMW2BpIzY5ts2
         RRCnjxFmmgjRwEo3C8O8h6UUkO7smPty0CtiHG89IxjHCzreIf6SZLts8NERpSI1yaaH
         WF/terF2j3cN1kmF30jVUVHW47tNtIy7imdif5rztEJEov3vqHr/PczqRjwcXejnEr5v
         86IhpiQHLI6NUHJEDP6riDUwhZpD8A+J+IeizPCybV8/19G10mnplmyFPcpWrtTAQgZF
         8D8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329883; x=1788934683;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kAqe81220j1eCiObq98rTG/bbfUc5ej6NLfeB1N4V5g=;
        b=rzv/8Um222tGb9LB9rnjHxiJL820ZjF+Q5aWqWGj3P+ZCCpgl+tEcPoer6h3CK5N2Z
         8zscFRqWvmEK8EUjESd9X3EYK6hqFC2PxP++nTF6ybynEmc3s8vmUbZFN5WLUNZVJOpV
         HC2hpwKoIXhkhZI2eU3ZWODTVnLRbiMeKZIuY86qTaa6i3FTTgJCxfTcCpYNBt/oq0J0
         2bGk0oOn78MFmNoe6CgO/0WGs/ztlVSm7FOhu2xDbEPl8Xx2YQp7xhHNAGQYJgNeDWGR
         VIJWEbJPc9LK31T4ahnhF4ox2bd8ya9wVfg87IVVpLCvLa0jDdEic/3NqXylZ+eqYLmk
         2o5w==
X-Gm-Message-State: AFuF++km6QT08U8wePs3FOrPyB6THLi+RdqjDcEX832h5NrSu9bgmaYc
	B/OL3TH3bjK7B5d7Kk5RM+zE3ooNws9A2aaHRbILFpQEqL7KO4FsRhwmGEMxjKfXAbKW6j9Zhw9
	kHyndNBMUyxBMhVh6VLeO0X//GbCAVYfjPQ==
X-Gm-Gg: AYBFou1fls3XIroM+CPKYbIpAnfWKugnwJEobj4LT487Q1MpUlYGtwDc8zHdasSGRDX
	3gg3ymz2YmokOAVQTaZCbBVRC1D+Jmwbrd9DnmgKjfz+Ii+5yhU6bqk2dh4OgOtLp/4wBy3/wOw
	UFiGGHIcHFYOpv7ow3c/yzHyQLiSq+6cJL92k8q+iNNubpKIbf5SckORFPgg//1INt6BRQq+NZM
	lhvscXutY0JjPRYNaDnbKt11IzyRLXwhQWj7z8nlA1zEPtsfzi1DJtHLwmsAXRxWgMe3CxkZ6Uv
	wXARCUwprGgXxlpM1bsw9NJBZwXBVEXtPmTxZLjRH7O0agSgKiAutrfmlAiQifnfKJwKOEdT58Z
	DhGrw4BS3WzOJAYCBI8KygTICSak3bPAinZjXIcjqKKGOqjvhV4Y0CmKN1EoPSDek4nWSDtCZ/s
	MER9aSSh0crOqxrBmJNsauJihzjfPTQ3/GfzAbhMIud7Y+lBwDTybZ5DFONxbJL9mhyGuW8oi/z
	9TdJNxWI02rNw==
X-Received: by 2002:a05:690c:7:b0:860:a41:cc74 with SMTP id
 00721157ae682-86c51d42776mr11243757b3.20.1788329882960; Tue, 01 Sep 2026
 23:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260902012611.448874-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260902012611.448874-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Sep 2026 23:17:36 -0700
X-Gm-Features: AcwNN1WBukhqKScVNmZ54cjqFjBBByN3iKyk-1ENubh7ViMaB3fcMkxHh4tZBaM
Message-ID: <CAMKF1sr1qM_sz4FRn6m+gQeUFmrap99penVb1bmgk=W-c7k6yg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] Revert "cyclictest: add real-time
 latency measurement recipe"
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org, 
	Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000006a47c3065a79ff51"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 06:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129631

--0000000000006a47c3065a79ff51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Dmitry, I should have noticed it but It completely fell through
cracks.

On Tue, Sep 1, 2026 at 6:26=E2=80=AFPM Dmitry Baryshkov via lists.openembed=
ded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> cyclictest is a part of the rt-tests suite which has the recipe in
> OE-Core since prehistoric times. Revert the commit 1253fb84313b
> ("cyclictest: add real-time latency measurement recipe") which
> duplicated a part of OE-Core recipe.
>
> Cc: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../cyclictest/cyclictest_git.bb              | 26 -------------------
>  .../packagegroups/packagegroup-meta-oe.bb     |  1 -
>  2 files changed, 27 deletions(-)
>  delete mode 100644 meta-oe/recipes-benchmark/cyclictest/cyclictest_git.b=
b
>
> diff --git a/meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb
> b/meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb
> deleted file mode 100644
> index d3fbcf6394e7..000000000000
> --- a/meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -SUMMARY =3D "Real-time latency measurement tool"
> -DESCRIPTION =3D "Cyclictest is a tool for measuring real-time latency an=
d
> jitter on Linux systems. It measures the latency of the kernel scheduler.=
"
> -HOMEPAGE =3D "https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git=
"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> -
> -SRC_URI =3D "git://
> git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;protocol=3Dhttps;branc=
h=3Dmain
> "
> -SRCREV =3D "7aca81171ea05a03d0e8698af4ae53c5177f5f83"
> -
> -UPSTREAM_CHECK_COMMITS =3D "1"
> -
> -DEPENDS =3D "numactl"
> -
> -# Filter out unsupported compiler flags
> -CFLAGS:remove =3D "-fcanon-prefix-map"
> -
> -do_configure[noexec] =3D "1"
> -
> -do_compile() {
> -    oe_runmake NUMA=3D1 CC=3D"${CC}" CFLAGS=3D"${CFLAGS}" LDFLAGS=3D"${L=
DFLAGS}"
> cyclictest
> -}
> -
> -do_install() {
> -    install -d ${D}${bindir}
> -    install -m 0755 ${B}/cyclictest ${D}${bindir}/cyclictest
> -}
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 8f32706ef9ab..0320021d6550 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -54,7 +54,6 @@ RDEPENDS:packagegroup-meta-oe-benchmarks =3D "\
>      bonnie++ \
>      coremark-pro \
>      cpupower \
> -    cyclictest \
>      dbench \
>      dhrystone \
>      fio \
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129628):
> https://lists.openembedded.org/g/openembedded-devel/message/129628
> Mute This Topic: https://lists.openembedded.org/mt/121044832/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006a47c3065a79ff51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Dmitry, I should have noticed it but It completely=
=C2=A0fell through cracks.=C2=A0</div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 1, 2026 a=
t 6:26=E2=80=AFPM Dmitry Baryshkov via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;dmitry.baryshkov=3D<a href=3D"mailto:o=
ss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">cyclictest is a part of the rt-tests suite which has the recipe in<br>
OE-Core since prehistoric times. Revert the commit 1253fb84313b<br>
(&quot;cyclictest: add real-time latency measurement recipe&quot;) which<br=
>
duplicated a part of OE-Core recipe.<br>
<br>
Cc: Vaibhav Jindal &lt;<a href=3D"mailto:vaibjind@qti.qualcomm.com" target=
=3D"_blank">vaibjind@qti.qualcomm.com</a>&gt;<br>
Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.=
qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<b=
r>
---<br>
=C2=A0.../cyclictest/<a href=3D"http://cyclictest_git.bb" rel=3D"noreferrer=
" target=3D"_blank">cyclictest_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 26 -------------------<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-oe.bb" rel=3D"n=
oreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 -<br>
=C2=A02 files changed, 27 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-benchmark/cyclictest/<a href=3D"ht=
tp://cyclictest_git.bb" rel=3D"noreferrer" target=3D"_blank">cyclictest_git=
.bb</a><br>
<br>
diff --git a/meta-oe/recipes-benchmark/cyclictest/<a href=3D"http://cyclict=
est_git.bb" rel=3D"noreferrer" target=3D"_blank">cyclictest_git.bb</a> b/me=
ta-oe/recipes-benchmark/cyclictest/<a href=3D"http://cyclictest_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cyclictest_git.bb</a><br>
deleted file mode 100644<br>
index d3fbcf6394e7..000000000000<br>
--- a/meta-oe/recipes-benchmark/cyclictest/<a href=3D"http://cyclictest_git=
.bb" rel=3D"noreferrer" target=3D"_blank">cyclictest_git.bb</a><br>
+++ /dev/null<br>
@@ -1,26 +0,0 @@<br>
-SUMMARY =3D &quot;Real-time latency measurement tool&quot;<br>
-DESCRIPTION =3D &quot;Cyclictest is a tool for measuring real-time latency=
 and jitter on Linux systems. It measures the latency of the kernel schedul=
er.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://git.kernel.org/pub/scm/utils/rt-test=
s/rt-tests.git" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org=
/pub/scm/utils/rt-tests/rt-tests.git</a>&quot;<br>
-LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419260aa954499f7abaabaa=
882bbe&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/utils/rt-=
tests/rt-tests.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" targe=
t=3D"_blank">git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;protocol=3D=
https;branch=3Dmain</a>&quot;<br>
-SRCREV =3D &quot;7aca81171ea05a03d0e8698af4ae53c5177f5f83&quot;<br>
-<br>
-UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
-<br>
-DEPENDS =3D &quot;numactl&quot;<br>
-<br>
-# Filter out unsupported compiler flags<br>
-CFLAGS:remove =3D &quot;-fcanon-prefix-map&quot;<br>
-<br>
-do_configure[noexec] =3D &quot;1&quot;<br>
-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 oe_runmake NUMA=3D1 CC=3D&quot;${CC}&quot; CFLAGS=3D&quot;${=
CFLAGS}&quot; LDFLAGS=3D&quot;${LDFLAGS}&quot; cyclictest<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
-=C2=A0 =C2=A0 install -m 0755 ${B}/cyclictest ${D}${bindir}/cyclictest<br>
-}<br>
diff --git a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegr=
oup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.b=
b</a> b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-m=
eta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=
<br>
index 8f32706ef9ab..0320021d6550 100644<br>
--- a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><b=
r>
+++ b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><b=
r>
@@ -54,7 +54,6 @@ RDEPENDS:packagegroup-meta-oe-benchmarks =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0bonnie++ \<br>
=C2=A0 =C2=A0 =C2=A0coremark-pro \<br>
=C2=A0 =C2=A0 =C2=A0cpupower \<br>
-=C2=A0 =C2=A0 cyclictest \<br>
=C2=A0 =C2=A0 =C2=A0dbench \<br>
=C2=A0 =C2=A0 =C2=A0dhrystone \<br>
=C2=A0 =C2=A0 =C2=A0fio \<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129628): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129628" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129628</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121044832/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121044832/1997914</a><br>
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

--0000000000006a47c3065a79ff51--

