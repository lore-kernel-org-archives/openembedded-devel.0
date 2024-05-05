Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802A7C4345F
	for <webhook@archiver.kernel.org>; Sun,  5 May 2024 22:31:40 +0000 (UTC)
Received: from usb-smtp-delivery-118.mimecast.com (usb-smtp-delivery-118.mimecast.com [170.10.153.118])
 by mx.groups.io with SMTP id smtpd.web10.8363.1714948292343853833
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 May 2024 15:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@noxmedical.com header.s=mimecast20231107 header.b=hV511hfb;
 spf=pass (domain: noxmedical.com, ip: 170.10.153.118, mailfrom: gudnimar@noxmedical.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noxmedical.com;
	s=mimecast20231107; t=1714948291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Q+J1vqZ/Ewz+ZXkax+e4pd9s5/eMCugH9zaSQXVsIOw=;
	b=hV511hfbcEaTE34hee5IElDfS0FophWD/gPZwBCDC5q0DQB2FN7WOsHCTZUAO5lxA5lU7H
	4QYXNWmCABqb/3qsP1kWH3iyN309liw1m/MGFRJzXlwkjh/ZRNXzt7hbxuIr8cbmP2gK6p
	snHrPbS/5E3lleuk5YyrciQAGJ+V2/M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-36-_FTdjAF9PVu5LfzN1kFQOg-1; Sun, 05 May 2024 15:31:27 -0700
X-MC-Unique: _FTdjAF9PVu5LfzN1kFQOg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-34c93732095so769358f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 May 2024 15:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714948285; x=1715553085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tV/yEo0rsRmyG9HX1yZm5O450S0GUx9vuZfy1MvBEeU=;
        b=RaJA8w+7secRYpBrjT7MLWoS0kdXrRu1Go+ovnvqyuD5X+/AEB5EANINkqcG2BIsNo
         SoDinahikKoXtgYv9GOqXWPXY8b1krrIaRFOhNoZ119DwQslksOocwKivDcmE0sWff0L
         nzu54U+XVnTK5C2zkKYvadEHCy7FAfqs5Y5KZPYwD+trD+kTN0w8KSSJ+EQe8eNeWt04
         8vBi201iyEOf17bGFOadhR+s1ZTh8W4nL2HncIkoILMZDpOh82wBtnZFt3owc2PyLo5w
         r2h+we2PRs136KK+7vR17NOIbRhi/wi2akP+5doxUrXCcmbT4XMZW5tUiHMmAtWWx++I
         adfg==
X-Gm-Message-State: AOJu0YxxVllaOokaa0AKm9hKNwSquo2AEpzyyHgsJINpMxlLCKTP+O7t
	6SXBeS34IAEFtGMsNtJ6rmvWeLVATrVTRq7J0tyl2psWv48B6hPalr5FirEm+F2apZ93/NLtUfe
	DjwmmlZoPv1GOlbNR+c056K1A7RL81CxLhDCy/uURYRGRnusOaCLjdQ5AlkzJSysttXixuSuUPI
	Y/InCm17Jgy6Lo6+wrMbMJi0sdkiVQ2NWomGKL1k9jGQp1RagIaUxfb/gDEIUwaAjCXxNi
X-Received: by 2002:a5d:6146:0:b0:34c:e409:49d9 with SMTP id y6-20020a5d6146000000b0034ce40949d9mr5142886wrt.68.1714948285508;
        Sun, 05 May 2024 15:31:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy5IAmbj+MgBks/AG/bnZxud4O02Q8VQZsznQj4km8qxyjAh/3XvjN0Xe+FhRkAX8ncTEKlw==
X-Received: by 2002:a5d:6146:0:b0:34c:e409:49d9 with SMTP id y6-20020a5d6146000000b0034ce40949d9mr5142875wrt.68.1714948284990;
        Sun, 05 May 2024 15:31:24 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id dz5-20020a0560000e8500b0034d10895f95sm9119357wrb.56.2024.05.05.15.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 15:31:24 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudnimar@noxmedical.com>
Subject: [meta-python][PATCH] python3-twisted: prepend split PACKAGES
Date: Sun,  5 May 2024 22:31:10 +0000
Message-Id: <20240505223110.1043449-1-gudnimar@noxmedical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: noxmedical.com
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12405051531290701"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 May 2024 22:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110256

--MCBoundary=_12405051531290701
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Fixes an issue where split packages were no populated since all the files
were picked up by FILES:${PN}

Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudnimar@noxmedical.com>
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

--MCBoundary=_12405051531290701
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Fixes an issue where split packages were no populat=
ed since all the files<BR>
were picked up by FILES:${PN}<BR>
<BR>
Signed-off-by: Gu&eth;ni M&aacute;r Gilbert &lt;gudnimar@noxmedical.com&gt;=
<BR>
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

--MCBoundary=_12405051531290701--


