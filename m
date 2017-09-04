Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1306577E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2017 17:34:26 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id k3so449791pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Sep 2017 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wvmmOxcJ/A2vihavxjQ6uMKZmuUThWH7nTFDlBvAVQc=;
	b=HSEKCC8LAcscMfafSHCoQY24BxwCSmyjxQDJ1pankiydFUIwlXLqLRuQW5HT0OFppY
	mLXuc84I0V7UNdXHBTG66pLbCxSMjlFhK6WCXNhg4Dlp9UW+xgJEakOUrD8ZgPCFojVB
	Tdiuti/mPrsZmkQewTRjT9rvpj9QC/eevyvblldYmg4T9bAxAcEqfwvKGSh4DVjzWoW0
	arwhC/BbHqniuXOz3d9DIwxfrl4JOvCg4cWW7+cfGVBBm4VmB6rCSWfl7Yrl0l0j+mTF
	KaGCk5L3YgaKDNNDEpOFTBRvZVVVNxqtHAEfCU8ehJeXNfIldG5zoQsK7pwGRYaNYytY
	3f/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wvmmOxcJ/A2vihavxjQ6uMKZmuUThWH7nTFDlBvAVQc=;
	b=YKgha1GWX62YAWOUFTr9NfkgOb5CcgcjXce/Oxsx0gqEqozXDFtzuu2uuHER5Ib+Q1
	g3+kaRa+f60LJkUY8TxOoQCVw7xG1ArSQHWb+tuQtJ4JqGbgcd+fhYmxqAfUvIso0mdy
	qeOXmJKj23B2NgtFfl2PKs4Ys4fv8YYao6S70Xw9hwrawV8IOMr0pDBobMGllyisBkCa
	FFA8cidVf0MTfAv1PCKXB11gIw1lCy4rGSI8AcQdUO2tG94tmYnTaZ/hcDbzWMHdpEkm
	a29b68SaPQ67YgzN/j4Qc0+kjAwFXEjhGRKOlIajvOLWT+HgLN3NcQY1FC1rS/I3cifo
	Bcww==
X-Gm-Message-State: AHPjjUg24zzZSPrtNozWJry2ByuLc5F7PJExTZhQi1ME52Q81HSBREzb
	L4lKA5MmAJnw2qIN
X-Google-Smtp-Source: ADKCNb5TevznYBtwAvv0mfmrIZIylwh5lWLtSYJbjU3dDMZZf8g/pfCY6OkqbJGz8jP/sn3wLSAu3Q==
X-Received: by 10.84.232.8 with SMTP id h8mr1456178plk.62.1504546468285;
	Mon, 04 Sep 2017 10:34:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	q66sm11078482pfb.132.2017.09.04.10.34.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 10:34:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Sep 2017 10:34:19 -0700
Message-Id: <20170904173420.20442-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-networking][PATCH 1/2] netkit-rpc: Link libtirpc on musl
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
X-List-Received-Date: Mon, 04 Sep 2017 17:34:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
index 75ec07cfe..9487fdc2c 100644
--- a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
@@ -4,12 +4,15 @@ SECTION = "net"
 LICENSE = "SPL-1.0"
 LIC_FILES_CHKSUM = "file://rpcinfo/rpcinfo.c;beginline=2;endline=3;md5=3e6339e3ce266e1122c5ba293e04bc89"
 
+DEPENDS_append_libc-musl = " libtirpc"
 SRC_URI = "http://sources.openembedded.org/${BPN}-${PV}.tar.gz \
            file://gcc4.patch \
            file://0001-rpcgen-Fix-printf-formats.patch \
            "
 SRC_URI[md5sum] = "67212720482ea1aea9182a98653a9642"
 SRC_URI[sha256sum] = "421d63b414162237a72867061f1bd3e3752a0d962cd5d30b5e933ddad8a14d3b"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+LIBS_append_libc-musl = " -ltirpc"
 
 do_configure () {
     ./configure --prefix=${prefix}
@@ -18,6 +21,7 @@ do_configure () {
     echo "LD=${LD}" >> MCONFIG
     echo "CFLAGS=${CFLAGS}" >> MCONFIG
     echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
+    echo "LIBS=${LIBS}" >> MCONFIG
 }
 
 do_compile () {
-- 
2.14.1


