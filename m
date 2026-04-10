Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89ADF36BBB
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 06:37:52 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150578.1775803069994221284
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 23:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V/wzmg/G;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6501d32b04bso1852708d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 23:37:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775803069; cv=none;
        d=google.com; s=arc-20240605;
        b=Fo7tqwK277CvePDMgMsZQewUBUqJlONQIx+p2Qxyk7oSJbNyBX16lRIJCTcCKQWDwI
         C11ttnOlUOQpu2f5A8ULxQ67/09Gk1spAYh5iMdRWCdKNyFghAHABij4gCyjMKWBXAxA
         VYefG6ZplqFRJCkHK7tBSRaVg+Msm5D86AE9dS6jxLs6YdKIPaEFA77nthTRx3mQHV6m
         Lp7s5nIZRLERPCTfpQ4Pakj4LHCIt1Vi+kI6tlWYfOH7lFVXedic7QLVgwKVNrjoZvF7
         swJb0KuENR9VDv9DKa/oXIwGwVhTMGZxpSDPuECE5Op1VjZrCw191/GVjml3smHukh88
         LiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jw93OS57weAqSEcnK7mY31duaywkPt/+kEKBwk6lg+k=;
        fh=EqFFGVnRn0qz4znwnmk0n+hFhLaJvAVW0pujP36Ql9U=;
        b=ZGHY01QQhNUgh0ZKIsDVI3dZndjBkjiB8IiMLf+u3MPTi2VZUD99jnDUlDqG3+CD8b
         iiFIEgjGWTz/RCcPy+x1PzaCA3Dm5ujLJFucWRd8VYNoLtQoOdkR2sPdV9eNFAhG2uuZ
         iwVh7Trm1EdX+A3H9AsSqqXCyix/apTo3gwHEjPh3tEL5nqEcNjX77EO0rNDvpEF7hEG
         /vT8uPVeagXme1JsrF7w2uE7LbNi/smdSO9D/0KDmVFKGTDHZRtO7rPGUNcjsXmv49Jp
         XI0sAjyKCYM/JXxwflajs4nDaE++XpViqlahfXQ/0gPGGX8i1SoGSUG1uQb64yDfbezr
         Eliw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775803069; x=1776407869; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw93OS57weAqSEcnK7mY31duaywkPt/+kEKBwk6lg+k=;
        b=V/wzmg/GTlRTKWsbaOwPbvu5iNbY8fc27VKfb0ZY3a03NxEOC97W2jpfKRUE8AvZOn
         DpJIx5SDSd06bkSMTsCGcgny7t34PyyMeBpkL5fxl8/lJ7uB24zfLG4V+Tsrbqs2/VDa
         BU5Y4XmOa4yf4A1pe/5qIn2acAKlV5vnu9lO176h2o1Kitpo1xlJFTMt2RtmIMNKXVfe
         mptsqledoz/98A4nwWKYPyWCcVR1o+OWiuyBCXKrhlYb15AJYCIeISSC1tIZUNKGKpdE
         pY2wix4E5+7PY+xv3c21iCeXyd5SUbgqHLfeLS4QhP1ewYpyW4I1J+wE80Jx1xxZKkO9
         qEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775803069; x=1776407869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw93OS57weAqSEcnK7mY31duaywkPt/+kEKBwk6lg+k=;
        b=o67kqrSdxFdM+VreXfaoC/BpDmchWFNAMEnNceIgL3mD5uacKunkCVnCIhiFIimCF/
         8cawReeeZOFxu/D28YnIjEZ8e55SnF/5jc+sYRRKrvUxeQxnR3EDOSpcGRHM1ME/ZuRA
         CamJT78ydkMyJL+id+aw+VJEEPc/uiabaVyIirhz4QgMSI3p8xzSHGXfsvYKjXjL2z7F
         HQBkECS07yIoLYL7MXehbLynJLRZYUB2VBh5Mx89Ua+Z+WSnaTmbmS98itOYLLvzMWC6
         RrJHGL8ZH0sObFeRWP5PEw0pRixoyDkiOaaF+hRSSTpmJeCpoxiTiRJ1nGSfts1r6v2k
         b1yw==
