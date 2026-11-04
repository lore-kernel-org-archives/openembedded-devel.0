Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5171.1793782730411175392
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 00:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Kbk1hG7l;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b07db03f41so325164a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 00:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782730; x=1794387530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CQMGDBBUx9y1Hw9WcmVXq9pFRko7pyUGxZKghOYO9Y=;
        b=Kbk1hG7lR/sdcEyQrIvIZaZNCpfDnlEUYgW37xbbwFgIdIBWiY8bemWSxTAQ7jIB8n
         8riXTKpdPuZwcvZHwpZ76R5F1iPdQ4qLifIODppdsY5rRWJP3r4G9iGsgJvcmtRoA9KF
         rbyV1pb06dtcrBJ+E471Jl56wV7G8n0FttArJJmbPCxrcx1VbQuQg1VcPFgBYu7bOMQ5
         QMLO/PufC0ggVJlyq/MrP+62SZ/2SkDWkZX9vM6vCeulfDpcIIO/SdvxGTKlFelSL5nW
         LsQLyk0VXUSUJWlY7y0qseMBcRZHy+CpYOhxA/M75C1s8g58x7Hrm94GQeUd+PgWZmJR
         XomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782730; x=1794387530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CQMGDBBUx9y1Hw9WcmVXq9pFRko7pyUGxZKghOYO9Y=;
        b=ZcSYK3i/ibuuP4depfpyaTruhZdr8Dppgekq4FlVP17/pzold3917PH1MBMAwQZYfv
         5HlzACIvVID0knkHTmWYYIIiU/LmTGNTpuWSZhJ+uIelD/LXifJNcO9+Mi0Pymip1BIc
         bS9nggYsSxyt6ycjmowAyh+dTk3fe0EJirM3GOoCOcz5Ov+wKQs8GkJDL8gU2EtRwDKS
         g7ghMmgjWnmKPh1fLnGb8idzSjd9Lb5dW3OFMluJ2LwvAVIvTbc7wSEUv/eRbAcF1QNu
         1Dyx7rn/hPBXebAMCDh9A8MN/fkHPioSPNUzdz1p4HPGeRnopWV1X6AOGgAJl2Wn8Hn/
         RC2Q==
X-Gm-Message-State: APuU4Z9D+Lw/U6deQ84TLuLvZtBz3tNoTn61Z+DqQ5cPqikeQ5oACc9S
	VZ9k+5jUg15g53AWfp0/qe8afdk/6L5SIwpr+oc30+cPPJqTnWAt3rZ/ZbLqBQ==
X-Gm-Gg: AYBFou2kW+ICiu7W1TtHwVZux7TH+ykNKFTjFaSlhbt6eTvc0tIoTfp4qIfogKjucEL
	VC0Ra3hr/Jr4R358uWpdEKYX7Xg/IQGT7kRye3BekWj7zfS/CwJUe9ZgYKxkTYXNekRAtXX2kgS
	WofMeM3db1kC5tLO7F79Rp5fucou8OLSPTuk1CHDrOIK1Fs3Nb5jfpWxoS3Z0ywn94i/pwn0yI8
	yqPdveTArMw5cpgZc7P/QH+YOCBLV5EzwunYrTSSKn9ClPzkOd0qdkC+M/ghSQ8IL3jzXLFKJEn
	XBwfLakFXJh5GO5g8YLWEbU4sYgY4dvaUovve8ktY0JZL2JihAPW/4GTIcExs57oQe34kq/9EG/
	KlBlkgZ80bVjunnQJCd/RmCeGRBOO09SXw/l4qATRdHhEGprGhklFtkBRci79yw9rMEcmRwoEBF
	Ia0FxsZHXNHfFmiTBl7H95+odILNZa0GdJUqAtyQ0Y6taBlbDSRhvTsvx6c806jHV2ck9K8xkiR
	dw+QpZ1Wpk3WtKQFjCVEgI8TnPwBY/t4iVvk74de7kXm9soTbSR3sIaLMTab7lSlTBhpEXHceZh
	Mc/+Vg8TWaVb0Y9lQBdAtrDN9JkvaY+pvfseBG2nj3lliBb6qz4QR5QU9dOCLk78
X-Received: by 2002:a17:90a:f307:b0:3ae:9944:3bf0 with SMTP id 98e67ed59e1d1-3ae99443c7bmr8538732a91.34.1793782729659;
        Wed, 04 Nov 2026 00:58:49 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3139981a91.1.2026.11.04.00.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:58:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 4/4] ndpi: patch CVE-2026-116744
Date: Wed,  4 Nov 2026 21:58:34 +1300
Message-ID: <20261104085834.1877643-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104085834.1877643-1-ankur.tyagi85@gmail.com>
References: <20261104085834.1877643-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 08:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131838
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-116744

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ntopng/files/CVE-2026-116744.patch        | 33 +++++++++++++++++++
 .../recipes-support/ntopng/ndpi_5.0.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch

diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch b/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
new file mode 100644
index 0000000000..5794963ada
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
@@ -0,0 +1,33 @@
+From 00706d4da0b7a1f9eff61e5835a0a1cc22c9c7e1 Mon Sep 17 00:00:00 2001
+From: Ivan Nardi <12729895+IvanNardi@users.noreply.github.com>
+Date: Mon, 26 Oct 2026 17:35:39 +0100
+Subject: [PATCH] softEther: fix out-of-bounds read (#3298)
+
+Close: #3291
+
+Reported by HaiND (Nguyen Dinh Hai), Post and Telecommunication
+Institute of Technology, github.com/Haind03
+
+(cherry picked from commit ca9d819151606377ac53305583fe819748c69be2)
+
+CVE: CVE-2026-116744
+Upstream-Status: Backport [https://github.com/ntop/nDPI/commit/ca9d819151606377ac53305583fe819748c69be2]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/protocols/softether.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/protocols/softether.c b/src/lib/protocols/softether.c
+index 379e743f7..c6f5d131e 100644
+--- a/src/lib/protocols/softether.c
++++ b/src/lib/protocols/softether.c
+@@ -200,7 +200,8 @@ static int dissect_softether_host_fqdn(struct ndpi_flow_struct *flow,
+   payload += value_siz;
+   payload_len -= value_siz;
+ 
+-  if(strncmp(val1.value.ptr.value_str, "host_name", value_siz) == 0)
++  if(val1.value_size > 0 &&
++     strncmp(val1.value.ptr.value_str, "host_name", value_siz) == 0)
+     got_hostname = 1;
+ 
+   for (; tuple_count > 0; --tuple_count) {
diff --git a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
index 6eadf8ba62..80890b1f27 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 SRCREV = "375f99ef9fb4999d778b57bbeece171b3fa9fba6"
 SRC_URI = "git://github.com/ntop/nDPI.git;branch=5.0-stable;protocol=https;tag=${PV} \
            file://0001-configure-Stop-embedding-pwd-at-configure-time.patch \
+           file://CVE-2026-116744.patch \
           "
 
 inherit autotools pkgconfig
