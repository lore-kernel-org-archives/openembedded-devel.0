Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95040C761A6
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 12:50:09 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.33856.1679921408430732500
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 05:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EzJHvQ7l;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id y4so35778727edo.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NqKFiYgMUXOmTFJXnUFc4d1cSEyrlAbzKVZoTukbe/0=;
        b=EzJHvQ7lxBWByqk476+FSdpVlsWxi4FNuDqY6OhtGhwhy+zdqPepGVou01KCdnMuLG
         /PQ/Y0mOlJNLYouAidMpe4sIBWwY3pgwD7aV/jvsJDPDWCw4v2p6XX6JXCPktIaxbUyt
         dpc0VF4iXzONhTOXz0Knvpi/lGNhTZBLFbhmeVCOHmSOeFRDElhNkrkan1VwBwvkJwNr
         RJgaEpplZmeW59weoOFlIhIXiUKDiJaSrxzfvQPNpJskE91FAU8Xk2tFzgdNP6nGJ+K3
         UCcTqBfALghZo5es+SoUwJhpFLGT/BT+tCZZhEYKg7dxdLd8dOEBOTbHc6mCHqVX4ziH
         8O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqKFiYgMUXOmTFJXnUFc4d1cSEyrlAbzKVZoTukbe/0=;
        b=tUWQRYeqSxar8t9dFI3Gb1xFknFiJHDAmjMjiDmD2AtexKVd2kZ6K9kQFy+sE+3y5Q
         1fHZJl29jEqELZ/GFNSUwqKb08CIwq9b7j9UIXUoXdrsz7RzEh9un5B2pgxQLKfn5+iU
         OZuphSID6fFpuEtFnIriz2NGD75aFc/XyU7ywbi8J7WvZZkaB/xCSK9nsro1a0xYsHZs
         tSlJY7KIabdf2vgljwZLz7hBTmCDHywRk3mug+DZPBg8hIyNbHRlJmGg3pq+mqIgQLFr
         wFQFmTPVs+4fgJlOPaeZvbqTwNu1EQzhWuPz2jasKV6gd/2wMqT8s3oKRMu88fiiUOg2
         db3g==
X-Gm-Message-State: AAQBX9edbAHs4vjCfKznduuOt6IWW0xOOxkzSz+rgEA157tKwoo/3p14
	wMZ/ezQfmDNrmbS/2f31VyaryrC65/A=
X-Google-Smtp-Source: AKy350b8zGa1m6ODxkzirJMqyh0JMMWabkgMKDRbKQvrEUazwbmexZTZU2GJTUj+D7Prn6/yhgEttQ==
X-Received: by 2002:a05:6402:cc:b0:500:5627:a20b with SMTP id i12-20020a05640200cc00b005005627a20bmr11518072edu.1.1679921406043;
        Mon, 27 Mar 2023 05:50:06 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id z21-20020a50cd15000000b004acbda55f6bsm14657722edi.27.2023.03.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:50:05 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-executing: New recipe
Date: Mon, 27 Mar 2023 14:49:59 +0200
Message-Id: <20230327125002.90472-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 12:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101780

Dependency of python3-stack-data.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../recipes-devtools/python/python3-executing_1.2.0.bb   | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-executing_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-executing_1.2.0.bb b/meta-python/recipes-devtools/python/python3-executing_1.2.0.bb
new file mode 100644
index 000000000..89f935c67
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-executing_1.2.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Get the currently executing AST node of a frame, and other information"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a3d6c15f7859ae235a78f2758e5a48cf"
+
+DEPENDS = "python3-setuptools-scm-native"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "19da64c18d2d851112f09c287f8d3dbbdf725ab0e569077efb6cdcbd3497c107"
-- 
2.39.2


