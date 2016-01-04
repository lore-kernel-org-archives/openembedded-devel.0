Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4C3731CA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 13:40:10 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l65so163066293wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 05:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=751TQDk5LxJSsYc8CYZUcIoaUxc6jcL4QSIaNmUL1JM=;
	b=q3njEaL3EAF2J1IgshemvEY+iFQ1pmIdAsFmUTuuefqCO5LmRZcg2AdyLPRGYzmEjj
	ay2lnRmWuj04gaATZhKr7ZdPaq4tZS6G3BlF4P2BwuOuGY+A+bqEPFGoj9bD3QpiqGD9
	8dq9wVO9FT960qfCWdUc//K1Vv2hwxh9QMdZRQH7Kj77HGi7fE08et04/2xWFHvGUXJs
	zPCIaNeeYWzqpJP8yqMZAgATcopUYSqN3Lu68ePk6btJhQ2YvKJ2kd3NJevVk1GOPPoF
	hxPrOvp2EPNTFLhAwmKwzLqsQj02tw9fWdTRchG2wDDIk9SJXPJQYoCjfEImgjTTjqzW
	3DMQ==
X-Received: by 10.194.171.97 with SMTP id at1mr96477983wjc.39.1451914810550;
	Mon, 04 Jan 2016 05:40:10 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	da10sm86056286wjb.22.2016.01.04.05.40.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jan 2016 05:40:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jan 2016 14:44:14 +0100
Message-Id: <1451915055-28243-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1451915055-28243-1-git-send-email-Martin.Jansa@gmail.com>
References: <1451915055-28243-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 3/4] iksemel: blacklist because of gnutls upgrade
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
X-List-Received-Date: Mon, 04 Jan 2016 13:40:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/iksemel/iksemel_1.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
index 6d2abf7..0cdbd4e 100644
--- a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
@@ -8,6 +8,9 @@ DEPENDS = "gnutls"
 
 PR = "r1"
 
+# http://errors.yoctoproject.org/Errors/Details/25825/
+PNBLACKLIST[iksemel] = "Not compatible with gnutls version 3.4 currently in oe-core"
+
 SRC_URI = "http://iksemel.googlecode.com/files/${BP}.tar.gz;name=archive \
            file://r25.diff"
 SRC_URI[archive.md5sum] = "532e77181694f87ad5eb59435d11c1ca"
-- 
2.6.4


