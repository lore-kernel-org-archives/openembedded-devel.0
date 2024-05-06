Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8BEC41513
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 18:55:38 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.153.118])
 by mx.groups.io with SMTP id smtpd.web10.1179.1715021736397246791
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 May 2024 11:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=IE0Mg7hR;
 spf=pass (domain: noxmedical.com, ip: 170.10.153.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1715021736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t60t3DrchQulnOOF8nng8JkL1jvRoIVvAdHqj23cVpE=;
	b=IE0Mg7hR1avTtiCdIfEDD2Fv/vaE6i05Uf2C3em2C7OawXMbWtdAUt6ltHX7FzN8FuEu/k
	JhzD/fRKzFyImga5vCkUgHv1VmQLRCBNE7/UaMPeq4XGCaAxG/dFs8OWAiP262+VQz5jaY
	ZRfE8ZUVdhPFUZioqRJCFOv8lvGlLL4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-48-hdRjbevNPriHcu16dpUH0Q-1; Mon, 06 May 2024 11:55:33 -0700
X-MC-Unique: hdRjbevNPriHcu16dpUH0Q-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2e32c301353so9386491fa.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 May 2024 11:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715021731; x=1715626531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGMc5DNoiw1p4ItlDfjfPqryqmOn/kE1fzE9oCpoVLI=;
        b=hejgFyyaRuXoD2apVH7WyOkhqF0hwNYJe4TM/J0yBU5hKsTyo2XG2kJQF/vOrL9a1n
         jaXkzM4nbWHP0hpvqftsURj7S7ehnxEai7yUE9ixqIhUru6qJtdd6dXTE4jACgZNfRVX
         p7oZ40C8qnZjl8l1q8ReW8HQrZWmNvdgFPOiTr1DGi1jdNOHb6Dg26A1BqOJPPicxkDh
         ORVF5hZtUJzVj7EvB/b8aPpNKn8yQqEgyXKcGis3z/kJSvzqlygnSaQ+Fb5GD3sYcb9k
         2e52vLq/DOSdX6asMkVgC9VhOM+dZfCadGSgHQX5jDQf+v7WjM50aTbkqt2ABqVfesH8
         DEdQ==
X-Gm-Message-State: AOJu0Yy0VZDmjORU+fjFCH0ixTepzNrfgK6MJeJmqy3DvQDwKYqCexHv
	aXmVyeSAEK7Uu+kyvTHzTimywHPWn5YMv2D4qew6lucLV5g8qltSUlMgfQGoH5S1vEbYqVRblnv
	4cKYkR7NHdXrjA2+HV1c2k4e+TLgMKQus4w/IuEO0EHHFAz6uS4DlfjxvAO0LPAnZAWpXGFj7Vc
	FZ+SXvR057xSzUtGJBYtbR+zFJciggkCNwJEVhn2fIvIQ5RvO0xSqHslIB5IAD5HSiB3qO
X-Received: by 2002:a2e:7008:0:b0:2e1:ba1c:efea with SMTP id l8-20020a2e7008000000b002e1ba1cefeamr6889424ljc.19.1715021731097;
        Mon, 06 May 2024 11:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHs6N5xOnPoTZlPYJ4B/v25FvceFq+Pv1/faJ2RCa0BeUNT3dzoJBPUGMMy5GKU2qFEoN829A==
X-Received: by 2002:a2e:7008:0:b0:2e1:ba1c:efea with SMTP id l8-20020a2e7008000000b002e1ba1cefeamr6889415ljc.19.1715021730644;
        Mon, 06 May 2024 11:55:30 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id je8-20020a05600c1f8800b0041bf28aa11dsm16919356wmb.42.2024.05.06.11.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 11:55:30 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH 2/2] python3-twisted: prepend split PACKAGES
Date: Mon,  6 May 2024 18:54:43 +0000
Message-Id: <20240506185443.3715-2-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506185443.3715-1-gudnimar@noxmedical.com>
References: <20240506185443.3715-1-gudnimar@noxmedical.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12405061155352971"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 May 2024 18:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110262

--MCBoundary=_12405061155352971
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Fixes an issue where split packages were no populated since all the files
were picked up by FILES:${PN}

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index ba5bb04db..336c17389 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -15,7 +15,7 @@ do_install:append() {
     find ${D} \( -name "*.bat" -o -name "*.c" -o -name "*.h" \) -exec rm -=
f {} \;
 }
=20
-PACKAGES +=3D "\
+PACKAGES =3D+ "\
     ${PN}-zsh \
     ${PN}-test \
     ${PN}-protocols \
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

--MCBoundary=_12405061155352971
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Fixes an issue where split packages were no populat=
ed since all the files<BR>
were picked up by FILES:${PN}<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<BR>
---<BR>
 meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb | 2 +-<BR>
 1 file changed, 1 insertion(+), 1 deletion(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
index ba5bb04db..336c17389 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<BR>
@@ -15,7 +15,7 @@ do_install:append() {<BR>
     find ${D} \( -name &quot;*.bat&quot; -o -name &quot;*.c&quot; -o -name=
 &quot;*.h&quot; \) -exec rm -f {} \;<BR>
 }<BR>
 <BR>
-PACKAGES +=3D &quot;\<BR>
+PACKAGES =3D+ &quot;\<BR>
     ${PN}-zsh \<BR>
     ${PN}-test \<BR>
     ${PN}-protocols \<BR>
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

--MCBoundary=_12405061155352971--


