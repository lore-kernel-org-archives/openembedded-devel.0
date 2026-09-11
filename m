Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD464C88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:01:38 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41535.1789138894934736990
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 08:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U/zdiUzY;
 spf=pass (domain: gmail.com, ip: 74.125.224.140, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99ddso359197b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 08:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789138894; cv=none;
        d=google.com; s=arc-20260327;
        b=PsYJqVpt2WplW2WxQPRvOyuuLV/i9OuIS2qKcw9l8jsnMD0cqBagIjIK1zW51NPAA+
         /yZFPRjoHn5OEVfWYGFRavVa5wjRZNKOPYzP2sM0wjCE3HdwCGu6E97/Q0UelqV96oOT
         /y0r4EZxrsSrIaZcojkFCbc2FYsDWA8POLqcwoSN0KZsds0ouLekPK+slOLfDvkbb9gf
         W54UPC6vN8GxygpTrP9lL+6Y9fuUDMWldAe0K/9bJgiDv+XX4LytWq766yA4N7txnD4U
         pfKMASL8wqWHBTf3PAYHV4z9wAw3jyVsXFnxHl55t8pyTCrbSHIXzTPpXcclQbOCPJ7L
         PJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E7BD4mlqE9Gr7H1cQ81HJ6vyi6ykuVWxV6mairKUfwE=;
        fh=/fX/h2LjTtUCGS/hlAZB7ZqjbZYt4w0AG98/qobobvU=;
        b=GYPs5FJRV6rV3zB+gIh439khy8ASy1ogWriPwlOa3tmE9ADUBWPlxuRtoZi3juD6Pk
         EmaLjFfsDODo4HIBHLJ6bpmLabryQhMGIKYxvZE6Oq/2dUnly1vYWTqwviT9If5yZwtk
         DclvZ335qKcEaFBv3jmyJzy9a7OwCVeqzo+6BTd0dtVsT4xAUk0PJQWrXb8ffDFuXVyf
         Q+spdB45R0NX4SDwm0XQJFi99fFYjylAR4eq9V1bzqzZcV79RWYg7R2A2SoR7zN0yo7M
         uGGvZf5ppRu0OgkcER06tItLJJ9WJvkf8Pf2wVivJHFZpvhuOqK1AuA3vfwFzMpWl6zO
         5XTA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789138894; x=1789743694; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7BD4mlqE9Gr7H1cQ81HJ6vyi6ykuVWxV6mairKUfwE=;
        b=U/zdiUzYEzJP4yXUg+73nt/gmFQG6vogRNjlFu8jXFubNbPR+Hg65DehlunRQfcIb4
         9t6EtXL9CPs2DfmGoiXy7fZ/nBorvdyQEio89jjKXGapYlOHJUs/MTaOkqld0hCUcbxL
         lhfPW7QhEMaBWogzg+ydd8hrd8wM6dIADK0+mJP09fnZbJzEUIggWz1kGRD2qoEPn3C4
         Dz5kBLrFW4PROD57m+DLekQmko1+Or3gTXI7nyYel2vx9BeSqkWKx5+EIyZ/9/z+Ja7B
         aW1agkINBv40dEmOdfbFCtV6s/lgt5JhTX8KMrZI/nDGQzHdxYAUcXcQm34bXV1PCvqX
         /Sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138894; x=1789743694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E7BD4mlqE9Gr7H1cQ81HJ6vyi6ykuVWxV6mairKUfwE=;
        b=VNnzcmwIp/lMEXl4paFizWIQ0XyXE1s9GbQ5hcyhMA0peuWzOXRP425WehRz7dYLzY
         JTmxvwEK0kZmYSSCjVJBpVcreAW7vZwjVV0HP9neROIM28ygjnSim1mg/jgFQsyQgzJQ
         EJcg8ZxsBG26c7eHHQo3pm6abtAmSyBhGrblTU/uy1olWzhGAQFVvmhWLRSbGKU2JVyh
         iNpONlnnOeh08ZbnOzWbMszcfkBaLYHNtA94MNHHGp1sBeTGT628OBDEKBqB8Vy2oY98
         1aSevYLsNObzUleim2mStp4mRvfXSU8txjdNclVCoHMYGrSKTsW2UTHkUm/XdwCYSK4C
         gB6w==
X-Gm-Message-State: AFuF++nZS1Z0jx+3wu7wx+nc430jyi/6QeFXgCHgpcpYXOzaoABruj9j
	9Bczc7uWVq9k6hY9yOfRLOK0Mb7ejj8gTibD6Rfhd/488HkwJboFhTvqkaTjRU2JGXJIcFaFGhL
	JWLY70+GgYqcGCMlazSD9Ty3+zcFJzfI=
X-Gm-Gg: AYBFou0EdSpfHJKniC1dpkQ/h0hL2sbniBsWC6QdsiQ8/WGCEVoBNmYkWYDijPKJweL
	nhh25QLr21ZrXNp86Gkrxq/LuPRPfGhqoIzZtVCD9h+3eDHYmW9FLs7m0ZB4URsfp5aNE9N+JUI
	QRwVaJu96+wLYxI/qrVpkFbbojLKJAiy84Vsq+dspwUxzP4pKXqozKZkI+imEnAJHi8D89tO2DQ
	3dH6LqGcpPgjZ779TSuUFpbx8kPZW/X9vgQy7pKYLRS9OFceaJREIpHbYPipcNn20/HhzxgNJGf
	FfTxt7cux1JMqShlZYJMaZQiCtLJVZ4Aued8TpGQLeWJuw7ATKOvgfZq5dTpWLtJdJYLJcacyQV
	pkfWS02YTCKG1k/z+mcOn/LKb5AwtPVH+f8BZQsr9q7eWtWhbbVw4Sh9HgTmlVLZ5+13UcqpjK/
	WhSJUJSRF3UayzEa7Bhu3RlgNasbYqUc89uskGqBSPwW6EnmpwFcMDQHQQByu610bL2+aZMPSux
	NUDE8D5Qk7taYya6q0wsKmh
X-Received: by 2002:a05:690c:f05:b0:873:5bd1:98bb with SMTP id
 00721157ae682-884b29d162fmr14023637b3.45.1789138892510; Fri, 11 Sep 2026
 08:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260911045624.4072516-1-alistair.francis@wdc.com> <CAMKF1sr-M=kiTZhuOsy0sfuXHpC8ge8Yh7tBc-3uTuojmdLkhA@mail.gmail.com>
In-Reply-To: <CAMKF1sr-M=kiTZhuOsy0sfuXHpC8ge8Yh7tBc-3uTuojmdLkhA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Sep 2026 08:01:04 -0700
X-Gm-Features: AcwNN1UG9vlAmkLrD1PhR9rI0G_NvbpqlVLOKDCZLup95wTobthZzDqioIMhclA
Message-ID: <CAMKF1spvDCxwCKQKtaj0eLgcS8_p6G9t3X1E8hsdju9OW9txHQ@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] tcmu-runner: Initial commit
To: alistair23@gmail.com
Cc: openembedded-devel@lists.openembedded.org, alistair@alistair23.me, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: multipart/alternative; boundary="0000000000002464ad065b365c00"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 15:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129974

