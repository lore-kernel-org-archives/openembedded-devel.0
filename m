Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8062DC54F52
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3032.1785293069699865556
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nqlMhiVc;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38deea72eebso498109a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293069; x=1785897869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Acm7L9NuxhTl+azrxrFtUl15WbFuBifKS5qn6l4PWDA=;
        b=nqlMhiVcbzgwsx8AQiaBoFiGwy1mZufb28vLsq4ly+H2W5H3of8X0i2iH414YVMRCw
         NaH8Hrx96yNSaaimPByOoFHVWprTYwgHEpB352Eog9CyZ3yyPC6ffMDY5MrJT927D94s
         61jB+gKt5PjnvneFdwtKaG8jejAfbhRLcHobopuUQ+sb42RfVFX92q8VxWXNtvMBmdou
         nL0k5soEP/SdiT7sCvekzf9C6Bg1KZ/2PBXElmoqMKvmkxIS4xHzR9flqzi6cv1pLnBo
         /l09pVfKDD7/pcXUU1xHrOyWhe0rAsn/IzVzWOqtu2libAjDYNY8/oipgJseTyQ2yqZ1
         XVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293069; x=1785897869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Acm7L9NuxhTl+azrxrFtUl15WbFuBifKS5qn6l4PWDA=;
        b=lylG+Qek3p4jxVE62PhrQcvtH8c0UTzBRINBnWRt/BKfi0EbQ7v9V/9Nkntzfy3DIO
         5SlY/V+Z7sIlOnOAQeqJTpfv1aV5XomusgDn28WsiDV19jUh1HLuVTHQKvpqBDSG3qKH
         aWnDlT3bE7X5t471b3zyiJLrNv4htMxM4O08/RPgSz67QCZpgj7kJOLpflWMrHaE3XH8
         ERiX3EWFbxMUdmHfmsX0oBbMRzWi37yQuY6zsclSlI2KbMmaE2drTaNhpa1LtdZW5fCo
         VWpXpws9y5MjWWGLFe4HC4GC2gL1g058VQ/KY3/9qbOgKWmRv4m6Jh+YQS5EBarDZbbT
         u3yQ==
X-Gm-Message-State: AOJu0Yw0Q6X484qwdEw88Ko15BaMmukVwTk2gK3pD1Kq1L23PRGQL1zD
	qrUtql1yMJbU/FBtWBsHw4sUvHtSyTWRn/7cs01RXon1f8APOUqddNtpo/vIn+fO
X-Gm-Gg: AR+sD11fSH/QGJGDN08vAP95NIWcw+5hOERc3s1QYVGiICzpRLgJdD9Qm71XQYUVER+
	emQG9iZMocVUB1sVUcgsr6fN8rpn1Pcl0ymx+XKlScaQ+fKNHtLfD60TRBzzi+6nhmJcxAZ2vh8
	nDl7Usrdy6I+0CynI5ZZ+m8vPgBw0ShA2teKthFOCJbYboE0+ugWAZoyxQzmPINd8VOeMoDqmaO
	lxzzyaExg9sfUT1WUVX7UcDuJ9QpcBoZKty2+PEGc2U/icpgGwfcrzUmB0ctlVGv6+XzveHd0ua
	jk4QX6RX/TCmXy4h6l5CTs9+2EGApW498pTbMeu7fKbGv+aOE2iYFpnTHuQaAh6DD6Qkx2VqiWr
	6EtEsy7BpPC6DmpLmajm4BJZSpjHdWhfckU2jO3nnPNkfcOTzy51JizF5TLjWpCVvQspbWnSGNe
	8SyOsH1qKYVY8xoID5S4DQ0aqWvCZ4jxjOneDZpqAg5ikdZmdo9bFpRA5VY5YQ290sFbKE4Ktfq
	12zR2C0UuXBLGdwIBhgmS392Aj8aTyDjjdyn8wF/m3DdP/5e/sbFBlAKgzoUH+cDkE9Ll9fLtl7
	FXZnRnyOEhL0wXWx2+m9Lcxmx1o7oW/c1Qg3qvjcjaj+mY9gKKGkFG1AYnyF8iaye/C+cGYC3q0
	VGg==
X-Received: by 2002:a05:6a21:4d92:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c8ba5f61bbmr6072827637.50.1785293069038;
        Tue, 28 Jul 2026 19:44:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 06/18] pv: upgrade 1.10.5 -> 1.11.0
Date: Tue, 28 Jul 2026 19:44:08 -0700
Message-ID: <20260729024420.2328180-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128522

Changes:
- New --monitor option to run a command and watch its input, output, or both.
- Allow decimal values for --rate-limit; extend the %T / %{buffer-percent}
  format to indicate the transfer method when the buffer is not being used.
- Performance: use splice() in more circumstances, use copy_file_range(2)
  when input and output are both regular files, and speed up --discard by
  splicing to /dev/null internally.
- Fixes: report signal interrupts on a new line (no "^C" over the progress),
  prevent an endless wait on unread output-pipe data, avoid double-EOF on
  spliced terminal input, and error out when the --pidfile cannot be replaced.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/pv/{pv_1.10.5.bb => pv_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.10.5.bb => pv_1.11.0.bb} (95%)

diff --git a/meta-oe/recipes-support/pv/pv_1.10.5.bb b/meta-oe/recipes-support/pv/pv_1.11.0.bb
similarity index 95%
rename from meta-oe/recipes-support/pv/pv_1.10.5.bb
rename to meta-oe/recipes-support/pv/pv_1.11.0.bb
index 5ccb9f05af..32b8fa9d48 100644
--- a/meta-oe/recipes-support/pv/pv_1.10.5.bb
+++ b/meta-oe/recipes-support/pv/pv_1.11.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.gz \
            file://pv-test-system-version.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "ab21b4f8662280646b6a02e1b9f096790918f89c952bbe0d06fef75d3b52fb15"
+SRC_URI[sha256sum] = "fc02c9fc2b82b20a92cc8d98f844be63f22abd98751a8e4abc875e1d803662eb"
 
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar"

