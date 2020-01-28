Return-Path: <marek.belisko@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id DEF669203E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 19:52:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b6so17532924wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 11:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=gevS0PgfA7vzC305h/XLbVlKZiQWCN5tJFXdAotph5c=;
	b=avw8RtM0w73fhphqvb57nrfsy/VIgu2tbLoBpaJ/h0TY59mU6cmWRXehwX4LUvjDqW
	Kh9aPBQqAhiExmyf9Hu2N3wd783we70I1LrrzTUTLxnbuUREzGICyIRPypA90Wli8H/6
	ol+YpNzUgYs92R+pEajxUpdnoI/5XSpSqaoJpBsUWy/42GgvEJ9uTkqyzm2NbbE1I2Q0
	G5EP/Vy+hp/N/x5+8q1VLyiRruwBMwc1CRMJoU0xRS/qLVhzrWzHkRKUbDVsI7doWyXj
	NUSrCqyzDmfGgYLXXsR2O7d23M8dj81fvotarb+79Qz/vel0S/GDgvwVFJ3+lqHImR0X
	Uh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=gevS0PgfA7vzC305h/XLbVlKZiQWCN5tJFXdAotph5c=;
	b=DnRRb/F68uo8w9nfXPL/eWFLFChHm1TveB0mJ+jMVrKFhQqfiyGdxe8hEZ60QEtMqN
	PJKYCtOiQn11kHJE9vzEolwVUlIbyv+RryRN6odjGYWqGMSkwGi0z2isK9ZYqxa/tflp
	HjY8c54loNSbQYaxrE+vZsvhVcPq/xfPvAAzflalxBQrgNct9NC3m3II5AzCTgEPjUZq
	uYfY8UXMJnPDi6FT8mInXfNALcKNBeiHJtfu1UBNY9q5bSNx8NUySeeDJ4Q7v3TSbTUg
	xX1aOMnsYojYCjEn/+/jd2119xuZPLspPgiqFJfhvwBWTahbWyqfBJxQHNDqWU0WV8NF
	rwXQ==
X-Gm-Message-State: APjAAAWfX/YFuh8Ln0t8mDr1/CMnB7T/d8nwbAdh9hrOSCbgMRAo5BNT
	2WNa5xmuNOq+Rd8aBb7jurxZjIIBSoI=
X-Google-Smtp-Source: APXvYqzDU15RxRsZze8gjMK9QC3ML3ImmLwqddNTi6cODLgA8FXS+4n92GIhrOcDzFJBKToNQh0+Gw==
X-Received: by 2002:adf:ee88:: with SMTP id b8mr32213702wro.249.1580241126403; 
	Tue, 28 Jan 2020 11:52:06 -0800 (PST)
Received: from localhost.localdomain (adsl-dyn55.78-99-206.t-com.sk.
	[78.99.206.55])
	by smtp.gmail.com with ESMTPSA id 18sm4110488wmf.1.2020.01.28.11.52.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Jan 2020 11:52:05 -0800 (PST)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 20:51:59 +0100
Message-Id: <1580241119-12734-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 2.7.4
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Subject: [meta-oe][PATCH] recipes-support: Added recipe for gengetopt package
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
X-List-Received-Date: Tue, 28 Jan 2020 19:52:06 -0000

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb

diff --git a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
new file mode 100644
index 0000000..a31ad0d
--- /dev/null
+++ b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
@@ -0,0 +1,16 @@
+SUMMARY = "skeleton main.c generator"
+DESCRIPTION = "Gengetopt is a tool to write command line option parsing code for C programs."
+SECTION = "utils"
+HOMEPAGE = "https://www.gnu.org/software/gengetopt/gengetopt.html"
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ff95bfe019feaf92f524b73dd79e76eb"
+
+SRC_URI = "${GNU_MIRROR}/gengetopt/${BPN}-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "ea165d618640dbdecb42ae4491337965"
+SRC_URI[sha256sum] = "b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab807584ac"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


