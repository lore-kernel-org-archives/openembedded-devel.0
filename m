Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FCB66D666
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2018 12:51:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t27so19558059wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2018 04:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AWj1a7q2wqQYts4Mp8/jxblqpXwlBVYbohLemHJaquI=;
	b=XwDjWqxHRVzBtuQPLcPad6ktTz3LIBhASbbZJA++0XMqp/PGIachaDTDW6ZwlPaH5W
	UPkRLUfTYfsbXqnttQtr4S+rzox6bGD5HSn45HLst4Hk+aKvlTAW5m8qcMYZFX68113K
	I2udUfDiUzMPUBdYX7T8AMiu7In1ZbgnFOk55ADVc9CXC329zU3nELTlncDGgAeBfSfP
	VZ9C4GkBQoQvI8b1DsO7y+5fl9aavvM37J4oMNQzWpg12N20pGfGtdSFo3VHr5CEQBA9
	OwnwpX1XdyWPpvbrq8wbMXsmj3w716IISkZsgAE0boU0rWjMgVFkaYzqWQPyZxv9JFQx
	8r1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AWj1a7q2wqQYts4Mp8/jxblqpXwlBVYbohLemHJaquI=;
	b=UOIhsvtncVZlK8eft3ZEcyra4ymQXLjePsNB5K0SPY2BpqUXMfzerDvIkBvxrduU/t
	SaPfIig2c+wNAY0j830Ri8vFuhOJgIKKwxJvUtaZRqdL27C0d9gTVg8rw4zm5x3cSXB7
	WtziWxUOZrCNc61BekxPHQugdIFN4NEC2laDHVRVJKFAYm2FStXT6LGJ/t5/fTqVAUsH
	geQ4hTE84+ZVtH0LPooZH5inngMexhrmaH8906qFaWbIhLeCNUua8xOUBVMzy6q3MORp
	HV0ASMqhFUZfdgZgZRkmAxs2X9wvuyQKV36CT/qM++wjxiRq4Gir86i1QIJerXvUO+dS
	M8mQ==
X-Gm-Message-State: AA+aEWbOGFKFquT+6ix4rUE+i0Pw3Dg9q/tGHiiR0N5pAD+Kv03iIPhn
	DYphLRm+BaKHn2KmB9aK45R/i5/Yc94=
X-Google-Smtp-Source: AFSGD/VHPu4JAhp7bS0kDzwqgjsQS8SiODJ6gBHqpvHtM/QxGbSaXJfZwIG4HkosyaNtD3+itztY6A==
X-Received: by 2002:adf:8122:: with SMTP id 31mr22260508wrm.48.1544014267138; 
	Wed, 05 Dec 2018 04:51:07 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v16sm17771582wrs.75.2018.12.05.04.51.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Dec 2018 04:51:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2018 12:51:00 +0000
Message-Id: <20181205125100.32765-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181205125100.32765-1-ross.burton@intel.com>
References: <20181205125100.32765-1-ross.burton@intel.com>
Subject: [PATCH 2/2] iwd: install API documentation
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
X-List-Received-Date: Wed, 05 Dec 2018 12:51:06 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_0.12.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
index 3caad20a40..16c537b66a 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.12.bb
@@ -21,6 +21,11 @@ do_configure_prepend () {
     mkdir -p ${S}/build-aux
 }
 
+do_install_append() {
+    mkdir --parents ${D}${docdir}/${BPN}
+    install -m644 ${S}/doc/*.txt ${D}${docdir}/${BPN}
+}
+
 FILES_${PN} += "${datadir}/dbus-1"
 
 SYSTEMD_SERVICE_${PN} = "iwd.service ${@bb.utils.contains('PACKAGECONFIG', 'wired', 'ead.service', '', d)}"
-- 
2.11.0


