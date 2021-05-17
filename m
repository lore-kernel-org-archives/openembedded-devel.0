Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
 by mx.groups.io with SMTP id smtpd.web12.16824.1621244693549448385
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 02:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=l7QosvW8;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.201, mailfrom: 3fduiyamkab8r5fbjjbg9.7jh@flex--wak.bounces.google.com)
Received: by mail-yb1-f201.google.com with SMTP id o12-20020a5b050c0000b02904f4a117bd74so8689061ybp.17
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 02:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=RnBACWVCQH/TH0r0k9o44G1vPU6FV282qJUVjcyTfDw=;
        b=l7QosvW8srOKK6pTkUutXO77olw1i5xtWWVMU19IAq3XcpFiqCz67Sf/j43R41DJly
         guc0uNx4QN2CfD/tEMl9sKIfAgWdRKVPhfBLnbMHaapkdhF0jjq5fJULSEcg2GiZJmHW
         e7hNCRbXQR3TtZ8NiK5t8M/I1gx0yqMe45EHpEhTQj+AJxTQLIIzjHZyV5wVch89lCZU
         dgvOqRn9IdSrzyG0P5cOFRJEh8HG8iXFi7OsjSYxKh1gvsbaLTjAyyV8QzSbVTolMIw6
         pKQKWcRq6tXa8+GJXjASVTVsli5/OOzg70LAKL1g4lCA2kBaw+ehwaapYvoLr6CAmwJN
         wwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=RnBACWVCQH/TH0r0k9o44G1vPU6FV282qJUVjcyTfDw=;
        b=DH+B3YW7W1BT9WhiPQM9DxcPt/sbQol7oxvbNaUJ+thZ95FHfNddPFLzeVQuODUdnp
         6RQ3rz7iIrF10w3vT6aBLBm2ONfZaNBcjmaKGbKu0URN5NQD8tViOlfSHaXcTrSjxAih
         FkQJFggEYqN7UhqlH+d6VtxPlwlILJOVJUCR94uFrXYH0q64afmHGqxX1yG8Oq1bNYSf
         LQ3QT3sCKTpxVIYaVRKn86KnnGA6X1/IjldyObnnT3HEwRL2qZVmpBlUNfDOqpuoi+90
         /YMpZLIMEdoDlVN2zTxItB9/ejCbuLrdvBgl/40UXoi85HQjyTPmgiCQQQy+wV8fHbmY
         smAQ==
X-Gm-Message-State: AOAM531dgl4F7oAfSfNMNvcKdDoveNiy1Y2iltOTJz/5KMAx0neynuba
	afsiZmTTgHi6/OIwhrl3IG0FtAymEnCjKaD4PmcAS95xI+17clFb7/RUD7tzUo2EfJBlJZRdab+
	0YgCcQkPPllL3DwP0l3oCrdb2VQgnu2msISaz04Fn54ay61bGt26iCb34arR1We59TOZnFNUFnx
	20lf4=
X-Google-Smtp-Source: ABdhPJwMcAtwRtLAtPB6qTOayCkDg9zl2RzEcuM8mQPLbALtdqoalHVKp/IagjB/wzvzkgFHR6PSZjg=
X-Received: from wak-linux.svl.corp.google.com ([2620:15c:2c5:3:349d:7266:b0eb:443f])
 (user=wak job=sendgmr) by 2002:a25:dc4d:: with SMTP id y74mr9198693ybe.490.1621244692567;
 Mon, 17 May 2021 02:44:52 -0700 (PDT)
Date: Mon, 17 May 2021 02:44:44 -0700
Message-Id: <20210517094444.956896-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [meta-oe][PATCH] span-lite: upgrade 0.8.1 -> 0.9.2
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../span-lite/{span-lite_0.8.1.bb => span-lite_0.9.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/span-lite/{span-lite_0.8.1.bb => span-lite_0.9.2.bb} (86%)

diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.8.1.bb b/meta-oe/recipes-support/span-lite/span-lite_0.9.2.bb
similarity index 86%
rename from meta-oe/recipes-support/span-lite/span-lite_0.8.1.bb
rename to meta-oe/recipes-support/span-lite/span-lite_0.9.2.bb
index 6956f5fe6..16b7c3e54 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.8.1.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.9.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI += "git://github.com/martinmoene/span-lite"
-SRCREV = "937262f25fb702592cbc5c772111a73a5e3c1e07"
+SRCREV = "126453198fe2236b31ddfa7353e95d3a06c478ab"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1.751.gd2f1c929bd-goog

