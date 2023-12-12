Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1243FC4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 20:35:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.7044.1702413335555110010
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 12:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DzU8AvZw;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c2718a768so61685685e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 12:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702413333; x=1703018133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcj7jroJEluuDzS4A84y5EoUhTbA/xnPl5nA5sjyYFQ=;
        b=DzU8AvZwNvAfCoeyIonTWr794o0K6twUsT1YEgoXTz3Gb4fZQYRm9HHeoHHUqjOnV9
         +FmtMVG01ozAO/+Yq3mFq+05xma4kVGqhBiX22sglD5A031JG8b1hxBQkB+f+mVnkvqC
         nBrQ6JO/4Fnddhsb6G5zSSwfsVMgurYEAv4F6knShMUPozohORn+ORswwNEHGB54h66D
         hXL7WgHu73UHq9fVXlBClI1udDAX2YiyXUG3b714t6cLcgfZzTHU3mZIE8JmDp4EVRMi
         fr3w2weUJXCFyHm3DwoiHnRYUuhwywwt6BFScg27ptRLThUrLyXkcYxNL3cv3GzKev/M
         iVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702413333; x=1703018133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qcj7jroJEluuDzS4A84y5EoUhTbA/xnPl5nA5sjyYFQ=;
        b=RX3jvsG/P25zVy6Z46RQxVC0t4Kxwhn4cpNx5IAxylD8jqneiNHlutK4Gtq5uE+oIN
         MwCf2OC+tocYwt029i9w3rw82OELv0DdZxdZouJ1hPc5qO3wf2xt7TNcbJBk8VkU3Lkb
         HyJ0KZZWpQwx+8mmfqW5woEhvt2K7NEf/EtWR6T7IvOhP0RtNhRuhE77nJM/wqB8hHLz
         8ZgH6gqq5t5cmCF62jSCiKWb6NpOftUOFLOtBFOvQ+JGuyXFy0Hz9gb+TImfxmQgeB3H
         Cbw43sdOAeGOKtLiJIb68iEXfir1IvRAcJGZklZEoxVlY3UyFF5qr2nsmSsk90jlAAaA
         nV0w==
X-Gm-Message-State: AOJu0YyEGFslvh9K8uexa46qAShi1ePetvbR66xeFNqAm5A3A1/ezsWO
	5FFH/AmRFapBqnsPRvMxNN+Jd7SsinmnCA==
X-Google-Smtp-Source: AGHT+IHM4rYkvpmdnDsoCZRJctE8qj/DhlwZWXzipzg3n7DWNYu3FiLmFYImEFtd3Ejn1orr3laxoQ==
X-Received: by 2002:a05:600c:3784:b0:40b:5e1b:54a8 with SMTP id o4-20020a05600c378400b0040b5e1b54a8mr3713754wmr.52.1702413333322;
        Tue, 12 Dec 2023 12:35:33 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b0040c490db950sm7554730wmq.47.2023.12.12.12.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 12:35:32 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH 3/4] libsombok3: use autotools-brokensep instead of setting B
Date: Tue, 12 Dec 2023 23:35:08 +0300
Message-Id: <20231212203509.902175-3-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212203509.902175-1-alperyasinak1@gmail.com>
References: <20231212203509.902175-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 20:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107343

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
index 2a1234c57..9b18269bc 100644
--- a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
+++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
@@ -11,13 +11,12 @@ SRC_URI = "git://github.com/hatukanezumi/sombok.git;protocol=https;branch=master
            file://0001-configure.ac-fix-cross-compiling-issue.patch \
           "
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 # sombok-2.4.0
 SRCREV = "0098d85a037ef5c99a648a3669a077781a45e8cc"
 
 S = "${WORKDIR}/git"
-B = "${S}"
 
 # Disable libthai support
 EXTRA_OECONF = "--disable-libthai"
-- 
2.25.1


