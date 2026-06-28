Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5453FC43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14738.1782634335093759358
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FquWQJvN;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3078e0dcd67so4006710eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634334; x=1783239134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3ngqlIGK5ufhAJkiV2YSuSyG1WBxEDfUufWyy09djk=;
        b=FquWQJvN9fapIdTLXNd2OYwvjedHlwYIro9iPVHh5/AU3+uwu12o5rwLWMa7teCkxb
         S978mPslIVIXfJWxW4S871idts/yNocV/m8iRXh4JrF2eEzmhkEIX9baCT5fYa9f6aHR
         0w5gSFEKONCOKApmZxgntAuEkdlLPdpnyhbb7Z6nNv4hdllffUWMmhXaPMd+UDhnmDU5
         9pa0iZy2wz2/+x/GNV6r2qbxsLYOpCXKg8Un8poQ2qfL61FL1c2lWc7tvOb/CAx2xeZK
         adVwB2LLuy7kA8Wi2x1P8FQ3Y+YcxMaJxM3WW7FYcPvJr7bQKeqWleuvO7rHJAfSFi/u
         vTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634334; x=1783239134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3ngqlIGK5ufhAJkiV2YSuSyG1WBxEDfUufWyy09djk=;
        b=i35zMNuOeAVhJfERjf2x7RXEVOIuko7j/LWhpPt7e7lvoEPW62UR9FiZ7HfFN8WjDI
         HBJisn4axqzj5GDIuRFewWcfz+8pzYOmk3EPv28CrtTnKdENtpg2Hep8i49kKb1qo+Z1
         lcztCY2f4NU52x2kFrzGoCIGQNOpKLeGruHJZGIQF+3jj/+I68L0pK5JF7rWAJSjpeSn
         bZ/HdZ5DMjD3TcuFOOfqSXt/E0JxNi5qRz+f8aafqC8COIRoEFqKzKwzWgDxQlBumsWR
         GrHQWAN6Kl4jeiaWMtP7HPzDCC/s8VCBbOhMV+Oo+79f8fNOB7LEsSW4F2jlfFaeSudX
         i4nA==
X-Gm-Message-State: AOJu0YzWyfEUSuSyccDzwMahWPMvdlSNsKmnFQJpoJphmTP5dGlHIrhW
	z3su9m0kDolfWuEAeYS9CWkxXbuBp13Hro2gsq+h3Ivgu4MV4DFdsyfPt2dAwhloa8WeUA==
X-Gm-Gg: AfdE7cm/ed6KaCaNaArC1lQfNkgIEhGGa9l9TAcNmuLfLriVmW5vy2DWzHLG7v1tu9x
	g035CdWne7Y9Dgi4WrRIBCtE8sGoFlL5aygOCL338yt0Zll5V2kZ1FopiCVbOStiEk5iujdsUVT
	EW9hXyq0Ggqf7O11T7agPY6iFB8PxrlpmtI73o59JSQ1jc4j1kzM3oduw0Ncte/ATI5Y4NNnIJm
	Xbj7HFnIsTl/tuft/XAA3CV0dMOqdV/gKq3dzAhxUCgpmaFQkJt6R+DR9Ce3sSfVbnljwC3mOA4
	YzU/l2LLpL+ivko2lY6Z/VFjZaM1PcYP9unoRsc9parO8FHvDWlvlKpz4WsENKmtPI8D1Q8X8is
	SeXpbBBONN98n50n6YjVL5L2KS8qk7xaCGmQ9kCUcpli3qwu2C/nwqBz8bu621IJfmvbAQAn9hX
	k12/XJLLnr1ayJEFbb0sWNZCw4N+6j4d6HSBxUt0iBNrpYufFY8+ORR7oz5gjXjGY9b9ND13hx+
	YsKftC5ViNHdS+9wT+UTgCqLhj+688NeTePYhenCpUQ5UUtJ2zEtvrtn+oJXUS3+ad6erZ7zxYf
	2mj/7hfiFNJ5hzTLrSxe+NxauL+03g==
X-Received: by 2002:a05:7300:72d1:b0:30e:c71e:dbc with SMTP id 5a478bee46e88-30ec71e34cbmr276671eec.30.1782634334372;
        Sun, 28 Jun 2026 01:12:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 054/128] parallel: upgrade 20260422 -> 20260522
Date: Sun, 28 Jun 2026 01:10:05 -0700
Message-ID: <20260628081122.178348-54-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127864

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../parallel/{parallel_20260422.bb => parallel_20260522.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20260422.bb => parallel_20260522.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20260422.bb b/meta-oe/recipes-extended/parallel/parallel_20260522.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20260422.bb
rename to meta-oe/recipes-extended/parallel/parallel_20260522.bb
index 74cf8c75e2..b055a9af2a 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20260422.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20260522.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "664cf165d66ea217b2f49cd96a7865ecf90c9d0616599cc2aba8cad481d907bb"
+SRC_URI[sha256sum] = "2bab0cf913eeb60a24c6575d60e3c167cd03e63b4f7d17965915844e005dd895"
 
 inherit autotools bash-completion
 

