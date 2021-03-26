Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.6666.1616721777157514210
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qzqPnqUT;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so1707277pjb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 18:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ypyCcc9z8T8syMWXobxMfJ7T16gHthhhZ9BFUMVk5co=;
        b=qzqPnqUTDpgvvEdvTFM8YVN8YefjzaKsc5o0mckULEOefTOixYBI8q17fTsGdgglQz
         bhiCV8godeirtG5F2MdHbcr0IhZm+I4oByRf7TEqVj9LWh5v0lS2e23JPHx+85OguWBD
         hp4DDqPxgAdny71ZIhOpVZtuDehnGvC7Tt60WcAS2hxExgh/c/UJl8sUuPKLTbxzG7bV
         klvymT2xdK/Mi7psQ3vsQpHKeG86MotfQ+O+7LsIK7gFBD1wfLp8tuAlLZ2LsAAuZk/R
         5gHsZbFeaKTQ4FupUNxNOE//1WcK3vflEojTWQsP8rV73EiYj6/qBXAPUEuB+nFqbpy7
         eLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ypyCcc9z8T8syMWXobxMfJ7T16gHthhhZ9BFUMVk5co=;
        b=duejzB2o3i2vwd0YS9sBjDDwCxat03gMjGqvp6qVtIuTRl1n4qDtiAeSp14Ayemd11
         CAWBnsqb6gjgRaJLE6nh54W8K2gbPVoobffACfjP3+foP18srcqLZnMb11f+8sep5gN3
         1l/FlMZhOOXOLFgERg36wPdiCy482+ubuUcUMWy7iaz2ukIu3MfNqYaIEmw8VN5ycjRj
         mzs94q8x68pblTzGrrVm5DBzRdruj1zSTn0a/yErjAXGIa84tMVtFtoiNFAsH3AlnLpo
         FPQGe47Gmsv/RyXXkwR8psyfiM18T3C9Pm61gyMb3BubcHNrvNe/q1glNp9vyntPPm9r
         lehA==
X-Gm-Message-State: AOAM531QVB0NN+upRd9Pv3eR267jCSTWMwUBwprA8qufwSiYAqHoNt6w
	qlV2bTfQuFgjlpppY3Hur3sWb7zDnU4FfQ==
X-Google-Smtp-Source: ABdhPJzW9k6/WOuvzV9BIBT1DPoighwhf8oExjibQ48N0JD9DI4k7wP7vpkXXv6Rj+US9djaSkLfuA==
X-Received: by 2002:a17:902:b68b:b029:e6:cda9:39d with SMTP id c11-20020a170902b68bb02900e6cda9039dmr12895522pls.63.1616721776473;
        Thu, 25 Mar 2021 18:22:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::aebb])
        by smtp.gmail.com with ESMTPSA id q10sm6472873pgs.44.2021.03.25.18.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:22:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH 4/4] sox: Exclude from world if commercial is not in inclusion list
Date: Thu, 25 Mar 2021 18:22:51 -0700
Message-Id: <20210326012251.1063470-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210326012251.1063470-1-raj.khem@gmail.com>
References: <20210326012251.1063470-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It needs ffmpeg

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 21fddd1e19..4c3f37913a 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -38,3 +38,6 @@ SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"
 
 inherit autotools pkgconfig
+
+EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
+
-- 
2.31.0

