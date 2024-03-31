Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3718DCD1284
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 12:42:45 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.153.118])
 by mx.groups.io with SMTP id smtpd.web10.16275.1711888956622929136
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Mar 2024 05:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=L6XpGPLF;
 spf=pass (domain: noxmedical.com, ip: 170.10.153.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1711888956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ojWJLctY132x+pBULeGCuKzcjhEB32fa4FeeQw3JhBg=;
	b=L6XpGPLFkuZhtYjOIrO00xOczMuCZLddD6lRuRdGsNsrsP5std05tqlz85+iCYD9Wh+YuO
	i8KwXKUiyEwUO3s2OIJHQYQxZl4Sk6Ky2yeoAA/CfFW84X3tRmUb9HEG2h3BywhHOPxh9e
	JnFCY2TJwTZ7wvFVRjBpxN0eaQlOhDY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-40-sU_mTrAtPKifLA8VqBGbyQ-1; Sun, 31 Mar 2024 05:42:34 -0700
X-MC-Unique: sU_mTrAtPKifLA8VqBGbyQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3418f237c0bso2069158f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Mar 2024 05:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711888952; x=1712493752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cdrpigru6j9HVzlKuxIsBlKjPA/kXezM1Ue9mVft+lI=;
        b=HELv950of70hl6Cj98z79taHhVFt/1sCfy95a88QHMbRQeud72QNXEerZLXhZvTH3W
         g8WTf/nJUrUFhUMjc3ktgZKo4d6pQhaCkuxVvl2DurHSQd1BTfVblHoalQYruJweRa2F
         u1R/Vk2notOxuM9ym27mAAdQhMrR6vo3dcdRM724bd7UxIoSHXbEJC23JRISnYm/eeiA
         tgQtYuref3KSEewU20G/SJF2SLNs8lAuWe5ObH13f64hQ41nU5clr04nckInjT9+83o0
         a/Md+w+SY8RMDpjHP/9hKds+IIEQEd/SwXMQsR7Cd89R4znvew9xxc5gZRI+zDOszzmP
         isYA==
X-Gm-Message-State: AOJu0YyKp6800T9O/ns/50QIrZmXoloQ/NlnEk//3JYuA5J5NVGYFMEO
	Yf/eT+IQeQAjFdMJsI4nZHNKHGI2Tu7g0pkSWCNndeENZvZpYwHtzQ0xaCF31rQ1kJE/6SuLDJc
	UizxuZfKsahyjS2seEKxhoiWmo6z9FllkaiZ3CW5/yVOYgVxCQ+UeS1L2lOUzDP2QPNrwQAxvjQ
	BQLG4QefMsz0eqo6p6SK7i4HVOi2ZxnAAi7XxSkqT0deS9LR7/yVzh3yJBAhp13PEMTfzE
X-Received: by 2002:adf:fac4:0:b0:33e:c316:2a51 with SMTP id a4-20020adffac4000000b0033ec3162a51mr3429674wrs.27.1711888952160;
        Sun, 31 Mar 2024 05:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETVVHrLvdRUbJmr/DNXggStRqm0CoOe7rBB9UeGtLa3dZhDiUBLnYrUKaZqPIWBYFe0t3cEA==
X-Received: by 2002:adf:fac4:0:b0:33e:c316:2a51 with SMTP id a4-20020adffac4000000b0033ec3162a51mr3429658wrs.27.1711888951545;
        Sun, 31 Mar 2024 05:42:31 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id e1-20020adff341000000b0033dd2a7167fsm8885057wrp.29.2024.03.31.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 05:42:31 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-ecdsa: remove python3-pbr
Date: Sun, 31 Mar 2024 12:42:13 +0000
Message-Id: <20240331124213.2542824-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12403310542350211"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Mar 2024 12:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109689

--MCBoundary=_12403310542350211
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

python3-pbr is not a runtime dependency or a buildtime dependency.
The reason for this change is not only to clean up the RDEPENDS list.
But also because python3-pbr adds pip as a runtime dependency which
is not always desireable.

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb b/=
meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
index d1022891b..ea175d214 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D "190348041559e21b22a1d65cee485282c=
a11a6f81d503fddb84d5017e9
=20
 inherit pypi setuptools3 python3native
=20
-RDEPENDS:${PN} +=3D "python3-six python3-gmpy2 python3-pbr"
+RDEPENDS:${PN} +=3D "python3-six python3-gmpy2"
=20
 BBCLASSEXTEND =3D "native nativesdk"
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

--MCBoundary=_12403310542350211
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>python3-pbr is not a runtime dependency or a buildt=
ime dependency.<BR>
The reason for this change is not only to clean up the RDEPENDS list.<BR>
But also because python3-pbr adds pip as a runtime dependency which<BR>
is not always desireable.<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb | 2 +-<BR>
 1 file changed, 1 insertion(+), 1 deletion(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb b/=
meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb<BR>
index d1022891b..ea175d214 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.18.0.bb<BR>
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] =3D &quot;190348041559e21b22a1d65cee48=
5282ca11a6f81d503fddb84d5017e9<BR>
 <BR>
 inherit pypi setuptools3 python3native<BR>
 <BR>
-RDEPENDS:${PN} +=3D &quot;python3-six python3-gmpy2 python3-pbr&quot;<BR>
+RDEPENDS:${PN} +=3D &quot;python3-six python3-gmpy2&quot;<BR>
 <BR>
 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<BR>
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

--MCBoundary=_12403310542350211--


