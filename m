Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51DCC4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 17:59:05 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web11.3312.1714586337928093447
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 10:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=bntVphdT;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1714586337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=eYohFRzsfWFpG+2AjaNhHpnhZ2BKsPOwBeD/VI2wnvI=;
	b=bntVphdT9KO+E0K+0m/c6zPFwr+LskobFw9ESI4tR7NgjYlXa8PNitflH7eQabfHJj8SW4
	VqSWBo2Sb8Ct+mXbvXB3ee6llzKSuJpOXSJuehLzxXUycUrG8Q2nddSP6gvxmap9Kwh4Gq
	C8VPr9lwDMcAfBvNTVxcceCKzxQKLCY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-15-N3e1OkYTNi6h7yFhLo_8OQ-1; Wed, 01 May 2024 10:58:52 -0700
X-MC-Unique: N3e1OkYTNi6h7yFhLo_8OQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-416ac21981dso5312865e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 10:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714586330; x=1715191130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4lpIy4vrsIoyKziPTvZeGSFfxu8mv2OaS7TA3fWcVg=;
        b=EO1f3+mEaQ3QlKIFoFOteeSr5yTnKExNBkqlNSAWzBLU2QSNojBwGzSqs2lja6lHeS
         iYMcdfFBdQrsXJx99uDWKYskCWa7atana5H9l7CXeYyrTH5DdY9NVX5usqJQAZvaA1M4
         9JLlpfKb7osid6JBe+d9tFvF7ncpWPrevrv8+SayLQlFF0D9HNhDEDLVVaGwqOXaA6Vu
         yXGCPW06fjF5/IDyFeCA7/NmuBivPU7IOLshuJJlEKldyLsHUPVbKog94uUMqs3GZaGt
         w4I+N8eTK04O9eV9iOUAClxzHUDGHhs3lBEQiDUnGeZtS+PUyX9jMCas6B2dwcmcw5j/
         Ow2w==
X-Gm-Message-State: AOJu0Yy/YQsKSFAtB3UsHvho/bRYUvEfGiaGDY9KeEE8tja/DVz7EBlT
	YPtNt0I138NQ2t+0+HQZ3fuhCXpmwDdrTVnoi1gwh//TdFywc+v7qSE2762YFbPzwxZH7hljS2R
	LUy4cXazzAVl+bzjKleCbj5w4Z2HdarwajjDRPALIVZEKEgDjz4lw05e5fs2R1gJDdZ7Eor/114
	ExIVG3XgOL9c2DLpeqiIvaFhvgVaOQrVgFk+y5bK1AMnXFJp5FVQ9CPGNzq13tdVx6nt8t
X-Received: by 2002:a05:600c:4748:b0:415:ff48:59fc with SMTP id w8-20020a05600c474800b00415ff4859fcmr315100wmo.8.1714586330309;
        Wed, 01 May 2024 10:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQ7fwFnAodxAHaN7FRvQ/d8PS0D07cd2IOwrKundlrd2OrQf6qJs5qSfE5YbV5SGpouLcQKQ==
X-Received: by 2002:a05:600c:4748:b0:415:ff48:59fc with SMTP id w8-20020a05600c474800b00415ff4859fcmr315085wmo.8.1714586329827;
        Wed, 01 May 2024 10:58:49 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id bd23-20020a05600c1f1700b0041bfb176a87sm2916935wmb.27.2024.05.01.10.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:58:49 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH V2] python3-twisted: remove obsolete python3-twisted-flow
Date: Wed,  1 May 2024 17:58:33 +0000
Message-Id: <20240501175833.4551-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12405011058560821"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 17:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110210

--MCBoundary=_12405011058560821
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The flow module was removed in Twisted 9.0.0 a long time
and currently does not install anything. Let's remove it
to cleanup the recipe.

This commit also removes python3-twisted-news package because
the source files were removed in Twisted 21.2.0. All other
files which no longer exist in the source are also removed from FILES.

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 .../python/python3-twisted_24.3.0.bb           | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index e5223ccd6..ba5bb04db 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -22,11 +22,9 @@ PACKAGES +=3D "\
     ${PN}-conch \
     ${PN}-mail \
     ${PN}-names \
-    ${PN}-news \
     ${PN}-runner \
     ${PN}-web \
     ${PN}-words \
-    ${PN}-flow \
     ${PN}-pair \
     ${PN}-core \
 "
@@ -66,11 +64,9 @@ RDEPENDS:${PN}-test =3D "${PN} python3-pyhamcrest"
 RDEPENDS:${PN}-conch =3D "${PN}-core ${PN}-protocols python3-bcrypt python=
3-cryptography python3-pickle"
 RDEPENDS:${PN}-mail =3D "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-names =3D "${PN}-core"
-RDEPENDS:${PN}-news =3D "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-runner =3D "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-web +=3D "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-words +=3D "${PN}-core"
-RDEPENDS:${PN}-flow +=3D "${PN}-core"
 RDEPENDS:${PN}-pair +=3D "${PN}-core"
=20
 FILES:${PN}-test =3D " \
@@ -152,12 +148,6 @@ FILES:${PN}-names =3D " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/names \
 "
