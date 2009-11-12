Received: from [87.249.123.12] (helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1N8bzZ-0003xc-SV
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 16:53:52 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Thu, 12 Nov 2009 16:51:28 +0100
X-TM-IMSS-Message-ID: <64808bb100021266@nedap.com>
Received: from [10.2.40.9] ([10.2.40.9]) by nedap.com ([10.91.8.1]) with ESMTP
	(TREND IMSS SMTP Service 7.0) id 64808bb100021266 for
	<jaap.dejong@nedap.com>; Thu, 12 Nov 2009 16:51:27 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 12 Nov 2009 16:49:01 +0100
Message-ID: <1258040941.18126.5.camel@nvc0624>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 12 Nov 2009 15:51:29.0000 (UTC)
	FILETIME=[FF789680:01CA63AF]
X-SA-Exim-Connect-IP: 87.249.123.12
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
X-List-Received-Date: Thu, 12 Nov 2009 15:53:53 -0000
X-Groupsio-MsgNum: 14220
Content-Type: multipart/mixed; boundary="=-3PHcTYh7v3mkUBXpU/7D"

--=-3PHcTYh7v3mkUBXpU/7D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi there,

attached a proposal for a recipe for building the 
Precision Time Protocol daemon (ptpd).

Suggestions by Michael Smith:
> 
> You are also missing the addition to checksums.ini, and maybe a line to 
> install the manpage so the doc package gets built.
> 
are hacked into it

Jaap de Jong


--=-3PHcTYh7v3mkUBXpU/7D
Content-Disposition: attachment; filename="0001-Precision-Time-Protocol.patch"
Content-Type: text/x-patch; name="0001-Precision-Time-Protocol.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Precision Time protocol (IEEE 1588)

---
 conf/checksums.ini         |    4 ++++
 recipes/ptpd/ptpd_1.0.0.bb |   16 +++++++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ptpd/ptpd_1.0.0.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index a8c8263..cf8a275 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -20774,6 +20774,10 @@ sha256=22eae4f6c72247f8ac79c57ce4469797ad3df67614758c5096b7ce9290bd10b4
 md5=db7fd581b66998cd76d96f8b7c3f22a1
 sha256=78e290d3cf78d4dc15c7397b0edd138b4d29cf2ad0a7311bfc1c4dfb88f2a400
 
+[http://downloads.sourceforge.net/project/ptpd/ptpd/1.0.0/ptpd-1.0.0.tar.gz]
+md5=b112b2bedc7f6e6e11a838608b9e0357
+sha256=8ac1fdcad1e246b0395097dd9af29966c6823533d7e6989aae91506048fb51bc
+
 [http://pypi.python.org/packages/source/p/ptrace/ptrace-0.3.2.tar.gz]
 md5=8108c2474bef16d126e956dce3c5073b
 sha256=634fe75e195179adafb6218040724f38252bd0fc8f796bb3e3e9bdba065890c5
diff --git a/recipes/ptpd/ptpd_1.0.0.bb b/recipes/ptpd/ptpd_1.0.0.bb
new file mode 100644
index 0000000..3737d63
--- /dev/null
+++ b/recipes/ptpd/ptpd_1.0.0.bb
@@ -0,0 +1,16 @@
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
+        install -d ${D}${bindir} ${D}${mandir}/man8
+        install -m 4555 ptpd ${D}${bindir}
+        install -m 644 ptpd.8 ${D}${mandir}/man8
+}
+
-- 
1.6.3.3


--=-3PHcTYh7v3mkUBXpU/7D--
