Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6F7C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 18:31:56 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.2566.1741804312005422738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 11:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jtnWqINZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: awais.belal@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913fdd003bso117746f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 11:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741804310; x=1742409110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Pd+aRF77mMX6XOu07l9pDCucE/fl0QeIXMot6IWvtc=;
        b=jtnWqINZtCC7UsNkkvJwd3RUE1tjcoxO7y2rwiLYpvAeGdFKI9HOxuf+csk2ePdx6q
         ytTy/4ocPBin1xIIkSDX9OwW90wroEqzkyS3vd55WzS3HCfbD5LStYAQkcwd6nmQCOKz
         tUNEqOl65Z81WAefb6RXhS2fA1l04Wi3MNsrfKpWbxG3OXlbs6ZM2mB+BZTkRHF5ccjQ
         jpxopMien4N+fFzf9QdhybR5/Hi85hGhqkE2CtXdx2HshDnhJPZvE2ZvunrdQBDI4B9Q
         9pGO2CNW77ul25NT6IMWi/7PVZYvsgXpFsUQwAm7SXgA1lpyNLmuyLy6FYMiHFxw2taJ
         d72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741804310; x=1742409110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Pd+aRF77mMX6XOu07l9pDCucE/fl0QeIXMot6IWvtc=;
        b=IGhDWukMxYQu8Gpz+P2q/hORCnmLKbcJ+tWVqSmc39wvjoHlQbc4Y0lOeSkxLhdDOs
         doEOvlAXsjrBRQKe2nOBQo0uL7xfT1YEKnhMYyN/SQ4Nd9yQ70tXKhuMd4Ql3LwGx5f9
         6LD/b1XQoHr9VqtwQhjKOpED1JVS5Ab2A9XoPeOSVez6PVTd2zksccY3m+NVTwUQpRBF
         /u1TZE7TybPttYNNQjZnMXDxu3+p4qfNPQIgdxNxlcLq+sSXLe9/nbgJ0SEeYgl5KCvb
         d8EWxZlo9YIITgOgadBhBsc+5r9r059ZkCjdqnUwGS31CvOLHgNZOxplZmuaihrFFEkD
         zXkg==
X-Gm-Message-State: AOJu0YwrFVsN9ExquIKwniXMChFgjClhVJRSuwiYvs6U5N7f5kCL5nSq
	c46V2Jt390xhxcdLUetY65Ds/Mx7Cr8TBxc5X2Z0VotDQZcS4G9qsrl6gf7I
X-Gm-Gg: ASbGncvXQJJd06Rg3PCa3EwN5bcnq77DnRBRAqYG9o4wi5xfg+affTusYrlc2WTKiq8
	n+PAagn1O1BC383W3IlQp6qmvmXfiAOVVBHEW89sWpKfsTi8DTCwA0TJkIWkqD7ngc/rBvJ9YtK
	eHzFid5PuaudD3+UOv/Nw97YeD1+IF8cdk3/IlO7Rk6suuh72GpJmexy5k9k2kekL5i0lU0QsPT
	8CirHgvq59DWVHcpcycsjhY9JHglLKkxRPbsqiklPzkbRmqfV8pUZcOGqUTQ/D+A9p9BxQmu6la
	KWro+740dWY/R75271+MDdtN9rRY90gyUHImy9o0J4WiJeI=
X-Google-Smtp-Source: AGHT+IFMIqKxmfQ/863o7WgXNv54hr9SbuMzkGqj+prB+D23xB+RpUhNp+GGLob8zx50rIqiJMJLyA==
X-Received: by 2002:a5d:5887:0:b0:391:812:4e0d with SMTP id ffacd0b85a97d-3956d0866a3mr478183f8f.10.1741804310079;
        Wed, 12 Mar 2025 11:31:50 -0700 (PDT)
Received: from elitebook.. ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c101febsm21248374f8f.81.2025.03.12.11.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 11:31:49 -0700 (PDT)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Awais Belal <awais.belal@gmail.com>
Subject: [meta-oe][meta-python][PATCH 2/2] python3-cheetah: fixup native RDEPENDS
Date: Wed, 12 Mar 2025 23:31:33 +0500
Message-Id: <20250312183133.3403868-2-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312183133.3403868-1-awais.belal@gmail.com>
References: <20250312183133.3403868-1-awais.belal@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 18:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115939

cheetah-native is used while building mongodb and a build
failure for mongodb identifies that the current version of
cheetah templates requires the cgi module. The following
is seen

> | from Cheetah.Template import Template
> | File
> "/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/mongodb/4.4.29/recipe-sysroot-native/usr/lib/python3.13/site-packages/Cheetah/Template.py",
> line 24, in <module>
> | import cgi # Used by .webInput() if the template is a CGI script.
> | ^^^^^^^^^^
> | ModuleNotFoundError: No module named 'cgi'

This is fixed by utilizing the legacy-cgi module.

Signed-off-by: Awais Belal <awais.belal@gmail.com>
---
 .../recipes-devtools/python/python3-cheetah_3.2.6.post1.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
index 6cba6b3adf..e7b404cd8f 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "python3-pickle python3-pprint"
-RDEPENDS:${PN}:class-native = ""
+RDEPENDS:${PN}:class-native = "python3-legacy-cgi-native"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


