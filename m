Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A666CD1284
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 19:01:33 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web11.1017.1712257283365611566
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 12:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=Rl0ipjPA;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1712257283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oI4GVoROZL+YTFrIdi6Z2P1oN7+Q1/VGSWrN2nltQxU=;
	b=Rl0ipjPAgXUM4gGufPlJWaQI7HEe8koBH1/LGFfpl/1aECcqFneL+qJp5FEgmfHHrl8SWN
	IGu1p97eL7irNTq0Ftz3eeS+L7Jq0DU6uiuzgNH0bvpywbGgZn1Vrvmyhr8RCa0esGDamG
	y9/myal5PoFv+a2hPl2C/bpcBFsCC2k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-29-t7AEoYQ1MImM5QCvGB3DQQ-1; Thu, 04 Apr 2024 12:01:18 -0700
X-MC-Unique: t7AEoYQ1MImM5QCvGB3DQQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-343c6a990dbso431915f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 12:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712257276; x=1712862076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJubdoSHXO5w70gStlaR2qYJfMJ8DVWXhZIGiTdpgzM=;
        b=AS1V984umisrZ59U78+zYSf3eJbtDz9YBO0bRy2sJFlZOaYLwI60bvBl6IXGDOw8jW
         ikpVwUlkAe8vcUKZQXh3IYIj/qlz8kaNjMoIZYYKh3T7xXuk0iukA5OqGwzNVC7I9Aim
         eYRxa2i3zzQV96WuasJMbvtYYfV1/sKjVp0MY62tUZXmRKY02WlxEtxuaFuBmCkJDKx6
         E0PqsSaDgwCoJ/h7pGrQPhxuCfW3QzXQwZH6Toorf+mqepVyL8gVRLD/xjVSvVaUdbMi
         UikDl71u6dC2Fc8jYATV23uQUo7a6VlXDq8MOy2ZXXVpn/47nYDfIwhN8/uTxhEL4xo0
         a59Q==
X-Gm-Message-State: AOJu0Ywi/Q36eLEbnjuROBAUJDyflVai6mHCmSjVSP0FOxDjY6vUSFPL
	kAW148C7PwJ/8e0qBI+zr+8i+pvq7YOqnxuRJgPrjSsEqJeVZsu76gWqD4m42W8sHZHee6sR9F1
	g2xb5wvQNJ2xScZVX5wwTxLKfLi1CvSgWGkJrXNN7HQLcl/VqlYILMcPLLSLcY4tiEPGZt+CkSp
	OnkNk7kw5D6ZgzKCENsACnO/jadspyd4rded+MweO0v809PFj/WvaDj9imn1kBItrAyNvN
X-Received: by 2002:a5d:6311:0:b0:33e:cbec:e98 with SMTP id i17-20020a5d6311000000b0033ecbec0e98mr320411wru.13.1712257276091;
        Thu, 04 Apr 2024 12:01:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdi31lgfJGGfuNY7r0Hc2MyVJxrp84iFi9Aoz0Uk/dKWDyHMBb4LJsrMeVwG6lPiz6+f7tmg==
X-Received: by 2002:a5d:6311:0:b0:33e:cbec:e98 with SMTP id i17-20020a5d6311000000b0033ecbec0e98mr320395wru.13.1712257275654;
        Thu, 04 Apr 2024 12:01:15 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id i6-20020a05600c354600b0041488691eb1sm3623594wmq.17.2024.04.04.12.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 12:01:15 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hains van den Bosch <hainsvdbosch@ziggo.nl>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-twisted: Add python3-asyncio to RDEPENDS
Date: Thu,  4 Apr 2024 18:57:50 +0000
Message-Id: <20240404185750.3570-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404041201298281"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 19:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109800

--MCBoundary=_12404041201298281
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

From: Hains van den Bosch <hainsvdbosch@ziggo.nl>

To fix crash due to missing module:

from twisted.internet import defer
File "/usr/lib/python3.11/site-packages/twisted/internet/defer.py", line 14=
, in <module>
from asyncio import AbstractEventLoop, Future, iscoroutine
ModuleNotFoundError: No module named 'asyncio'

Signed-off-by: Hains van den Bosch <hainsvdbosch@ziggo.nl>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index 3225b6c98..c55c86ea5 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -57,6 +57,7 @@ RDEPENDS:${PN} =3D "\
 "
=20
 RDEPENDS:${PN}-core =3D "${PYTHON_PN}-appdirs \
+                       ${PYTHON_PN}-asyncio \
                        ${PYTHON_PN}-automat \
                        ${PYTHON_PN}-constantly \
                        ${PYTHON_PN}-core \
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

--MCBoundary=_12404041201298281
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>From: Hains van den Bosch &lt;hainsvdbosch@ziggo.nl=
&gt;<BR>
<BR>
To fix crash due to missing module:<BR>
<BR>
from twisted.internet import defer<BR>
File &quot;/usr/lib/python3.11/site-packages/twisted/internet/defer.py&quot=
;, line 14, in &lt;module&gt;<BR>
from asyncio import AbstractEventLoop, Future, iscoroutine<BR>
ModuleNotFoundError: No module named 'asyncio'<BR>
<BR>
Signed-off-by: Hains van den Bosch &lt;hainsvdbosch@ziggo.nl&gt;<BR>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<BR>
---<BR>
 meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb | 1 +<BR>
 1 file changed, 1 insertion(+)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<BR>
index 3225b6c98..c55c86ea5 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<BR>
@@ -57,6 +57,7 @@ RDEPENDS:${PN} =3D &quot;\<BR>
 &quot;<BR>
 <BR>
 RDEPENDS:${PN}-core =3D &quot;${PYTHON_PN}-appdirs \<BR>
+                       ${PYTHON_PN}-asyncio \<BR>
                        ${PYTHON_PN}-automat \<BR>
                        ${PYTHON_PN}-constantly \<BR>
                        ${PYTHON_PN}-core \<BR>
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

--MCBoundary=_12404041201298281--


