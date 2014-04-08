Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 812CB65D58
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 07:53:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s387rl29024327
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 00:53:47 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Apr 2014 00:53:47 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Apr 2014 15:54:32 +0800
Message-ID: <50282b60ac02b6ac13d5d6ffdcdb22c7422a9555.1396941241.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1396941241.git.jackie.huang@windriver.com>
References: <cover.1396941241.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] collectd: enable/disable libpq explicitly
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
X-List-Received-Date: Tue, 08 Apr 2014 07:53:52 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

If '--with-libpq' is not included in configure options, the configure
script will assume 'with-libpq=yes' and try to figure below variables
out with 'pg_config':

    with_libpq_includedir, with_libpq_libdir

This causes configure QA errors on some hosts that have 'pg_config'
installed (which from postgresql-devel):

* ERROR: This autoconf log indicates errors, it looked at host include
  and/or library paths while determining system capabilities.

Anyways the target package should not depend on any host headers/libs,
we should enable/disable the libpq support explicitly according to if
the postgresql feature was enabled.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-extended/collectd/collectd_5.2.2.bb    |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
index 25be1c4..4eed2b6 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -23,7 +23,8 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp --with-libnetsnmp=no,net-snmp"
 PACKAGECONFIG[libmemcached] = "--with-libmemcached,--without-libmemcached,libmemcached"
 PACKAGECONFIG[iptables] = "--enable-iptables,--disable-iptables,iptables"
-PACKAGECONFIG[postgresql] = "--enable-postgresql,--disable-postgresql,postgresql"
+PACKAGECONFIG[postgresql] = "--enable-postgresql --with-libpq=yes, \
+        --disable-postgresql --with-libpq=no,postgresql"
 PACKAGECONFIG[dbi] = "--enable-dbi,--disable-dbi,libdbi"
 PACKAGECONFIG[modbus] = "--enable-modbus,--disable-modbus,libmodbus"
 PACKAGECONFIG[libowcapi] = "--with-libowcapi,--without-libowcapi,owfs"
-- 
1.7.9.5