X-Gm-Message-State: AOJu0YxKYvW7QVdMab3P+O58YV04kTE5Cfle9E0hq/0E0KG/0ctF2ozK
	54k2ZLSa2syAexVAx88QjfQSGg2CHKr8HcXgatnUmB53naHICUdMolEU6UrL9c/3PHAz1OtWG1i
	TLI6Dsfb2Qn1WCv7sE7OTxkbVMaUn/d5BU9rO
X-Gm-Gg: AeBDieuEc2jelJDS2fLB2PzN/zhisSZJe4ZJ/PjItur3gcyoNNywLjGq0iev3SfJOFG
	9MSGXBguq4f4R9fKATRwS8x817dlLM0Wh6s3hphdynwJO3gn1krykgiPgXTEEnpHGkAeLoRdK6B
	JSumgf505JGnk3Q5hCOgdEerpoObuX6TiyhvxLeVBnpyI31UUUQyc3NALLhOyxXE4RFnmcdCGHh
	B5GmLlT8EnFzrLGcQcQP95Sn2c507oRXa7xzqNoeIPw3SjLJvM8RHF0n+V9AaXhJL51nzvfUsG9
	v/De9EGxxZDq/sRGU/JSl2mzvE8J83Vd77S880+uweZwDNwphOBZ5y6EG/kprD3eOCDpHkwhMPA
	s6oyxKKEfG6LVMUqtAvMFl5gX
X-Received: by 2002:a53:ba8d:0:b0:650:39d6:69a1 with SMTP id
 956f58d0204a3-65198a397b7mr1438517d50.4.1775803068998; Thu, 09 Apr 2026
 23:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260409220610.1216303-1-peter.marko@siemens.com>
In-Reply-To: <20260409220610.1216303-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Apr 2026 23:37:21 -0700
X-Gm-Features: AQROBzDv1Ggjr4jdG07_UKWAfaVHC9KHCEMYv15QzPyBg8PABNHSabrh9eF-6YA
Message-ID: <CAMKF1sqorucyyzMA80kpqngsJWEqVpcmx68QJjnBq+taFthn6Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] crow: add new recipe
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001e676b064f155f63"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 06:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126217

--0000000000001e676b064f155f63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

