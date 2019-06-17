Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0007E508
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 05:24:48 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id s24so3581292plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2019 22:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bqCuQ8dPDOpb9DpTgpZTmFeh3etK9YkTzrTk1UeYAno=;
	b=OVX56YH/2NSt5D2Eks37Z2k5gYtgo9gwVaIy+IT9iryKI54SnmugszTRTrgtWefcRL
	9boHm5uOx/nNIP524WTw283ScHVBmCyHM7U8yrZUa7vZSfZu3gyC0xG1oRHRiTG+QYnT
	ItKeTU2t7wxqCtRXRGJrowtyFCiwsA12O1HbzPY06bru03g1VW6F5cfrVfp0djM62JoI
	HCKBzJm/F/fqn46MPEfbn2ZyQY/w6uxTawNeceU+C2Yz07II82DTH9wrUSlc2yHNvqMC
	7cy8MpNxZX176U/pnUwRSxgTwYdgsrvIiBJzpKPEXp59cLLOC+UWwaETlbwJQ/BNHDzL
	MS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bqCuQ8dPDOpb9DpTgpZTmFeh3etK9YkTzrTk1UeYAno=;
	b=rhJGFDQ+DQ17qR9wao0grJHKXnvFAHGLFxgKvxsSg3FOUV3IneLYZBFYqHxPMfHdEb
	5oA6geSac/9C4J2sEILRxRZLLKq+QrUFbxX5hDpF/qvv3KkApRfTQkTg4dl0pCUBWINO
	cvPEg9iEjNgFyUOoE3XUUAGhDuqNSWuOwfYlQlCob3lv1PuSc80MJ/R+s8Tkx+1SamNm
	W6iGKQxeQCfe6UDPY5bER/4lcA9Z8a+VjaIovIvDg1Zpy89xdZefqx7S1n8qr00XUXE2
	WS7m5CoqGgfbCA56qbKdnNoq+R2sXczMi2DE9dYunK5RSY74vKl34UZKDNyWBgqz5u/Z
	RAew==
X-Gm-Message-State: APjAAAUJUEUnfML/kRGvlLZbLjtGoDwPb/695zpZPfISA15JKIUsif5e
	TpeybOrY2kIxPN7hrXhxiUQO9SKH0gg=
X-Google-Smtp-Source: APXvYqxolc65kSY98Q5jhzstK8NTs0/vUATYmcvIj+pAPlz8aaG2SltiV85VVTSs/Tg9lcL4TmOPAw==
X-Received: by 2002:a17:902:2ae7:: with SMTP id
	j94mr21874568plb.270.1560749089722; 
	Sun, 16 Jun 2019 22:24:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3c7b])
	by smtp.gmail.com with ESMTPSA id
	c124sm10156911pfa.115.2019.06.16.22.24.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 16 Jun 2019 22:24:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Jun 2019 22:24:39 -0700
Message-Id: <20190617052440.18958-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617052440.18958-1-raj.khem@gmail.com>
References: <20190617052440.18958-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] stressapptest: Implement reading sysfs and use it if sysconf is not there
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
X-List-Received-Date: Mon, 17 Jun 2019 05:24:49 -0000
Content-Transfer-Encoding: 8bit

This helps in building on musl platform where _SC_LEVEL1_DCACHE_LINESIZE
is not available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../read_sysfs_for_cachesize.patch            | 72 +++++++++++++++++++
 .../stressapptest/stressapptest_1.0.9.bb      |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch

diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch
new file mode 100644
index 0000000000..8c251aeb97
--- /dev/null
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest/read_sysfs_for_cachesize.patch
@@ -0,0 +1,72 @@
+sysconf params like _SC_LEVEL1_DCACHE_LINESIZE are not universally
+implemented, therefore check for them being available, if not there
+then read the sysfs directly to get the value
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/sat.cc
++++ b/src/sat.cc
+@@ -1482,15 +1482,47 @@ int Sat::CpuCount() {
+   return sysconf(_SC_NPROCESSORS_CONF);
+ }
+ 
++int Sat::ReadInt(const char *filename, int *value) {
++  char line[64];
++  int fd = open(filename, O_RDONLY), err = -1;
++
++  if (fd < 0)
++    return -1;
++  if (read(fd, line, sizeof(line)) > 0) {
++    *value = atoi(line);
++    err = 0;
++  }
++
++  close(fd);
++  return err;
++}
++
+ // Return the worst case (largest) cache line size of the various levels of
+ // cache actually prsent in the machine.
+ int Sat::CacheLineSize() {
+-  int max_linesize = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
+-  int linesize = sysconf(_SC_LEVEL2_CACHE_LINESIZE);
++  int max_linesize, linesize;
++#ifdef _SC_LEVEL1_DCACHE_LINESIZE
++  max_linesize = sysconf(_SC_LEVEL1_DCACHE_LINESIZE);
++#else
++  ReadInt("/sys/devices/system/cpu/cpu0/cache/index0/coherency_line_size", &max_linesize);
++#endif
++#ifdef _SC_LEVEL2_DCACHE_LINESIZE
++  linesize = sysconf(_SC_LEVEL2_DCACHE_LINESIZE);
++#else
++  ReadInt("/sys/devices/system/cpu/cpu0/cache/index1/coherency_line_size", &linesize);
++#endif
+   if (linesize > max_linesize) max_linesize = linesize;
+-  linesize = sysconf(_SC_LEVEL3_CACHE_LINESIZE);
++#ifdef _SC_LEVEL3_DCACHE_LINESIZE
++  linesize = sysconf(_SC_LEVEL3_DCACHE_LINESIZE);
++#else
++  ReadInt("/sys/devices/system/cpu/cpu0/cache/index2/coherency_line_size", &linesize);
++#endif
+   if (linesize > max_linesize) max_linesize = linesize;
+-  linesize = sysconf(_SC_LEVEL4_CACHE_LINESIZE);
++#ifdef _SC_LEVEL4_DCACHE_LINESIZE
++  linesize = sysconf(_SC_LEVEL4_DCACHE_LINESIZE);
++#else
++  ReadInt("/sys/devices/system/cpu/cpu0/cache/index3/coherency_line_size", &linesize);
++#endif
+   if (linesize > max_linesize) max_linesize = linesize;
+   return max_linesize;
+ }
+--- a/src/sat.h
++++ b/src/sat.h
+@@ -136,7 +136,8 @@ class Sat {
+   int CpuCount();
+   // Return the worst-case (largest) cache line size of the system.
+   int CacheLineSize();
+-
++  // Read int values from kernel file system e.g. sysfs
++  int ReadInt(const char *filename, int *value);
+   // Collect error counts from threads.
+   int64 GetTotalErrorCount();
+ 
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
index 679201c528..aa1bf1cd32 100644
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ea9d559f985fb4834317d8ed6b9e58"
 
 SRC_URI = "https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz \
            file://libcplusplus-compat.patch \
+           file://read_sysfs_for_cachesize.patch \
           "
 
 SRC_URI[md5sum] = "d3a526c174c049dd7a1068dc74a62be2"
-- 
2.22.0


