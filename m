Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8595A60664
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:02 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so213766eaf.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=B/VPj3XOp3CBZZ4Y+RWH7gPv2qMlzUdXwIstAYHG4WM=;
	b=cq2TczEMPNdtpnndp3eX97FoeiKwUlcRui5qavFIjlB2p7iDkRVvhXYZ3MePvk7iBa
	+Evsa61hEI8MdIcdV5xPUaBeAwdlMJNUr7aqV7PFUn7DmcAKqYBnfNXUKOVI9zuIlNjZ
	LlRyx0izAqS820slc04aIMJzt4AhvM4GTsi597oDMeq7M4hz4UTJaivwwczLHTv+HCYl
	kaYYIWKrsFhwqz6QhKMd4lxb/SR0Yyvi8rY+QjUFDe+U2R3/CKzMpiBNT0uFYMe8ONph
	lazT6Qg2RScu3gsThI0Z/xsaGCZIUQlJKSNnDWFVYATLzhMaQPqx7wmZCCbyHqZhkqj0
	UG0Q==
X-Received: by 10.15.26.199 with SMTP id n47mr37752943eeu.88.1374669662994;
	Wed, 24 Jul 2013 05:41:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm65895153eeu.4.2013.07.24.05.41.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:51 +0200
Message-Id: <2a80d3c27bad3e8a758020bf842ad96b8e2baa3e.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/29] inetutils: add PACKAGECONFIG for ftp and uucpd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2013 12:41:02 -0000

* readline support is autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index c55851f..7c7343e 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -29,6 +29,11 @@ inherit autotools gettext update-alternatives
 
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
 noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
+
+PACKAGECONFIG ??= "ftp uucpd"
+PACKAGECONFIG[ftp] = "--enable-ftp,--disable-ftp,readline"
+PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
+
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         --with-path-procnet-dev=/proc/net/dev \
         ${noipv6} \
-- 
1.8.3.2


