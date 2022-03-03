Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0830C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 04:04:21 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.7461.1646280260897226535
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 20:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mn7g1PCv;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id s11so3682862pfu.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 20:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HbtLV8gYjQKRtX3rTtt70Kxz320nYgZ26ecXL79pPBs=;
        b=Mn7g1PCvIaWOkhenyn4XstOFu8aqqxPasRvAiQgidHjJJdogEf2MdqBdp8MXoCJ6GA
         m6dkIy6v+891ma/B4xXlOSO13F6DvwCrJ/+1+mgEApYo+/oH8fidHDzGQRsKXJHozmCH
         tdm9tsEjZ1zxqrcKcOUIJPYwBDZRMo7mnQScfhP8P5bapbAbNXDpi8elBdp95qocvHjJ
         6ddwkgcNGQRSACJBFwpgL2PpE1SibJLeT3xfvOWbYpsJIx3lsLCUfF0TC7eH5+r/w3wa
         QFS9N4mLrIbJEghgsKtNC0hAlw2FLJ0GjtvQifNWpt8q+0b9kjgsMk+L3VTGl/S0/uVh
         8lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HbtLV8gYjQKRtX3rTtt70Kxz320nYgZ26ecXL79pPBs=;
        b=ciF3+1g1dA/qRRRsE8BHbK9MnnJy6a3H6UN20A72TsrapQtiR3xXYwz9HQe9l4rq3F
         JJkY3HgP3+8QjlnPf3LLqf2SjwP4jOj/B5mQvRuBnsvc2B8aPmN3ih+YlhEBlzpJ0ICS
         VFjgOFVev0e+9Q8r/iSU+TSlyPtUxI6YvVQhTyyurKTLxslhyBYEBcRbSAJdHJHS66tX
         dPmoFTABc9tMe1KVsTOcQQnJ8xUgcuARek7uiC46JztKPbrIYUHWF27nb8x2FlD6jN4w
         ydpoyYyfnaNeh1xOuD/QW+si9YQQ/8b4FAL3UcvcyO+Lf+ZsHdTp9VdZizdmeamJCu/D
         pFsw==
X-Gm-Message-State: AOAM530GVvenYkHS33XAJ0nWCWVnuQEaUFzzO6HCBjMeDi4Mi0rFUMOt
	ZTFuvx7JDzN76QRBeErMm6eQGXrjeKhOog==
X-Google-Smtp-Source: 
 ABdhPJxpd7rQEx/AK9zH1Wnhl/VY3WnF8CCPZHCNrylunS6SyMdx1vOp4q8TcOZ/IK+kav1kuFon0Q==
X-Received: by 2002:a05:6a00:1646:b0:4f4:58f:b64 with SMTP id
 m6-20020a056a00164600b004f4058f0b64mr20650874pfc.47.1646280259989;
        Wed, 02 Mar 2022 20:04:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 v10-20020a056a00148a00b004e0f420dd90sm742626pfu.40.2022.03.02.20.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 20:04:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-blivet: Adjust install location for
 binaries and systemd units
Date: Wed,  2 Mar 2022 20:04:16 -0800
Message-Id: <20220303040416.874842-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 04:04:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95725

With wheels changes it is also getting installed under PYTHON_SITEPACKAGES_DIR
perhaps something to fix in setup.py but this fix works better from a
packager point of view.

Moves the systemd unit files and daemon into /usr/lib and /usr/libexec
dirs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/python-blivet/python3-blivet_3.4.3.bb  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
index d79fc7d003..85575df7b5 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
@@ -23,6 +23,12 @@ inherit pypi features_check systemd setuptools3
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
+do_install:append() {
+    mv ${D}${PYTHON_SITEPACKAGES_DIR}${exec_prefix}/* ${D}${exec_prefix}
+    mv ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir} ${D}
+    mv ${D}${PYTHON_SITEPACKAGES_DIR}${base_libdir} ${D}
+}
+
 RDEPENDS:${PN} += "python3-pykickstart python3-pyudev \
                   parted python3-pyparted multipath-tools \
                   lsof cryptsetup libblockdev \
-- 
2.35.1


