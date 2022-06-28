Return-Path: <noah.t.brewer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DD3C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 20:48:29 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.3422.1656449304221854982
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jun 2022 13:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WJk5wP32;
 spf=pass (domain: gmail.com, ip: 209.85.160.41,
 mailfrom: noah.t.brewer@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-101ec2d6087so18672899fac.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jun 2022 13:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4BIyjhCeWLji6u7rMxPB5y9rh7A5Wh8DwEwAF2EFSiY=;
        b=WJk5wP32vlGd3vbWuDc/qzccgIb1U/TLIvf66c6SWUfLlFg2ZiZRBRpLZDKRNC/OuC
         v7FJ2IMqDpJwQpmDa+MVyalMOWsUezgSn/Nxw53yexwd9d/wJlY3NlVNdRvniwv0XEGz
         4bn89mUJze+9zvRBBLkWxIkX5e/rLUDx+BGmKCoyeJNJc9+pDuCZSw3jY/2ABGxuCpVH
         huBqjViPnruUgkTa4Mh8bedj5g39CiEhr2eenRWyvhx4hwvfZzk8yyTo2Pn0Ikg3oJ72
         ScrzTzsN8EFAniE37IEV/YXvkLmh9qSybTEfG/k9HKhc/ZK1FMmxqOv87MrqWRG6mAp9
         mjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4BIyjhCeWLji6u7rMxPB5y9rh7A5Wh8DwEwAF2EFSiY=;
        b=2o+6qyIIHPJrzgVj6D8u6CWTIqaw3HcnF1ys23pqeN+XsaU2i9P/cuLRDD58UEwORH
         hjt+6jORRz0H/uYu59TgdLwVZfaDqyGCfoLUiYBoowhMf7iDEv8zpltsmoU5gG3u78mk
         BZc800VaJUpVlmxwpzPGd3/13W5/HPJcLLv/c+6QAEL7JwHbnD9u8lMpjf+T7VNIekHz
         YCnt0mYOLlqFN4q/lRrjRwdntJwQdABs8h7+7IHFsJGx+jeQgOjVWihmXodSq4Ij5EVk
         YD4p/eshr19aJ8fEDGWC2NrllMktRhQV8DuQ7y/zlAQ5dbLryzrpl6DVTomrAIBzoMNU
         oq6g==
X-Gm-Message-State: AJIora/BwAZy4A6LE75QWdstlnvoh/f1xNrLCfiYAM991mIbuP4MXgV+
	irKoGkOsLH/oAV2vdVfUTcvouJoYm5BkT4hm
X-Google-Smtp-Source: 
 AGRyM1uSr/7Ywyn+OtWz2BaoXCujA4n/xQ9gDSD/u9cd7Now1yTKQGOhF8zW0tfRLPN5N50Efp5cGA==
X-Received: by 2002:a05:6870:2111:b0:e9:768:f288 with SMTP id
 f17-20020a056870211100b000e90768f288mr938365oae.45.1656449298578;
        Tue, 28 Jun 2022 13:48:18 -0700 (PDT)
Received: from localhost.localdomain (cpe-70-122-13-158.austin.res.rr.com.
 [70.122.13.158])
        by smtp.gmail.com with ESMTPSA id
 l17-20020a05687014d100b000f349108868sm9642825oab.44.2022.06.28.13.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:48:15 -0700 (PDT)
From: noah.t.brewer@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Noah Brewer <noah.t.brewer@gmail.com>
Subject: [PATCH] libpwquality: Add option to disable python bindings
Date: Tue, 28 Jun 2022 15:47:36 -0500
Message-Id: <20220628204736.2743017-1-noah.t.brewer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jun 2022 20:48:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97609

From: Noah Brewer <noah.t.brewer@gmail.com>

Remove python3-core from RDEPENDS when the appropriate PACKAGECONFIG
is set using the remove operator. Use bbappend file to set PACKAGECONFIG
to disable python bindings and to remove python3-core from RDEPENDS.

Signed-off-by: Noah Brewer <noah.t.brewer@gmail.com>
---
 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
index f892cc650..ea3787792 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
@@ -32,9 +32,11 @@ EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
                  --libdir=${libdir} \
 "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} python-bindings"
+PACKAGECONFIG[python-bindings] = "--enable-python-bindings=yes, --enable-python-bindings=no"
 PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
 
+RDEPENDS:${PN}:remove = "${@bb.utils.contains('PACKAGECONFIG', 'python-bindings', '', '${PYTHON_PN}-core', d)}"
 FILES:${PN} += "${libdir}/security/pam_pwquality.so"
 FILES:${PN}-dbg += "${libdir}/security/.debug"
 FILES:${PN}-staticdev += "${libdir}/security/pam_pwquality.a"
-- 
2.25.1


