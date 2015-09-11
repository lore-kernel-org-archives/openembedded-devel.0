Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 620A475CF1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 09:30:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8B9UE4g026334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 02:30:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Fri, 11 Sep 2015 02:30:13 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Sep 2015 17:24:43 +0800
Message-ID: <1441963483-11926-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] collectd: fix a floating dependence on openjdk
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
X-List-Received-Date: Fri, 11 Sep 2015 09:30:17 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. fix a floating dependence on openjdk
2. fix the host contamination, since the default value of java home
is /usr/lib/jvm:
   warning: library search path "/usr/lib/jvm/jre-1.7.0/lib/amd64/server" is unsafe for cross-compilation

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index 55d7b38..6a3476f 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -25,6 +25,7 @@ SYSTEMD_SERVICE_${PN} = "collectd.service"
 FPLAYOUT ?= "--with-fp-layout=nothing"
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG[openjdk] = "--with-java=${STAGING_DIR_TARGET}${libdir}/jvm,--without-java,openjdk-7"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp --with-libnetsnmp=no,net-snmp"
 PACKAGECONFIG[libmemcached] = "--with-libmemcached,--without-libmemcached,libmemcached"
 PACKAGECONFIG[iptables] = "--enable-iptables,--disable-iptables,iptables"
-- 
1.9.1


