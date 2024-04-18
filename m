Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36959C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 09:29:32 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.151.118])
 by mx.groups.io with SMTP id smtpd.web11.8579.1713432571754557228
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Apr 2024 02:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=g2f8xGvG;
 spf=pass (domain: noxmedical.com, ip: 170.10.151.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1713432571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=3wonqx5hKS/x/jOSkBIsY55npv8pv4PkUObo7f2QPo8=;
	b=g2f8xGvGDDBYvCKfIOwGktqQWcZ+lRXOriwDYOthh/0aFnMct60PQAvlF5ua90PYnLUYgn
	mHj+PwLdc6rWdRDcpyhMT73hssjhVFh5m1M0sR7rTVDz9IKu8+gWB4Tvh5SrvNPxhSsmKg
	2L494Kj9xiLZ4HZw0vtC86gRKZFX69Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-37-k87IWL4kM8SnoxRs1KKIeg-1; Thu, 18 Apr 2024 02:29:26 -0700
X-MC-Unique: k87IWL4kM8SnoxRs1KKIeg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4167351545cso5620115e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 02:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713432564; x=1714037364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFtp2N7N5wX6MVDbaG7z98ndcIsTKEoTj8nV7pwkWkQ=;
        b=xBSDpgSEqgl6YEgKI7/aaeBFaSLRIDZSMpmTUsp5F1ncB/o9XTqMEwOMrdwQRvG3+I
         IBqvbbt+l1kYDhdwa537kSnY81PqQ7fxL6sHUffj6U5z63u7q76nq41BkKQpZgA69ERi
         4DLGQ4E3yhs+cB6vFMysyOoQBy1a0OFnOgaSdQ797U6+lLwcBf3AwxiHxeI0ouUjupTy
         TXfe5Q5KROo4r85pDvmXlb4vlyB8fgqJCu21Jkwik6rI4oxh+EZue/vLAwZX5RYNuVMf
         0DXrulUcWRGT0MGcw6ymEP5BjeL2EgyLgaSO/cD3DxLa66Ar5p8of3q3z6lbDwfqod7y
         wUhQ==
X-Gm-Message-State: AOJu0YxrjHgNS0FTjVES9mn79mLt69KeRSWWf4alQkYcl5VYStQUZiFD
	gzZpuVqEUfZgXV6JqMdJG5gYwFqzOaxYlAgaUTVVR6wyz9R/y4hIpYlG3GoFQC58ICK6y8/s/dc
	RSCZ5ncHPeZFM3KJeUlYJ7iKLXNxLVsb+FyaSvaNpgGpzF95wpm3k7wNvaR5wahQEk0gz9Fck9g
	lBEkNx0RVoMpgXLR2InlnkmGA9CljbRWer60znbGFzj9CiK6gaXbR42UwLKMPryC5zEBN+
X-Received: by 2002:a05:600c:1da9:b0:418:e8bf:5e70 with SMTP id p41-20020a05600c1da900b00418e8bf5e70mr1042323wms.8.1713432564469;
        Thu, 18 Apr 2024 02:29:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg2MnU8333DN1vzBge89/PQlXwYmPEL5JZCl4bZp3HV3ikKrf/7+BuWNTRIFN5qil7HlKP9g==
X-Received: by 2002:a05:600c:1da9:b0:418:e8bf:5e70 with SMTP id p41-20020a05600c1da900b00418e8bf5e70mr1042306wms.8.1713432564083;
        Thu, 18 Apr 2024 02:29:24 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c35d200b00418d434ae4esm2034551wmq.10.2024.04.18.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 02:29:23 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-incremental: cleanup RDEPENDS
Date: Thu, 18 Apr 2024 09:29:10 +0000
Message-Id: <20240418092910.3585-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404180229290461"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 09:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110052

--MCBoundary=_12404180229290461
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

incremental package does not need all twisted packages. Only the core packa=
ge is required.
The goal with this change is to minimize dependency memory requirements.

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 .../recipes-devtools/python/python3-incremental_22.10.0.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-incremental_22.10.=
0.bb b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
index 3d93cc05e..79fa15311 100644
--- a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D "912feeb5e0f7e0188e6f42241d2f450002e=
11bbc0937c65865045854c2
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D " \
-    python3-twisted \
+    python3-twisted-core \
     python3-click \
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

--MCBoundary=_12404180229290461
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>incremental package does not need all twisted packa=
ges. Only the core package is required.<BR>
The goal with this change is to minimize dependency memory requirements.<BR=
>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 .../recipes-devtools/python/python3-incremental_22.10.0.bb      | 2 +-<BR>
 1 file changed, 1 insertion(+), 1 deletion(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-incremental_22.10.=
0.bb b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb<B=
R>
index 3d93cc05e..79fa15311 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb<BR=
>
+++ b/meta-python/recipes-devtools/python/python3-incremental_22.10.0.bb<BR=
>
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] =3D &quot;912feeb5e0f7e0188e6f42241d2f45=
0002e11bbc0937c65865045854c2<BR>
 inherit pypi setuptools3<BR>
 <BR>
 RDEPENDS:${PN} +=3D &quot; \<BR>
-    python3-twisted \<BR>
+    python3-twisted-core \<BR>
     python3-click \<BR>
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

--MCBoundary=_12404180229290461--


