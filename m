Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 251C260843
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2020 06:18:01 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id c23so5425477plz.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Feb 2020 22:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O2RnT+rB04U+tTgxQvaZw6jasCbCSPewO5YYKaZbjl4=;
	b=o0j3hkJ9TD2ftvxevs6SG3ywIbUYIzbwg3C6oY5TXd+DNG5vLW6LJnwqV1P2siAyAe
	4AEVW2+c1kW1J5LVIzElQoizW15/rYFFMfl2gNwu/2D23QZESEWRQ+RV460rVyghSR/3
	+8oa/lHRc7GGKKA9IFg6Q4K88HHrHViDTVoX2f+5rRdPNhckylNPkqz7sI0EDRR9yX1w
	9N38HMSLCVjCTX1LPOIvE1sx17kDlFvxf2hv779cIp8Br6wlN3RDLu9bpNpSMqxlzP5o
	UKABoeDP1+oYdiS4sSt0kNtFSrSwmnt0dPh52kPQWT2rVSo83IIOrJRpe89EmjCZBqbn
	XsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O2RnT+rB04U+tTgxQvaZw6jasCbCSPewO5YYKaZbjl4=;
	b=F9oWicOzjgAzFFa+QXep1dvwLwsC6Jf9WnaXvrZVXqNDcfv//JisziS3YWhmockiOu
	8qqAP4sDv8leGIps1uz/QEfHABDNVprTqClwyt3ooVZFHHn2EqfzDmXLES4harsZ/nlo
	j2MxAsnP5M+AXfGA/iQh/XDmTsrllsQ9UvG+W4uekU/tm1hMwAe8mmUBuEqfpemyGvk+
	r5T3qF50KX0tVBcdDH7ONsJ+LfzcjTKLWQtrhgx+V5EqrB9zA7j4AX9Jc6YCrsTrE2mq
	mSjTn2kRv0m2ylZtZgUxrigzn47YQ9L34WPo/F43ujnXB6n30Zr+Oy7uQybegD1czF/6
	d4YA==
X-Gm-Message-State: APjAAAX7NGClSaWuMH+SSBp5SbSNEw35n8Mx/w29mBVPT4/lSaINeiBB
	bEjkEA5qFV2/llRlmQgj+ee/VwU0LCA=
X-Google-Smtp-Source: APXvYqw26IQn7YXEZpea/L+FPjg4gkVvwlE6MI/WJ5ddO1L6s2M5dPXgOxc5VbZOcQ0dwnzKc313sA==
X-Received: by 2002:a17:90a:da03:: with SMTP id
	e3mr28090954pjv.100.1580710681755; 
	Sun, 02 Feb 2020 22:18:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	133sm18695840pfy.14.2020.02.02.22.18.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 02 Feb 2020 22:18:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Feb 2020 22:17:56 -0800
Message-Id: <20200203061756.2643196-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200203061756.2643196-1-raj.khem@gmail.com>
References: <20200203061756.2643196-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] recipes: Inherit perlnative for pod2man
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
X-List-Received-Date: Mon, 03 Feb 2020 06:18:01 -0000
Content-Transfer-Encoding: 8bit

replace host version of pod2man perl-native provides, helps in
improving reproducability

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb           | 2 ++
 meta-networking/recipes-support/netcf/netcf_0.2.8.bb            | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
index 3221581466..53a79af76d 100644
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.10.0.bb
@@ -9,6 +9,8 @@ SECTION = "net"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+inherit perlnative
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
            file://options.pptp \
            "
diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
index c57e7d4714..a180571f2d 100644
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -20,7 +20,7 @@ do_configure[depends] += "${MLPREFIX}gnulib:do_populate_sysroot"
 
 S = "${WORKDIR}/git"
 
-inherit gettext autotools pkgconfig systemd
+inherit gettext autotools perlnative pkgconfig systemd
 
 EXTRA_OECONF_append_class-target = " --with-driver=redhat"
 
-- 
2.25.0


