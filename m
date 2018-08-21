Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 40DF47900B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:03:30 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id k19-v6so8047280pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bOeRWG5tkM+nT4CQW/crkqEzf7OCq2FIzbs0TV7QfAo=;
	b=S2P7Z2WCGEEH3h9uNjBKE23w1uV79FSe74S9fAUsaa1z50Rbf23xehmthhcN1yuHrs
	f71oQUKiHaNOrsFTmgmF2HE1LwvgRw0IeWXq5lRLTuwhahfeokkyFAhNgsXcKs3JvB1D
	7BBoRESpGJx1MrJr+KFX+/OWPPpJldphpBx33qi/1Y4W54tWVHNsC+cG4n3a9MJIt0yK
	VEdPiWqFgy/dpu2RLpt33ZBaZCpS338TW79lwGh+MnSYisykNqyKOJoLRAMK1OPxFmbL
	nJNYS9UUFS2+EfowBai+SzScAxj1q1ycT4ufy0E2eroZnVyDNIUn3d8s/2K3TKTTQ17K
	aLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bOeRWG5tkM+nT4CQW/crkqEzf7OCq2FIzbs0TV7QfAo=;
	b=Nscez5ApjWc0XDbUn8qJgG2z/vkNxFqRLb2IOe3FROBEkCKuUaunfa1IYUEi8HKQaN
	J6xRKdgs+c7PcDyGUSiPkVGP9pl48Yg13zvJk0n4YpKb0zaI2PcRM6GMn/lx4ZGHC/q7
	urn/twjEKLhrHH2NJqfVVXFcPy+X3UpK5wdzNTcx2rT4Zy0m6UO+PRc9j84I240CVUNo
	J2XDnuP3iXenJI7ZzaEczWdjMEBJy+MxSUxnW+rJq867aJEBllIawk8QhuJROBg38QZr
	h51JcNQJOlSbfcbKpBXxUaSBLaIYyXZnJcPUQ4kZSYbUvuyZrL5xWZr8qXAvJWNSBtAq
	6uCw==
X-Gm-Message-State: AOUpUlEfMsP4/SMwlyfTbuk7ySOAnPrh0hHgafTxHsBIulIWKwGOFRMU
	TRWf3qN/oiPZwUDDioupAfb0Ta90
X-Google-Smtp-Source: AA+uWPygF5mdZI0lKMpQIjIkqbVPcVxL2HtXdH9vZ/QAE7AK5MKDHW73ACwC0BV8GNFj02Wqyh90kw==
X-Received: by 2002:a65:62cd:: with SMTP id
	m13-v6mr46214477pgv.280.1534835010936; 
	Tue, 21 Aug 2018 00:03:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	l84-v6sm21214669pfg.3.2018.08.21.00.03.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 00:03:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2018 00:03:19 -0700
Message-Id: <20180821070319.36295-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821070319.36295-1-raj.khem@gmail.com>
References: <20180821070319.36295-1-raj.khem@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 5/5] recipes: Exclude non-buildable recipes from world for musl build
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
X-List-Received-Date: Tue, 21 Aug 2018 07:03:30 -0000

These recipes need to be fixed for musl, until they are needed
on musl lets remove them from world builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb      | 3 +++
 meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb     | 2 ++
 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 3 +++
 .../recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb         | 3 +++
 .../recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb         | 3 +++
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb             | 2 ++
 meta-oe/recipes-kernel/crash/crash_7.2.3.bb                    | 3 +++
 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb  | 3 +++
 meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb              | 3 +++
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb                        | 3 +++
 10 files changed, 28 insertions(+)

diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
index 0c97960f8b..4fe6893fac 100644
--- a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
+++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
@@ -38,3 +38,6 @@ DEPENDS = "bison-native"
 inherit autotools-brokensep
 
 EXTRA_OEMAKE = "BIN_GROUP=root MAN_GROUP=root RDIST_MODE=755 RDISTD_MODE=755 MAN_MODE=644"
+
+# http://errors.yoctoproject.org/Errors/Details/186972/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb
index effe956999..c534c6206b 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb
@@ -70,3 +70,5 @@ INSANE_SKIP_${PN} = "dev-so"
 
 RDEPENDS_${PN} += "bash python"
 
+# http://errors.yoctoproject.org/Errors/Details/186970/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index f08256d31e..03dd96338a 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -100,3 +100,6 @@ RPROVIDES_${PN}-server = "rshd"
 
 RDEPENDS_${PN}-server = "xinetd"
 RDEPENDS_${PN}-server += "tcp-wrappers"
+
+# http://errors.yoctoproject.org/Errors/Details/186963/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index 113f89b7f5..9b8af27f88 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -73,3 +73,6 @@ FILES_${PN}-dbg = "${prefix}/src/debug \
             ${bindir}/.debug ${sbindir}/.debug"
 
 RDEPENDS_${PN}-server = "tcp-wrappers xinetd rpcbind"
+
+# http://errors.yoctoproject.org/Errors/Details/186962/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 9fe3d6e51c..2fadf0334e 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -59,3 +59,6 @@ ALTERNATIVE_LINK_NAME[telnet] = "${bindir}/telnet"
 SRC_URI[md5sum] = "d6beabaaf53fe6e382c42ce3faa05a36"
 SRC_URI[sha256sum] = "9c80d5c7838361a328fb6b60016d503def9ce53ad3c589f3b08ff71a2bb88e00"
 FILES_${PN} += "${sbindir}/in.* ${libdir}/* ${sysconfdir}/xinetd.d/*"
+
+# http://errors.yoctoproject.org/Errors/Details/186954/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index 3a71fb9790..5154208175 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -30,3 +30,5 @@ do_configure() {
 do_install() {
     oe_runmake prefix=${D}/usr PPPDIR=${D}/etc/ppp/peers install
 }
+# http://errors.yoctoproject.org/Errors/Details/186959/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.3.bb b/meta-oe/recipes-kernel/crash/crash_7.2.3.bb
index 66d740af93..45a26545d9 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.3.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.3.bb
@@ -115,3 +115,6 @@ RDEPENDS_${PN}_class-cross = ""
 # Causes gcc to get stuck and eat all available memory in qemuarm builds
 # jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
 ARM_INSTRUCTION_SET = "arm"
+
+# http://errors.yoctoproject.org/Errors/Details/186964/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
index 27348f750c..bae5cf4f9f 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
@@ -42,3 +42,6 @@ do_install_append() {
     sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${sysconfdir}/init.d/minicoredumper
     sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${systemd_system_unitdir}/minicoredumper.service
 }
+
+# http://errors.yoctoproject.org/Errors/Details/186966/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb
index efc56fe8c4..6c2176f79c 100644
--- a/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb
+++ b/meta-oe/recipes-multimedia/alsa/alsa-oss_1.1.6.bb
@@ -41,3 +41,6 @@ do_configure_prepend () {
     touch NEWS README AUTHORS ChangeLog
     sed -i "s/libaoss.so/${LEAD_SONAME}/" ${S}/alsa/aoss.in
 }
+
+# http://errors.yoctoproject.org/Errors/Details/186961/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index 1ee6573bdb..09290909d6 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -63,3 +63,6 @@ do_install () {
     done
 }
 RDEPENDS_${PN} +="bash"
+
+# http://errors.yoctoproject.org/Errors/Details/186956/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
-- 
2.18.0


