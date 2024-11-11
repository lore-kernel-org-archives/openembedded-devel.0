Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47969D5E392
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 08:08:48 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.54668.1731312524080632312
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Nov 2024 00:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sp/8Dgx8;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9ec86a67feso740618066b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 00:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731312522; x=1731917322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NjKOSQ85fPO6JaiV1Ke3trGdp5AyD+SskJ7QY6DJx8g=;
        b=Sp/8Dgx82rm5+8KCO9rTVObYn00A3tp/hFiu0+UZ2eLaYabJ/pE/vZgWaNWIvgSMYy
         od+WWRL6iy3X9SZszUtC5UUQWqLUopdlQjwmDgN2qqooWpbF5isUfEh/q7ABWzhwMeN6
         HKe2tZRIbeDS9vrmJ2lvIoxEbKk9lfmRRo0r75vxgnkJO3VPc7qvq+a2o8d9jd5Zt2Hf
         ieC1LV4CzC2OUJ/5o5fZv2TAp1kBygo9wG4oZ4F/fNhAilzDlW5IUhCC5fj7G6SYfnwH
         0AYn24nkQeD4LYQ2mcXWuJZTfK0L5onBPxWp5kFDWawJWjMu20Dc4/DvSJlJO+H3bKjI
         n4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731312522; x=1731917322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjKOSQ85fPO6JaiV1Ke3trGdp5AyD+SskJ7QY6DJx8g=;
        b=CpB/h5xXgwdfexpjrhhTwMvuDo+llkY8dfBI+sENnTAcX9ns8DBbk74uEH8tj23YXz
         D7IJ+fBIUMZ/0Gn8ljWkvT9Jwi1zaKTisq99ItnlS6HczUYz15FSZZelWJ0DcljwQF5R
         MCiXAMGUfnsu/x0BXsz8qxVHGTbWJDnCMWsF0ek216UuzKuNprhiFVVDiV+4fcIUbLm3
         QjBxQiKDKpAbmqPnPID4Hki9XKIgmzHuIWmEtAJ57cxcOjPQNEBnif3l5QZidI3zN9AZ
         8oNtd3vj2Po9CJhMvUj+BshGMQ7/UXFh+oSzDdKeO6YtfWIygGJmHEYjEHQ4Zt9gE+Qf
         XghQ==
X-Gm-Message-State: AOJu0YycIypCRhknrZudINYPjuz+/2+vEdVo/iZ3fp3KapNRZGEpkOQJ
	k78R7mhWmJvewQ/CwM8jPAWgNNNIsVTBrsDUr4/g9UTrHLovzPl77PGnmg==
X-Google-Smtp-Source: AGHT+IEh4BvMfKbdsAvL+cQ1NN/Eq4AHpQrHzGVA6pjaEFCMLrc83xxPDyHzQe+6SYVZul+rAevAmw==
X-Received: by 2002:a17:907:2d0c:b0:a9a:154e:dd86 with SMTP id a640c23a62f3a-a9eeff43e6emr1246323766b.28.1731312522240;
        Mon, 11 Nov 2024 00:08:42 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a46119sm562253566b.46.2024.11.11.00.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 00:08:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] libjs-jquery-cookie: update branch from master to main
Date: Mon, 11 Nov 2024 09:08:32 +0100
Message-ID: <20241111080832.885767-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 08:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113786

* it was updated in nanbield with upgrade to 3.0.5 in:
  fc0a506bde libjs-jquery-cookie: upgrade 3.0.1 -> 3.0.5

* drop duplicated protocol param as in mickledore:
  2e0a581bee recipes: Remove double protocol= from SRC_URIs

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
index 2db16e114e..4061e677e6 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/js-cookie/js-cookie"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e16cf0e247d84f8999bf55865a9c98cf"
 
-SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=http;branch=master;protocol=https"
+SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=main"
 
 SRCREV = "0ba77141dd215782cc7770347a457906908c66ff"
 
-- 
2.47.0


