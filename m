Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7559.1792575023756180672
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aC0qy++C;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so1372365eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575023; x=1793179823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ia57Yt5XUYUZCmhKfVbWDfQ1WThh7M6NiDd4GdflPs=;
        b=aC0qy++CnaymRUtw3Kr/M1WtdvnMl8w8KcxIho3M9XLN3I/6Iy8pGO2psYx/2khaYZ
         rifeN6uB/mqOnYC/DQ2aKKT5MrV6pGk12OlMtPl8eVPkL5O4opOglFeahpic1CE2k2YB
         bfmfqBKbHzlTRrTPJviKi5gWJoAFYVF6sI3/9kGb7AD9ZxYSjZg8QkBeQhcMBzwiX0Hc
         b3TpqErMs0Cx6UEigHXVTj0jn7hgc5vdYdZA65pn6mcbkFDF6RZchUeBZOR5nU4L2HsX
         ntWK6D4i6czfdIzrI8CGIYLeVUsjCBt7LYi5uRDUaT4LRaIE1z8vFrySfExmuxLoE4jA
         N26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575023; x=1793179823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Ia57Yt5XUYUZCmhKfVbWDfQ1WThh7M6NiDd4GdflPs=;
        b=JV3TaQxueNtYhA0he8F1oPqObdusQ8oYh6gfBFHs1VFjyIiL2ek9WXnlUZ980QBgg6
         dZZ6rT7DeqDWR1z85NrA+NWMrNzTODEUYeFRChq7kl1hybrOOEsLK0rQ8B4QExjFdTYe
         Bq0XpFsSbBlfXwEQW0hKF9TMpXpOe8PybEikxWMlBi7lAoZXEQfQHpNQ8MIFVwytYGDt
         u3dw3sUjlxT4jTQKcgZfSoAoLHLTT/0zhUcBENKJKqbj8TASSMLccMctofDk0KtV0Gw2
         BVdLuDwqr3MVjbb8ts0v3OpVpQ8exV60FGrCsCdl8u/E89nDkUeGe1AyCUlGpNMfBDvX
         C3TA==
X-Gm-Message-State: AFq9FYIoyNuCXkFZb0uiyEE9Cm6PMcLR07u+AWK0G5iKQjr0EdB68zha
	cf/ikukrHveBZnvoTZf5RsEpOOxLoyMjTCX4n+UjGb8ea2EJXcRw4mYMLJ+ePA==
X-Gm-Gg: AYBFou2JJIHBdblkAeBsf6k/zROSqRjxeI49mTHpSeoyQLNsROp90Fel/7yRHnx3rs0
	SE9LxEKZ3ZL6UDDdk6Jr0wrSYg8l+eWbOZVvMK8MtNWeqpJI1y6Vz4yl7l3u/m5S9FIoTxfisb3
	g2Lyxv3xJ9a8evGe7zGPlYcnzNOD5RZzivd99Ifq4sDxE8X9RIeFCLkwG1C1Z/xaO4XKdGk5yCT
	TqW1q7FqBB32tuj7zembh23VFMEA8CKFdGaHf7GfmgPsmkLi368USPaXmzPY9nuUivnsiSKTosK
	l7lWMuToZlH2m/BfLB92EhQohQAl4XZyFq8DAMNoCaFR77IdnviXEmzgOGqrGm0nOBoKC+owEgx
	ysDJqiIYlxQEarcrqGwC/oErrfajpFEGhxtexge5W1VeG/XfjoXb3/AB8PENo9OyLot5lEcutuK
	Uo8OBzIQaSh6DVXBFOjUEGGKa71Q7HoRcqXQzgeFtkRuquvm/hWOpvCOgFhlLk4nauLC4FLXR0y
	ngB6VLHMKzH/Vwj3tXkkuCWhMlqzsA+3oiMa108CGa7NEiiOjiV+vf70UijsCpd2+C/TuEGAz7K
	w2N/po+i1tm1TUUQVN3P0tnJKpYOmHo=
X-Received: by 2002:a05:7022:f512:b0:16f:c9db:c5af with SMTP id a92af1059eb24-190a437d52emr1917050c88.11.1792575022958;
        Wed, 21 Oct 2026 02:30:22 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 34/44] nmap: patch CVE-2026-72712
Date: Wed, 21 Oct 2026 22:28:47 +1300
Message-ID: <20261021092857.3585453-34-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131221
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-72712

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nmap/files/CVE-2026-72712.patch           | 46 +++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.99.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch

diff --git a/meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch b/meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch
new file mode 100644
index 0000000000..f5e81aac0e
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch
@@ -0,0 +1,46 @@
+From 120d13b8aca52ec306e50eae9a74fb1bfe49540a Mon Sep 17 00:00:00 2001
+From: dmiller <dmiller@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Thu, 11 Jun 2026 18:31:31 +0000
+Subject: [PATCH] Stop parsing on a zero-length packet option
+
+Fixes #3368. Closes #3373.
+
+(cherry picked from commit 7ef4ee030a0023fe22616387a000032e1a678b6a)
+
+CVE: CVE-2026-72712
+Upstream-Status: Backport [https://github.com/nmap/nmap/commit/7ef4ee030a0023fe22616387a000032e1a678b6a]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ nselib/packet.lua | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/nselib/packet.lua b/nselib/packet.lua
+index ec6db40a2..e17972d88 100644
+--- a/nselib/packet.lua
++++ b/nselib/packet.lua
+@@ -686,10 +686,7 @@ function Packet:parse_options(offset, length)
+   local opt_ptr = 0
+   while opt_ptr < length do
+     local t, l, d
+-    options[op] = {}
+-
+     t = self:u8(offset + opt_ptr)
+-    options[op].type = t
+     if t==0 or t==1 then
+       l = 1
+       d = nil
+@@ -699,6 +696,11 @@ function Packet:parse_options(offset, length)
+         d = self:raw(offset + opt_ptr + 2, l-2)
+       end
+     end
++    if l==0 then
++      break
++    end
++    options[op] = {}
++    options[op].type = t
+     options[op].len  = l
+     options[op].data = d
+     opt_ptr = opt_ptr + l
diff --git a/meta-oe/recipes-security/nmap/nmap_7.99.bb b/meta-oe/recipes-security/nmap/nmap_7.99.bb
index 515623d63d..0cbef990cb 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.99.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.99.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
            file://0004-libdnet-fix-PF_PACKET-conftest-nested-function.patch \
            file://CVE-2026-58058.patch \
+           file://CVE-2026-72712.patch \
            "
 SRC_URI[sha256sum] = "df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2"
 
