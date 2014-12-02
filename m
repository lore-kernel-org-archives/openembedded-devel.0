Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id C033B72278
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 01:50:00 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kq14so12363768pab.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 17:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hoDCATNHkKFPnG2a91gwf/zeOp7j6v6zJmE3W6nfhoM=;
	b=VjE+Y2s9J54RnToFVAXfwsn0WUPShNpBIKFvNndAkL59QxtHkvrU6Febby166etb++
	3CmiJJH1KuCAH5JtVtFRzo8WbrzPiFIBH2PVYsGNu3QbuaRKj03jR4eTuKlIGJGKlVDE
	hUZ+PEPV6HuebJPTX23nkLeR338SzxEbCSdPwAM51hKbAqEi7B9dSDem4rmxKeRhPq9n
	76u2OShMHTMqbwY69lTKcHogdBRlIAxhSjElW52H5X/4zhANeJJLO+HuCeghVjuR9D89
	vCj6TwIGuDCaeC7h0v2vgWYfmYVsKP0IFIETSfaGZNiEAYYhfQOO0yfZff6P+5JD1+p3
	2tQg==
X-Received: by 10.70.54.37 with SMTP id g5mr32782976pdp.71.1417485000917;
	Mon, 01 Dec 2014 17:50:00 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id y3sm18606781pbt.44.2014.12.01.17.49.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Dec 2014 17:49:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Dec 2014 17:49:56 -0800
Message-Id: <1417484996-17551-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] New package: netkit-rpc
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
X-List-Received-Date: Tue, 02 Dec 2014 01:50:02 -0000

this adds rpcinfo and rpcgen

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-netkit/netkit-rpc/files/gcc4.patch     | 39 ++++++++++++++++++++
 .../recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb   | 41 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-rpc/files/gcc4.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb

diff --git a/meta-networking/recipes-netkit/netkit-rpc/files/gcc4.patch b/meta-networking/recipes-netkit/netkit-rpc/files/gcc4.patch
new file mode 100644
index 0000000..d54cea9
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rpc/files/gcc4.patch
@@ -0,0 +1,39 @@
+This fixes an issue when building with gcc 4.x
+
+https://github.com/openembedded/openembedded/tree/master/recipes/netkit-rpc/netkit-rpc
+
+Upstream-status: Backported
+
+Signed-off-By: Armin Kuster <akuster808@gmail.com>
+
+--- netkit-rpc-0.17/rpcgen/rpc_cout.c~gcc4
++++ netkit-rpc-0.17/rpcgen/rpc_cout.c
+@@ -101,8 +101,6 @@
+ 	case DEF_TYPEDEF:
+ 		emit_typedef(def);
+ 		break;
+-	default:
+-	  /* can't happen */
+ 	}
+ 	print_trailer();
+ }
+@@ -664,9 +662,6 @@
+ 	   decl->name,decl->array_max);
+   emit_single_in_line(decl,flag,REL_VECTOR);
+     f_print(fout,"\t\t   }\n\t\t };\n");
+-
+-  default:
+-    /* ?... do nothing I guess */
+   }
+ }
+ 
+--- netkit-rpc-0.17/rpcgen/rpc_hout.c~gcc4
++++ netkit-rpc-0.17/rpcgen/rpc_hout.c
+@@ -106,8 +106,6 @@
+ 		f_print(fout, "\n");
+ 		pprogramdef(def);
+ 		break;
+-	  default:
+-	    /* ?... shouldn't happen I guess */
+ 	}
+ }
diff --git a/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
new file mode 100644
index 0000000..fcc87b8
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "netkit-rpc includes rpcinfo and rpcgen."
+SECTION = "networking"
+HOMEPAGE="http://ftp.linux.org.uk/pub/linux/Networking/netkit"
+LICENSE = "SPL-1.0"
+
+LIC_FILES_CHKSUM = "file://rpcinfo/rpcinfo.c;beginline=2;endline=3;md5=3e6339e3ce266e1122c5ba293e04bc89"
+
+SRC_URI = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/${BPN}-${PV}.tar.gz \
+        file://gcc4.patch "
+
+SRC_URI[md5sum] = "67212720482ea1aea9182a98653a9642"
+SRC_URI[sha256sum] = "421d63b414162237a72867061f1bd3e3752a0d962cd5d30b5e933ddad8a14d3b"
+
+do_configure () {
+    ./configure --prefix=${prefix}
+    echo "LDFLAGS=${LDFLAGS}" > MCONFIG
+    echo "CC=${CC}" >> MCONFIG
+    echo "LD=${LD}" >> MCONFIG
+    echo "CFLAGS=${CFLAGS}" >> MCONFIG
+    echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
+}
+
+do_compile () {
+    oe_runmake 'CC=${CC}' 'LD=${LD}' 'LDFLAGS=${LDFLAGS}' 
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}${mandir}/man1
+    install -d ${D}${mandir}/man8
+
+    # remove strip flag
+    sed -i 's/install -s/install/' rpcinfo/Makefile
+    sed -i 's/install -s/install/' rpcgen/Makefile
+    
+    oe_runmake 'INSTALLROOT=${D}' 'BINMODE=0755' \
+    'DAEMONMODE=0755' 'MANMODE=0644' \
+    'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
+    'MANDIR=${mandir}' install
+
+}
-- 
1.9.1


