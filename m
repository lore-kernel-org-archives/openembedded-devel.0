Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id EB6CF731CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:40:11 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id u188so147251587wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 05:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rEMHc1klT01oTlEK5+iXMdK0/Uj0YzIeMPAnQBjv9+w=;
	b=jNFKHdfxs/ggD/HAhgyfR753/9b4PT/06cKc/JwZZ3zsPNe7byvyKmm0VXKzRZHfl+
	CWQUGCaXOJOwhmyfkKgXYoAP8mEMjEah39efV5FABRpM7xYGE9EiQQwoZiWLjpgJeoBt
	4QKLanWsdKsyG1kOmGzqOA73OcD6XwOX/EUaOEZt4BUSHbDDs2D0Sa3QyoOB0WdSaXS/
	hHvLd5dY69m3pgQQy0gGU/8ynP/cgZtOSoibNifvllcCnii7jp6c3gJqwLHuBngZS6Sm
	kFz0D/Uvr1Tn2MPDL3cCxxmu4gNFsCwpcNyfVDezLSs0TmSiOWTNQr4wSCueC50hYVsz
	t7Uw==
X-Received: by 10.194.86.166 with SMTP id q6mr71917309wjz.69.1451914812173;
	Mon, 04 Jan 2016 05:40:12 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l194sm51419365wmb.14.2016.01.04.05.40.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 05:40:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jan 2016 14:44:15 +0100
Message-Id: <1451915055-28243-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1451915055-28243-1-git-send-email-Martin.Jansa@gmail.com>
References: <1451915055-28243-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 4/4] rsyslog: blacklist because of gnutls upgrade
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jan 2016 13:40:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
index b7a8140..6023c7d 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
@@ -17,6 +17,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
                     file://COPYING.ASL20;md5=052f8a09206615ab07326ff8ce2d9d32\
 "
 
+# http://errors.yoctoproject.org/Errors/Details/25829/
+PNBLACKLIST[rsyslog] = "Not compatible with gnutls version 3.4 currently in oe-core"
+
 SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://initscript \
            file://rsyslog.conf \
-- 
2.6.4


