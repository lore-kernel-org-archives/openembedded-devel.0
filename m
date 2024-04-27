Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDE2C4345F
	for <webhook@archiver.kernel.org>; Sat, 27 Apr 2024 18:30:25 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.153.118])
 by mx.groups.io with SMTP id smtpd.web10.16553.1714242622340078274
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Apr 2024 11:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=eTEg5LmS;
 spf=pass (domain: noxmedical.com, ip: 170.10.153.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1714242621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=G3aSD/YSo3vYNq5AkeoF9O/X5yBDCNrn7fb6Uu8PkXs=;
	b=eTEg5LmS+3xLfQ6ylTvHxxEt1FXy5hdq5aps2uFy9HvX6UD1uWNkcHRd22LzBcLpTOSX1k
	j9r5HLJyqiBm82VthnZ0oBSg11ukHaF8UL0C1tV0zIIr7WHC1TrYgOsC5iSRZmH33clOuF
	nXr18x3Ar41MPBNILhDAA1BdCgvozFw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-6-K3WEPZqZNAie-6LaAbb97w-1; Sat, 27 Apr 2024 11:30:16 -0700
X-MC-Unique: K3WEPZqZNAie-6LaAbb97w-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-343f8b51910so1950908f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Apr 2024 11:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714242614; x=1714847414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVlzk74fUEvS2KJkQMU33fKJriXqul6RJ20FQ1SAgsM=;
        b=Pz75GFnkS3PC5ze1Ic89GkBj1LVfWopSVAWRvfz2abJznYm+sB1pWSZoSG+4RxlYhK
         glf84XDoTdiLRRkhf2Y76DYwErv8VUGTt5IJtgbxsVYPsLj6jPrwvKvlxX28uVbT9tcN
         n9luMz5b3AZiHSOZxo2Y3VGdBD7Ojc17bbATl1Lp8IigIKl0s349P8iqtRpjcdHzfa8L
         /w+XnoJpNmAtxp6H4C2+kpZkXyqdmpZnGZgZsnpqv/4GMQj99Z9YWwrGamznax5mPted
         oLkLpSg9unzR43N92w0wNkTsGucGG7FmRDJMJB0h8dx2tqKtU+n0Dci1+hb5gOBsx/ge
         2jvQ==
X-Gm-Message-State: AOJu0YyA2pa5vf01M0MPBnLamV683yTzvnzFW0oRELY9WDzOjtGJcKCB
	EV4jWm4GagOKg6kpHQKVfrHNU6BH4pZV9ZarF3oBClN1zg4MMt1lhIhWiu6a17cBUBgpjV4QU/e
	z953ijb+IeOPSByKPxFs/zN3gRyfZJMP6E+3fqUBZ4EgISdNn/bX4hceF47D+ZUNMMyVmavQk8N
	8EwhisgMoycojZhrcVY3ZM/cSn41gtB8bXJvWXHZrYjUA7K6gefqyszhQZEMSZZJVJmfuz
X-Received: by 2002:a05:600c:4ec6:b0:419:b1d3:1261 with SMTP id g6-20020a05600c4ec600b00419b1d31261mr4065517wmq.27.1714242614544;
        Sat, 27 Apr 2024 11:30:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMuxUVNl4lnKVG2/DlD2ONPioha+a2C707FymbClavQNel5lF+HcrTuksp+6FC+YWaBKWYAg==
X-Received: by 2002:a05:600c:4ec6:b0:419:b1d3:1261 with SMTP id g6-20020a05600c4ec600b00419b1d31261mr4065500wmq.27.1714242613888;
        Sat, 27 Apr 2024 11:30:13 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id a18-20020adffad2000000b0034c9b7d406dsm2301982wrs.75.2024.04.27.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 11:30:13 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-pyhamcrest: cleanup RDEPENDS and correct build backend
Date: Sat, 27 Apr 2024 18:29:59 +0000
Message-Id: <20240427182959.1491435-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404271130200051"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Apr 2024 18:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110157

--MCBoundary=_12404271130200051
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- build backend is hatchling.build
- python3-six is not a runtime dependency, it's not imported anywhere in th=
e source
- add python3-asyncio to RDEPENDS

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 .../recipes-devtools/python/python3-pyhamcrest_2.1.0.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.b=
b b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
index eaa24eefe..dcc9ebfa9 100644
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D79391bf1501c=
898472d043f36e960612"
=20
 SRC_URI[sha256sum] =3D "c6acbec0923d0cb7e72c22af1926f3e7c97b8e8d69fc7498ea=
bacaf7c975bd9c"
=20
-inherit pypi python_setuptools_build_meta
+inherit pypi python_hatchling
=20
 DEPENDS +=3D "python3-hatch-vcs-native"
=20
@@ -13,6 +13,6 @@ UPSTREAM_CHECK_URI =3D "https://pypi.python.org/pypi/PyHa=
mcrest/"
 UPSTREAM_CHECK_REGEX =3D "/PyHamcrest/(?P<pver>(\d+[\.\-_]*)+)"
=20
 RDEPENDS:${PN} +=3D " \
-    python3-six \
+    python3-asyncio \
     python3-numbers \
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

--MCBoundary=_12404271130200051
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>- build backend is hatchling.build<BR>
- python3-six is not a runtime dependency, it's not imported anywhere in th=
e source<BR>
- add python3-asyncio to RDEPENDS<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 .../recipes-devtools/python/python3-pyhamcrest_2.1.0.bb       | 4 ++--<BR>
 1 file changed, 2 insertions(+), 2 deletions(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.b=
b b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb<BR>
index eaa24eefe..dcc9ebfa9 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_2.1.0.bb<BR>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D79391bf=
1501c898472d043f36e960612&quot;<BR>
 <BR>
 SRC_URI[sha256sum] =3D &quot;c6acbec0923d0cb7e72c22af1926f3e7c97b8e8d69fc7=
498eabacaf7c975bd9c&quot;<BR>
 <BR>
-inherit pypi python_setuptools_build_meta<BR>
+inherit pypi python_hatchling<BR>
 <BR>
 DEPENDS +=3D &quot;python3-hatch-vcs-native&quot;<BR>
 <BR>
@@ -13,6 +13,6 @@ UPSTREAM_CHECK_URI =3D &quot;https://pypi.python.org/pypi=
/PyHamcrest/&quot;<BR>
 UPSTREAM_CHECK_REGEX =3D &quot;/PyHamcrest/(?P&lt;pver&gt;(\d+[\.\-_]*)+)&=
quot;<BR>
 <BR>
 RDEPENDS:${PN} +=3D &quot; \<BR>
-    python3-six \<BR>
+    python3-asyncio \<BR>
     python3-numbers \<BR>
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

--MCBoundary=_12404271130200051--


