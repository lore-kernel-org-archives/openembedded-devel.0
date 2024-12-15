Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A83E7716A
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 18:36:23 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.40714.1734287780797325408
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Dec 2024 10:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZJv9EbTp;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so603628276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 10:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734287780; x=1734892580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Io6nIVi9VgsUPo2qG8yDzR6NWUlwwRZZeIMBhqursxI=;
        b=ZJv9EbTpjCzEl15rN14l9V1TQxKISUftTI0onl621s5kCVYq0pxdraQWL1kgjkxled
         0Vqy9p871h6aeBDGyp93bN/kr1QBjZugVFyrbPgU94G2J/N8qg7VT6K+HX3XjWDjBtmK
         +Q0BeUYb7tkO3NxTzCypEKco46qE+UGc+Xww9+gcbN0JnbWKitnKyQMks2xCSrfYli3+
         RDFql8qVJz61gRysM6U2xbpkPeRQRVPiIhuwUudm/ntqw90yaCuQXALxT5KBXlCa5Jqy
         z4Y9knk7B+MQuryW1MV3Vn1TScCkmGuKj4RLnMrdRM4DzcnpgIsYuLu3DYwEdtQgx9KT
         qzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734287780; x=1734892580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Io6nIVi9VgsUPo2qG8yDzR6NWUlwwRZZeIMBhqursxI=;
        b=CH3OXwN14tuidXuVc8b+OsNOxrE27x9swzlkOHXqgZszl2gpgugBxFWGJR92pBnLEh
         wWx5YDQcgFIGcKBxVEx1qGueZNn/HMVNVfywJQ4HUowb1S/uCMoPlYQ60qTOSTIW/aJc
         kSgy05xFcSza9QqUbR5ffYReksiMsYy2ORBqQBk1sSn1Kr4ksaYw0zpQc+BzEmRVsm0j
         WQ2v5OBYHV3Ptb5C2Y0Dmxio5CIGu3BbVpMT8k/G+q9scwhtHRUqLZ8B6q8V15mnZKnY
         EmTBiu56iW0KOaOCQHBkte7BKCvRp/PPDd/idx3wEbpLjWYdAyeU4IebIE0BMZTKc39F
         rkhQ==
X-Gm-Message-State: AOJu0YxrLmz0kbiQvqR3pxNlEWQvlejaPj8LhfPI4KhEBHF1XutumXug
	YwFPojKR7j6RvWEYZYI7asFuNBYIcY9jvZRFZRcPDpLLKuPQ5sGGEGtxZSC5
X-Gm-Gg: ASbGncvZMHEnpgbZNwlR7+T4o0SYQ7MLzAHpTNM8xLIm1bWWNx0fOCJvcJMUUE84bFu
	Djxv+aFiNYt6B3ZfFFCNSAe90orh2DQmQE/0+7S59S4IlKkCsqwxRUUdW0yC3ojS6h+qmyemmyg
	/RihzOr6qNgn9ahcD3gu9Q5KCcIgAemHZk30FbojjKWt0OOLz6m9rY4vjshMsKqxcxVcjfUS6ii
	HaIZp/vj4FlVjHQuka7qDb4V5jfDjcPK6Om3SOmK8VezdNzcFsp/Xn8DbVjBiF4uGNNbA==
X-Google-Smtp-Source: AGHT+IFr31Bl/fh6M750Ba7pN+TbaiSvX7bRzEGciI5vgXVafabIvUNFfplYVXsv4UAe3chpbYu4Hw==
X-Received: by 2002:a05:6902:1542:b0:e4b:f516:38ba with SMTP id 3f1490d57ef6-e4bf516431amr1478443276.17.1734287779859;
        Sun, 15 Dec 2024 10:36:19 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:a906:ba5:bc1d:da36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e47035366easm985356276.18.2024.12.15.10.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 10:36:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 5/5] ntfs-3g-ntfsprogs: fix CVE-2023-52890
Date: Sun, 15 Dec 2024 13:36:16 -0500
Message-ID: <20241215183616.7218-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241215183616.7218-1-akuster808@gmail.com>
References: <20241215183616.7218-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Dec 2024 18:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114321

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport fix from upstream

  https://github.com/tuxera/ntfs-3g/commit/75dcdc2cf37478fad6c0e3427403d198b554951d

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c452799c4df849b3e573e9e4cb937ca7a474ec30)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...use-after-free-in-ntfs_uppercase_mbs.patch | 42 +++++++++++++++++++
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
new file mode 100644
index 0000000000..3160f56880
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
@@ -0,0 +1,42 @@
+From 7b6210c5be46e5120b42c09f910e8f104bf3edf1 Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik@tuxera.com>
+Date: Tue, 13 Jun 2023 17:47:15 +0300
+Subject: [PATCH] unistr.c: Fix use-after-free in 'ntfs_uppercase_mbs'.
+
+If 'utf8_to_unicode' throws an error due to an invalid UTF-8 sequence,
+then 'n' will be less than 0 and the loop will terminate without storing
+anything in '*t'. After the loop the uppercase string's allocation is
+freed, however after it is freed it is unconditionally accessed through
+'*t', which points into the freed allocation, for the purpose of NULL-
+terminating the string. This leads to a use-after-free.
+Fixed by only NULL-terminating the string when no error has been thrown.
+
+Thanks for Jeffrey Bencteux for reporting this issue:
+https://github.com/tuxera/ntfs-3g/issues/84
+
+Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/75dcdc2cf37478fad6c0e3427403d198b554951d]
+CVE: CVE-2023-52890
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ libntfs-3g/unistr.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libntfs-3g/unistr.c b/libntfs-3g/unistr.c
+index 5854b3b..db8ddf4 100644
+--- a/libntfs-3g/unistr.c
++++ b/libntfs-3g/unistr.c
+@@ -1189,8 +1189,9 @@ char *ntfs_uppercase_mbs(const char *low,
+ 			free(upp);
+ 			upp = (char*)NULL;
+ 			errno = EILSEQ;
++		} else {
++			*t = 0;
+ 		}
+-		*t = 0;
+ 	}
+ 	return (upp);
+ }
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 37a8106bb0..be2a5245ce 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
+           file://0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
-- 
2.43.0


