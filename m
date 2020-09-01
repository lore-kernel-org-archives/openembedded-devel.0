Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.8336.1598999779919506264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V0M4gIr1;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id np15so1240754pjb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=evITPnGUGjKqy7+ZODtVDh1tH0hDOAEmXJxC0AU42Mw=;
        b=V0M4gIr1seO7uoBGBoTjPdMbFptle9LYKFx50VuYgjY2sbFYiK6/rzfR03qG37zmaA
         yiO7U0ik/1gopjkI9RO99QlAx0KZKVjVDlhR13stOicvJ7iA2FXctaSDaDu0KTLAU9NI
         j8flHtnA+vd4ctE7r2CuDj5+oaxi1BHOI7sAcBRJMNQYcxVSE37j5SCO7DAy+wv0uwLv
         n3fXlpWOXLkXHyWX5j+2a8e/3tdD4vx6wbxFm/74EjCPo7NzAhWAmQRc9Xen84HgXPcK
         7wI/QXXt7BsEgQ9BwJAwHhOOpVs7PgtOwVCYJvfwbZQWNRqBCSEMc2LQ3VlSJH1OrUtv
         hv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=evITPnGUGjKqy7+ZODtVDh1tH0hDOAEmXJxC0AU42Mw=;
        b=Fxb6w4DfA3ImgshbZgBeXF+ytJU8Sjb/CFsGDOL5f7r7SoqSor+R7wRmhSDtN+tuB9
         6WSb1bqUdzZ7HYtgWQ1KWg9eRuwttx6aIoyZ3CJvTiXPI36bipSD3BX3/PR/ErbDNBnB
         pREnarXxKm8gO8B+2Za68zSkOtCKsgrDw6AhuGzzru0dukwtHug3dDeytIeNVeLijnSs
         t5AkJ7KmM4JsBao7MNi2x37dL6MikKpUdaVtpNlKhIBVR970qFBK8OiXIrT1pwPrEKuG
         fAyIJbaM3sHvo4KQJz2OkOgZVXsbNH1MfZ50W0LuUIV1gfyRYjMroQUgrcbZeuNkkLbQ
         7hsA==
X-Gm-Message-State: AOAM531X/q4DVsz56BaxcfwiBrOBS2LsITYWfLawN/nnqoy7/v/Xbi5z
	4752vxxF/9LYE5P8zKFyT3w9qeSo+0l33Q==
X-Google-Smtp-Source: ABdhPJwQ8VBmkg216kZ5UXfk5MTFxD7Hc1o6tFxHW9e7idYfP1p9Ut4mxLcEwk7LxOLhmi+Az/q8tA==
X-Received: by 2002:a17:902:bf41:: with SMTP id u1mr3195008pls.73.1598999779087;
        Tue, 01 Sep 2020 15:36:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q34sm3157964pgl.28.2020.09.01.15.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:36:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 04/10] autossh: Depend on ssh instead of hardcoding openssh
Date: Tue,  1 Sep 2020 15:36:06 -0700
Message-Id: <20200901223612.1386026-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901223612.1386026-1-raj.khem@gmail.com>
References: <20200901223612.1386026-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps it to use dropbear

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
index a84fd9ac1a..9b69601e7b 100644
--- a/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
+++ b/meta-networking/recipes-connectivity/autossh/autossh_1.4g.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.harding.motd.ca/autossh/${BP}.tgz"
 SRC_URI[md5sum] = "2b804bc1bf6d2f2afaa526d02df7c0a2"
 SRC_URI[sha256sum] = "5fc3cee3361ca1615af862364c480593171d0c54ec156de79fc421e31ae21277"
 
-RDEPENDS_${PN} = "openssh"
+RDEPENDS_${PN} = "ssh"
 
 CFLAGS_prepend = "-I${WORKDIR}/build "
 
-- 
2.28.0

