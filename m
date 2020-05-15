Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.906.1589577100586048216
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 14:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=nJ3CCrj3;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.193, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f193.google.com with SMTP id f13so4154476qkh.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 14:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ib2w9w6UVtKAGK/QYuhR/AEnRitJ+aJBJuCXhW4NjBs=;
        b=nJ3CCrj3VNKc74Z5cVkB0nJVNct49gVR18FLkFBARD+yJVOD2rOt4ZH6VpRG75be5h
         8m/DSyX+/tI1gvRuhxtBBelCXMvbmqC6ZCR7tguVdfgGWgbEwXYPbwz6cjSeQsw+9m+e
         exgIcfnwwuYCvG7k9ykOCGrsXBkvIO3nmgmduVY4efqVBlCJ8zAsouXl/CuHUUxMyDUp
         awhJXaKS+2mMJ8sNTUJatQx28/8o6ia9/lElhFLHxH+qIlIcjxF7XCunsfyPdITrNhXx
         SdZNrQp6Yv5niRlZiCzRlDFzk6KSxCEATETnBi31/+1+K/x98ljQuQywO9JfFwrJ4/qI
         jc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ib2w9w6UVtKAGK/QYuhR/AEnRitJ+aJBJuCXhW4NjBs=;
        b=uY7KIY+uKmDg7nYAstQf2n5NsVITQ2uzsNho0BZgg+Gkvm1Vr37mzeSGOYWrSdVoSk
         lAozQeGqJPo1awd0vLvpBXt05bCkS7YZP2ZfosXFA3qKz13Dic5QMoMsBwNbSAldPbW8
         DJ5CUF3dSGSoQYa2nWxqdKHZyNxJ49UWeKCHHEdlK+P1Z1NT9zlfqAU9OvC3SSd+ZcxK
         FXft8c4LZpPx2Zl8MdhreH7xwbRC/SDgekKwkPs61ZFF3sOHne9J7bNg7Zbx7r7Fr7E9
         /d64Hoamz6UNCGjSDmMKjDi8X1PQkhAwvfNqAahOFclkUs3Yb6eKncJol2QmZBPp3q2c
         iqRQ==
X-Gm-Message-State: AOAM532RaOn3bJdMCWxeZsKIjpQIPYGec5z0JI8mpPGGuFhjQlhf5ZGX
	ANel/ReVYHtdZVEvdRQLbDVCFkR3yY8=
X-Google-Smtp-Source: ABdhPJwq/tAYbj3IXjad1qibyzbbdMyXV2ajDvoDEYSEL+jJM5RmWBa2MhykZ4G5wQA+weetterEgQ==
X-Received: by 2002:a37:4e05:: with SMTP id c5mr5490988qkb.232.1589577099523;
        Fri, 15 May 2020 14:11:39 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:b83f:ce2d:1156:b223])
        by smtp.gmail.com with ESMTPSA id h134sm2483276qke.6.2020.05.15.14.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 14:11:38 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 2/3] python3-snappy: Add recipe version 0.5.4
Date: Fri, 15 May 2020 18:10:42 -0300
Message-Id: <20200515211043.10347-2-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515211043.10347-1-domarys.correa@ossystems.com.br>
References: <20200515211043.10347-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-snappy_0.5.4.bb                | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb b/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb
new file mode 100644
index 000000000..1836473b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Python library for the snappy compression library from Google"
+DEPENDS += "snappy"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b3090152f53ee19f6a7b64b1a36384fb"
+
+SRC_URI[sha256sum] = "d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "python-snappy"
+
+RDEPENDS_${PN} += "snappy"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

