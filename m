Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC93B712FC
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIbn1026581
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:37 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:24 -0700
Message-ID: <bb26df7fc35ef5021ad7fb11c2c6402cb4f6ddcd.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409584344.git.liezhi.yang@windriver.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/13] autofs: add bash to RDEPENDS_autofs
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
X-List-Received-Date: Mon, 01 Sep 2014 15:18:37 -0000
Content-Type: text/plain

Bashism:
[snip]
possible bashism in autofs/etc/init.d/autofs line 116 ($"foo" should be eval_gettext "foo"):
                echo $"$prog not running"
possible bashism in autofs/etc/init.d/autofs line 120 ($"foo" should be eval_gettext "foo"):
                echo $"Reloading maps"
possible bashism in autofs/etc/init.d/autofs line 150 ($"foo" should be eval_gettext "foo"):
                echo $"Usage: $0 {start|forcestart|stop|restart|forcerestart|reload}"
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-daemons/autofs/autofs_5.1.0.bb         |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
index aab2187..06ee77b 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
@@ -4,6 +4,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS += "libtirpc flex-native bison-native"
+RDEPENDS_${PN} += "bash"
 
 inherit autotools-brokensep systemd
 
-- 
1.7.9.5


