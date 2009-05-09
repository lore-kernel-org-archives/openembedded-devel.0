Received: from [209.85.217.206] (helo=mail-gx0-f206.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arj-0000UM-I1
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:35 +0200
Received: by mail-gx0-f206.google.com with SMTP id 2so2089217gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=nzMQEp8B2UgDh/aO0jhFaw5Xy7LsPWoiT7XKlQOAb2Y=;
	b=v2kqp1iHwOVI8Yf0h/4OH9lEnKDuSWVdo/BF88F9d4feV8qBCW81O5m+OSVqgQPvfP
	u+oa4cZP7uMBM/KMCDKD1PSfIkT02XXAEsFj64u3LbaEf8UBbSD68G+DCgi9S3msQTIs
	0vh/KhueuLipv9tSm6PSodA2rtTk7rvD2xu/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=cDLnn7zvFbwKNMKaFegAIMKkLxOU7yHSJCJL2kVZGsThecG7g+SRrUfSGfV34+Ujo2
	erEKtVvtbr0nHdM072kj9Ut+gH+1oKjh3sDnLky01rh5NJ3lC0sJ/oymyR95FYS8QEc1
	0Ene8YO2zXPMZnQT7FT4aBvA2I+XOvhpmjbPw=
Received: by 10.100.3.13 with SMTP id 13mr9960281anc.75.1241830219993;
	Fri, 08 May 2009 17:50:19 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm3665623ywp.24.2009.05.08.17.50.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id EF8186101A5; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:25 -0300
Message-Id: <1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 09/23] system-config-printer: add to provide python-cupshelpers to hal-cups-utils
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
X-List-Received-Date: Sat, 09 May 2009 00:56:36 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                                 |    4 ++++
 .../system-config-printer_1.1.7.bb                 |   19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/system-config-printer/system-config-printer_1.1.7.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 5daf8ec..0df13ba 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -22214,6 +22214,10 @@ sha256=26c05ef7666881eb1d60291a4293e67d75dbf048ca8a30f6b9eb3dc86ad1b6b0
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
index 0000000..e02a814
--- /dev/null
+++ b/recipes/system-config-printer/system-config-printer_1.1.7.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "cups Python Bindings"
+SECTION = "devel/python"
+PRIORITY = "optional"
+LICENSE = "GPLv2"
+DEPENDS = "cups"
+RDEPENDS_python-cupshelpers += "python-pprint python-netclient python-misc" 
+SRC_URI = "http://cyberelk.net/tim/data/${PN}/1.1/${PN}-${PV}.tar.bz2"
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit distutils
+
+do_configure_prepend() {
+		# disable xmlto usage since we won't use manpages
+		sed -i 's,xmlto,echo xmlto,g' ${S}/Makefile*
+}
+
+PACKAGES="python-cupshelpers"
+
+FILES_python-cupshelpers = "${libdir}"
-- 
1.6.3.rc1.51.gea0b7



