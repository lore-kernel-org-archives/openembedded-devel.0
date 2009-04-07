Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1Lr5fx-0003jR-A0
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 09:24:57 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1770352ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2009 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=HtTQ3cFSvouDjHAxGzmdr9ImA7nLKpNvAAil8x5Q2YE=;
	b=L1XA9KfAk8odnv01xJMzs/KscVQENV5ORz2XrdAFV/g61QJONFLaz9fAs6UJU7Awo4
	hXx9eCuVQtO12Zgn78lVVwIRpmlRtUxgTNH2gU8YX852kWkZWwdyqEZQIBcarPDz8UjP
	2B7l6cxOzyHqeirdUvcBsL+WnyP+C+FNcM/4c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=i4o2s4Nft/J4qAB2p6XZ5y99aEzPAHvOPevj/XWdIAZNLl+LsfbIVvYnG5+6Rk1Zt3
	tzGbyI7ll2CLdC+f39M1WRduYGcCrcagis3ZAy8OcgLGaQCDP6V8ZIn84LFSDyNedBUC
	rQUOMkS77siQpq7qhpUpA7hY7ZNakMdkztRpQ=
MIME-Version: 1.0
Received: by 10.100.253.7 with SMTP id a7mr5992510ani.136.1239088588103; Tue, 
	07 Apr 2009 00:16:28 -0700 (PDT)
Date: Tue, 7 Apr 2009 09:16:28 +0200
Message-ID: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.154
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE][PATCH v2] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Tue, 07 Apr 2009 07:24:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 conf/checksums.ini                                 |    3 +++
 .../mingw-binutils-canadian-cross_2.19.1.bb        |   10 ++++++++++
 recipes/binutils/mingw-binutils_2.19.1.bb          |   12 ++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
 create mode 100644 recipes/binutils/mingw-binutils_2.19.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 2a119dd..20dc248 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -26886,3 +26886,6 @@
sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af

+[http://downloads.sourceforge.net/mingw/binutils-2.19.1-src.tar.gz]
+md5=ad3f2b5fdcd599a772ad75fec2c384d8
+sha256=2df529b1ac0a621efb87b5b53dbc0167c566f8bebbd6a8ce19964b05845fd2e7
diff --git a/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
new file mode 100644
index 0000000..130dea5
--- /dev/null
+++ b/recipes/binutils/mingw-binutils-canadian-cross_2.19.1.bb
@@ -0,0 +1,10 @@
+require mingw-binutils_${PV}.bb
+require binutils-canadian-cross.inc
+
+DEFAULT_PREFERENCE_sdk-mingw32 = "1"
+
+require binutils-canadian-cross.inc
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/binutils-${PV}"
diff --git a/recipes/binutils/mingw-binutils_2.19.1.bb
b/recipes/binutils/mingw-binutils_2.19.1.bb
new file mode 100644
index 0000000..19d1077
--- /dev/null
+++ b/recipes/binutils/mingw-binutils_2.19.1.bb
@@ -0,0 +1,12 @@
+PR = "r1"
+
+require binutils.inc
+
+DESCRIPTION = "A GNU collection of binary utilities - MinGW port"
+HOMEPAGE = "http://www.mingw.org/"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/mingw/binutils-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/binutils-${PV}"
+
+DEFAULT_PREFERENCE = "0"
-- 
1.6.2.2


