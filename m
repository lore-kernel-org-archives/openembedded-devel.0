Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.2897.1594437578318961341
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oypAeeuc;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id k71so3405924pje.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 20:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Q2YwaEmM06hE8D7mL80ztD2MmjrcSXuZy7hKD9UAgpQ=;
        b=oypAeeucPOgrvbOwIx0AoF9xaXAP5IE1pc6LqVmsQPYJVHoCOYHq13MK0Cqs5LxFU7
         7i46ZAII1EWMvfFg71Yj2xKWrEuGxCtr6k4jmDnCktzUqG+/aOCddXNMBMs4Xsd+BkVO
         v6XdC7HYCSXZtHglJ1aSJJ9SCw8kYC6isbidfAmRFbwpQWGghyRf9cl8VJclLPwoltf6
         lw5LBgOIyHnk/GZKL/o8seHtZopqfD8MuzAaFGC412O8pZPDzVuylXkWpN2Eb5Rh9wlz
         96tKzrFgs4Pw7tifn1gfZ5AvmJ8O/a9WFHjKJA2r7SKlQl+b9o9MCJBYNjyHI72LwZhK
         Zayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Q2YwaEmM06hE8D7mL80ztD2MmjrcSXuZy7hKD9UAgpQ=;
        b=UU9fsBxQ/2ZDgjI5yZkH78pHvlDuzJMXZcyULNCGvS0eGx1FI+6DJLcDSu3VomFsxv
         RgH2+dofJ4u1cb0+NyeSZ6QvTipvKEYuCP7AwpwGYSLlou8HlD1ugqsFs8FqvCXtrCvK
         Cam5BOdkg+OCURQKr+SSErSLXUBVhJsFO3YW+Qd0j65xjXUl29y8R1M+T+5Clp8T83iY
         7D4D6qLZFDeTVUDAL4Z/vlan+eGilb6f5fSwRlbWChd85zXjyrRh5yboykIwfIGPqsa0
         OfWZLFYeZsYNdhx/035k3AXczqPLUHWp+My/6ja5rPUTjikQkwuVuJiupZQAoE6tAMFL
         tNwA==
X-Gm-Message-State: AOAM533jMIrVTzlZRODh86oWzBSw8VYtDF5ccTo02VHWtzT9OgSZ61tE
	4Xe7yK4xA3DVparS0bf6R8O4Aw8XeEM=
X-Google-Smtp-Source: ABdhPJzx+SAgjhAj9ts3ya1YUt6Pr+PKqUG0wN6zgORjrzg7fnd773QsvxERFtx+DQFJ4tDeQkmFxQ==
X-Received: by 2002:a17:902:70c2:: with SMTP id l2mr33489832plt.84.1594437577621;
        Fri, 10 Jul 2020 20:19:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:94e8:27ac:fdd9:c160])
        by smtp.gmail.com with ESMTPSA id f3sm6925461pju.54.2020.07.10.20.19.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 20:19:37 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/5] python3-gnupg: add new package
Date: Fri, 10 Jul 2020 20:19:31 -0700
Message-Id: <20200711031932.5883-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200711031932.5883-1-akuster808@gmail.com>
References: <20200711031932.5883-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-gnupg_0.4.6.bb    | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb b/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb
new file mode 100644
index 0000000000..ff0a91c6f6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gnupg_0.4.6.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A wrapper for the Gnu Privacy Guard (GPG or GnuPG)"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b0b7ac63b60085b23fa9f7e1951daa1d"
+
+PYPI_PACKAGE = "python-gnupg"
+SRC_URI[sha256sum] = "3aa0884b3bd414652c2385b9df39e7b87272c2eca1b8fcc3089bc9e58652019a"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} +=  "gnupg-gpg"
-- 
2.17.1

