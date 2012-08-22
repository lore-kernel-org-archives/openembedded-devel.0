Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T4GfY-0000hx-04
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 21:32:48 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so1834865pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 12:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=H/cg52ZMSKG6wshEXV7Sm8UpvX0pwjTD63fkJaPH1rY=;
	b=wLITEIk+xYXqINNgy/6L3mbTCSpozxbZfBc9eD3fr9IQR6vysMr98voZ7YyqzLWvow
	Ndau2fw/laODFBlketKArsUFXkCxdKXGtXNL9wE1gp34cmAauJP2xzYf88CI44HY1l+N
	gkeWvmJNQJFm3uzHATQ3RLVkq2EHig65h1+tY6piveED0Uy0oQbDaC9wFLGCBdgPG7Py
	oqsmPrS23OaEpZ7ZwYmDLnd4Q+mkEEZFKVLTZBm3q26MsntYvEewS/8qavm/rVLiD8c+
	0cApNp11fJWX8teK46qoAfUGMzJZQZyYZbGkUmkdniyD9/Ef2plvM5UJgPb6M2dgt1E6
	o/Yw==
Received: by 10.68.197.136 with SMTP id iu8mr48077328pbc.151.1345663244458;
	Wed, 22 Aug 2012 12:20:44 -0700 (PDT)
Received: from eos.du.ae ([94.205.108.162])
	by mx.google.com with ESMTPS id oj8sm4254996pbb.54.2012.08.22.12.20.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 12:20:43 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 23:20:21 +0400
Message-Id: <1345663224-42350-4-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
References: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 4/7] tune-ppc440e: Add tune-ppc440e file.
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
X-List-Received-Date: Wed, 22 Aug 2012 19:32:48 -0000

* Tune option for ppc440e with hard-float.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 conf/machine/include/tune-ppc440e.inc |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 conf/machine/include/tune-ppc440e.inc

diff --git a/conf/machine/include/tune-ppc440e.inc b/conf/machine/include/tune-ppc440e.inc
new file mode 100644
index 0000000..1769e05
--- /dev/null
+++ b/conf/machine/include/tune-ppc440e.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "ppc440e"
+
+require conf/machine/include/powerpc/arch-powerpc.inc
+
+TUNEVALID[ppc440e] = "Enable ppc440e specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc440e", "-mcpu=440fp", "", d)}"
+
+AVAILTUNES += "ppc440e"
+TUNE_FEATURES_tune-ppc440e = "m32 ppc440e fpu-hard"
+TUNE_PKGARCH_tune-ppc440e = "ppc440e"
+PACKAGE_EXTRA_ARCHS_tune-ppc440e = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppc440e"
+
+# glibc configure options to get ppc440e specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc440e", "-with-cpu=440fp", "", d)}"
-- 
1.7.9.5



