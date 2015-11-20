Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 120456080F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 10:05:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAKA5H34001560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 02:05:18 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 02:05:17 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 02:05:12 -0800
Message-ID: <b32062fe5fc0dc3c7124a9957693964fa99e7693.1448012203.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448012203.git.liezhi.yang@windriver.com>
References: <cover.1448012203.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] ctdb: RDEPENDS on bash
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
X-List-Received-Date: Fri, 20 Nov 2015 10:05:17 -0000
Content-Type: text/plain

Fixed:
ctdb-2.5.1: /usr/bin/onnode_ctdb contained in package ctdb requires /bin/bash, but no providers found in its RDEPENDS [file-rdeps]

And really bashisms there:
$ checkbashisms usr/bin/onnode
possible bashism in tmp/work/corei7-64-wrs-linux/ctdb/2.5.1-r0/image/usr/bin/onnode line 186 (<<< here string):
        done <<<"$ctdb_status_output"
possible bashism in tmp/work/corei7-64-wrs-linux/ctdb/2.5.1-r0/image/usr/bin/onnode line 250 (<<< here string):
    done <<<"$out"
possible bashism in tmp/work/corei7-64-wrs-linux/ctdb/2.5.1-r0/image/usr/bin/onnode line 284 (${parm/?/pat[/str]}):
                echo "${all_nodes//#DEAD/}"
possible bashism in tmp/work/corei7-64-wrs-linux/ctdb/2.5.1-r0/image/usr/bin/onnode line 337 (${parm/?/pat[/str]}):

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index 3731efd..70bdfb1 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -27,6 +27,7 @@ inherit autotools-brokensep pkgconfig systemd
 PARALLEL_MAKE = ""
 
 DEPENDS += "popt libtevent talloc"
+RDEPENDS_${PN} += "bash"
 
 do_configure() {
     oe_runconf
-- 
1.7.9.5


