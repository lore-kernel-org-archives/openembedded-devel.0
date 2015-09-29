Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C8C8276AC4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 20:15:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8TKFhSt028416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 13:15:43 -0700 (PDT)
Received: from ord-lpggp3.wrs.com (128.224.149.46) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 29 Sep 2015 13:15:43 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Sep 2015 15:14:08 -0500
Message-ID: <1443557648-14567-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-networking][PATCH] tsocks: Add tsocks to meta-network/recipes-protocols
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
X-List-Received-Date: Tue, 29 Sep 2015 20:15:44 -0000
Content-Type: text/plain

The tsocks program is frequently used to easily wrap any generic
program such as telnet, ssh, wget or any other tcp socket program
using an LD_PRELOAD library.  One might use an ssh tunnel and wget for
example.

Example of tunnel via ssh to remote url:

ssh -N -D 1080 $REMOTE_HOST_TUNNEL_ENDPOINT &

cat<<EOF>tsocks.conf
server_port = 1080
server = 127.0.0.1
EOF

TSOCKS_CONF_FILE=$PWD/tsocks.conf tsocks curl $REMOTE_URL

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 .../recipes-protocols/tsocks/tsocks_1.8beta5.bb    |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb

diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
new file mode 100644
index 0000000..5ad3c05
--- /dev/null
+++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Libraries and wrapper for using a SOCKS proxy"
+DESCRIPTION = "The role of tsocks is to allow non SOCKS aware \
+applications (e.g telnet, ssh, ftp etc) to use SOCKS without any \
+modification. It does this by intercepting the calls that applications \
+make to establish network connections and negotating them through a \
+SOCKS server as necessary."
+HOMEPAGE = "http://sourceforge.net/projects/tsocks/"
+SECTION = "net"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
+
+SRC_URI = "http://downloads.sourceforge.net/tsocks/tsocks-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "51caefd77e5d440d0bbd6443db4fc0f8"
+SRC_URI[sha256sum] = "849d7ef5af80d03e76cc05ed9fb8fa2bcc2b724b51ebfd1b6be11c7863f5b347"
+
+inherit autotools
+
+S = "${WORKDIR}/tsocks-1.8"
+B = "${S}"
+
+FILES_${PN} = "${libdir}/* ${bindir}/tsocks"
+FILES_${PN}-dev = ""
+INSANE_SKIP_${PN} = "dev-so"
-- 
1.7.9.5


