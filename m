Received: from [213.160.213.92] (helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1N7Tm4-0002PE-6t
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 13:55:16 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Mon, 9 Nov 2009 13:52:54 +0100
X-TM-IMSS-Message-ID: <5469ed1d0001caa3@nedap.com>
Received: from [10.2.40.9] ([10.2.40.9]) by nedap.com ([10.91.8.1]) with ESMTP
	(TREND IMSS SMTP Service 7.0) id 5469ed1d0001caa3 for
	<jaap.dejong@nedap.com>; Mon, 9 Nov 2009 13:52:50 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 09 Nov 2009 13:50:17 +0100
Message-ID: <1257771017.19063.3.camel@nvc0624>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 09 Nov 2009 12:52:54.0111 (UTC)
	FILETIME=[8DA906F0:01CA613B]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Precision Time Protocol (PTP) as defined by the IEEE 1588 standard
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Nov 2009 12:55:16 -0000
X-Groupsio-MsgNum: 14047
Content-Type: multipart/mixed; boundary="=-3d0gjEFN7DPL04pX8sCr"

--=-3d0gjEFN7DPL04pX8sCr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi there,

attached a proposal for a recipe for building the 
Precision Time Protocol daemon (ptpd).


Jaap



--=-3d0gjEFN7DPL04pX8sCr
Content-Disposition: attachment; filename="0001-Precision-Time-Protocol.patch"
Content-Type: text/x-patch; name="0001-Precision-Time-Protocol.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Precision Time protocol (IEEE 1588)

---
 recipes/ptpd/ptpd_1.0.0.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ptpd/ptpd_1.0.0.bb

diff --git a/recipes/ptpd/ptpd_1.0.0.bb b/recipes/ptpd/ptpd_1.0.0.bb
new file mode 100644
index 0000000..3737d63
--- /dev/null
+++ b/recipes/ptpd/ptpd_1.0.0.bb
@@ -0,0 +1,15 @@
+# ptpd build file
+LICENSE="BSD"
+DESCRIPTION="Precision Time Protocol (PTP) as defined by the IEEE 1588 standard"
+HOMEPAGE="http://sourceforge.net/projects/ptpd"
+
+SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz" 
+
+S="${WORKDIR}/ptpd-${PV}/src"
+PR = "r0"
+
+do_install() {                                                                                                                                               
+	install -d ${D}${bindir}
+	install -m 4555 ptpd ${D}${bindir}
+}
+
-- 
1.6.3.3


--=-3d0gjEFN7DPL04pX8sCr--
