Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id EE09877EE4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jun 2017 04:58:46 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id f127so3759859pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jun 2017 21:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vWLLdgHLX4y3G6uce6ZNdrPFlBEnzlrcybzH5OqQqeE=;
	b=j4fZVZ9Y4afDNyQDfcSjfJRE82HdeywdPvuxAIucQmB38nHYTVqPz0IagkfahUUFH2
	aYp3dtOhOZcswj2XE4xrJhe6YPezEVBsz79f35dWnSPKs20wTTEFfC73bkvYzcCn39Xv
	Ouy/0dYIQgd08n5BfSunfU14mnSA24sDyD2wQI3Gizhh6kBI+gJlQ9k3/fJnBuSTi6bn
	/4PmmeGKoXimHQF/QM/xYzLZNp320cfTRE2wOaoB1rgQp1p3sz18azh0OSNc+EFgSAj/
	FVokltv6AqdB/pThkJzH3fn2h67Ca9W16DGrEXCg7iJyK2r91opKHoV2/GkZJ1O9yKVF
	ADaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vWLLdgHLX4y3G6uce6ZNdrPFlBEnzlrcybzH5OqQqeE=;
	b=BaMSQfzNFeMPkaLaHpHCHdsVD8ySdLH/Fm13EZ02aR9L3PhwLotCOxYZduKlvWWot4
	CT1R+jiyzFInwDMO7l7B2Jv5LSUuGKMsaTrfs27rHMWHWeo0ExLVzllvM3XhUayPJVM+
	yPTDKo5c4YcRNRqgo+cucbyuTg0X+82Dx8soX4Pr0ex/MsLvvXqTXk4wVevR3Bv439Fn
	7TfjvFdCCIqMnVWD0eySMz1TL4ovnD5zWB5NaVaOyje6gIZGjnInHH2AGZRJSP5aG6Oh
	Dg2YqY2A661pRXds5WcHWrCbQ/SLPsJQciZ9I8UWmqpx6lN8WOtB8Pp/KBBoFzSALErd
	ejfw==
X-Gm-Message-State: AODbwcBZ3GyyzzIIFPy0J/TRj2vc09UxMNyHa3mfiLBoXGVuHvunhhgt
	PlYS/HhaateUeK2R
X-Received: by 10.99.126.20 with SMTP id z20mr10272928pgc.158.1496465927561;
	Fri, 02 Jun 2017 21:58:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	o29sm40732836pgc.27.2017.06.02.21.58.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 21:58:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jun 2017 21:58:32 -0700
Message-Id: <20170603045833.8120-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170603045833.8120-1-raj.khem@gmail.com>
References: <20170603045833.8120-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] openipmi: Fix build with musl
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
X-List-Received-Date: Sat, 03 Jun 2017 04:58:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openipmi/files/include_sys_types.patch              | 17 +++++++++++++++++
 meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb     |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/openipmi/files/include_sys_types.patch

diff --git a/meta-oe/recipes-support/openipmi/files/include_sys_types.patch b/meta-oe/recipes-support/openipmi/files/include_sys_types.patch
new file mode 100644
index 000000000..58ec5d883
--- /dev/null
+++ b/meta-oe/recipes-support/openipmi/files/include_sys_types.patch
@@ -0,0 +1,17 @@
+include sys/types.h for u_int32_t
+
+ui.c:340:5: error: unknown type name 'u_int32_t'; did you mean 'uint32_t'?
+     u_int32_t     addr;
+     ^~~~~~~~~
+Index: OpenIPMI-2.0.22/ui/ui.c
+===================================================================
+--- OpenIPMI-2.0.22.orig/ui/ui.c
++++ OpenIPMI-2.0.22/ui/ui.c
+@@ -42,6 +42,7 @@
+ #include <fcntl.h>
+ #include <time.h>
+ #include <sys/time.h>
++#include <sys/types.h>
+ #include <ctype.h>
+ 
+ #include <OpenIPMI/selector.h>
diff --git a/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb b/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
index 82e8cac3e..9f4b0ff26 100644
--- a/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
+++ b/meta-oe/recipes-support/openipmi/openipmi_2.0.22.bb
@@ -30,6 +30,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
            file://ipmi-init-fix-the-arguments.patch \
            file://makefile-add-ldflags.patch \
            file://do-not-install-pyc-and-pyo.patch \
+           file://include_sys_types.patch \
            file://openipmi-helper \
            file://ipmi.service \
            "
-- 
2.13.0


