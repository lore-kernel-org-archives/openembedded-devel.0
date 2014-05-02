Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 709C960C22
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 May 2014 13:36:46 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Fri, 2 May 2014
	15:36:43 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id 472EA28C881;
	Fri,  2 May 2014 15:36:43 +0200 (CEST)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 May 2014 15:36:41 +0200
Message-ID: <1399037801-2347-2-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399037801-2347-1-git-send-email-mihaela.sendrea@enea.com>
References: <1399037801-2347-1-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [meta-networking][PATCH v3 2/2] netperf: enable SCTP support
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
X-List-Received-Date: Fri, 02 May 2014 13:36:49 -0000
Content-Type: text/plain

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
---
 meta-networking/recipes-support/netperf/netperf_2.6.0.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
index 45760ad..64e3be0 100644
--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
+++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
@@ -27,6 +27,9 @@ CFLAGS_append = " -DDO_UNIX -DDO_IPV6 -D_GNU_SOURCE"
 CFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'largefile', \
     ' -D_FILE_OFFSET_BITS=64', '', d)}"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'sctp', 'sctp', '', d)}"
+PACKAGECONFIG[sctp] = "--enable-sctp,--disable-sctp,lksctp-tools,kernel-module-sctp"
+
 # autotools.bbclass attends to include m4 files with path depth <= 2 by
 # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
 do_configure_prepend() {
-- 
1.7.10.4


