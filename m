Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D09BCCD18D
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.7964.1759409978316894793
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gwpzSzHf;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7322da8so212660266b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409977; x=1760014777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRd7TkFF3wIBXVOZPciMey3WQxUTe7FJe3bh35Bn94c=;
        b=gwpzSzHfgIzUUIzCjtVm5Ms/pi5mU5f7FZMTqj6ytTW0IoIxOwdZOjqrTfA6GvBQhD
         tK13fcQ/WniROINmxiU9i4gWa3bzq+sB0mYZR5HDy7DyNM1I/3bgdke6B/WYyUxE4peo
         Z6yp+MwMCx5kbQtyJbSIUhPe/31zhk7Ngzv56wewmVGSxcxX7Nf96uf8osDk326aoTZ+
         sJeo7fnaxsH0+uVzCmKn2fFwf9ij2Ss1l9fAs3oPqtWtwHJ+CO5mUKIErpApFEcvkLEH
         kzj2hLhALYTE0nxbVM3mkqWiMrvY/O+tsIH/MuhiIYQ3KGdznSIlfVQOyJVEhyvWSJHI
         aAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409977; x=1760014777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRd7TkFF3wIBXVOZPciMey3WQxUTe7FJe3bh35Bn94c=;
        b=fviLez/R3CT9gkKwexBvA2DdNz73BHgDFod4xVfRw9AHc/TYn3PIU1yeQv+OcPtsf0
         WiwpATtVyDCZiMMpdlQSm5mFRk6Rus7kYzDbVwhnb+bPAOqW7tZzOm8MsERk3UbTrgsb
         yE/n+N+MBjddQJNVrKoqPfAd9XNLmQ3T/KNoxurNFdPrqGNkxdNXBYqfq+b3HTM6UXGt
         EY+JUnb+oDU28+xIaWumP/qKApwkb42j6ONkAs+ffnr3p2esWEj2+Wt/dxNaIzlVKq1h
         o6qOpOMoFHEEwmp5FQACoRggxs8DYPMeqpzztZBYxpiJdQxBGqq0OJecX7ixbokQagMD
         ya6A==
X-Gm-Message-State: AOJu0YzOpOlooS5ARXLqzJJYKpOVc68IiwwJ25bI0lgBx9Tf8tb+Ao5p
	JcXf77xO/4TPQYWqZjYOILNyhDr7y/z+Z7CvqRNGu6Jd/H+RghJpgTWwJWxCdw==
X-Gm-Gg: ASbGncvDiMuP0fgRVcZy4EjdUC4eF4Olxyp9tPMWi/oQsQU9O0OELGg10VFDa6sqekm
	V1Ta9Vk/F5MMuiBh0+eSABNoi1Y7ry2otFaKAIu2lJCJzclPiuHXrUmhOd3GkBGGVUtd97iJ9GJ
	6mS/0ssgA70IX6XAphmUhZTUWIwmdal8HMV1XvGTQJoZBUY+a556hpVypmLltSnZbLgQAr7UNQz
	OLWe0WHjRdaTr+SQa5kJ8YZlhl1xwm5EAiya5oJxcviN0Ea+fCohDZrshenwRGmYLLMneEJtUoM
	YojNow6nbqX/a+PjdVt0nL0Oa1ydJfQT35/uWiNIK+NfTqnvkGHO41hVBn8dons/UYZdpAKtd62
	g/HpmgvdLUK/26J118kWQR5c4YxOlalKs5wDRYYsoCIuwdnnjRBuqjlo=
X-Google-Smtp-Source: AGHT+IGmXzS67n3MdV3HdaO0XTzIen64zHlZnZe5BLE/+dJCbb5khFuz4R1VcMtUkx2GgLCPZfscnA==
X-Received: by 2002:a17:907:3fa5:b0:b3d:f985:7dcd with SMTP id a640c23a62f3a-b46e8b83842mr892962466b.31.1759409976595;
        Thu, 02 Oct 2025 05:59:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 12/26] procmail: patch CVE-2017-16844.
Date: Thu,  2 Oct 2025 14:59:12 +0200
Message-ID: <20251002125926.2624522-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120181

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian.
https://sources.debian.org/data/main/p/procmail/3.22-26%2Bdeb10u1/debian/patches/30

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3d97f4c13d5f5810659e107f6461f0b63f6fa92a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../procmail/procmail/CVE-2017-16844.patch    | 20 +++++++++++++++++++
 .../recipes-support/procmail/procmail_3.22.bb |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch

diff --git a/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch b/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
new file mode 100644
index 0000000000..6e04989c33
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
@@ -0,0 +1,20 @@
+From: Santiago Vila <sanvila@debian.org>
+Subject: Fix heap-based buffer overflow in loadbuf()
+Bug-Debian: http://bugs.debian.org/876511
+X-Debian-version: 3.22-26
+
+CVE: CVE-2017-16844
+Upstream-Status: Inactive-Upstream [lastrelease: 2001]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/formisc.c
++++ b/src/formisc.c
+@@ -103,7 +103,7 @@
+ }
+ 							    /* append to buf */
+ void loadbuf(text,len)const char*const text;const size_t len;
+-{ if(buffilled+len>buflen)			  /* buf can't hold the text */
++{ while(buffilled+len>buflen)			  /* buf can't hold the text */
+      buf=realloc(buf,buflen+=Bsize);
+   tmemmove(buf+buffilled,text,len);buffilled+=len;
+ }
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 4cfac9b49e..827770e4b9 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://from-debian-to-fix-man-file.patch \
     file://man-file-mailstat.1-from-debian.patch \
     file://CVE-2014-3618.patch \
+    file://CVE-2017-16844.patch \
 "
 SRC_URI[md5sum] = "1678ea99b973eb77eda4ecf6acae53f1"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"

