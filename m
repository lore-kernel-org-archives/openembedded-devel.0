Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id D2F696C40F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 06:37:31 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 0ED5C2202CE;
	Tue, 20 Nov 2018 19:37:31 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 19:37:15 +1300
Message-Id: <20181120063718.28683-3-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181120063718.28683-1-douglas.royds@taitradio.com>
References: <20181120063718.28683-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH 2/5] net-snmp: Reproducibility: Fixed path to /bin/uname
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
X-List-Received-Date: Tue, 20 Nov 2018 06:37:32 -0000

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index a32d09d77..089946032 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -67,6 +67,7 @@ CACHED_CONFIGUREVARS = " \
     ac_cv_header_valgrind_memcheck_h=no \
     ac_cv_ETC_MNTTAB=/etc/mtab \
     lt_cv_shlibpath_overrides_runpath=yes \
+    ac_cv_path_UNAMEPROG=${base_bindir}/uname \
 "
 export PERLPROG="${bindir}/env perl"
 PERLPROG_append = "${@bb.utils.contains('PACKAGECONFIG', 'perl', ' -I${WORKDIR}', '', d)}"
-- 
2.17.1


