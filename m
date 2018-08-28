Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E7038746D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 13:24:42 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id f21-v6so1925954wmc.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=q33qyV0XUtwBhywrIvM+A+Y5fhqz2GTiA0UOPTThEig=;
	b=E/MMUHQqjVpBWRJvtXAn/COEhefnvJJXrufEvaaMEKGmcAxTAZHaRDWyGcvvLjaZwE
	Xh9MRErRnzJzyQFBDsFwbF0dJbVsA1481MMxDpXtGr8qeZ05TCcopuxAmw6QedQEy5EC
	DXdGvTKhvjp5Ny1dvrIJcb14R3GfjrX0nP/3MsNwj07zlh+XJa47hng5ja/8ozK8WazD
	JtVQL2dxTt5qO3xZhlDqA6B0IGaUREH7bKusQVQhMlneybGVLbB9bhIhP+DdI/w0fQkp
	AtJeYS3Mgg5ohvxSoF058ur6jJtVIRjQ2Ur/QWVYAekzKg6K3PiB+jSOgBSv72KjIpEH
	EnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=q33qyV0XUtwBhywrIvM+A+Y5fhqz2GTiA0UOPTThEig=;
	b=D8xdSbP4+104Fhl9WSrfwsGLEJcFaPFbOA46UO+NtF74occTNu6m0U4BpaBGwYTu39
	9yTonlMZj8lbsplyTMci1wagA6C4G+yocd3412B+3o5/CEKdR41iiQWRPjntcsrCQVlw
	FuqPAyetUhQeu0c5MJpmF+2nL07256fTVsLZQa3GfMSsp7xS8lVYkhXWEsUQd/tjv6hI
	j4Jzhez2+neTnhMytVmAApCZjT+l6OKCteQZU6o68wXKZihVvsJFhjuTkvEJjXfM/EAt
	/A5GhtEYIbHKJ85mLXLY6Z9t48QnU+CsKkotItIDkIofVO4a4trpRSf88hR6s577BwEm
	vm2w==
X-Gm-Message-State: APzg51CYd1/wqKRPcVDH4lEwPNAii4GO54GUWUUri/6a3rH/EgRDGgj4
	q2Z8GH4q+qAsn83sxl2yOiyv9Dox
X-Google-Smtp-Source: ANB0VdZ/MhoT51TPCvJq+JlpFY+TTm9QGymA3rzTSJ3DbCSYL6/3jQdHyCBQgEhZYCD9f1fGAdlTsw==
X-Received: by 2002:a1c:2dc8:: with SMTP id
	t191-v6mr1433186wmt.94.1535462683556; 
	Tue, 28 Aug 2018 06:24:43 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	t131-v6sm885701wmg.10.2018.08.28.06.24.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 06:24:42 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2018 15:24:27 +0200
Message-Id: <20180828132427.22296-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH v2] libnet-ssleay-perl: Fix configure issue
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
X-List-Received-Date: Tue, 28 Aug 2018 13:24:43 -0000

Fix libnet-ssleay-perl tries to execute found openssl binaries
at the place of ${OPENSSL_PREFIX} and bailing out when either
binaries are missing or can't be executed. From cross-compiling
perspective, both is insane.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../no-exec-on-configure.patch                | 33 +++++++++++++++++++
 .../libnet/libnet-ssleay-perl_1.85.bb         |  8 +++--
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
new file mode 100644
index 000000000..6efa7d8f9
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
@@ -0,0 +1,33 @@
+--- a/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2018-08-27 14:56:24.788544991 +0200
++++ b/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2018-08-27 15:00:12.847266331 +0200
+@@ -24,20 +24,7 @@
+     $self->requires_external_cc;
+ 
+     my $prefix = $self->find_openssl_prefix;
+-    my $exec   = $self->find_openssl_exec($prefix);
+-
+-    unless (-x $exec) {
+-        print <<EOM;
+-*** Could not find OpenSSL
+-    If it's already installed, please set the OPENSSL_PREFIX environment
+-    variable accordingly. If it isn't installed yet, get the latest version
+-    from http://www.openssl.org/.
+-EOM
+-        exit 0; # according http://wiki.cpantesters.org/wiki/CPANAuthorNotes this is best-practice when "missing library"
+-    }
+-
+-    $self->check_openssl_version($prefix, $exec);
+-    my $opts = $self->ssleay_get_build_opts($prefix, $exec);
++    my $opts = $self->ssleay_get_build_opts($prefix);
+ 
+     $self->makemaker_args(
+         CCCDLFLAGS => $opts->{cccdlflags},
+@@ -58,7 +45,7 @@
+ }
+ 
+ sub ssleay_get_build_opts {
+-    my ($self, $prefix, $exec) = @_;
++    my ($self, $prefix) = @_;
+ 
+     my $opts = {
+         lib_links  => [],
diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index a0bb90e7d..dccef1640 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -23,6 +23,7 @@ RDEPENDS_${PN} += "\
 "
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
+           file://no-exec-on-configure.patch \
            file://run-ptest \
           "
 SRC_URI[md5sum] = "d602bdce4e0531c6efc276e3e429ca69"
@@ -32,9 +33,10 @@ S = "${WORKDIR}/Net-SSLeay-${PV}"
 
 inherit cpan ptest
 
-export OPENSSL_PREFIX="${STAGING_LIBDIR}"
-
-EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS='-L${STAGING_LIBDIR} -lcrypto -lssl -L${STAGING_BASELIBDIR} -lz'"
+do_configure() {
+    export OPENSSL_PREFIX="${STAGING_EXECPREFIXDIR}"
+    cpan_do_configure
+}
 
 do_install_ptest() {
     cp -r ${B}/t ${D}${PTEST_PATH}
-- 
2.17.1


