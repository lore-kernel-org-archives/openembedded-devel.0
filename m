Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJS-0005cc-0c
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:18 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805180fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=OUAGjnSgNV1QPcn3GGIEFajyAA0nVjl9SeA0e203AjU=;
	b=wjyHFL8ded7Cko/sfYyxoQHokrNTXBLptHp4p9Qq15Cjkgsouw8dtyHULtwUBhJjCG
	LoCPZC17REwyS1LawZKQzeilsU2rTwxUJzy8yZwRicWC9kACvYXzkvFfbFxuheeGGgXb
	BcV3TcAkcsBIWElnFHIXnrpcdye9Di7xMtLFc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Zf+iuJm31AXXpwUGcjGIpnbi1eGUc2fcuqTXsUK5Bpr6JzIpC7UzD41xgUkZGTJzAx
	CM3xbCHKt8bciYOKx0bvdsfuJdTJQhVWUMinDsh6M20n5CwISKKoXKsaMxzuFZhTcaST
	oTUCMdmNn6hcvlJajDiMIR2szHesi++27xCW4=
Received: by 10.103.229.12 with SMTP id g12mr1067255mur.87.1242873586308;
	Wed, 20 May 2009 19:39:46 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id w5sm1929855mue.34.2009.05.20.19.39.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:45 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id BBCDB6103BA; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:23 -0300
Message-Id: <1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 08/23] system-config-printer: add to provide python-cupshelpers to hal-cups-utils
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
X-List-Received-Date: Thu, 21 May 2009 02:47:18 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                                 |    4 +++
 .../system-config-printer_1.1.7.bb                 |   22 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes/system-config-printer/system-config-printer_1.1.7.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 7fe3566..96a2272 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -22378,6 +22378,10 @@ sha256=26c05ef7666881eb1d60291a4293e67d75dbf048ca8a30f6b9eb3dc86ad1b6b0
 md5=d7b8f27b83ff080ff824177d65a7dae0
 sha256=0a63da1c99b6a9b6a93b6fd0a9391c7d8216f658d2bea0ba81999e261c6b6649
 
+[http://cyberelk.net/tim/data/system-config-printer/1.1/system-config-printer-1.1.7.tar.bz2]
+md5=a77bde5adc5ee8822b0764ff786ccc09
+sha256=fdd50cb114151c66b8180c0ce90ba0e99f77a69770ac21598a87be935eec2224
+
 [ftp://ftp.cistron.nl/pub/people/miquels/sysvinit/sysvinit-2.86.tar.gz]
 md5=7d5d61c026122ab791ac04c8a84db967
 sha256=035f98fae17d9cff002993c564ccc83dc4ed136127172caeff872b6abdb679d8
diff --git a/recipes/system-config-printer/system-config-printer_1.1.7.bb b/recipes/system-config-printer/system-config-printer_1.1.7.bb
new file mode 100644
index 0000000..5a6d632
--- /dev/null
+++ b/recipes/system-config-printer/system-config-printer_1.1.7.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "cups Python Bindings"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "cups"
+RDEPENDS_python-cupshelpers += "python-pprint python-netclient python-misc" 
+PR = "r2"
+
+SRC_URI = "http://cyberelk.net/tim/data/${PN}/1.1/${PN}-${PV}.tar.bz2"
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit distutils
+
+do_configure_prepend() {
+    # disable xmlto usage since we won't use manpages
+    sed -i 's,xmlto,echo xmlto,g' ${S}/Makefile*
+}
+
+PACKAGES += "python-cupshelpers"
+
+FILES_${PN} = "" # we're not going to support it for now
+FILES_python-cupshelpers = "${libdir}"
-- 
1.6.3.1.54.g99dd



