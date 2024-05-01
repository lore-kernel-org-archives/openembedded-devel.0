Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B74C10F1A
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 08:19:18 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.153.118])
 by mx.groups.io with SMTP id smtpd.web10.7737.1714551551280707202
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 01:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=BoQ8dvS3;
 spf=pass (domain: noxmedical.com, ip: 170.10.153.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1714551550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=jQQmItKGI1bS0eKpO407Al8G3BeyPGEfMl6vPqMzqDY=;
	b=BoQ8dvS3GaQc859ApbbfnpswxZCLbmDlTWCP1Pfioj6XTrnyf70182YiTxMTx7uh2j7i3z
	EIxOaZL17zHXmo/sdwxpDjDuLckssP7JVEkanxTHreL+2NIAWjvVVxWzsrJSXJpzRBKlYL
	cpbuAxdpyzyHZ5nwPpe5rsD6yLJbToQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-2-ZG3bRhh4N7Ohgrmg9fXMBw-1; Wed, 01 May 2024 01:19:06 -0700
X-MC-Unique: ZG3bRhh4N7Ohgrmg9fXMBw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-41d9e2b4743so1205475e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 01:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714551544; x=1715156344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkkrGublReAeof+9k/To2wpeYA+gNTAhiPnX1d/RquU=;
        b=X0DaAY08cJdcu/yhOWT4KlysEP0uY8urmfYjaKGVvA4+oL78Di3EVXUfn0WcKt9ZIN
         85ijeliQuIjKIijXCn/Jm865Oe+OnYGry769lVG8iW3d6pH7gY+VBRXOV3qh8zMd4GWR
         +2VTedBvAzSIeO9WWjR//f7ozZyLFK89xepvtaWStzhg/616myhaai7p2tsNlk9E1Bty
         h8A6FdFwmdjYiYE7109twi1u99gcrPl8va1seBbyEysNOUN6OjkkNTyToTxYYtnwQzS4
         vOUaJBHO2jP7alUoYNdq8F1xCaErsJEQoJiJ+wFPOaaUMN1ZU4Csm1SRFJVgXP+Z8S/m
         uqzw==
X-Gm-Message-State: AOJu0YzjD32QY/kks9oxgnv3PJp6D7o5Z0Sd4TC/TzSbaTG0bw9CBdpV
	1XMPdR0gJgAmX1m7wnkTKeaEDjpJnxfJtXcn2op9HGOP3QFlcNt15CnTX4OPUFDpSARf4n5UoPx
	lnIhidWFGYh6LQC3UytbVkADaYDxFqrYEcLrIDYAhmdqRetho1Co4OJ5M0cN9eFNjzBAfwsu1Nv
	tUa7t+bkZsyt1ePMOd1zYpAvpr/712l8LFH8omoI5PQM/pMYkzHkhg9lRDg8t31jSyWqB1
X-Received: by 2002:a05:600c:4fcf:b0:415:6afd:9ba6 with SMTP id o15-20020a05600c4fcf00b004156afd9ba6mr1512551wmq.1.1714551544237;
        Wed, 01 May 2024 01:19:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEedlrfdPBS9lS5J08Wno8fuJ21ytvunniw3LAlGHHg2YWmRCqXfeHqGP7CJXS0D2XUOYRsJA==
X-Received: by 2002:a05:600c:4fcf:b0:415:6afd:9ba6 with SMTP id o15-20020a05600c4fcf00b004156afd9ba6mr1512520wmq.1.1714551543482;
        Wed, 01 May 2024 01:19:03 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id k1-20020a05600c1c8100b0041906397ab7sm1445196wms.3.2024.05.01.01.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 01:19:03 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-twisted: remove obsolete python3-twisted-flow
Date: Wed,  1 May 2024 08:18:46 +0000
Message-Id: <20240501081846.6363-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12405010119080991"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 08:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110202

--MCBoundary=_12405010119080991
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The flow module was removed in Twisted 9.0.0 a long time
and currently does not install anything. Let's remove it
to cleanup the recipe.

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 .../recipes-devtools/python/python3-twisted_24.3.0.bb     | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index e5223ccd6..f203486fa 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -26,7 +26,6 @@ PACKAGES +=3D "\
     ${PN}-runner \
     ${PN}-web \
     ${PN}-words \
-    ${PN}-flow \
     ${PN}-pair \
     ${PN}-core \
 "
@@ -70,7 +69,6 @@ RDEPENDS:${PN}-news =3D "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-runner =3D "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-web +=3D "${PN}-core ${PN}-protocols"
 RDEPENDS:${PN}-words +=3D "${PN}-core"
-RDEPENDS:${PN}-flow +=3D "${PN}-core"
 RDEPENDS:${PN}-pair +=3D "${PN}-core"
=20
 FILES:${PN}-test =3D " \
@@ -176,12 +174,6 @@ FILES:${PN}-words =3D " \
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
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_pair.py* \
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_pair*.p=
yc \
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

--MCBoundary=_12405010119080991
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>The flow module was removed in Twisted 9.0.0 a long=
 time<BR>
and currently does not install anything. Let's remove it<BR>
to cleanup the recipe.<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 .../recipes-devtools/python/python3-twisted_24.3.0.bb     | 8 --------<BR>
 1 file changed, 8 deletions(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
index e5223ccd6..f203486fa 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
@@ -26,7 +26,6 @@ PACKAGES +=3D &quot;\<BR>
     ${PN}-runner \<BR>
     ${PN}-web \<BR>
     ${PN}-words \<BR>
-    ${PN}-flow \<BR>
     ${PN}-pair \<BR>
     ${PN}-core \<BR>
 &quot;<BR>
@@ -70,7 +69,6 @@ RDEPENDS:${PN}-news =3D &quot;${PN}-core ${PN}-protocols&=
quot;<BR>
 RDEPENDS:${PN}-runner =3D &quot;${PN}-core ${PN}-protocols&quot;<BR>
 RDEPENDS:${PN}-web +=3D &quot;${PN}-core ${PN}-protocols&quot;<BR>
 RDEPENDS:${PN}-words +=3D &quot;${PN}-core&quot;<BR>
-RDEPENDS:${PN}-flow +=3D &quot;${PN}-core&quot;<BR>
 RDEPENDS:${PN}-pair +=3D &quot;${PN}-core&quot;<BR>
 <BR>
 FILES:${PN}-test =3D &quot; \<BR>
@@ -176,12 +174,6 @@ FILES:${PN}-words =3D &quot; \<BR>
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
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/twisted_pair.py* \<BR>
     ${PYTHON_SITEPACKAGES_DIR}/twisted/plugins/__pycache__/twisted_pair*.p=
yc \<BR>
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

--MCBoundary=_12405010119080991--


