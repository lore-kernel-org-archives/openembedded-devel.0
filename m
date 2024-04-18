Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47404C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 09:26:22 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.153.118])
 by mx.groups.io with SMTP id smtpd.web11.8535.1713432378694561445
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Apr 2024 02:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=OvL63ITi;
 spf=pass (domain: noxmedical.com, ip: 170.10.153.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1713432378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fxeyK2WY+Cedt7yZWJMSTff3jOBXAl8etQnT5gnj9Gs=;
	b=OvL63ITiTa6kFmv9Ch40lQ3ZNmW0XelBL72BqrVmuuHPkFket0yGk1N+K0Mhz51emnS9L/
	4bPJEPoTTVgXQGUCOqJmMnI2yMMI+sLyQSRdEn/2H+MeTxtIJB/w/dXWe/10hOoIio5EHs
	LW1YXr7yVK4mUvU2sBwiD3/zlQs0pak=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-16-hFQ24fv1OpeyPifSN7GIMg-1; Thu, 18 Apr 2024 02:26:14 -0700
X-MC-Unique: hFQ24fv1OpeyPifSN7GIMg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-416e58bdc0eso3501535e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 02:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713432372; x=1714037172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXxvruFfF3VQDApr3ig0TJrfANZTgO/3s09W922qkRc=;
        b=Dby/EPqev24GydJeqOPYXH9WRZ59iuR9Ou0/WmhMTf60vu8gruOL6yL6vTVUcZM7CW
         Cj2+fqxp7/0dTxKWwxaiN/AXPyt4ixwNGNc9VaitZVMSuZ7qgGe0+/JlW/rFOst6QrG0
         anCCPf1umeFu7VuCH8NQLMDb/L9Kgy0yOajN8v5D0rffUni+5SpRVaIJNZ22bL1C75j1
         r37Pnp+ah81hOtpdF/KNXObtbdX6gc7+Df9XRAlJse1slFkB/km13I+92r0dIG25JWnh
         DsOqogJLX3A0XLPLo5gaK37obQyLnpieR18b3YjmpOFfi1vudqRVbPmUAAMDaX1ZNwcL
         yKOg==
X-Gm-Message-State: AOJu0YyEJIupR8pyWly2bTiUfSrIl0w6dMScJ9dVhfqYUUDhd3pI+v45
	mFMjoisUxyOp4iHW8a83tXIJlV6F6YY1Ky7cBis2dhsV//3wNtGY6562zwE1j7I28zW4Cwwexzo
	JRXrodn7BNNUdEG7GxIvzXeeIbDMrP8KA90+7KIzX8nfl6nCyRT6lbZOZuAPiXDz9JX075ir5Vf
	BWgj2Gx9H/v5SX+IErDlv8LbJKfai+apdpNp97nVpD6mKhWRGytVHEleSmAexGXQwwNLlE
X-Received: by 2002:a05:600c:4f48:b0:417:c329:b52b with SMTP id m8-20020a05600c4f4800b00417c329b52bmr1639162wmq.39.1713432372592;
        Thu, 18 Apr 2024 02:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJ1EH7EXH4c6DqIYmECyTtf2MwOlti3qtGHB8nYiLaGbLEBeh2KsICrTirydImVbv3TgIHvw==
X-Received: by 2002:a05:600c:4f48:b0:417:c329:b52b with SMTP id m8-20020a05600c4f4800b00417c329b52bmr1639143wmq.39.1713432372016;
        Thu, 18 Apr 2024 02:26:12 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b00417f65f148esm5851470wmo.31.2024.04.18.02.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 02:26:11 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-txdbus: cleanup RDEPENDS
Date: Thu, 18 Apr 2024 09:25:53 +0000
Message-Id: <20240418092553.3408-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12404180226160991"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Apr 2024 09:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110051

--MCBoundary=_12404180226160991
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

python3-six is no longer a dependency and Python 2 support has already been=
 dropped.

Change python3-twisted to python3-twisted-core such that only required modu=
les
are installed.

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
---
 meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb b/=
meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
index d579ca044..1232f5e99 100644
--- a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] =3D "8375a5fb68a12054f0def91af800c821fb2=
232949337756ed975f88d8e
=20
 inherit pypi setuptools3
=20
-RDEPENDS:${PN} +=3D "python3-six python3-twisted"
+RDEPENDS:${PN} +=3D "python3-twisted-core"
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

--MCBoundary=_12404180226160991
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>python3-six is no longer a dependency and Python 2 =
support has already been dropped.<BR>
<BR>
Change python3-twisted to python3-twisted-core such that only required modu=
les<BR>
are installed.<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
---<BR>
 meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb | 2 +-<BR>
 1 file changed, 1 insertion(+), 1 deletion(-)<BR>
<BR>
diff --git a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb b/=
meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb<BR>
index d579ca044..1232f5e99 100644<BR>
--- a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb<BR>
+++ b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb<BR>
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] =3D &quot;8375a5fb68a12054f0def91af800c8=
21fb2232949337756ed975f88d8e<BR>
 <BR>
 inherit pypi setuptools3<BR>
 <BR>
-RDEPENDS:${PN} +=3D &quot;python3-six python3-twisted&quot;<BR>
+RDEPENDS:${PN} +=3D &quot;python3-twisted-core&quot;<BR>
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

--MCBoundary=_12404180226160991--


