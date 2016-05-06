Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 75C8560017
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:01:04 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id w36so56342015qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Nor0S/6OrU7QhN/ZVqVgBfLpCspJ5zwqDrdLj97I0JA=;
	b=MWfiU6qc9m8GlHKMDYepvDgnxI66b0mSYQiLEJb89K79fWqSMvK9MfGBSvNoF9EFqW
	ROH0asmmb7MxTC/js0pMmOmvV+Em8d4m4LDnCtAeZQDDu7qv77MO8OJI0ZLwBTPeAYKr
	gXaOCN0L8d/K5TTbXYcNcgAsvD338TN+HHj+c1AaHJWJICxuRgxVhuCwTBpwVQZsXW17
	dEGWcDI8JNh04fbSYgnH4T2WJbyg0V0i8GSsx94dATImFsiW/MvaH3pZzUMh+fVOTV9L
	pa86ib7qUEMeyZP4q7pZA+650AodzHg7HoGH98PaGZZCF5z0Iwa6MuAXYQx4w4OX+xLw
	TtkQ==
X-Gm-Message-State: AOPr4FWls6wnlqZLD/hGcjG50aQBbAiAWbP82yfZNN9I0RK5tbA577J87AVzxPvePszYzw==
X-Received: by 10.140.19.174 with SMTP id 43mr20054427qgh.44.1462543265156;
	Fri, 06 May 2016 07:01:05 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id q2sm675158qke.15.2016.05.06.07.01.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:01:03 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:00:59 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:38 -0300
Message-Id: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 01/22] net-snmp: enable ipv6 support
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
X-List-Received-Date: Fri, 06 May 2016 14:01:09 -0000

From: Zhu Yanjun <yanjun.zhu@windriver.com>

Add packageconfig for ipv6 and enable it when it's defined in distro_features.

Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 1a50932..ee8878f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -39,6 +39,9 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
 PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
+
 EXTRA_OECONF = "--disable-embedded-perl \
                 --with-perl-modules=no \
                 --disable-manuals \
-- 
2.8.2


