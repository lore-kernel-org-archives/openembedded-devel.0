Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E74C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 14:51:48 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.23464.1714402302649061620
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 07:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=TZW1SRLi;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.41, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a58e7628aeaso253624666b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714402301; x=1715007101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KqZA9GUOKoj2xudd/85xqC0P++FcMQf6HXOpveuQfOo=;
        b=TZW1SRLiLX46x05Yf5SPmMOVgmMw/LGh7F52jSGCAe/scb5NXk+oghXq97d8TzByVj
         SbpdlPgkKI9c6olsGIE2lQQE+jCClcT9nWBWoxVgZjPSe4EmZKf86cw4JP2rzmxLt7OO
         Vx+QnfW8YgbkARwOQCtWAvxiV5jj6dWadX+wT5iVJilZsW9NazXH8cIDezQR6FBExxLR
         zeO/85lafFVu86ZylZTsEtx2ELTeV8WVfYqWt12Y7ZdE9vxlv62tbEDdr9njapirnMCW
         WhsSAQaV2x70i6V9H2JgS2qQeZ0ZrwK1vmdcJY8oQTGXji5YUGE+a0oRc/Duh+H9l5X5
         +eXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402301; x=1715007101;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqZA9GUOKoj2xudd/85xqC0P++FcMQf6HXOpveuQfOo=;
        b=A/B3Sxb5p3yNcjfaPkakPlvsSsVHiegTKJoQsgJksWdnsbK8DlThD7e/JLTZOhGkCn
         faBMvvG2Aj0GUDSV5Ue6EX247gRCH9KR62P1ssOwLuOjsx+LfUna0+HXd2EidGxpgsx6
         u2JOizY62Dzmvl/GtopQo5dI60AToesuZm1kjBfqRShagYvOTx+yCTyJ77b6utxKQ0EC
         uf5GLRuWVwfXIiYlx+COk9h8VxO6SLMX6+3tWXPmo8POWM345bytul9qsHWql4YvPT+Z
         LFSIuOmXGUVPUhbOZs6fpscaw8D8+L485EcrOOB4pCpYkn3XG2wB/3xSVlhwI5XKGrNg
         rQQw==
X-Gm-Message-State: AOJu0YzJQsmVqPqoh/+pnuZpsjvuO3yVAe41jQhdwed6Z4sJmEOSKW6O
	fJHvNd7EzE6FYxplT24wuGquxUHjSpBHmTjVQuSP8lF2pTBeMVcx0tAmc4YnwkdPO9EJE7fWYoZ
	7RPY=
X-Google-Smtp-Source: AGHT+IEVGc4DIO4j/ZUyfgpv7ferdoi7UUwd2oH7DPc7kFU9DSYTOBFlwDA2eiQJ5uSnNpKFHd084A==
X-Received: by 2002:a17:906:2783:b0:a52:320a:6320 with SMTP id j3-20020a170906278300b00a52320a6320mr6833966ejc.51.1714402300811;
        Mon, 29 Apr 2024 07:51:40 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id ky26-20020a170907779a00b00a5887833da8sm6997677ejc.81.2024.04.29.07.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 07:51:40 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Peter.Marko@siemens.com,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH v2] procmail: Update status for CVE-1999-0475
Date: Mon, 29 Apr 2024 16:51:36 +0200
Message-ID: <20240429145136.4606-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <AS1PR10MB569715FF87D60F790400FB2DFD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <AS1PR10MB569715FF87D60F790400FB2DFD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 14:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110186

Current version 3.22 is not affected by the issue.
Affected versions: Up to (excl.) 3.2.1

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index ba268de0a..16917666a 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -43,3 +43,5 @@ do_install() {
     oe_runmake -i BASENAME=${D}/usr MANDIR=${D}${mandir} install
     install -m 0644 debian/mailstat.1 ${D}${mandir}/man1
 }
+
+CVE_STATUS[CVE-1999-0475] = "fixed-version: No action required. The current version (3.22) is not affected by the CVE."
-- 
2.44.0


