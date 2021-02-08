Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.28541.1612742476752706342
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 16:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lPOuH2pb;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id z21so9109403pgj.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 16:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idc1XBv6CGp2vW/cfUy42OJEkl9atrQ1AWQZsHLl8DU=;
        b=lPOuH2pb73bxavnaAllNNRsUH7n4ofnsbvvXQGekvNphyCLQfuI4JCBJ/S8BGnsZ1f
         4HhA586ClKW6Kd6JRJiygy0Zxvc2LviVDkMHpTeg5k6rPNs5nMlJsK7KuJ4YvkX0iMbl
         /ZZwpKYOFIfAxVp1bb0G69k9qXFW+dWgCISKZJTAe5BnJadh3VFyPZabdQFmpxd6S4Jl
         VmamDcbQK5y4p80sBjOOGCeXDBlzVs5KcLf5blWOr9KpqiJzFCJ/h9OJtxu4GLXTjHgS
         WQy04TYW0krj/9eIq078sXWHpPjEaWJBaDYau9VzqUQuIXSMRyxRqFJb3mryabXgUxh3
         OnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idc1XBv6CGp2vW/cfUy42OJEkl9atrQ1AWQZsHLl8DU=;
        b=UHJ/JKU9rfVhe61FwZZNOYPUjnC06Yp0nqTWEsglrWmuruYF75LUds5ozM/rKO2Ffq
         BAtufpQOvjGZlmtomwzQfcVVsPzZfNekdD3ozMYULK/I6gNZnVpZW4RkeAJW/Uh31VQZ
         4LZg0n+lhBgV44oQXjfEMEYkVohlaa8/5rcLZIOUor2os2JonajqKgycllfx6kylSFXM
         NiRGvmrN/pkMDOhwD8X8gfg73WAFQgeNQd/Bp24l3FodvJuwN7XRKk2FdbOQ63ougoEu
         wvLKfz9UDWc3R1gWvP3Ai3Zmmq86+G87VCuQC5JxalFby6MmyCBdJsOJ0eSonScOpnS2
         /D7g==
X-Gm-Message-State: AOAM531SW99onCb8vgT2qfqvDc0pqeocBE6AY+ds1m+FcLFxaxmgH8+G
	o/ylQmFFmWowndKJ4460m4cxDQln9BOATw==
X-Google-Smtp-Source: ABdhPJxkF6+4lkPeZMQXbMlGjjJgE+5+pL2wM6YrAXxxGR1cuJRLJlTZR0/FoBhQ786JJB9zgMxB8w==
X-Received: by 2002:a63:2352:: with SMTP id u18mr15016016pgm.385.1612742475853;
        Sun, 07 Feb 2021 16:01:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id ch5sm14304740pjb.14.2021.02.07.16.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 16:01:15 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] libsrtp: Copy ar-lib from automake
Date: Sun,  7 Feb 2021 16:01:13 -0800
Message-Id: <20210208000113.1095577-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

since libsrtp does not run automake, it does not get to add missing
files e.g. ar-lib macro file which is needed during autoreconf,
therefore copy this file from native automake to use here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
index 6f349e9c81..9d4c305fc7 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
@@ -12,6 +12,9 @@ SRC_URI = "git://github.com/cisco/libsrtp.git"
 inherit autotools pkgconfig
 
 EXTRA_OEMAKE += "shared_library"
-EXTRA_AUTORECONF += "--exclude=automake"
+
+do_configure_prepend() {
+    cp ${STAGING_DATADIR_NATIVE}/automake-*/ar-lib ${S}
+}
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.30.0

