Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 28F9560684
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 06:03:21 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t79so348502800wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 22:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sWOIen6SgQRfMvvq45oQBsorvq5JBTw8gV67TumSPwI=;
	b=022/9u6I/0qRm0GxLHqs5AGHJK3Jy4OQPLgKwtsxL2cU7XOlDZb7rzisp0bKEnQtsB
	HEaWxTsj2uRXN9JUe5PGSsHpJD3KkYZnCF9bgk3ZXIhDuJJuoWjNBIQjt/uf5eYpISHS
	L6hmfly8SqYcO/gobf3J/pj3kbCnUfAmmO+Eb2RwzSd7HcArj6vFOq6H2BpxsWVTOE5v
	Dlbq83TpZU5sEiiOJlhJYGlI4mIwyzAEBRuZJWAtjK+kZh70fuOsjqYZunj/qLY4Y+ZV
	DKfr5H4GL0tT195vMxbJtlyIuM/sUjGSfHZZ1OFWoYYzDXzAxc0SFCSikwTiwNZ6z0wq
	swSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sWOIen6SgQRfMvvq45oQBsorvq5JBTw8gV67TumSPwI=;
	b=GBegB5esvVdRGa4gD7lyGjxWtq+MKVcyGmyTgHSBpWK5+cY3GujiPd5ZuWB4LHR3Wy
	Sv0Ts1vD3cp93DpQOOq5pL7yHSCrskpb5oyQfvD76Ptw0ChsWRyS5rJNSDDF9/CULqUw
	eB+pW3W45Xcy4jum3UkrF4V/KA10tKQ74d+lNLyzaztkdw/0iFlge0eIrtG9Jp4nx8AT
	Z5keINSNXNTdWP4RrWxgJnLWYlrGZ4PF8tNkX7TsApQGOPnaVZmHdxCfgAZHH64iHbgl
	zdi+Zn7fcxcjuUAQiOydcHcc76dxk8gr7ia+Kv8nQN/+3XBdEpQRjCPruvOClsuHHJdo
	clmQ==
X-Gm-Message-State: AIkVDXL5DyOpgMUlUe3QkCfVIObD43urA2WWAahEQ/UMMmelvjpocFCGFS7f7OSJfgiErakO
X-Received: by 10.28.71.14 with SMTP id u14mr36835991wma.52.1483077802501;
	Thu, 29 Dec 2016 22:03:22 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	e5sm68438040wma.12.2016.12.29.22.03.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 22:03:21 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 07:02:51 +0100
Message-Id: <1483077771-28877-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] tcpreplay: upgrade to 4.1.2
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
X-List-Received-Date: Fri, 30 Dec 2016 06:03:22 -0000

---
 .../tcpreplay/{tcpreplay_4.1.1.bb => tcpreplay_4.1.2.bb}          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.1.1.bb => tcpreplay_4.1.2.bb} (69%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.2.bb
similarity index 69%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.2.bb
index 389d61b..6ee9d73 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.1.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.1.2.bb
@@ -6,10 +6,10 @@ SECTION = "net"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
 
-SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.tar.gz \
-           "
-SRC_URI[md5sum] = "80394c33fe697b53b69eac9bb0968ae9"
-SRC_URI[sha256sum] = "61b916ef91049cad2a9ddc8de6f5e3e3cc5d9998dbb644dc91cf3a798497ffe4"
+SRC_URI = "http://prdownloads.sourceforge.net/tcpreplay/${PV}/tcpreplay-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "3105b10b07dbc0b07ce2da07a2368359"
+SRC_URI[sha256sum] = "da483347e83a9b5df0e0dbb0f822a2d37236e79dda35f4bc4e6684fa827f25ea"
 
 DEPENDS = "libpcap"
 
-- 
2.7.4


