Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2BAAD73955
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 19:21:24 +0000 (UTC)
Received: by qcxr5 with SMTP id r5so9347412qcx.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 12:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mXAQv8/8HreaN32V9ovU7PjJEV1Sbb8d0rzt4OO1nzY=;
	b=lhfCC1ZljRDLPq/Zz4zg9eHTjAy5jVj+GbcfXYyEB5S5N7kkb6cZM6I9QB3rkmztQE
	7yIHPfX9D3tpr+OSBXTl3jY67d7o+PziyQgQOncFV0AQuH63ovXr8fNtQVdMbrtdO4nl
	VoqdpaV+nisJNv3015AwvlQREoWAz89Nzv+idbpEYDcnxIxpu7BCNkzrcrOUfvJJGtvm
	qrVphPRwJYjtEsxLEPM99hubZPJV7l5Y3tv0JVv9m64p246qh0fO1ReWb8qi5gJLOrhQ
	zr+kP+4YyPTwjwLEi5HKgF4vMiHzk68YmipjAJOZ6Ajg2sasnPjn8ok1HWEJXhuZ49bz
	kpZg==
X-Received: by 10.140.102.165 with SMTP id w34mr36982561qge.26.1425928886097; 
	Mon, 09 Mar 2015 12:21:26 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-10-241.ronkva.east.verizon.net.
	[71.171.10.241])
	by mx.google.com with ESMTPSA id 22sm12141195qgj.49.2015.03.09.12.21.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 12:21:25 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2015 15:21:15 -0400
Message-Id: <1425928875-29697-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1425928875-29697-1-git-send-email-philip@balister.org>
References: <1425928875-29697-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH 2/2] python-pyqt : Move RDEPENDS on python-sip to PyQT.
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
X-List-Received-Date: Mon, 09 Mar 2015 19:21:27 -0000

python-sip has the runtime support for PyQT. Also drop the need
for anki to RDEPEND on python-sip.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb | 2 +-
 meta-oe/recipes-extended/anki/anki_0.4.3.bb           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
index 989f2cf..160a5d5 100644
--- a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
@@ -49,7 +49,7 @@ do_install() {
      oe_runmake install
 }
 
-RDEPENDS_${PN} = "python-core"
+RDEPENDS_${PN} = "python-core python-sip"
 
 FILES_${PN} += "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip/PyQt4/"
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/*/.debug/"
diff --git a/meta-oe/recipes-extended/anki/anki_0.4.3.bb b/meta-oe/recipes-extended/anki/anki_0.4.3.bb
index d441a70..61e063d 100644
--- a/meta-oe/recipes-extended/anki/anki_0.4.3.bb
+++ b/meta-oe/recipes-extended/anki/anki_0.4.3.bb
@@ -1,4 +1,4 @@
 require ${PN}-${PV}.inc
 
-RDEPENDS_${PN} = "python-pyqt sip libanki"
+RDEPENDS_${PN} = "python-pyqt libanki"
 RRECOMMENDS_${PN} = "virtual-japanese-font"
-- 
2.1.0