--0000000000002464ad065b365c00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

and also fails to build with clang see -
https://errors.yoctoproject.org/Errors/Details/971842/

On Fri, Sep 11, 2026 at 7:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> This fails on AB with
>
> stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: QA Issue: File /usr/src=
/debug/tcmu-runner/1.6.0/tcmuhandler-generated.c in package tcmu-runner-src=
 contains reference to TMPDIR [buildpaths]
> stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: QA Issue: File /usr/src=
/debug/tcmu-runner/1.6.0/tcmuhandler-generated.c in package tcmu-runner-src=
 contains a reference to the build host HOME directory. If upstream hardcod=
es a directory path that matches your home, you can set OEQA_BUILDPATHS_SKI=
P =3D "/srv/pokybuild" in the recipe. [buildpaths]
> stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: Fatal QA errors were fo=
und, failing task.
>
>
>
> On Thu, Sep 10, 2026 at 9:56=E2=80=AFPM Alistair Francis via
> lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
> wrote:
>
>> From: Alistair Francis <alistair.francis@wdc.com>
>>
>> Initial support for verion 1.6.0 of tcmu-runner.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  .../tcmu-runner/tcmu-runner_1.6.0.bb          | 33 +++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>  create mode 100644 meta-filesystems/recipes-utils/tcmu-runner/
>> tcmu-runner_1.6.0.bb
>>
>> diff --git a/meta-filesystems/recipes-utils/tcmu-runner/
>> tcmu-runner_1.6.0.bb b/meta-filesystems/recipes-utils/tcmu-runner/
>> tcmu-runner_1.6.0.bb
>> new file mode 100644
>> index 0000000000..c851bb10f7
>> --- /dev/null
>> +++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.0.bb
>> @@ -0,0 +1,33 @@
>> +SUMMARY =3D "A daemon that handles the userspace side of the LIO TCM-Us=
er
>> backstore"
>> +LICENSE =3D "Apache-2.0 OR LGPLv2.1"
>> +LIC_FILES_CHKSUM =3D " \
>> +       file://LICENSE.LGPLv2.1;md5=3Da7ef827a98fa240d37910ac4e8ce3f53 \
>> +       file://LICENSE.Apache2;md5=3D6c4db32a2fa8717faffa1d4f10136f47 \
>> +       "
>> +
>> +SRCREV =3D "1bdb239fa183c84d2ace6b52aa33476968a0cef7"
>> +
>> +SRC_URI =3D "git://
>> github.com/open-iscsi/tcmu-runner.git;protocol=3Dhttps;branch=3Dmain"
>> +
>> +inherit cmake pkgconfig systemd
>> +
>> +DEPENDS =3D "gtk4 libnl gperftools glib-2.0-native"
>> +
>> +EXTRA_OECMAKE =3D "-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 \
>> +                -Dwith-rbd=3Dfalse \
>> +                -Dwith-glfs=3Dfalse \
>> +                "
>> +
>> +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
>> +
>> +PACKAGECONFIG[systemd] =3D "-DSUPPORT_SYSTEMD=3DON,,"
>> +
>> +SYSTEMD_SERVICE:${PN} =3D "tcmu-runner.service"
>> +SYSTEMD_AUTO_ENABLE =3D "enable"
>> +
>> +FILES:${PN} +=3D " \
>> +    ${systemd_user_unitdir}/lib \
>> +    ${systemd_user_unitdir}/tcmu-runner \
>> +    ${systemd_system_unitdir}/tcmu-runner.service \
>> +    ${datadir}/dbus-1 \
>> +"
>> --
>> 2.55.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#129952):
>> https://lists.openembedded.org/g/openembedded-devel/message/129952
>> Mute This Topic: https://lists.openembedded.org/mt/121193927/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000002464ad065b365c00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">and also fails to build with clang see -=C2=A0<a href=3D"h=
ttps://errors.yoctoproject.org/Errors/Details/971842/">https://errors.yocto=
project.org/Errors/Details/971842/</a></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 11,=
 2026 at 7:43=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr">This fails on AB with=C2=A0<div><br></d=
