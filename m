Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0077278231
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:13 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e199so17016230pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tK1JXJ/99Pi/L7IVwzWoB1fQ9+gT20wTgv9NycJWOTo=;
	b=B2SQHLuQTVjfAqEr/3C9zER0C80dkxBvi0p7Pil9IHDGyL7yWHpQLH2qH+BoYj7D1v
	aaw9dSuWnIWfNYY5HyzhjnxBeJB+Tb+cTO4K4nds5DWziPPzSdJNodjI631WZlmR1cPF
	xFU5xn6TRuww4CW1mY0a4mpsZwsrESOUixQOOt9TuR12nrcmsk7ZMquxWUFg/frrRjPR
	BKvU7UTSxR0GnZS7kx1/bJTDwgfQ+d+tv8+7/Z1QJwS6Gld0IXA5yVm+XfHirzRiqLyA
	mKPIT/gv8xho3mxGiNrLix4H7CJ/iXtIRUV3Ruu3RIld0Lu5JB9MdW03E39IBoSm53eZ
	IY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tK1JXJ/99Pi/L7IVwzWoB1fQ9+gT20wTgv9NycJWOTo=;
	b=aQv4RoEGSV8uIixX8qCQHxczpKC3RLrTAw4CUabcyCO6lN4CNgPMpE3s02qvGhGVe9
	gqKudwdtrWCvu0ZRyiHAcyWU+2Pfo0deL52roUk0gjb5mB78WGC3xjGnVrp+VtzWYsHM
	jMKfxkeuSX8ZntSyMm30OOLSAg1RGEiiTvs1/Pn2Garb3bL5nAGqaxUKy02828Pg2k/T
	SZNm48v4nZDfy68cJMCYqfFSb2kEw6E3B4ZuE6vUY2sPnrkSV4HLRdHstyWgKL9pyrvo
	taMgy2lR9Y+xXKjTEY1qUyDIWNGB49Xq+0++FUELEokf1lJjiyRlguY2s6HkK+p3oiyS
	ovIg==
X-Gm-Message-State: AKS2vOwWlDF4teCN+42B3fOcWnfjvwhSOU2ByqNaWtIDts7MDmqjrJaE
	fVlC5FzxvSsGX5vA
X-Received: by 10.98.68.156 with SMTP id m28mr2676227pfi.159.1498827614255;
	Fri, 30 Jun 2017 06:00:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:43 -0700
Message-Id: <20170630125957.3342-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/17] librcf: fix mips/mips64 build
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/librcf/librcf/mips-support.patch | 19 +++++++++++++++++++
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb     |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/librcf/librcf/mips-support.patch

diff --git a/meta-oe/recipes-devtools/librcf/librcf/mips-support.patch b/meta-oe/recipes-devtools/librcf/librcf/mips-support.patch
new file mode 100644
index 000000000..4a327f78e
--- /dev/null
+++ b/meta-oe/recipes-devtools/librcf/librcf/mips-support.patch
@@ -0,0 +1,19 @@
+Index: RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
+===================================================================
+--- RCF-2.2.0.0.orig/src/RCF/ByteOrdering.cpp
++++ RCF-2.2.0.0/src/RCF/ByteOrdering.cpp
+@@ -64,6 +64,14 @@ namespace RCF {
+ 
+     const ByteOrder MachineByteOrder = LittleEndian;
+ 
++#elif defined(__mipsel__) || defined(__mips64el__)
++
++    const ByteOrder MachineByteOrder = LittleEndian;
++
++#elif defined( __mips__ ) || defined(__mips64__)
++
++    const ByteOrder MachineByteOrder = BigEndian;
++
+ #elif defined(__bfin__)
+ 
+     const ByteOrder MachineByteOrder = LittleEndian;
diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 4c9683a66..1287eb014 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
            file://0001-Add-CMake-build-files.patch \
            file://aarch64-support.patch \
            file://0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch \
+           file://mips-support.patch \
           "
 
 SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
-- 
2.13.2


