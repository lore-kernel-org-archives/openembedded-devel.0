Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D65D6B6CE
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 19:25:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.24114.1730316298022543926
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 12:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eija5Nbv;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so141426f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 12:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730316296; x=1730921096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7Gc2PuIuTNPTly6qcq8reBBTNWn7QKgS1rIB4og5vM=;
        b=eija5NbvxqsxU4bIa1B43FfPygKTRj3+aI4cZ64bO5pnz6OSRPOUaY+n3VRMRcVDqq
         4+1k2x2TnPg9JR20qwGxOJSRqRoLJqK6B07/OCEahzoUEdfuVjuqPykZmulqtEwASfIL
         fZHeOi/KxGtecbyO74dt9KbCDp/RgQ3cZ0TmYaAHK9eFayni2yn4OS9AWF6JZVcq5aKx
         9+xPx9fyBxtXqKaqjkH7OhMb/+GnM+y/Gej6Dj3SBJynMtktvnnYzc3KLLf5ymQsknTc
         49dNMG88c2pk8yS/zHkNjzXlKDnFHfstg9FaMkkgSD2jtHHkkBjcZQgmjwQ3t2VgEE8h
         dZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730316296; x=1730921096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7Gc2PuIuTNPTly6qcq8reBBTNWn7QKgS1rIB4og5vM=;
        b=ddoou0vkN0lJgPi2nMmtFXqKQkiZChql2ZP/5FRoqtchdmEKL4rYf/Vucv7isUtA8F
         XM/WZvT1Ar3KIL7LrQVxlcNOiXCq6CmhpE7gXTQjACCnuIN0QX/sVxYBaI+fdPxspA6b
         yXeASCuNVDIWZOEHLAmHqTQmwSgdlz6CLix2dc7jKPBjv5xx2iAaV8NIMFSuH+jUBQWs
         aCVpyO8u9Cs+hsDG2ChCRDUe72jLo56UZexub/RaAavXg+13ZaCl9P2gtWvZ0DNZ9G1d
         uPkWEGFYDy79M2KaagnJ/4yWZao+lrJMiHOmjkaZ967uN7ObXtlWQODaT0rIUFNz4+AH
         svSQ==
X-Gm-Message-State: AOJu0YyCN0hFfKiXOGzU0LCPNqgtzulnsddct7jJykKpFudkVv/vO+HW
	kL6FKqyhGs2YsjIF6kObsel6Of563z9UIJUjUVkUko3EKN4S4spL6sDbJaNR
X-Google-Smtp-Source: AGHT+IFgRcEuXqxgsXr9XW5DXkrQO8aZ5IowzlLJGJw/ZAzQHVvHAtzk8+dXE9bpE7/dHTeP6NWCIw==
X-Received: by 2002:adf:e0c8:0:b0:37d:43f1:57fc with SMTP id ffacd0b85a97d-3806120606dmr10641252f8f.58.1730316295813;
        Wed, 30 Oct 2024 12:24:55 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb4348sm16035307f8f.111.2024.10.30.12.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 12:24:55 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] swagger-ui: OpenAPI (aka swagger) website (v5.17.14)
Date: Wed, 30 Oct 2024 20:24:46 +0100
Message-Id: <20241030192446.5964-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 19:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113352

New recipe with the static version of the Swagger UI.

This is *not* a NPM version of the website (swagger-ui, swagger-ui-dist, swagger-ui-react).
But the static release.

  Plain old HTML/CSS/JS (Standalone)

  The folder /dist includes all the HTML, CSS and JS files needed to run SwaggerUI on a static website or CMS, without requiring NPM.

      Download the latest release.
      Copy the contents of the /dist folder to your server.
      Open swagger-initializer.js in your text editor and replace "https://petstore.swagger.io/v2/swagger.json" with the URL for your OpenAPI 3.0 spec.

  -- https://github.com/swagger-api/swagger-ui/blob/HEAD/docs/usage/installation.md#plain-old-htmlcssjs-standalone

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../swagger-ui/swagger-ui_5.17.14.bb          | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.17.14.bb

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.17.14.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.17.14.bb
new file mode 100644
index 000000000..de5437027
--- /dev/null
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.17.14.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Visually render documentation for an API defined with the OpenAPI"
+DESCRIPTION = "\
+    Swagger UI allows anyone — be it your development team or your end consumers — to visualize and \
+    interact with the API’s resources without having any of the implementation logic in place. \
+    It’s automatically generated from your OpenAPI (formerly known as Swagger) Specification, \
+    with the visual documentation making it easy for back end implementation and client side consumption. \
+    "
+HOMEPAGE = "https://github.com/swagger-api/swagger-ui"
+SECTION = "net"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https"
+
+SRCREV = "74ed0adebfc9c8dd0de2bf8e81495b022a66c083"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${localstatedir}/www/openapi/static
+    cp -r ${S}/dist/* ${D}${localstatedir}/www/openapi/static
+}
-- 
2.39.5


