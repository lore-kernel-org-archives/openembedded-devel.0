Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.6360.1613036433158902628
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 01:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=eKclEP1n;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id o10so5634410wmc.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 01:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2HafgMk2+xGhTjyE/8L2GK4eBjRWI0ynxOfdzXJJNJA=;
        b=eKclEP1n2z8tgF59F5bWxJMD5DCVFXlRi7vEPo/flqB0rTqBUIaB62Kq2ZJctKTCfc
         Ud4VgyIZqEvgo/cBVMuqSVftqwXM1idQCxMNlLA/uAC/xydVFb2UAv7gKzm5aYGIpezj
         /DbQLZbLoUSLwVCmho5oN2TfoGEtPDIVBSoRnQ8sybAQKxsOPQKPLJk5jZd4FarGj86w
         C8vyk/jMhHn+mWUVO2ZVX5f85vTkkUO12Iwt3Ebh0ysxdMETHX+Sxds3nN4uWe6U8laT
         0amBjU7icwnN+rXd/d7UZdgtUIGDYO0PV+Z1FO1vu56bflTcPu/uDbZ1WQ4M+p4b76Dk
         X9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2HafgMk2+xGhTjyE/8L2GK4eBjRWI0ynxOfdzXJJNJA=;
        b=jBlBqChEWnPES576LLc6guj7LS9r/0UWPtTd3Y83ZYquhEaPd2FONgUOoSwiaTttYM
         IcsjgoIZkPUTCEpzVqFX1pml0FszoYirbx5IN8FRClTh0ydaoAA8yy1yPKrUe/GrNCpF
         CVclOiCarVARpXzKtEzjMRO7ImP1+LsfbKZauQHYkF4JWyA0yIDDnyXygM3yZ8NKdZRr
         IaCkxg6trm4GRFpWNdQ8JMQrJsepNOOgIoE4Y+gYhIqZYZlS6v/h8+Rc2bZaqjVqPebO
         Kve4If2ABWegxiTjAmLv7Ue51qPFQyv79ivhzZgtHl7M80EL83+xjXtWiCqoOGyqld5e
         av6w==
X-Gm-Message-State: AOAM530ZZkB8CEoM5vJkEmYQJLLAzBuxSMVNI3yH8sMj6fdii7YW6+sj
	GVDb3JcWBUsJ0C3q8VbcDHPwzA==
X-Google-Smtp-Source: ABdhPJxFfJs3SOBYggpiHDKlW2aUb+nZiljY3Evs822r8DLG64Cy3Mpb39BlOKh2iEDDMn7/59WcSA==
X-Received: by 2002:a1c:dfd6:: with SMTP id w205mr4297936wmg.90.1613036431625;
        Thu, 11 Feb 2021 01:40:31 -0800 (PST)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id t197sm28262640wmt.3.2021.02.11.01.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 01:40:31 -0800 (PST)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-python][PATCH v2] pydbus_manager: new package
Date: Thu, 11 Feb 2021 10:40:29 +0100
Message-Id: <20210211094029.8113-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

pydbus is a popular (and probably the most 'pythonic') implementation
of DBus for python but unfortunately it doesn't implement the
ObjectManager interface. This project is an extension providing this
functionality.

The reason for having this as a separate project is simple: pydbus seems
to no longer be actively maintained so it's hard to make it part of the
original codebase.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- add pydbus-manager to packagegroup-meta-python3

 .../packagegroups/packagegroup-meta-python.bb       |  1 +
 .../python/python3-pydbus-manager_git.bb            | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 8b267c9cb..e31b0b8b4 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -288,6 +288,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pycrypto \
     python3-pycurl \
     python3-pydbus \
+    python3-pydbus-manager \
     python3-pydicti \
     python3-pyephem \
     python3-pyexpect \
diff --git a/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
new file mode 100644
index 000000000..ae9e42160
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
@@ -0,0 +1,13 @@
+SUMMARY = "DBus.ObjectManager implementation for pydbus"
+AUTHOR = "Sébastien Corne"
+
+LICENSE = "WTFPL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fd5bb1dae91ba145745db55870be6a7"
+
+inherit setuptools3
+
+SRC_URI = "git://github.com/seebz/pydbus-manager.git"
+SRCREV = "6b576b969cbda50521dca62a7df929167207f9fc"
+PV = "git${SRCPV}"
+
+S = "${WORKDIR}/git"
-- 
2.29.1

