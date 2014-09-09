Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AECF1713AB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 16:27:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s89GRwMK014922
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 09:27:59 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 09:27:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 09:27:46 -0700
Message-ID: <63e89adc5ffc2c1e30a4b2a41ca0988e95158554.1410279874.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410279874.git.liezhi.yang@windriver.com>
References: <cover.1410279874.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/14] autofs: add bash to RDEPENDS_autofs
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
X-List-Received-Date: Tue, 09 Sep 2014 16:28:01 -0000
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


