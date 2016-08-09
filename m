Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C9B747720D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 15:40:48 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y134so1071000pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 08:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yieqkEotOIgB1OIa6X+15RxXZ1wGRPa9SUZ6323scuM=;
	b=bt6h5hSfThdGD0A5liSWmsZx/GpQVqS9Z2+RLqbJtFIYKLdz5Y6C73yZ11pWpE2GCQ
	y1HMBfKFqHGf9txquwJwVkREQqVOvtQBeMDR2cEBaWE5i9UqHOdZBkVOf+fzA8rILoda
	Dp6iR3lrjdz7w+Og9CwTBAX/ul83j8Deus5SzWSFB+AeGx4G6EoxCdTqbXLQ98t+24s9
	JzbKkNtpFkw8KzniqXFokIOHyT8Ys9kZRh9EJUBEUl7fcbYSYLqd1G8QOeGuxLlsoLdU
	eq4PdYTtVHuS0dT5T+0bTaiibGzckgYGxx/q9bLCcVK8sXwGSHPo2Z5Yc30Sln4M3/q9
	Qyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yieqkEotOIgB1OIa6X+15RxXZ1wGRPa9SUZ6323scuM=;
	b=jfqHgSDr46DBiQxQIeC65ngDkOLHydJoisV+YvwG/LNMGzcvH532Ik+T5Wwv5LhjUz
	kUUc/DKk3wEVzkZUbmrwYQl6K4JMagYfoolvsYRk1eeRWl2JepDLncY0ZY/MAz2fpkcD
	l9z3kFTr1UWrA6c2Bof/+9pW40mjfIQ7PSXgMZSDnHxV4mwYbz2GpvHlCMJnDxf7BXjp
	mi2imIo5NGsbYZnWRZDjpThrJumzQGkK+oiHOHs1TJX96NBr0wICJVxIcuI5hbFBvKLB
	4lOydOQYCbgP4Y6DCTD6DJPTFK9ZFy2oJjJr0OwG3PVvkI5c7mXoUr8T4cNYDzGgbyRA
	rtXg==
X-Gm-Message-State: AEkoouslv2fexXqWAwLC4fphfkDxoPLFkmhFPGu0zNpQxbUU4synl8jy0GLeIZsMjZ4FLA==
X-Received: by 10.98.7.80 with SMTP id b77mr67799161pfd.136.1470757249410;
	Tue, 09 Aug 2016 08:40:49 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k9sm56963914pfj.63.2016.08.09.08.40.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 08:40:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster@mvista.com
Date: Tue,  9 Aug 2016 08:40:36 -0700
Message-Id: <1470757240-9091-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
References: <1470757240-9091-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH][master][krogoth 2/6] engine-pkcs11: fix fetch error
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
X-List-Received-Date: Tue, 09 Aug 2016 15:40:48 -0000

ERROR: engine-pkcs11-0.2.0-r0 do_fetch: Function failed: Fetcher failure for URL: 'git://github.com/OpenSC/engine_pkcs11.git;protocol=http'. Unable to fetch URL from any source.

removed "protocol=http"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb
index f2a2258..da096c9 100644
--- a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb
+++ b/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.0.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://src/engine_pkcs11.h;startline=1;endline=26;md5=973a19f8a6105de047f2adfbbfc04c33"
 DEPENDS = "openssl libp11"
 
-SRC_URI = "git://github.com/OpenSC/engine_pkcs11.git;protocol=http"
+SRC_URI = "git://github.com/OpenSC/engine_pkcs11.git"
 SRCREV = "6909d6761c8820e1750fa0bf4fa8532c82f34e35"
 
 S = "${WORKDIR}/git"
-- 
2.3.5