stdio: ERROR: crow-1.3.2-r0 do_fetch: Fetcher failure: Unable to find
revision f8c060c51feeca2c65828fb6f538603db4392d55 in branch master even
from upstream
stdio: ERROR: crow-1.3.2-r0 do_fetch: Bitbake Fetcher Error:
FetchError('Unable to fetch URL from any source.', 'git://
github.com/CrowCpp/Crow.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv1.3.2')
stdio: ERROR: Logfile of failure stored in:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/crow/1.3.2/temp/log.do_fetch.2934655

On Thu, Apr 9, 2026 at 3:07=E2=80=AFPM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> Crow is a C++ framework for creating HTTP or Websocket web services.
>
> Disable tests as they are using CPM (Cmake Dependency Manager), which
> would be downloading the test dependencies in configuration step.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-support/crow/crow_1.3.2.bb | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-support/crow/crow_1.3.2.bb
>
> diff --git a/meta-oe/recipes-support/crow/crow_1.3.2.bb
> b/meta-oe/recipes-support/crow/crow_1.3.2.bb
> new file mode 100644
> index 0000000000..611b732b2b
> --- /dev/null
> +++ b/meta-oe/recipes-support/crow/crow_1.3.2.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "A Fast and Easy to use microframework for the web"
> +HOMEPAGE =3D "https://crowcpp.org/"
> +DESCRIPTION =3D "Crow is a C++ framework for creating HTTP or Websocket =
web
> services. \
> +It uses routing similar to Python's Flask which makes it easy to use. \
> +It is also extremely fast, beating multiple existing C++ frameworks as
> well as non-C++ frameworks."
> +SECTION =3D "libs"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De08502e395a6f7c037ddfe7d2915f=
58e"
> +
> +SRC_URI =3D "git://
> github.com/CrowCpp/Crow.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dv${PV}
> <http://github.com/CrowCpp/Crow.git;protocol=3Dhttps;branch=3Dmaster;tag=
=3Dv$%7BPV%7D>
> "
> +SRCREV =3D "f8c060c51feeca2c65828fb6f538603db4392d55"
> +
> +inherit cmake
> +
> +DEPENDS =3D "asio"
> +
> +EXTRA_OECMAKE =3D "\
> +    -DCROW_BUILD_EXAMPLES=3DOFF \
> +    -DCROW_BUILD_TESTS=3DOFF \
> +"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126203):
> https://lists.openembedded.org/g/openembedded-devel/message/126203
> Mute This Topic: https://lists.openembedded.org/mt/118751042/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001e676b064f155f63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">stdio: ERROR: crow-1.3.2-r0 do_fetch: Fetcher failure: Una=
ble to find revision f8c060c51feeca2c65828fb6f538603db4392d55 in branch mas=
ter even from upstream<br>stdio: ERROR: crow-1.3.2-r0 do_fetch: Bitbake Fet=
cher Error: FetchError(&#39;Unable to fetch URL from any source.&#39;, &#39=
;git://<a href=3D"http://github.com/CrowCpp/Crow.git;protocol=3Dhttps;branc=
h=3Dmaster;tag=3Dv1.3.2">github.com/CrowCpp/Crow.git;protocol=3Dhttps;branc=
h=3Dmaster;tag=3Dv1.3.2</a>&#39;)<br>stdio: ERROR: Logfile of failure store=
d in: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-po=
ky-linux/crow/1.3.2/temp/log.do_fetch.2934655<br></div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Apr 9, 2026 at 3:07=E2=80=AFPM Peter Marko via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"m=
ailto:siemens.com@lists.openembedded.org">siemens.com@lists.openembedded.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D=
"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
Crow is a C++ framework for creating HTTP or Websocket web services.<br>
<br>
Disable tests as they are using CPM (Cmake Dependency Manager), which<br>
would be downloading the test dependencies in configuration step.<br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/crow/<a href=3D"http://crow_1.3.2.bb" rel=3D"=
noreferrer" target=3D"_blank">crow_1.3.2.bb</a> | 20 ++++++++++++++++++++<b=
r>
=C2=A01 file changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/crow/<a href=3D"http://cro=
w_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">crow_1.3.2.bb</a><br>
<br>
diff --git a/meta-oe/recipes-support/crow/<a href=3D"http://crow_1.3.2.bb" =
rel=3D"noreferrer" target=3D"_blank">crow_1.3.2.bb</a> b/meta-oe/recipes-su=
pport/crow/<a href=3D"http://crow_1.3.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">crow_1.3.2.bb</a><br>
new file mode 100644<br>
index 0000000000..611b732b2b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/crow/<a href=3D"http://crow_1.3.2.bb" rel=3D"=
noreferrer" target=3D"_blank">crow_1.3.2.bb</a><br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;A Fast and Easy to use microframework for the web&quot;<=
br>
+HOMEPAGE =3D &quot;<a href=3D"https://crowcpp.org/" rel=3D"noreferrer" tar=
get=3D"_blank">https://crowcpp.org/</a>&quot;<br>
+DESCRIPTION =3D &quot;Crow is a C++ framework for creating HTTP or Websock=
et web services. \<br>
+It uses routing similar to Python&#39;s Flask which makes it easy to use. =
\<br>
+It is also extremely fast, beating multiple existing C++ frameworks as wel=
l as non-C++ frameworks.&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De08502e395a6f7c037ddfe7d29=
15f58e&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/CrowCpp/Crow.git;prot=
ocol=3Dhttps;branch=3Dmaster;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D=
"_blank">github.com/CrowCpp/Crow.git;protocol=3Dhttps;branch=3Dmaster;tag=
=3Dv${PV}</a>&quot;<br>
+SRCREV =3D &quot;f8c060c51feeca2c65828fb6f538603db4392d55&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+DEPENDS =3D &quot;asio&quot;<br>
+<br>
+EXTRA_OECMAKE =3D &quot;\<br>
+=C2=A0 =C2=A0 -DCROW_BUILD_EXAMPLES=3DOFF \<br>
+=C2=A0 =C2=A0 -DCROW_BUILD_TESTS=3DOFF \<br>
+&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126203): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126203" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126203</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118751042/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118751042/1997914</a><br>
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

--0000000000001e676b064f155f63--

