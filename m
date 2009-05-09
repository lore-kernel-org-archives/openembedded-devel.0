Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2ard-0000U7-Cz
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:29 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1075455ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=rFHNaUP2d+uGKHNVSQk2mPT006TfJgGIX/O0eSEh0+8=;
	b=cXuU7rUAnhybKlCALXzimmk6EQG6m/e7mzIE0ADuz9k9zACTXyWfKnZ891O0wFPn0w
	UKFASOAJz6puopccK/2HNhVlXDPEaaU58MRuKSA3ceITMWMz3DpNXSneINRuOIAp/peH
	inOFm1Fh/Rp5Uq6craMBmUukKUnLHt0kux14A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=sTm/rGzERfzWuKuemCCZseFTtHgnQ/zsVZ8Daqu2UEJ6mgeG0HvapxBAofLHlpLh2K
	QGkCC29L1DPRm9KZtG61mH17NtMq3xde7JmnIo7M9CoiyknntA23j5Qz8e/eIe9nQS4I
	Dc09WPLaifKbGdmXzl3dq+LkvveQPD7DWt9xc=
Received: by 10.100.32.6 with SMTP id f6mr9904395anf.143.1241830213435;
	Fri, 08 May 2009 17:50:13 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm1657756ywi.58.2009.05.08.17.50.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:12 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 8CB21610199; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:17 -0300
Message-Id: <1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 01/23] gtk-engines: add 2.18.1
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
X-List-Received-Date: Sat, 09 May 2009 00:56:29 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                        |    4 +++
 recipes/gtk-engines/gtk-engines_2.18.1.bb |   30 +++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gtk-engines/gtk-engines_2.18.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 9cac3c7..c47b118 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -9774,6 +9774,10 @@ sha256=15aa3a926307b4b3e40f3a9b05c604df6811eb48814b1534db32aed414aefb0c
 md5=060ea25c471e5f4cf5c1baeac27d0345
 sha256=0d8b6630c546327ddc67c700859731036eebdf77e51ad8b71e4d19d28ca2ff2c
 
+[http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/2.18/gtk-engines-2.18.1.tar.bz2]
+md5=5dc748cfb0587bb412adc49b666fb6f8
+sha256=d7e2672fcf80f5c35d481c24e0ab5b7d0f6526dcc3d8821ab76468c1816dc3bc
+
 [http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/2.2/gtk-engines-2.2.0.tar.bz2]
 md5=78e9276c28b509f3203de4873c20a263
 sha256=140541cae8b003d2f7210e2ef060ac328d7e45a04e2cf5fa943fff73c9955dd6
diff --git a/recipes/gtk-engines/gtk-engines_2.18.1.bb b/recipes/gtk-engines/gtk-engines_2.18.1.bb
new file mode 100644
index 0000000..177c5b8
--- /dev/null
+++ b/recipes/gtk-engines/gtk-engines_2.18.1.bb
@@ -0,0 +1,30 @@
+LICENSE = "GPL"
+SECTION = "x11/base"
+DESCRIPTION = "GTK theme engines"
+DEPENDS = "gtk+ cairo"
+
+RDEPENDS_gtk-theme-redmond = "gtk-engine-redmond95"
+RDEPENDS_gtk-theme-metal = "gtk-engine-metal"
+RDEPENDS_gtk-theme-mist = "gtk-engine-mist"
+RDEPENDS_gtk-theme-crux = "gtk-engine-crux-engine"
+RDEPENDS_gtk-theme-lighthouseblue = "gtk-engine-lighthouseblue"
+RDEPENDS_gtk-theme-thinice = "gtk-engine-thinice"
+RDEPENDS_gtk-theme-industrial = "gtk-engine-industrial"
+RDEPENDS_gtk-theme-clearlooks = "gtk-engine-clearlooks"
+
+inherit gnome  gtk-binver
+
+PACKAGES_DYNAMIC = "gtk-engine-* gtk-theme-*"
+
+python populate_packages_prepend() {
+	import os.path
+
+	engines_ver = ['gtk-2.0/', gtkbinver_find(d), '/engines']
+
+	engines_root = os.path.join(bb.data.getVar('libdir', d, 1), ''.join(engines_ver))
+	themes_root = os.path.join(bb.data.getVar('datadir', d, 1), "themes")
+
+	do_split_packages(d, engines_root, '^lib(.*)\.so$', 'gtk-engine-%s', 'GTK %s theme engine', extra_depends='')
+	do_split_packages(d, themes_root, '(.*)', 'gtk-theme-%s', 'GTK theme %s', allow_dirs=True, extra_depends='')
+}
+
-- 
1.6.3.rc1.51.gea0b7



