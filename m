Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.2062.1632360312226695068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 18:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pJklIFGG;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id mv7-20020a17090b198700b0019c843e7233so3701865pjb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 18:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LyUXZ01LElFyFzXppx+nCFv4CYU5iibCQHHs1m0R2/U=;
        b=pJklIFGGm1KlDJTZ/LJX3YNf/mzJ/dqRoGVhunswfDJwEddS+V75x18MSiJfa6KgNU
         CAL2wzZfweGUATl6x5zpQYBWHfyt/A3BPAlR2ywP4k8mKh58d1XD8ZfrR6WUevYFy7I1
         uygcWyshRHISBuXxUFT9+M8ipIqxFqaa99aJOvkPWTkGLq7z08EgVECtqKKunGXlUIXu
         5xqNgFdvtbxynUMDhjhnB8O42byd8ZiJFYKMre/L9xnELF4XW92NGOYBQbwPcIpotZBU
         9cEvjNvX8g6WfU2OkACvoRGbba9P0uY0zMLnVD3SVTGrJD7vjIXx+VJqohr/cALMTN+G
         EpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LyUXZ01LElFyFzXppx+nCFv4CYU5iibCQHHs1m0R2/U=;
        b=0bYCtlm7vi7KltLyUzhOf+MKteu0frXFvX7vM1RsJaah6OWZHoyvPuR/p+EKd1ZZ7c
         K7ag7u1ztSVBdX6ubdReVxjr+EF66OzDgkteFxgEPmQqgJL/l7xCZcr6I6dtevYV10jt
         Z4IIkoU7CH3SBqGuqUe9yuCelO4buT0M01G9vVwsIJi9Gl6kx9bEfK7H9fAdiBcZqknD
         xa0pAkDxDLaixNJO3wnaNPOF1Js4XbGu6SaXDMBABqAHAJWs1tyvmBJYfTtO3LSRLNrN
         Scjw9JrtuoLM0YK5JgEaEKanj+55nIId5wfizH8LWQBdf+34A1JpKydnKhnjMfu1Bfqk
         0s7A==
X-Gm-Message-State: AOAM532a0DWisbexcNhXlYUbvjPEPcZ09YS6aKWn/AxQg/gGFMyPsogf
	R7iFp8K6smHmzBtBFep0AHafwg3asi+YnA==
X-Google-Smtp-Source: ABdhPJzQJ2tBB4p5G01D85vIpamPjUkrjiFCYBxjk7eUG9XJB0WBg2hERFGT79Lt1PjDicK9ldSIPg==
X-Received: by 2002:a17:90a:4b4d:: with SMTP id o13mr14478551pjl.236.1632360311569;
        Wed, 22 Sep 2021 18:25:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id e8sm628747pfc.153.2021.09.22.18.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 18:25:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/3] mosquitto: Inherit pkgconfig
Date: Wed, 22 Sep 2021 18:25:06 -0700
Message-Id: <20210923012506.1693632-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923012506.1693632-1-raj.khem@gmail.com>
References: <20210923012506.1693632-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
logging.c:(.text+0x218): undefined reference to `dlt_register_app'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_2.0.12.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
index 2df400846e..d2fa9cf322 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
 
 SRC_URI[sha256sum] = "31cf0065cb431d6f4e57a5f4d56663e839c9d177362eff89582d7cfde191c933"
 
-inherit systemd update-rc.d useradd cmake
+inherit systemd update-rc.d useradd cmake pkgconfig
 
 PACKAGECONFIG ??= "ssl dlt websockets \
                   ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
-- 
2.33.0

