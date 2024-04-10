Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92B2CD1284
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 22:51:52 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.153.118])
 by mx.groups.io with SMTP id smtpd.web11.4277.1712789502094959086
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 15:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=JOUsGOOP;
 spf=pass (domain: noxmedical.com, ip: 170.10.153.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1712789501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=mBGpL0T0B+NO+PDkZet3DFHmPSlJ6jgZuLrtMHX28Pk=;
	b=JOUsGOOPUEvgQYyprWWk9y/S3maXlSNMAqYHn3JCmcHGZPYjpmmCkfVpTMfZf3NuWz9ZqK
	A+gi9lr3vXDCz3TIKliQk2A7xCd5l7Pto0rEW+Ysuc4T6/igIhtrnJHFW+zeAimE/ZxORc
	UxxfH0NPxdtPLWt3HfKCmUcVnAy59lc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-46-p20o7XlXOj6wKca6nErXlw-1; Wed, 10 Apr 2024 15:51:38 -0700
X-MC-Unique: p20o7XlXOj6wKca6nErXlw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4147de378b9so35032065e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 15:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712789496; x=1713394296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHOxIurFXIZ7Cs3K4vZXXYXA79PkmL0/P9f7K3VTUhg=;
        b=WG5PjtN+jVI+B7z6T+tSdKhbOblsSJXUHvN9wSOcLUQ0CltBdC6NKFRBa06ajqbEVc
         aLTBc57dOFTs3MjDWnyPskCLv5RBYkKSK3WrYjrWKcfj7BQwGii3JJpSrQ1RLD4CgwG6
         TKXyjxlWyXVbwaUV9DxB5S/iXX6yWTU3FVL0z3uJYki8JOh46k9y1UJhKgkaHIyiFxsz
         5fHmWxdQ2yRf4K7lw3mcADSrEizycQmEqJzN6wx2Ghs3LDKQtv6WzpziFDXctLljZqyi
         o5NQqr36hM/3dYcVLWm1BSHkNccbqDj9nzn57W1DxIo8ZLDH8BDl17yIb8gjpjthQT6N
         aaqg==
X-Gm-Message-State: AOJu0Yw3EKc7+0Sahiy0xhRhJ45qMIB3Fiix3UpF5Y1DqKHydsxM0CiC
	xPkXuqhIsU5yRlS7u5PBIzQmuwLXdi7x9bjV7HAGHNZ26VYE5tyuNJrqI7FDuaWdKO5Vd4ZGIt5
	CMlGfPAd/Izaw/GuN6ize6vv8tT59fspN9dIsJa0yAtdtH3aKWCS0ABL490Wrhp43nv8CoyJtZH
	s3UM3ywpuckqHllZmkw+YCt1zYX766aSmInbgJ5z2hsWqu102gIZhhHT7t8MZTbQR+YCzt
X-Received: by 2002:a05:600c:1d01:b0:416:9fc0:972d with SMTP id l1-20020a05600c1d0100b004169fc0972dmr2833832wms.37.1712789496294;
        Wed, 10 Apr 2024 15:51:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnFLBiiJEvUiAgFkZDa8Uy9a3NXWrHiN8/RLn+boQzcR7IFzRRTNKnNQdgIapx/YU5Y4DVjQ==
X-Received: by 2002:a05:600c:1d01:b0:416:9fc0:972d with SMTP id l1-20020a05600c1d0100b004169fc0972dmr2833823wms.37.1712789495842;
        Wed, 10 Apr 2024 15:51:35 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c4ecd00b004148d7b889asm3630108wmq.8.2024.04.10.15.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:51:35 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-ecdsa: upgrade 0.18.0 -> 0.19.0
Date: Wed, 10 Apr 2024 22:51:18 +0000
Message-Id: <20240410225118.1033624-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404101551396551"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 22:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109913

--MCBoundary=_12404101551396551
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
New API:
------------
    to_ssh in VerifyingKey and SigningKey, supports Ed25519 keys only (Pabl=
o Mazzini)

New features:
------------
    Support for twisted Brainpool curves

Doc fix:
------------
    Fix curve equation in glossary
    Documentation for signature encoding and signature decoding functions

Maintenance:
------------
    Dropped official support for 3.3 and 3.4 (because of problems running t=
hem
    in CI, not because it's actually incompatible; support for 2.6 and 2.7 =
is
    unaffected)
    Fixes around hypothesis parameters
    Officially support Python 3.11 and 3.12
    Small updates to test suite to make it work with 3.11 and 3.12 and new
    releases of test dependencies
    Dropped the internal _rwlock module as it's unused
    Added mutation testing to CI, lots of speed-ups to the test suite
    to make it happen
    Removal of unnecessary six.b literals (Alexandre Detiste)

Deprecations:
------------
    int_to_string, string_to_int, and digest_integer from ecdsa.ecdsa
    module are now considered deprecated, they will be removed in a future
    release

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 .../python/{python3-ecdsa_0.18.0.bb =3D> python3-ecdsa_0.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.18.0.bb =3D> p=
ython3-ecdsa_0.19.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb b/=
meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
index 12dd51e79..5b4f7eb93 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb
@@ -4,7 +4,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D66ffc5e30f76cbb5358fe54b645e5a1=
d"
=20
 PYPI_PACKAGE =3D "ecdsa"
-SRC_URI[sha256sum] =3D "190348041559e21b22a1d65cee485282ca11a6f81d503fddb8=
4d5017e9ed1e49"
+SRC_URI[sha256sum] =3D "60eaad1199659900dd0af521ed462b793bbdf867432b3948e8=
7416ae4caf6bf8"
=20
 inherit pypi setuptools3 python3native
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

--MCBoundary=_12404101551396551
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Changelog:<BR>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>
New API:<BR>
------------<BR>
    to_ssh in VerifyingKey and SigningKey, supports Ed25519 keys only (Pabl=
o Mazzini)<BR>
<BR>
New features:<BR>
------------<BR>
    Support for twisted Brainpool curves<BR>
<BR>
Doc fix:<BR>
------------<BR>
    Fix curve equation in glossary<BR>
    Documentation for signature encoding and signature decoding functions<B=
R>
<BR>
Maintenance:<BR>
------------<BR>
    Dropped official support for 3.3 and 3.4 (because of problems running t=
hem<BR>
    in CI, not because it's actually incompatible; support for 2.6 and 2.7 =
is<BR>
    unaffected)<BR>
    Fixes around hypothesis parameters<BR>
    Officially support Python 3.11 and 3.12<BR>
    Small updates to test suite to make it work with 3.11 and 3.12 and new<=
BR>
    releases of test dependencies<BR>
    Dropped the internal _rwlock module as it's unused<BR>
    Added mutation testing to CI, lots of speed-ups to the test suite<BR>
    to make it happen<BR>
    Removal of unnecessary six.b literals (Alexandre Detiste)<BR>
<BR>
Deprecations:<BR>
------------<BR>
    int_to_string, string_to_int, and digest_integer from ecdsa.ecdsa<BR>
    module are now considered deprecated, they will be removed in a future<=
BR>
    release<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 .../python/{python3-ecdsa_0.18.0.bb =3D&gt; python3-ecdsa_0.19.0.bb} | 2 +=
-<BR>
 1 file changed, 1 insertion(+), 1 deletion(-)<BR>
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.18.0.bb =3D&gt=
; python3-ecdsa_0.19.0.bb} (82%)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb b/=
meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb<BR>
similarity index 82%<BR>
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb<BR>
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb<BR>
index 12dd51e79..5b4f7eb93 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.0.bb<BR>
@@ -4,7 +4,7 @@ LICENSE =3D &quot;MIT&quot;<BR>
 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D66ffc5e30f76cbb5358fe54b64=
5e5a1d&quot;<BR>
 <BR>
 PYPI_PACKAGE =3D &quot;ecdsa&quot;<BR>
-SRC_URI[sha256sum] =3D &quot;190348041559e21b22a1d65cee485282ca11a6f81d503=
fddb84d5017e9ed1e49&quot;<BR>
+SRC_URI[sha256sum] =3D &quot;60eaad1199659900dd0af521ed462b793bbdf867432b3=
948e87416ae4caf6bf8&quot;<BR>
 <BR>
 inherit pypi setuptools3 python3native<BR>
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

--MCBoundary=_12404101551396551--


