Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEE9C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 06:38:50 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web11.12256.1713854325780696760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 23:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=AqbiRgm2;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1713854325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=m/Q198U4YgYWO6yzh4WQSSPUm6CiTzsWQuBEdeWlV5g=;
	b=AqbiRgm2aGYzbtmTHtoHrINWmp0I/6h7jOmJB0HbxfMgjoAHT9vVNAy0ptLP1U03koGEbI
	EUvFHQjM9ZQrGB55/qiO7eGi4CKLGvo5iNLp32P0XAEMkW6rBAHHV9eR3aGY4zurBihzC+
	TxurFApuHvXtHvTP6Uu1w8q1GLk+P5M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-1-3CUyZeEoOlaTOVAgh2p4RQ-1; Mon, 22 Apr 2024 23:38:40 -0700
X-MC-Unique: 3CUyZeEoOlaTOVAgh2p4RQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-57215c940d2so1124764a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 23:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713854318; x=1714459118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuDsPje66MbYbPQydiPuMvZxCXNqB2b04h72IG5d3dI=;
        b=pEgnkqQq84nx3NRrmE1Yk/sA4VJwBzfWIT/iNUtzn75sUBOhTsQ5hPRPOfcuD4qizf
         bO0NLrMo7BMU1GTZI9V3YM2Cgx8kmSSSJQJ3Ik4L/NmAaVyOs/LQtbh+XJE8pMsrWdSn
         0Dde7dYpcpEP6CPjbSVFPokP3cllRxl87cO5QGO1SwDY9meWjOTCMLvyOY3k+rXVIkeJ
         OnDisrQpKrpnf4HbTa7FK7qBmRAQYDam5IO31Vbq3QB4/CmJHc+9qLMj+ebcIEJa9GsI
         ZnSnFcKy5CcGIxIks25TLUGbuy0UivRGQgItgKFd4AETDJy4g3HRj8OSJM9lhl4gb+TW
         xOLQ==
X-Gm-Message-State: AOJu0YypUspLiBL4qxmebS0o6LghFE+jNoPgKNtwEt6At1c4MUTNk2b+
	zDkUnUhScctzpVErDDHn/anSO8FqGSvOABCKKjDQmAp2B63lZJxLsepMZsMaJ8XdRutnMu7NL/p
	KjI+TGT8LCcU74F8l8ptGUnMBlycNXN6FM2vsLVkQoBlKxEc6eopKWNIMDwPtIHrneaDXgH9qmP
	hUocWGmuomCcvKa1tua0xwSMLugi7MyL2dmW4EmeWtwTQWilS2V/tcamEAvj0JkvZ4OMlT
X-Received: by 2002:a50:8743:0:b0:56d:fc50:ec50 with SMTP id 3-20020a508743000000b0056dfc50ec50mr1694433edv.13.1713854318342;
        Mon, 22 Apr 2024 23:38:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq9gtEZVIuXTjQHXw/X1vuGqNX8wxFuGQJOX5yBVnGysgZzqRDS51mGwhieU8d6NiQTwwwfw==
X-Received: by 2002:a50:8743:0:b0:56d:fc50:ec50 with SMTP id 3-20020a508743000000b0056dfc50ec50mr1694412edv.13.1713854317946;
        Mon, 22 Apr 2024 23:38:37 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ig3-20020a056402458300b0056e771978dfsm6265912edb.14.2024.04.22.23.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 23:38:37 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH V2] python3-incremental: cleanup RDEPENDS and use python_setuptools_build_meta
Date: Tue, 23 Apr 2024 06:38:12 +0000
Message-Id: <20240423063812.4192-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404222338430211"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 06:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110114

--MCBoundary=_12404222338430211
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 .../recipes-devtools/python/python3-incremental_22.10.0.bb  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-incremental_22.10.=
0.bb b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
index 3d93cc05e..503ef35a9 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
@@ -5,15 +5,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6ca9b07f08e2c7=
2d48c74d363d1e0e15"
=20
 SRC_URI[sha256sum] =3D "912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c65865=
045854c24c0bd0"
=20
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
-    python3-twisted \
+    python3-twisted-core \
     python3-click \
 "
=20
 # -native is needed to build python[3]-twisted, however, we need to take s=
teps to
 # prevent a circular dependency. The build apparently does not use the par=
t of
 # python-incremental which uses python-twisted, so this hack is OK.
-RDEPENDS:python3-incremental-native:remove =3D "python3-twisted-native"
+RDEPENDS:python3-incremental-native:remove =3D "python3-twisted-core-nativ=
e"
 BBCLASSEXTEND =3D "native"
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

--MCBoundary=_12404222338430211
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gud=
nimar@noxmedical.com&gt;<BR>
---<BR>
 .../recipes-devtools/python/python3-incremental_22.10.0.bb  | 6 +++---<BR>
 1 file changed, 3 insertions(+), 3 deletions(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-incremental_22.10.=
0.bb b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb<B=
R>
index 3d93cc05e..503ef35a9 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb<BR=
>
+++ b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb<BR=
>
@@ -5,15 +5,15 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6ca9b07f0=
8e2c72d48c74d363d1e0e15&quot;<BR>
 <BR>
 SRC_URI[sha256sum] =3D &quot;912feeb5e0f7e0188e6f42241d2f450002e11bbc0937c=
65865045854c24c0bd0&quot;<BR>
 <BR>
-inherit pypi setuptools3<BR>
+inherit pypi python_setuptools_build_meta<BR>
 <BR>
 RDEPENDS:${PN} +=3D &quot; \<BR>
-    python3-twisted \<BR>
+    python3-twisted-core \<BR>
     python3-click \<BR>
 &quot;<BR>
 <BR>
 # -native is needed to build python[3]-twisted, however, we need to take s=
teps to<BR>
 # prevent a circular dependency. The build apparently does not use the par=
t of<BR>
 # python-incremental which uses python-twisted, so this hack is OK.<BR>
-RDEPENDS:python3-incremental-native:remove =3D &quot;python3-twisted-nativ=
e&quot;<BR>
+RDEPENDS:python3-incremental-native:remove =3D &quot;python3-twisted-core-=
native&quot;<BR>
 BBCLASSEXTEND =3D &quot;native&quot;<BR>
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

--MCBoundary=_12404222338430211--


