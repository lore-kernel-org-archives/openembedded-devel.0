Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 51C316011A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 08:31:33 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id e65so86492104pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 00:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+0LSooGpJEJ08xmzhIDRtbipeWmS3YO5S0tp5sVLKgE=;
	b=wtyXW+ZVr6/kY2anxDg1E07EowArluelQhkoEzpVAU5BN6f7S/7HOt0kJ+pNHjdWa/
	UtA4VankT5ECKA3YGq2pxSrEEhu2Zi2yLN4ZXy+zRY61rH3g6LyJPGBe2RVJL3dfXf+7
	xEJyP+hzaC2aRsEX+cPpHCYO7I437TZxBOnbQnUYFXSG80y1U5mx/12zspX2VSTM6A2i
	qxNI6NU3mDaC031iWhsqPkw8hluF23hHn3HaAT+ZtE6OTeYXsjcq1WZ1oxnr/qivbikK
	o1wX3Zo6HEeVD7HVf5AM6i5TSJ4VArXUfQkwBDzqW/e2Pv2xJORtiXNattpOePyNF8DV
	ENxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+0LSooGpJEJ08xmzhIDRtbipeWmS3YO5S0tp5sVLKgE=;
	b=apb9QuSJEl4IyZikejdgkYwcQ/+ezLkq9mDGbw122gwgD2w8fFd+isccaoqd4wW9+K
	jyrfSUv3eQ2L0+f3FVY5FpRtJTdgzvZwYnb/JEV2ncoD+g6zS3USx+QoTehvQ7tUo4tj
	V1WzCpavikwgJptSKf3HZ3Rovfvuor8knBbHdDf2CKYVctfbWPmoQ3zVMxgTdHSUfrod
	WLG0lvAreiix5v76poIsph2bNDhYdb1mKBljcwBFTodJJ9d2vf3n696qQ016vCAA1eUf
	+2Ntma0fUFPYop8CNgxH5rIFnyOm3Iji8vxN14GPLyw25nO1VxvHtJC6PB7y86RBA1te
	HeJQ==
X-Gm-Message-State: ALoCoQmBY8vLcQYNF0EXN0Pp88Uv3mP+6oegevksAZVsF8zWxB5n+fJ5UP5iorBkWb3tpccsIrKjDAM4L0awNPrcaJdVX+eKDg==
X-Received: by 10.98.75.3 with SMTP id y3mr31412230pfa.115.1451464293744;
	Wed, 30 Dec 2015 00:31:33 -0800 (PST)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	yn8sm93123457pac.32.2015.12.30.00.31.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Dec 2015 00:31:32 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2015 14:00:55 +0530
Message-Id: <1451464255-5663-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [meta-networking][PATCH] iscsitarget: resolve build error if CONFIG_IPV6 config is not enabled
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
X-List-Received-Date: Wed, 30 Dec 2015 08:31:33 -0000

The element skc_v6_daddr (in struct sock_common) is defined in
kernel source only when CONFIG_IPV6 is enabled. Hence, access
sk_v6_daddr element (i.e __sk_common.skc_v6_daddr) only when CONFIG_IPV6
is defined; to fix below error in world build:

-- snip --
/home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/kernel-source/include/net/sock.h:330:33: error: 'struct sock_common' has no member named 'skc_v6_daddr'
-- CUT --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../access-sk_v6_daddr-iff-IPV6-defined.patch      | 28 ++++++++++++++++++++++
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-networking/recipes-extended/iscsitarget/files/access-sk_v6_daddr-iff-IPV6-defined.patch

diff --git a/meta-networking/recipes-extended/iscsitarget/files/access-sk_v6_daddr-iff-IPV6-defined.patch b/meta-networking/recipes-extended/iscsitarget/files/access-sk_v6_daddr-iff-IPV6-defined.patch
new file mode 100644
index 0000000..4444234
--- /dev/null
+++ b/meta-networking/recipes-extended/iscsitarget/files/access-sk_v6_daddr-iff-IPV6-defined.patch
@@ -0,0 +1,28 @@
+The element skc_v6_daddr (in struct sock_common) is defined in 
+kernel source only when CONFIG_IPV6 is enabled. Hence, access 
+sk_v6_daddr element (i.e __sk_common.skc_v6_daddr) only when CONFIG_IPV6 
+is defined; to fix below error in world build:
+
+-- snip --
+/home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86/kernel-source/include/net/sock.h:330:33: error: 'struct sock_common' has no member named 'skc_v6_daddr'
+-- CUT --
+
+Upstream-Status: Pending
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+--- iscsitarget-1.4.20.3+svn502_org/kernel/conn.c	2015-12-29 21:57:50.547932217 -0800
++++ iscsitarget-1.4.20.3+svn502/kernel/conn.c	2015-12-29 22:47:25.254657627 -0800
+@@ -46,10 +46,12 @@ void conn_info_show(struct seq_file *seq
+ 			snprintf(buf, sizeof(buf),
+ 				 "%pI4", &inet_sk(sk)->inet_daddr);
+ 			break;
++#if defined(CONFIG_IPV6)
+ 		case AF_INET6:
+ 			snprintf(buf, sizeof(buf), "[%pI6]",
+ 				 &(sk)->sk_v6_daddr);
+ 			break;
++#endif /* defined(CONFIG_IPV6) */
+ 		default:
+ 			break;
+ 		}
diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index c96810b..b327f86 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -11,6 +11,7 @@ DEPENDS = "openssl virtual/kernel"
 SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://use-kernel-makefile-to-get-kernel-version.patch \
            file://fix-errors-observed-with-linux-3.19-and-greater.patch \
+           file://access-sk_v6_daddr-iff-IPV6-defined.patch \
 	  "
 SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
 SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
-- 
1.8.2.3