=20
-FILES:${PN}-news =3D " \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_news.py* \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_news*.p=
yc \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/news \
-"
-
 FILES:${PN}-runner =3D " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_runner.py* \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_runner*=
.pyc \
@@ -176,15 +166,7 @@ FILES:${PN}-words =3D " \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/words \
 "
=20
-FILES:${PN}-flow =3D " \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_flow.py* \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_flow*.p=
yc \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/flow \
-"
-
 FILES:${PN}-pair =3D " \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_pair.py* \
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_pair*.p=
yc \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/pair \
 "
=20
--=20
2.34.1

Disclaimer

The information contained in this communication from the sender is confiden=
tial. It is intended solely for use by the recipient and others authorized =
to receive it. If you are not the recipient, you are hereby notified that a=
ny disclosure, copying, distribution or taking action in relation of the co=
ntents of this information is strictly prohibited and may be unlawful.

This email has been scanned for viruses and malware, and may have been auto=
matically archived by Mimecast, a leader in email security and cyber resili=
ence. Mimecast integrates email defenses with brand protection, security aw=
areness training, web security, compliance and other essential capabilities=
. Mimecast helps protect large and small organizations from malicious activ=
ity, human error and technology failure; and to lead the movement toward bu=
ilding a more resilient world. To find out more, visit our website.

--MCBoundary=_12405011058560821
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>The flow module was removed in Twisted 9.0.0 a long=
 time<BR>
and currently does not install anything. Let's remove it<BR>
to cleanup the recipe.<BR>
<BR>
This commit also removes python3-twisted-news package because<BR>
the source files were removed in Twisted 21.2.0. All other<BR>
files which no longer exist in the source are also removed from FILES.<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 .../python/python3-twisted_24.3.0.bb           | 18 ------------------<BR>
 1 file changed, 18 deletions(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
index e5223ccd6..ba5bb04db 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
@@ -22,11 +22,9 @@ PACKAGES +=3D &quot;\<BR>
     ${PN}-conch \<BR>
     ${PN}-mail \<BR>
     ${PN}-names \<BR>
-    ${PN}-news \<BR>
     ${PN}-runner \<BR>
     ${PN}-web \<BR>
     ${PN}-words \<BR>
-    ${PN}-flow \<BR>
     ${PN}-pair \<BR>
     ${PN}-core \<BR>
 &quot;<BR>
@@ -66,11 +64,9 @@ RDEPENDS:${PN}-test =3D &quot;${PN} python3-pyhamcrest&q=
uot;<BR>
 RDEPENDS:${PN}-conch =3D &quot;${PN}-core ${PN}-protocols python3-bcrypt p=
ython3-cryptography python3-pickle&quot;<BR>
 RDEPENDS:${PN}-mail =3D &quot;${PN}-core ${PN}-protocols&quot;<BR>
 RDEPENDS:${PN}-names =3D &quot;${PN}-core&quot;<BR>
-RDEPENDS:${PN}-news =3D &quot;${PN}-core ${PN}-protocols&quot;<BR>
 RDEPENDS:${PN}-runner =3D &quot;${PN}-core ${PN}-protocols&quot;<BR>
 RDEPENDS:${PN}-web +=3D &quot;${PN}-core ${PN}-protocols&quot;<BR>
 RDEPENDS:${PN}-words +=3D &quot;${PN}-core&quot;<BR>
-RDEPENDS:${PN}-flow +=3D &quot;${PN}-core&quot;<BR>
 RDEPENDS:${PN}-pair +=3D &quot;${PN}-core&quot;<BR>
 <BR>
 FILES:${PN}-test =3D &quot; \<BR>
@@ -152,12 +148,6 @@ FILES:${PN}-names =3D &quot; \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/names \<BR>
 &quot;<BR>
 <BR>
-FILES:${PN}-news =3D &quot; \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_news.py* \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_news*.p=
yc \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/news \<BR>
-&quot;<BR>
-<BR>
 FILES:${PN}-runner =3D &quot; \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_runner.py* \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_runner*=
.pyc \<BR>
@@ -176,15 +166,7 @@ FILES:${PN}-words =3D &quot; \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/words \<BR>
 &quot;<BR>
 <BR>
-FILES:${PN}-flow =3D &quot; \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_flow.py* \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_flow*.p=
yc \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/flow \<BR>
-&quot;<BR>
-<BR>
 FILES:${PN}-pair =3D &quot; \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_pair.py* \<BR>
-    ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_pair*.p=
yc \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/pair \<BR>
 &quot;<BR>
 <BR>
-- <BR>
2.34.1<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
/p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666;">Warning=
:  Copyright Nox Health.  This communication is confidential and may contai=
n privileged information.  By the use of email over the Internet or other c=
ommunication systems, Nox Health is not waiving either confidentiality of, =
or legal privilege in, the content of the email and of any attachments.  If=
 the recipient of this message is not the intended addressee, please call N=
ox Health immediately by calling (+1) 888.505.0280</p></body></html>

--MCBoundary=_12405011058560821--


