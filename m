Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0558771993
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 03:13:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA13DGGT019582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 20:13:17 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 31 Oct 2018 20:13:16 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Nov 2018 11:12:47 +0800
Message-ID: <1541041968-19942-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541041968-19942-1-git-send-email-changqing.li@windriver.com>
References: <1541041968-19942-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netkit-telnet: update SRC_URI
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
X-List-Received-Date: Thu, 01 Nov 2018 03:13:16 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

update SRC_URI since previous is not valid now

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 2fadf03..807a867 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -5,7 +5,7 @@ DEPENDS = "ncurses"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://telnet/telnet.cc;beginline=2;endline=3;md5=780868e7b566313e70cb701560ca95ef"
 
-SRC_URI = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/${BP}.tar.gz \
+SRC_URI = "http://ftp.linux.org.uk/pub/linux/Networking/netkit/${BP}.tar.gz \
            file://To-aviod-buffer-overflow-in-telnet.patch \
            file://Warning-fix-in-the-step-of-install.patch \
            file://telnet-xinetd \
-- 
2.7.4


