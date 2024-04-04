Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BB7CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 22:46:54 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.153.118])
 by mx.groups.io with SMTP id smtpd.web10.6200.1712270806910336442
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 15:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=c3DYO9rY;
 spf=pass (domain: noxmedical.com, ip: 170.10.153.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1712270806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=MjQS1REGY7dD50HxbAKU1bwBRSdA6fLTNSxoHz4IFlA=;
	b=c3DYO9rYbZPkJp7hsLh2j47W8VaMOOOTEi3fClxT27cl22Jt6rv/HDMlccWzQH8udGbwsB
	lTCkfXt6/VYuBpvVbGajqqCCwqtLSF1vUGBisfIlA5MtQguQd9MTIoaRVDalyKlgUr4Xlm
	vviXGndDI3pC0cueJGwKL+EGGxirX7Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-6-TI8yLbWAPXuJRNHuD3C96w-1; Thu, 04 Apr 2024 15:46:42 -0700
X-MC-Unique: TI8yLbWAPXuJRNHuD3C96w-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-41463be093aso7285095e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 15:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712270800; x=1712875600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uo7hjyCkQvnMYooukCMJfGbmdhbwnlyW9t5IZ2YMZGo=;
        b=O55qSUMs3vpu/AZqlLSsmMUHXPxabMA1wmENjUC7+hVpgLgFALb1PNwEd+akE09VS5
         oavGEyajW6dje+vhky/GEg44+ZIZPHUaBmHa1wo0rZR+y+zAavAwAazcNZg54w01Q3Xv
         Hlvwg+3IsXUjA1MO2bTbuChccZqSRurJG+jeLYffm8CyiTpy1C+V0BYwud0CCnxUDUqS
         ZXjXjow4Xi+N++/wg4gNzvGLOVLZ5AqHAGA9dEqCsZF1UXibNOkUEDAO7rZ0GRuco5zd
         Wle1fy0PvJ06LemF02NfLFZE85cW5n/lVMJ2hqJfKj3oX7bnvJvsxhl0HGbWYrJ3AVBf
         mz8g==
X-Gm-Message-State: AOJu0YzWubzxwwlUAkA5Zf1jD82uergE6fTm2rraxiEqnPnbnJcznwzr
	Nj+WpVy8jweCXp/nkgfBAB9IokInUfeQPtFjVgFEQ824xFte1bQGeiD+u4hEBddxhM4EFsZnUnC
	hdj9uNMcubr2/acCpvZRa7uGo7+P/wrKO1NsUDq5FfEm0OCTb4/QsMFQ6oiabUgCcAAKzm0vujg
	/bnQg0FixjW7GrtSdj6B4uQJeCK5/dLufuYwoFtMDh8hdIOH5QycEDSuoZnU3IB4z0Ojiz
X-Received: by 2002:a7b:cd15:0:b0:414:93df:bef1 with SMTP id f21-20020a7bcd15000000b0041493dfbef1mr2688271wmj.39.1712270800560;
        Thu, 04 Apr 2024 15:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL7kwBYoRMAywgCVeIDjqB5xsGg9b6IrQQYOh8pttm19NX6xc9KRQqTSQrFXq5lr/vsWMEEQ==
X-Received: by 2002:a7b:cd15:0:b0:414:93df:bef1 with SMTP id f21-20020a7bcd15000000b0041493dfbef1mr2688262wmj.39.1712270800149;
        Thu, 04 Apr 2024 15:46:40 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id u12-20020a05600c19cc00b0041469869d11sm4132492wmq.47.2024.04.04.15.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 15:46:39 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hains van den Bosch <hainsvdbosch@ziggo.nl>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][kirkstone][PATCH 1/2] python3-twisted: Add python3-typing-extensions to RDEPENDS
Date: Thu,  4 Apr 2024 22:45:21 +0000
Message-Id: <20240404224522.4303-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404041546441831"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 22:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109808

--MCBoundary=_12404041546441831
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Hains van den Bosch <hainsvdbosch@ziggo.nl>

To fix crash due to missing module:

File "/usr/lib/python3.11/site-packages/twisted/internet/defer.py", line 42=
, in <module>
from typing_extensions import Literal, ParamSpec, Protocol
ModuleNotFoundError: No module named 'typing_extensions'

Signed-off-by: Hains van den Bosch <hainsvdbosch@ziggo.nl>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
index f4575c9c2..3225b6c98 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb
@@ -65,6 +65,7 @@ RDEPENDS:${PN}-core =3D "${PYTHON_PN}-appdirs \
                        ${PYTHON_PN}-incremental \
                        ${PYTHON_PN}-pyhamcrest \
                        ${PYTHON_PN}-pyserial \
+                       ${PYTHON_PN}-typing-extensions \
                        ${PYTHON_PN}-unixadmin \
                        ${PYTHON_PN}-zopeinterface \
 "
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

--MCBoundary=_12404041546441831
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>From: Hains van den Bosch &lt;hainsvdbosch@ziggo.nl=
&gt;<BR>
<BR>
To fix crash due to missing module:<BR>
<BR>
File &quot;/usr/lib/python3.11/site-packages/twisted/internet/defer.py&quot=
;, line 42, in &lt;module&gt;<BR>
from typing_extensions import Literal, ParamSpec, Protocol<BR>
ModuleNotFoundError: No module named 'typing_extensions'<BR>
<BR>
Signed-off-by: Hains van den Bosch &lt;hainsvdbosch@ziggo.nl&gt;<BR>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb | 1 +<BR>
 1 file changed, 1 insertion(+)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<BR>
index f4575c9c2..3225b6c98 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.2.0.bb<BR>
@@ -65,6 +65,7 @@ RDEPENDS:${PN}-core =3D &quot;${PYTHON_PN}-appdirs \<BR>
                        ${PYTHON_PN}-incremental \<BR>
                        ${PYTHON_PN}-pyhamcrest \<BR>
                        ${PYTHON_PN}-pyserial \<BR>
+                       ${PYTHON_PN}-typing-extensions \<BR>
                        ${PYTHON_PN}-unixadmin \<BR>
                        ${PYTHON_PN}-zopeinterface \<BR>
 &quot;<BR>
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

--MCBoundary=_12404041546441831--


