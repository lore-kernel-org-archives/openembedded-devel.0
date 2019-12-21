Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7AD387FC14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:49 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id d5so4794028pjz.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Jlt2X8hYlT1Z3nJFT/qrxmlNy/4FruiWiiCzA+D4XOI=;
	b=UCWjf/rMQ7oywzXOMUWWPtDl8nbcoy3jW0PSptl4m7UdJmSS7rdTWd2n99x09R9m7k
	VIV7XVklDSW5lyFwvYZo/nxkiJpKIkQtKKHdpOSkNgucijYlpXOJy2TbQFbPx26o5OLB
	/9KVJ/inb2lP5hAe7ndIwLPWlrlZMzOWPhTt9z1mNH1LJw7I97wYCFcq+u+B2nnONPyf
	sNwNQsu5Ai8jNspv0y+KxoxsOkPT3Pe/X+SC6oNJIh0JfEJACo412kP7/4kleNpHIjqQ
	G+Fx1pNlD2c7c2gArkIXH1HaqA9O1QNRsqrOYdkTYydb/xk5fQ4vFx63MsB/tSYON9nD
	/C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Jlt2X8hYlT1Z3nJFT/qrxmlNy/4FruiWiiCzA+D4XOI=;
	b=Vb809R7XcoCCcTZmuOJBYOZeTTBoDJfPfhMc0PzJURw8ARVWOxH/B+JYhEEeJr8OM/
	5FHr5DSuGuQjknU6VsjJktXYmUYXqTSgbqlUOx11wtdNFPBFVdVuHiAylZVfdYfGsLsJ
	muGAZ3Xg3kmmyx6Apf3NBpGGHqUi60Dqf24ptSV42/0v3QZPM2E2S2t021Z6pB9kflMY
	rzneaMDZtCjVBNI/oVRV0uTRQgjVLwMapqm7ElXrGajD+oAMiegvd/HFpWRCuaz7cDvT
	EPngj6hojU1XJrFTX5wseSKjZVrH6lVpcpfFHulSgVPrmxJv47COHOrewWtH6mthQtFl
	+0rA==
X-Gm-Message-State: APjAAAVdWlX+DDH5gjBCkKjVEa8ijnmo18+9aQ3taKDQ3Kf2uWLSTCDl
	nejS6Po6xpMAikMdu336Bp6/Jv4HI3c=
X-Google-Smtp-Source: APXvYqxs7gFEU8SsVDKmqWqaYVgHhbdIWnB9CpMKCsQ+aEoIH8umane5dC/UMOq2uZMxqcx/XGbSyQ==
X-Received: by 2002:a17:902:d204:: with SMTP id
	t4mr18329794ply.167.1576886810115; 
	Fri, 20 Dec 2019 16:06:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:18 -0800
Message-Id: <20191221000635.1573390-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 06/23] nftables: Package python scripts into nonarch libdir
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:49 -0000
Content-Transfer-Encoding: 8bit

Helps fixing packaging errors on mulilib builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-filter/nftables/nftables_0.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb
index dc04326bc9..65a7bcc5ff 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.3.bb
@@ -29,5 +29,5 @@ inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native', '', d)}
 RRECOMMENDS_${PN} += "kernel-module-nf-tables"
 
 PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${libdir}/${PYTHON_DIR}"
+FILES_${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 RDEPENDS_${PN}-python = "python3-core python3-json"
-- 
2.24.1


