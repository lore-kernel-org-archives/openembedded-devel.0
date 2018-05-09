Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 59CFA74A0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:28 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id a13-v6so23076903pgu.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VjIJorAycRevOWzA66Y/vI2+9ehs7nmDWGYfl58NNtA=;
	b=BCYFqYOf9uGOyj3U1X602dLWn3e4gLyC1H7EwKUXUvxfUG+IQhehXAVz9RH++t3eGD
	OeMIKRqy8XPN5W2kMHlwF1iiepiP2AYTau/X7Lu6BoHdr543FwlvmlT5jeZgg0ubedb5
	esTOFDL7FIPGxrBXSO62JkI5Z/qgrL1TXDvlDAh8sOltbgIOHkCGy8+dO8gmVriZhBKz
	4vjl/4m4QczU9M2+rqX+hsYkff7vSO2OwYev3PjZqvzm0UCm3LuQa0OCKeECfoiS7XnV
	iFv+WMycc6njwdzd5mN3jw/q5uX2ao2ofa8nbAdGMeBrxH4fyfZTv3sEjrZLiqrjX9sR
	qhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VjIJorAycRevOWzA66Y/vI2+9ehs7nmDWGYfl58NNtA=;
	b=hmLg8JG99FJtW5NyNQcl3ZSnS64InUx8+ZrDWThMO/tBf4Hv2aozYpBdybZfg/r8Uv
	bYq+lxpUh7Yq41MQXgKVe3yyjtw0APw7XZmSTVgRSNN1g01URciGA9gj5WzLpi/gD9rD
	PgSPDZ3Gx+uT2Ztmosx1U8L51ts+M1OZJPGyj3kEf8w06UFBzEJyquUDKcoAsMp0sFRv
	ju9eigSdHfuynKJA1dbSMxsWLFczab5yVXRhc5VQmvSq/h4tf33a3VJTD07bbNMIPZYF
	oJuaUlH2BZLjyE1cgQXeQ8S8yyycT+BMS9YYf/GmJ8BMOfVgP0LkN7KewbGma2xl7g46
	Xp5Q==
X-Gm-Message-State: ALQs6tChqL07JvR/ba2dqI6z8QZbYbVqOUo1QhvkHmtuUgmE+TUVNPW0
	HsXBMtht1r5Fq0l6lNwEXgDNgA==
X-Google-Smtp-Source: AB8JxZp+kBB+h2tUz9PWLBN1bqtlRs3Uo0NvJWPSGyURToqgbBXOaLtgwExnsH1X8D3gu6rKK0qYHw==
X-Received: by 10.98.185.9 with SMTP id z9mr22508551pfe.254.1525892427654;
	Wed, 09 May 2018 12:00:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:03 -0700
Message-Id: <20180509190011.30006-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 08/16] recipes: Link with libtirpc
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
X-List-Received-Date: Wed, 09 May 2018 19:00:28 -0000

glibc no longer provides rpc implementation

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/snort/snort_2.9.7.5.bb           | 7 +++----
 .../conntrack-tools/conntrack-tools_1.4.4.bb              | 6 ++----
 .../recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb          | 6 +++---
 .../recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb    | 3 +++
 meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb        | 7 +++----
 meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb | 8 +++-----
 6 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
index 2034b85fb5..21e77c5417 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
@@ -4,8 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
-DEPENDS = "xz libpcap libpcre daq libdnet util-linux daq-native"
-DEPENDS_append_libc-musl = " libtirpc"
+DEPENDS = "xz libpcap libpcre daq libdnet util-linux daq-native libtirpc"
 
 SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
     file://snort.init \
