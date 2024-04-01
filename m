Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D007BCD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 16:44:35 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web10.99.1711989874166167254
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 09:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=hJHV7B7E;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1711989873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Z3yQXHiMCxAPEWXE2qzpkfhtRti1CHIlUEjrH1uUiGc=;
	b=hJHV7B7EPVSYZ6soGp2gTkj1uIlaf6tFJnds3TFe6l+0BGbb2nWtEbNbS1kyyhB92TK6lq
	UTRg2wggbQDIVChO0PUFXdi+BsPjtdmppAehubSQa+8ezi4/DdAS7InId/tlcwp4w7M1ZI
	dvjzN/nRB2AiAz8h21gthaLkGgI8TFs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-25-FIvcyiJSNbKjlk9r2-Mj2Q-1; Mon, 01 Apr 2024 09:44:29 -0700
X-MC-Unique: FIvcyiJSNbKjlk9r2-Mj2Q-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4155db7b58cso6695315e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 09:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711989867; x=1712594667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bT6nXT86YgMp6a/QCR/X4S72yoxusSJBK+XfkTaR/Xg=;
        b=ZDd4YBWNIpDXHbRoH8H2KKN/+21DzApKubyPDgiWi4JeknMode4XN5IIXgZ58JOKu5
         Yo0E9HkQOXgrpzQDdmQgtBryNyTlnW9y1Unbr9gs9mkkCmaK3pMBpy1DgTsvHF/ZcaDh
         vpOHzzXw3Jjp/kdmxQsB5zoc5BmMvUlYKQ/0i5udbCNTQf6kd4HbFW16QLyRdQwMx/B6
         C214BuhxsZvexUOgAf8VIUKzKuDWbnsgocUYuLx4VYSUnU4RSvpD8vsQ/cFNAGP4H9RQ
         PT9ikxMy4EYCiEmuB1tqJ/mHkk+xIR5rh1DZmlE3zAgIEJgLVGfUblgmE/sbDbhFHRBh
         1qZA==
X-Gm-Message-State: AOJu0YwkgrVR0FND9KrpNojUaGaErCabyM+g5x9p+WbC2o1kgVVy8JZP
	VXk173o8KKt8rpZDTWS4BUqDpmuxrFoKJnMLqw1FGYe+InX3QPeZtltWbV1cUMUIUiK8EAsfJeg
	KYjH6zKMXUOGvzFTNjFOFFTPHHEXcN/aXYbiUK29HWwkXpfjoFdheZCZ+TRCpFwEGtiYivn/9pn
	/fRZBXGlcvoKFVuxPc9L4F3sUeVAA9oqtBYsWM3eSyLToEQ/q8x6oIJcvq1AdCSeAneZN5
X-Received: by 2002:a05:600c:3556:b0:414:f58:a086 with SMTP id i22-20020a05600c355600b004140f58a086mr7738540wmq.6.1711989867422;
        Mon, 01 Apr 2024 09:44:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIhGKaMPonz+sSbyfnAPDptuEj9nnOSGRr6A+yyxwmwtCescaYL9QjjqUO4NfED0A04KYevw==
X-Received: by 2002:a05:600c:3556:b0:414:f58:a086 with SMTP id i22-20020a05600c355600b004140f58a086mr7738521wmq.6.1711989866790;
        Mon, 01 Apr 2024 09:44:26 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b004148c3685ffsm15430613wmq.3.2024.04.01.09.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 09:44:26 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-ecdsa: cleanup DEPENDS
Date: Mon,  1 Apr 2024 16:44:04 +0000
Message-Id: <20240401164404.7440-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404010944317611"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 16:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109767

--MCBoundary=_12404010944317611
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Remove python3-pbr from DEPENDS: when looking at the source code
it looks like pbr is used in the CI process when building for
Python 2.6 only. Python 2 is no longer supported in the Yocto
project so it can be safely removed.

Remove python3-pip from DEPENDS: pip is not a build time
dependency.

Changes were tested on Kirkstone. The requirements for
python3-ecdsa v0.18 are exactly the same.

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb b/=
meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
index ea175d214..12dd51e79 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
@@ -3,8 +3,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D66ffc5e30f76cbb5358fe54b645e5a1=
d"
=20
-DEPENDS +=3D "python3-pip python3-pbr"
-
 PYPI_PACKAGE =3D "ecdsa"
 SRC_URI[sha256sum] =3D "190348041559e21b22a1d65cee485282ca11a6f81d503fddb8=
4d5017e9ed1e49"
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

--MCBoundary=_12404010944317611
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Remove python3-pbr from DEPENDS: when looking at th=
e source code<BR>
it looks like pbr is used in the CI process when building for<BR>
Python 2.6 only. Python 2 is no longer supported in the Yocto<BR>
project so it can be safely removed.<BR>
<BR>
Remove python3-pip from DEPENDS: pip is not a build time<BR>
dependency.<BR>
<BR>
Changes were tested on Kirkstone. The requirements for<BR>
python3-ecdsa v0.18 are exactly the same.<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb | 2 --<BR>
 1 file changed, 2 deletions(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb b/=
meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb<BR>
index ea175d214..12dd51e79 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb<BR>
@@ -3,8 +3,6 @@ SECTION =3D &quot;devel/python&quot;<BR>
 LICENSE =3D &quot;MIT&quot;<BR>
 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D66ffc5e30f76cbb5358fe54b64=
5e5a1d&quot;<BR>
 <BR>
-DEPENDS +=3D &quot;python3-pip python3-pbr&quot;<BR>
-<BR>
 PYPI_PACKAGE =3D &quot;ecdsa&quot;<BR>
 SRC_URI[sha256sum] =3D &quot;190348041559e21b22a1d65cee485282ca11a6f81d503=
fddb84d5017e9ed1e49&quot;<BR>
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

--MCBoundary=_12404010944317611--


