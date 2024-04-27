Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6EAC4345F
	for <webhook@archiver.kernel.org>; Sat, 27 Apr 2024 19:01:15 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.153.118])
 by mx.groups.io with SMTP id smtpd.web11.17336.1714244468710180600
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Apr 2024 12:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=R09Xc3OS;
 spf=pass (domain: noxmedical.com, ip: 170.10.153.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1714244468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=zMgWQgkVVN6lgh6VVewGWIc+cSyG52XedasAvv+6UAI=;
	b=R09Xc3OSnRMZ4nPTT1LuIFDP69bxBsP5YmaDc/JHU4SzFGmpANSI41l7Br15vpzLTX7dbd
	kfbxFBAjWvykGA83l78QjnNVcgNL6GVM66Ghd8nQMH1DEnHi69UHDR7Ew/x+zJebwcXChi
	AFwjNfEQKPNJnFy8CYCEsMn5tvc6wsY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-4-aGBctgUSOXuUCRrg9auvsQ-1; Sat, 27 Apr 2024 12:01:04 -0700
X-MC-Unique: aGBctgUSOXuUCRrg9auvsQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-349c63ea688so2143686f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Apr 2024 12:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714244463; x=1714849263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qFApPCjsjziwYYqxY5U78nIQ31eBMUoCBRMrF/heVU=;
        b=cBK/yx/yiDDT5AQnl0plxKiXBiojY/p6dwcRQZD4N4LhJZrTgj4AWGvIaWcGcg0rIW
         VZtqvhk+K2xezAbflaMOHG6X2sBu9w6LvFM+coik8dHRLQUiaEYXzfYSx2tDJ/7f+XSQ
         DEoVnqp0vWslTfHy7M5ZHXXxuVkRdvtB2PR1zzJFcqxN8hlzXHws0sOWJQdMwLEnrwl9
         wiQMVej8rakV/B4PbeetQkvLM4wLv/2RdocdA/7i7qoeKJyKLVyQsnksyOt3HLryRQkK
         GP6O3HJAnFHn2bzbuK5prXu7eLjG2dH5ghJenu/i7sNFXHJ0hP8QyhcRPam7srQhNaO0
         O55Q==
X-Gm-Message-State: AOJu0Yx8WCijXCm6ilHJaDsfXKR6ZLhAAfzBsTHMBEMq7QXliGKobm96
	lNFRkAB7PMRCQSFhNsj19vuJYbO/+JJtZIIkY8WVhRLF8aQrEQ4+0IQ5OOh3T7YI//FpGq5tynl
	LgUrhMuiueseRR609iku4En4gicj67hl6etepBBgvzjyeX09d1skDOkGPYZoVtmLjr1cydJ6CxF
	aOA4N5OJe8HzPK0AIg8fTbb39fd0tQKWBiCzAYGwkwAlIyi096vl6FogAbK9K/VOpTiGCQ
X-Received: by 2002:a5d:628b:0:b0:34c:a488:e6d0 with SMTP id k11-20020a5d628b000000b0034ca488e6d0mr1457984wru.36.1714244463159;
        Sat, 27 Apr 2024 12:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK36U/Jun3JGHPLLwnJ9KNKs7mtcC6Nl+w+NNvcb4XcmC4M9R8kstIH+Nw2mk+OU/vROz+OQ==
X-Received: by 2002:a5d:628b:0:b0:34c:a488:e6d0 with SMTP id k11-20020a5d628b000000b0034ca488e6d0mr1457975wru.36.1714244462765;
        Sat, 27 Apr 2024 12:01:02 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id df7-20020a5d5b87000000b0034bc5934bf8sm9737895wrb.31.2024.04.27.12.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 12:01:02 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-protobuf: drop python3-six from RDEPENDS
Date: Sat, 27 Apr 2024 19:00:47 +0000
Message-Id: <20240427190047.1561142-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404271201070371"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Apr 2024 19:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110158

--MCBoundary=_12404271201070371
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It looks like python3-six was dropped as a dependency between
version 3.17.0 and 3.18.0. Looking at the PyPi downloads indicates
this coincides with when Python 2 support was dropped.

I couldn't find any release notes so this patch is based on looking
at the source code downloaded from PyPi.

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb=
 b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
index 8bb8a93f7..b9b03badd 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
@@ -23,7 +23,6 @@ RDEPENDS:${PN} +=3D " \
     python3-netclient \
     python3-numbers \
     python3-pkgutil \
-    python3-six \
     python3-unittest \
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

--MCBoundary=_12404271201070371
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>It looks like python3-six was dropped as a dependen=
cy between<BR>
version 3.17.0 and 3.18.0. Looking at the PyPi downloads indicates<BR>
this coincides with when Python 2 support was dropped.<BR>
<BR>
I couldn't find any release notes so this patch is based on looking<BR>
at the source code downloaded from PyPi.<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb | 1 -<BR>
 1 file changed, 1 deletion(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb=
 b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb<BR>
index 8bb8a93f7..b9b03badd 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb<BR>
@@ -23,7 +23,6 @@ RDEPENDS:${PN} +=3D &quot; \<BR>
     python3-netclient \<BR>
     python3-numbers \<BR>
     python3-pkgutil \<BR>
-    python3-six \<BR>
     python3-unittest \<BR>
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

--MCBoundary=_12404271201070371--


