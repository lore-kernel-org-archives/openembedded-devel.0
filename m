Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1FDCFB440
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 03:20:50 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.45286.1728271246929311468
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 20:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YwD5NaO9;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7c3e1081804so1558893a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 20:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728271246; x=1728876046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=86kF8/Kv1DvX5NtqDYgqcH/rHzf+emh2T2IRxTcv2VE=;
        b=YwD5NaO9twktEzk3uohY1pxOoF5CMMdw/egFh+YDpg6sTC9iTAusqBzBgT0q+V5pyg
         2BGRFSVa0bYZTtBWWmUuc0VmIYWTLydVQquU+EJrQCXnSUupkWLlVXG13e/tujsGKSvU
         Ig1nfPm8Q52VNROL+DFsk2jsn5HnCUvOWWkqUqKmZ/57odhkcmzo4huj9zdaz4DT+MAR
         sn9pOvZkbzSUdjkBOMdF331ylVNSH8B5+xR9e4gaJX10hlquMcA1mNE/jFXouLOtcwvn
         9kyvTvvXUfVxcc1UCKf9jLRx4uwHKS7K6666Q9mSpvfV6+gf1g9cavwNU9t2BkN6nEpm
         4JLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728271246; x=1728876046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86kF8/Kv1DvX5NtqDYgqcH/rHzf+emh2T2IRxTcv2VE=;
        b=uCOqbouTuxRvLhLYW32ooEswAFmJoZqO8BId5VKUd5D6cFy0/UiMey1bzkauUya8B/
         vweZimxREwC6OpEpnvQy4DR0a1cztK20b4jGjflVHAwiE9Oo4biUHH3EHx/G7uuRUzMu
         yNZgVpc7Lr93YXqkfP6/5jSvz4hwRQ+FG8yNZW0xAnxBuWmOxbhOBKUq/TSMNqW/jig0
         oFdAm3nZqH0Sn9RXoCQSs2loaukEeMc75tVfmWX97Ju7jPmzaWckY+cNyfqnNw3/8so7
         uxiyfc2CIQI9XBb+v4oSMlZKwrcPPsvy2ItzDAxiDKgw9Bpv6FpX9IbpI1JudqGLHsQK
         JRYA==
X-Gm-Message-State: AOJu0YwnHn0qfSsP4W3UY+V+PZgIXtnCbAD8cVI9njofFMLzp970qE1q
	QPecYUbzHEFebZErzccFEs67s1/v8Y7p9axPXwteVhtpMUG0RTBz1WR6kqsf
X-Google-Smtp-Source: AGHT+IHFRBLrie3EsZvrxUQjMLDgKoYGswlTv069aGCpntwMgX6DpaHKuscf5+JdLnEN4/pRokrJvQ==
X-Received: by 2002:a05:6a20:c916:b0:1d3:2922:2cad with SMTP id adf61e73a8af0-1d6dfac54f2mr15585196637.34.1728271245992;
        Sun, 06 Oct 2024 20:20:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7e9a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d45323sm3408846b3a.122.2024.10.06.20.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 20:20:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libhugetlbfs: Always use BFD linker
Date: Sun,  6 Oct 2024 20:20:43 -0700
Message-ID: <20241007032043.3158295-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 03:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112690

it uses its own linker scripts which assume BFD linker, therefore
when these scripts are used with -fuse-ld=XXX option they fail

libhugetlbfs/2.24/recipe-sysroot-native/usr/bin/x86_64-yoe-linux/x86_64-yoe-linux-ld.bfd: unrecognized option '--hugetlbfs-link=B'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb  | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index 00b34ad4ab..ccffc1ad82 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -48,12 +48,9 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 inherit autotools-brokensep cpan-base
 
-#The CUSTOM_LDSCRIPTS doesn't work with the gold linker
-do_configure:prepend() {
-    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
-        sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile.in
-    fi
-}
+#The CUSTOM_LDSCRIPTS doesn't work with the gold/lld linker
+# always use BFD linker
+LDFLAGS:remove = "-fuse-ld=lld -fuse-ld=gold"
 
 do_install() {
     oe_runmake PREFIX=${prefix} DESTDIR=${D}  \

