Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.37467.1590434473977140956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2020 12:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:34754 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jdIeu-009cJh-7C
	for openembedded-devel@lists.openembedded.org; Mon, 25 May 2020 15:21:13 -0400
Date: Mon, 25 May 2020 15:21:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] use weak assignments for PNBLACKLIST in recipe files
Message-ID: <alpine.LFD.2.21.2005251518590.6822@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

Make sure PNBLACKLIST assignments in recipe files use weak assignment,
so they can be overridden in, for example, local.conf files.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index c39faef8d..eee96d865 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -69,4 +69,4 @@ RDEPENDS_${PN}-server += "tcp-wrappers xinetd rpcbind"

 # http://errors.yoctoproject.org/Errors/Details/186962/
 COMPATIBLE_HOST_libc-musl = 'null'
-PNBLACKLIST[netkit-rusers] = "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or directory"
+PNBLACKLIST[netkit-rusers] ?= "Fails to build rup.c:51:10: fatal error: rstat.h: No such file or directory"
diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
index 23fe2021b..c296c3bc1 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
@@ -22,4 +22,4 @@ do_install () {
     oe_runmake install DESTDIR="${D}"
 }

-PNBLACKLIST[drbd] = "Kernel module Needs forward porting to kernel 5.2+"
+PNBLACKLIST[drbd] ?= "Kernel module Needs forward porting to kernel 5.2+"
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 5917cfb3e..4a1bbe620 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -36,4 +36,4 @@ FILES_${PN}-dbg += "${libexecdir}/lowpan-tools/.debug/"
 PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${libdir}/python*"

-PNBLACKLIST[lowpan-tools] = "WARNING these tools are deprecated! Use wpan-tools instead"
+PNBLACKLIST[lowpan-tools] ?= "WARNING these tools are deprecated! Use wpan-tools instead"
diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
index 21d110aee..2e3da7d4d 100644
--- a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
+++ b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.0.bb
@@ -27,4 +27,4 @@ RDEPENDS_${PN} += "\

 BBCLASSEXTEND = "native nativesdk"

-PNBLACKLIST[nanopb] = "Needs forward porting to use python3"
+PNBLACKLIST[nanopb] ?= "Needs forward porting to use python3"
diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index e40e1cd26..eca8dfc7b 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -11,4 +11,4 @@ inherit module

 EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"

-PNBLACKLIST[can-isotp] = "Kernel module Needs forward porting to kernel 5.2+"
+PNBLACKLIST[can-isotp] ?= "Kernel module Needs forward porting to kernel 5.2+"
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 6683eccf2..1758430bc 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -32,4 +32,4 @@ python do_package_prepend() {
 }

 B = "${WORKDIR}/${BPN}-${PV}"
-PNBLACKLIST[bpftool] = "Needs forward porting to kernel 5.2+"
+PNBLACKLIST[bpftool] ?= "Needs forward porting to kernel 5.2+"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
