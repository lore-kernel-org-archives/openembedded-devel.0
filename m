Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F03D977B8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 06:57:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3Q6vPeC013383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 23:57:25 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Apr 2017 23:57:24 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 14:57:12 +0800
Message-ID: <8d5aff46f29c8384214f62f25ef21d6878710259.1493189113.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493189113.git.jackie.huang@windriver.com>
References: <cover.1493189113.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 5/8] libnet-telnet-perl: add new recipe
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
X-List-Received-Date: Wed, 26 Apr 2017 06:57:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Net-Telnet Perl module, it allows you to make client
connections to a TCP port and do network I/O, especially
to a port using the TELNET protocol.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-perl/libnet/libnet-telnet-perl_3.04.bb | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.04.bb

diff --git a/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.04.bb b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.04.bb
new file mode 100644
index 000000000..652e8c941
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-telnet-perl_3.04.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Net-Telnet Perl module"
+DESCRIPTION = "Net::Telnet allows you to make client connections to a TCP port and do \
+network I/O, especially to a port using the TELNET protocol. Simple I/O \
+methods such as print, get, and getline are provided. More sophisticated \
+interactive features are provided because connecting to a TELNET port \
+ultimately means communicating with a program designed for human interaction. \
+These interactive features include the ability to specify a time-out and to \
+wait for patterns to appear in the input stream, such as the prompt from a \
+shell."
+
+HOMEPAGE = "http://search.cpan.org/dist/Net-Telnet/"
+SECTION = "Development/Libraries"
+
+LICENSE = "Artistic-1.0|GPLv1+"
+LIC_FILES_CHKSUM = "file://README;beginline=4;endline=7;md5=3fd238bfb6ee1810cb15d5d95e07b0f5"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JR/JROGERS/Net-Telnet-${PV}.tar.gz"
+SRC_URI[md5sum] = "d2514080116c1b0fa5f96295c84538e3"
+SRC_URI[sha256sum] = "e64d567a4e16295ecba949368e7a6b8b5ae2a16b3ad682121d9b007dc5d2a37a"
+
+S = "${WORKDIR}/Net-Telnet-${PV}"
+
+inherit cpan
+
+RDEPENDS_${PN} = "perl"
-- 
2.11.0