iv><div><pre style=3D"box-sizing:border-box;font-family:SFMono-Regular,Menl=
o,Monaco,Consolas,&quot;Liberation Mono&quot;,&quot;Courier New&quot;,monos=
pace;font-size:12.25px;margin-top:0px;margin-bottom:0px;overflow:auto;color=
:rgb(238,238,238);padding:9.5px;background-color:rgb(0,0,0)"><div style=3D"=
box-sizing:border-box"><span style=3D"box-sizing:border-box"><span style=3D=
"box-sizing:border-box">stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: Q=
A Issue: File /usr/src/debug/tcmu-runner/1.6.0/tcmuhandler-generated.c in p=
ackage tcmu-runner-src contains reference to TMPDIR [buildpaths]</span></sp=
an></div><div style=3D"box-sizing:border-box"><span style=3D"box-sizing:bor=
der-box"><span style=3D"box-sizing:border-box">stdio: ERROR: tcmu-runner-1.=
6.0-r0 do_package_qa: QA Issue: File /usr/src/debug/tcmu-runner/1.6.0/tcmuh=
andler-generated.c in package tcmu-runner-src contains a reference to the b=
uild host HOME directory. If upstream hardcodes a directory path that match=
es your home, you can set OEQA_BUILDPATHS_SKIP =3D &quot;/srv/pokybuild&quo=
t; in the recipe. [buildpaths]</span></span></div><div style=3D"box-sizing:=
border-box"><span style=3D"box-sizing:border-box"><span style=3D"box-sizing=
:border-box">stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: Fatal QA err=
ors were found, failing task.</span></span></div></pre></div><div><br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Sep 10, 2026 at 9:56=E2=80=AFPM Alistair Francis via <a href=3D"ht=
tp://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &=
lt;alistair23=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Alistair Francis &lt;<a h=
ref=3D"mailto:alistair.francis@wdc.com" target=3D"_blank">alistair.francis@=
wdc.com</a>&gt;<br>
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
</blockquote></div>

--0000000000002464ad065b365c00--