@@ -48,8 +47,8 @@ PACKAGECONFIG ?= "openssl lzma"
 PACKAGECONFIG[openssl] = "--with-openssl-includes=${STAGING_INCDIR} --with-openssl-libraries=${STAGING_LIBDIR}, --without-openssl-includes --without-openssl-libraries, openssl,"
 PACKAGECONFIG[lzma] = "--with-lzma-includes=${STAGING_INCDIR} --with-lzma-libraries=${STAGING_LIBDIR}, --without-lzma-includes --without-lzma-libraries, xz,"
 
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
-LDFLAGS_append_libc-musl = " -ltirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LDFLAGS += " -ltirpc"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/snort/rules
diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.4.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.4.bb
index 8b3490d7c2..46168b0ba4 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.4.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.4.bb
@@ -4,11 +4,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 DEPENDS = "libnfnetlink libnetfilter-conntrack libnetfilter-cttimeout \
-           libnetfilter-cthelper libnetfilter-queue bison-native"
+           libnetfilter-cthelper libnetfilter-queue bison-native libtirpc"
 
-DEPENDS_append_libc-musl = " libtirpc"
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
-LDFLAGS_append_libc-musl = " -ltirpc"
+EXTRA_OECONF += "LIBS=-ltirpc CPPFLAGS=-I${STAGING_INCDIR}/tirpc"
 
 SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar \
     file://conntrack-failover \
diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
index 9487fdc2c0..ebe867d776 100644
--- a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
@@ -4,15 +4,15 @@ SECTION = "net"
 LICENSE = "SPL-1.0"
 LIC_FILES_CHKSUM = "file://rpcinfo/rpcinfo.c;beginline=2;endline=3;md5=3e6339e3ce266e1122c5ba293e04bc89"
 
-DEPENDS_append_libc-musl = " libtirpc"
+DEPENDS += "libtirpc"
 SRC_URI = "http://sources.openembedded.org/${BPN}-${PV}.tar.gz \
            file://gcc4.patch \
            file://0001-rpcgen-Fix-printf-formats.patch \
            "
 SRC_URI[md5sum] = "67212720482ea1aea9182a98653a9642"
 SRC_URI[sha256sum] = "421d63b414162237a72867061f1bd3e3752a0d962cd5d30b5e933ddad8a14d3b"
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
-LIBS_append_libc-musl = " -ltirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LIBS += "-ltirpc"
 
 do_configure () {
     ./configure --prefix=${prefix}
diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index 459e39e593..a7d19182cf 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -18,6 +18,9 @@ SRC_URI[patch8.sha256sum] = "14882dbdda4e37baa84d55b54b46c7e063a20fc9e04d1be1a28
 
 inherit autotools-brokensep
 
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LIBS += "-ltirpc"
+
 do_configure () {
     ./configure --prefix=${prefix}
     echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
index 2ca781bf56..df1a19e7a2 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.6.bb
@@ -26,10 +26,9 @@ PACKAGECONFIG[libtdb] = "--without-included-tdb,--with-included-tdb,libtdb"
 
 PARALLEL_MAKE = ""
 
-DEPENDS += "popt libtevent libtalloc libldb"
-DEPENDS_append_libc-musl = " libtirpc"
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
-LDFLAGS_append_libc-musl = " -ltirpc"
+DEPENDS += "popt libtevent libtalloc libldb libtirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LDFLAGS += "-ltirpc"
 
 # ctdbd_wrapper requires pgrep, hence procps
 RDEPENDS_${PN} += "procps"
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb
index 5ebda19eb4..882d5d5543 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb
@@ -15,11 +15,9 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
 SRC_URI[md5sum] = "d61d1e923a22f9062cc9f47696882666"
 SRC_URI[sha256sum] = "e9483d68a7698d701bc06124fcf6e1b1f16380c2986c7ec0cf4e1475b9d0c218"
 
-DEPENDS = "openssl xz zlib bzip2 libcap icu"
-
-DEPENDS_append_libc-musl = " libtirpc"
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
-LDFLAGS_append_libc-musl = " -ltirpc"
+DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LDFLAGS += "-ltirpc"
 
 inherit autotools pkgconfig systemd useradd
 
-- 
2.17.0


