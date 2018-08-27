Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AC39F78685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 13:27:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v17-v6so13624391wrr.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 06:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=slkRqjvYD5o/X4xVCa2gm1MQywEQaozaI2p1ab/POmA=;
	b=VyO5qwgHCzZvGfqcgC8fo02YqmjWCG80eJygFAdStP15KRU4AeLi4zo8jwQdIDqOwC
	t/YlBS1jS5dwK9BWCEe/Vt6bkpihVLILiP5nZE1BHeYgivxb/s1bfctRGJDVrjOuuqKR
	wnpGyzxOzqVsvqbtuhGJqKXeLdk+sYXtYT7/rzjVE6fBcJwicZHzZCZgSj3+8TYKwAJP
	EB1ymF+L5Dk5JbOzR+bsGrn6A824nwdXES+1bOZco9WJ4sBAkzKkCmyV2kVLMHG6eeAR
	lHwBGbwEcrPeG9h1etoerwHeKBAW9V/nxXXO4TMreO6/ztF1VLsV2JxuBkALOjEyyjZL
	slYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=slkRqjvYD5o/X4xVCa2gm1MQywEQaozaI2p1ab/POmA=;
	b=k/hSRiPbRVgpRMY/2KGNytYR7nuKabnqFgpEdXbdRGp42b6Bzf4cF+NapqBmlTuNvM
	O28wtaDdednfV9IBq64xWGbniLlc6qGIXjyQgcnyZHce5X8Tw7Wdm1Tyuavq1iqwjrC6
	8GcI717sOBmG/1J8GINX2KSDuwNqWmLi3YEyau43Q0sLe2C9rs01tzlLA97c8eKvQQPZ
	9airFx4rH+S4nJrzFjfEkX8FUfuhjylMkypLylmpFX/ckpfisvfGi28QtdEZNb1ka74q
	lD3dGB93sOTNPkfDbIr/s3IFItf/1EFsMg8umq62g3mn4FW8r3ZeDJB5ZPDg0Z8h8dk5
	NM0Q==
X-Gm-Message-State: APzg51Dla4eI3z1bMf+9Oenyd7S8cXMImzisD8ZaMgnh/lzEan3a44WK
	rPoiTrHkMoyPnu9K3Y90E4FHbqhd
X-Google-Smtp-Source: ANB0VdZApd8ahN34qSBBg1gjdCCpbRziEKLo0YqexDFeJO2c75PK3OYuv0KosUQtu+nHmFvTUaeiAw==
X-Received: by 2002:adf:9081:: with SMTP id
	i1-v6mr9276912wri.271.1535376468254; 
	Mon, 27 Aug 2018 06:27:48 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	b124-v6sm7426678wmg.47.2018.08.27.06.27.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 06:27:47 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 15:27:29 +0200
Message-Id: <20180827132729.23213-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH] libnet-ssleay-perl: Fix configure issue
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
X-List-Received-Date: Mon, 27 Aug 2018 13:27:48 -0000

Fix libnet-ssleay-perl tries to execute found openssl binaries
at the place of ${OPENSSL_PREFIX} and bailing out when either
binaries are missing or can't be executed. From cross-compiling
perspective, both is insane.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../no-exec-on-configure.patch                | 33 +++++++++++++++++++
 .../libnet/libnet-ssleay-perl_1.85.bb         |  8 +++--
 2 files changed, 39 insertions(+), 2 deletions(-)
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
index a0bb90e7d..6a116459e 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -23,6 +23,7 @@ RDEPENDS_${PN} += "\
 "
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
+           file://no-exec-on-configure.patch \
            file://run-ptest \
           "
 SRC_URI[md5sum] = "d602bdce4e0531c6efc276e3e429ca69"
@@ -32,9 +33,12 @@ S = "${WORKDIR}/Net-SSLeay-${PV}"
 
 inherit cpan ptest
 
-export OPENSSL_PREFIX="${STAGING_LIBDIR}"
+#EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS='-L${STAGING_LIBDIR} -lcrypto -lssl -L${STAGING_BASELIBDIR} -lz'"
 
-EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS='-L${STAGING_LIBDIR} -lcrypto -lssl -L${STAGING_BASELIBDIR} -lz'"
+do_configure() {
+    export OPENSSL_PREFIX="${STAGING_DIR_TARGET}/usr"
+    cpan_do_configure
+}
 
 do_install_ptest() {
     cp -r ${B}/t ${D}${PTEST_PATH}
-- 
2.17.1


