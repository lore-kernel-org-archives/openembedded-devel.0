Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.11448.1629036405465182191
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PDLXwGfk;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id om1-20020a17090b3a8100b0017941c44ce4so9991431pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=di+bvZD/Rkw3azV3SNpTUUa4BXJeL29l7RMPpHOg+ZQ=;
        b=PDLXwGfkC3z9was/5RVR90QPccDNi+1eNpvjPd978m+5ff3It/86T7VFOyN925OWMN
         KL6CrhN96u8lZ9JXUkEcLgvl0XWBmRm9mazVkGsuspY2/GagUISecFc5l4IvNOUESvSC
         rFFCEHZHIWgVHO2h0HWlSDTtAMlj2pw55c4vb0m65YEgCP1K7nPNgajDk9SXN5IKa2hV
         M3kwErq5rFWzQ+zJwpsd34e1Sgb/QsTye/Fi2fY6oS5XqovULKIRFl870Yftx/BncGxQ
         JYOz0VUjqnQIJYUr2nPjFsgyVaTN7U+zxGYJFMK8bE/wwEUatn9/AXUVCkG8qCewIID/
         neFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=di+bvZD/Rkw3azV3SNpTUUa4BXJeL29l7RMPpHOg+ZQ=;
        b=hbsEx78RyO4hAUYIJXm3KHxVRb2+VSt9iUxPOvZ2o3PNn45jo3UlQpw1HrJxqBfTyp
         ZjGwl9QIObAarBbcZ6qHn07g3DbrgLfSPjnJ52aJKwBrsRskO9Ag4EGZRoihVJO7VZKd
         PaGZi/5UcUs/wPtsxNqI2NeAG6XnSB/tXKtCXf3eyrRLQQ41dczQ978/KP5tq5Krc3AQ
         f96sGLOhIvVTw3HAqKWwu/Rp9Nf0fo4sO5pksY9wXaSn57XsuTxPS0qIUeLUnXy77QjR
         ToTin/oAwzb4EPWC1R5MT7ZhwX2iIjSaYh5FLyCA+nalGIvxDh7RgEcxi49eVp7abnlg
         rLmA==
X-Gm-Message-State: AOAM530SILgnYHHvesRnJr5DwowPky8jzlgrWwxzbVzgvMQXQlsE42t9
	BkR/arK5PRLhsh5sS5Nzw/l9tj+hU+/3Pw==
X-Google-Smtp-Source: ABdhPJyEybdudkYQNEj3U1JeOz24TNhNnojAe9oY5G6eQHcV+9DA8QrAq5kAVZNMyCGVOfSCNc2U9g==
X-Received: by 2002:a63:2024:: with SMTP id g36mr11392484pgg.213.1629036404985;
        Sun, 15 Aug 2021 07:06:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:44 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 05/18] htop: Add ncurses-terminfo-base to RDEPENDS
Date: Sun, 15 Aug 2021 07:06:17 -0700
Message-Id: <864b9a12593452a09749812b3e37b24b57177802.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paulo Neves <ptsneves@gmail.com>

Without it there are no terminal configurations on the target
and htop refuses to run.

(cherry picked from commit b5d74f8a6bd33e8468dd04d990f08d89d1e6928a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/htop/htop_3.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/htop/htop_3.0.5.bb b/meta-oe/recipes-support/htop/htop_3.0.5.bb
index 8e9b95d91d..c757f7fb59 100644
--- a/meta-oe/recipes-support/htop/htop_3.0.5.bb
+++ b/meta-oe/recipes-support/htop/htop_3.0.5.bb
@@ -31,3 +31,5 @@ PACKAGECONFIG[delayacct] = "--enable-delayacct,--disable-delayacct,libnl"
 PACKAGECONFIG[sensors] = "--with-sensors,--without-sensors,lmsensors,lmsensors-libsensors"
 
 FILES_${PN} += "${datadir}/icons/hicolor/scalable/apps/htop.svg"
+
+RDEPENDS_${PN} += "ncurses-terminfo-base"
-- 
2.25.1

