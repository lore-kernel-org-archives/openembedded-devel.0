Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B09D3177A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:01:54 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.26868.1730829704624861645
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UOICc39b;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso1008283866b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730829703; x=1731434503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8V4rwdQyCDsdK49XXZL7dkP2JPDo66sDxvRvrbyw1U=;
        b=UOICc39bkOZI65f8pSuzVogzUzBDCM9GyYXSAbwympIGjAbJoATvM1hSv0OE6KhF4N
         g0/K5qU9d0NKWJnifypzBxRZR24WQyPBvPnvS7uLoJgtn315+eV694Z5nkS254p4zJtm
         sDyTJLRZVb84KoV6jlBI3IQYQRYIGv4owx/Is1oUeHTj/qYEQpTV1IjT4b4DhSJ8jjtK
         73wQUSz1hDzf3YUH+SK5N3PwF73IBXIRyKYfk7Gt9tYmzjjP0/Emg339zmSOOKsL2a4X
         6XFb13zuTXCykJ9uGb9QlE+4zxEoZI1Vhqb8pa0CvbB2SaCQ4SX9upiDH7AtPfGsYxOz
         2n4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829703; x=1731434503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8V4rwdQyCDsdK49XXZL7dkP2JPDo66sDxvRvrbyw1U=;
        b=EnreOEhq8xADM2PRdD7DYO3tVbo3I0qdPpicmgcQwchx9wx2cb5A9xYudRdJrgtPHQ
         uwSS0XcLz+8j/G/9QPDjJDbU3Unz692Wp6lVRk2FTOfqkPrKgohuFlzqcRUqp6raj3Jf
         REOh67StrINVA1Zav76DPc5ibGmhHRLc+SzmhhKO/OeDnhHpKweIXeGkCJJr28Ae4OU6
         u4fJYGfPs4rTvzQ/1w0uMi0AdIMmudZtILeP0zIcFt2Vr1BEcaSHFAVBPJ2oQXLnfCZK
         g5OqPK63uJ062J0RrARdi8FPZIywepcivQjELaBJFcKNXBLZfvyEmrK0XzeXLwqmBe25
         xEKg==
X-Gm-Message-State: AOJu0YyaueChP+nubbdXaaqpdmdh10a0OOoqEn4MFZZ3AMPVgtOzfuZa
	Y+Ka4GV6QbnqrjzgZ4E93kka61w6C4MEfkI8iQLKOwevKEt4rcGc5kR96vU8r9eioA==
X-Google-Smtp-Source: AGHT+IG+/JjggfulSVjSFXMcWGGBMyMnXw+MsiYTz/PZgvwFbFIE+cnk2Vig7wNqJCACbnvXo+Bezg==
X-Received: by 2002:a17:907:72c2:b0:a99:f67c:2314 with SMTP id a640c23a62f3a-a9de5ee34d7mr3919422666b.35.1730829701860;
        Tue, 05 Nov 2024 10:01:41 -0800 (PST)
Received: from localhost.localdomain ([146.52.197.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f6087sm166980366b.142.2024.11.05.10.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:01:41 -0800 (PST)
From: flowergom@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Minjae Kim <flowergom@gmail.com>
Subject: [meta-java][PATCH 3/3] avalon-framework-api: update SRC_URI
Date: Tue,  5 Nov 2024 18:01:05 +0000
Message-Id: <20241105180105.4721-4-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105180105.4721-1-flowergom@gmail.com>
References: <20241105180105.4721-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113513

From: Minjae Kim <flowergom@gmail.com>

The archive URL has changed slightly,
changed from avalon-framework to excalibur-framework.

Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 recipes-core/jakarta-libs/avalon-framework-api_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
index 081cfe7..5572c77 100644
--- a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
+++ b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 PR = "r1"
 
 SRC_URI = " \
-	   http://archive.apache.org/dist/excalibur/avalon-framework/source/${BP}-src.tar.gz;name=archive \
+	   http://archive.apache.org/dist/excalibur/excalibur-framework/source/${BP}-src.tar.gz;name=archive \
 	   http://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;name=logkit \
 	  "
 
-- 
2.25.1


