Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.3485.1618693586671502864
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ulVAvIBo;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id c3so1822863pfo.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:in-reply-to:references
         :content-transfer-encoding;
        bh=RDYnXRqiIM9XIG3vy2uJhX4ie+QeON4fZUPfDWpUh7g=;
        b=ulVAvIBoME7eK6JMqszUPu1s/eZgFihr6S8dfEao0uKGSJP693dADT8vHRrfD/7+Xz
         apIe/AqjlPPPsETTSsBA2wKH54TZQGQIyY2mTxYWsf3ISNjzITyUF7+gxXWYlXVSpwJv
         PqZX5OMzHJ1zJLiEr3OBwqQuXAvnHz9RRsGBYUShKRxmmFKs1dUG74q3VZHSDQCLivbk
         5cignNNpCXXfKN7b0vbRcw5/k8YYw1jCnWPeAS3VDW9xxOkHQoAb/iGKQb1YS5IEUsor
         r98e6NfzIpGvmJ7Nr97oVWVwsZHjH9LIPI5koNGDRcG58hJRbo09MWwXGfnfRsHJSrGI
         wwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=RDYnXRqiIM9XIG3vy2uJhX4ie+QeON4fZUPfDWpUh7g=;
        b=VOSn8BQZ0W7TR6jszJavaQyZ4tNMCMd8elHR+SwOdaEyoV1CerxgcNhhymOJPtFbZv
         haUSvSwmO+YjLBYaIGZ7FB8tEfPKdecLE9HOuH9i24aYwl5nejLzXv0sbkW6f96I6ovA
         ebzyyuRmER5rspQk7YrkYv4qMtPt7b/+qpMHefNRg1usDZQqVk93paSS4WnL93k++qpi
         X/jy8P4iNuZBXZg1wxVNYhDX0+rFtVL8unq1Ae3dH+SbZ2MdhRy5E1KEnsx3UKLzD6j2
         7lx1DL4NciKV7xBx5OM9tuHoZOUa4kl+0Wv2qvVKkeQtOhK5Gs9KIAdgC+zwj4xT5mI4
         ZbXQ==
X-Gm-Message-State: AOAM533jzI2qziZicLA75wADzgAWDK25vwvWzImsqgRSmdMBqwofx8cm
	gHVcCJ0txbfSGwaBmh9kT8i90oHdAeb5yQ==
X-Google-Smtp-Source: ABdhPJw4N6WXBpEMniWBTjTDCls8D9KuTA9poYlbtFSp/6WJJGbTrR6B72uWdC88jVtioQpfvm60wA==
X-Received: by 2002:a63:6581:: with SMTP id z123mr1648114pgb.379.1618693586143;
        Sat, 17 Apr 2021 14:06:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:25 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 23/50] libqmi: upgrade 1.26.6 -> 1.28.2
Date: Sat, 17 Apr 2021 14:05:32 -0700
Message-Id: <7ba897842c5b04a362599a0c614f13c4b0be2fee.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vinícius Ossanes Aquino <voa.aquino@gmail.com>

Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fbd0b60a277911a03fc8ef08ee49142781627670)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libqmi/{libqmi_1.26.6.bb => libqmi_1.28.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.26.6.bb => libqmi_1.28.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.6.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.26.6.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.28.2.bb
index 6d60a670268..9be48b75f25 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.6.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.2.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a71963bb1097a42665287e40a9a36f95b8f9d6d6a4b7a5de22d660328af97cb9"
+SRC_URI[sha256sum] = "8c8c3ee719874d2529bce9b35b028fe435b36f003979a360d3ad0938449db783"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1

