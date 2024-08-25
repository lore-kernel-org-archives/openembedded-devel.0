Return-Path: <michael@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15180C5320E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 08:50:02 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.28664.1724575794551311035
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 01:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=dYoy+oJr;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.167.45, mailfrom: michael@amarulasolutions.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-533488ffaf7so4602928e87.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 01:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724575792; x=1725180592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cm+lfJO2Xivs565693h1RJ9JwLKrM8T7YjwFiKFrRgo=;
        b=dYoy+oJrAksk/S9nE6zQv6AZrKthULlzeYm3HMQZ+tt44ATxpiAiGhSnqEV5zSniGE
         /j6KUlvRd3iet2Z+FQ0QKYOr1ANMeNRjfX00xQo5PHs0+Ar8iJVFkhBB7CvlQLobkbrP
         36slDfdW6otJnPh5x60XHymdntTPoBWHq8RrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724575792; x=1725180592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cm+lfJO2Xivs565693h1RJ9JwLKrM8T7YjwFiKFrRgo=;
        b=D57NFDFeqnAvQgp/6ku96bZ/sjqYsoUDbHiH8KySHLPzUQcQTqwnOt8iscj+RhZM/a
         ohE6hWyI+IKGYFB+V0VUIaCrJirI34Lx/miZvR/OABhxD204p8feHfkFx5b9Ulwa8Rmu
         E0CVLBddyWYujrw7FlO9YdBNu6RzRmERkKYotwt4cRvRtNpVbgrdP20HdNMcfGvyPXjN
         9LfMaM276/qkXM5enkv9StBn60fB3iMP7VbE6BceqzbYm5Dp8UTMKA2juLRo97za9IOn
         HNhGiTInVF9HQk1K8hYivlncnH3weYJVp8R3jYdGHfMwexXwJyUEuqIJgTH5wKNhIZ0Y
         QBrA==
X-Gm-Message-State: AOJu0YyjVuepyYzdr2c+aPXijQOndf45aYYCjZnIQ0d4LpTb1kUqBcNQ
	x0NsNd3WLQ/biXc2sr6WyiLkIfsDqJHK4j8zjoBh5d4YhhBeuoLkD8/s7NuaCy/yBD4si8O0ywe
	0B60=
X-Google-Smtp-Source: AGHT+IH0TdSK3wZFOGPQ9/v+oB9g7pNX0EOjWixiAfZee6DkkHmPmXPNrJkzaDy8MXSCeiiRg9nBzw==
X-Received: by 2002:a05:6512:3dab:b0:534:3746:c623 with SMTP id 2adb3069b0e04-534387bdeb3mr4416835e87.55.1724575792009;
        Sun, 25 Aug 2024 01:49:52 -0700 (PDT)
Received: from localhost.localdomain (93-35-133-65.ip55.fastwebnet.it. [93.35.133.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f21fe5esm508714466b.8.2024.08.25.01.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 01:49:51 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Subject: [PATCH] cpuset: Add recipe for cpuset tool 1.6.2
Date: Sun, 25 Aug 2024 10:49:47 +0200
Message-ID: <20240825084947.1032325-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 08:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111927

Cpuset is a Python application that forms a wrapper around the
standard Linux filesystem calls to make using the cpusets facilities
in the Linux kernel easier. This can be used on linux realtime or
standard linux

Example

cset shield --cpu 2-3
echo c > /proc/irq/287/smp_affinity
irq=`ps | grep -m 1 "irq/287"  | awk '{ print $1 }'`
cset shield -s -p $irq --force
chrt -f -p 75 $irq

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 meta/conf/distro/include/maintainers.inc     |  1 +
 meta/recipes-devtools/cpuset/cpuset_1.6.2.bb | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/cpuset/cpuset_1.6.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 60f36a9449..fe3d9c83d8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -121,6 +121,7 @@ RECIPE_MAINTAINER:pn-core-image-x11 = "Richard Purdie <richard.purdie@linuxfound
 RECIPE_MAINTAINER:pn-core-image-sato-dev = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-coreutils = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-cpio = "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER:pn-cpuset = "Michael Trimarchi <michael@amarulasolutions.com>"
 RECIPE_MAINTAINER:pn-cracklib = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-createrepo-c = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-cronie = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb b/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb
new file mode 100644
index 0000000000..b404d4131e
--- /dev/null
+++ b/meta/recipes-devtools/cpuset/cpuset_1.6.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Cpuset manipulation tool"
+HOMEPAGE = "https://github.com/SUSE/cpuset"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://github.com/SUSE/cpuset.git;protocol=https;branch=master"
+
+SRCREV = "4f80263208935f0df4f616cf9d8cb7285599a670"
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} += "python3-core python3-logging python3-pydoc"
-- 
2.43.0


