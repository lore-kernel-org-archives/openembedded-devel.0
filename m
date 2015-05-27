Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9D412756A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 17:36:43 +0000 (UTC)
Received: by ieczm2 with SMTP id zm2so19284682iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 10:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=TH9IQuQ+bjmS3drzVO002M7iiiaJe30zXZsYO2rItug=;
	b=Q6AhcymY0ZJvK+cTwGsR71zsNP5iY2u6QXpf8osiYBga+uwxiH/sJHYsOq1Dsme313
	Z69Sbw7TumHIMcqLRQ7ywLL03VVBjFWwZFKZFvAjrDp+dsdXqDRE6Si3SHe6SKEDD+su
	etiQ1a0VoD9lFhi1DWBZVn8Bj/kQeOXY3gnasHytnK9lRBIYUsakA+sl0OHbX74kBqR0
	WmUp30ALFXVMOV5caqoFU0L8TYC6ZS+DUrp4Y0FvHQh6XCmm02YumyLi9ysMte9vjF3L
	8gh2iMYyAw9SLB1a+WKXEi/19doq4wv4Fl5qWH3sDTd8YdHYOEC2dW9q4efWmaT6qJID
	85jg==
X-Gm-Message-State: ALoCoQk9cuZaanWxZVWdnhqlEczbtGYhXGVC8k/yov+eejZczlyZBOF5vv4c/KW5Z9rStvhgfbl/
X-Received: by 10.42.152.67 with SMTP id h3mr4891289icw.56.1432748204588; Wed,
	27 May 2015 10:36:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.20.5 with HTTP; Wed, 27 May 2015 10:36:24 -0700 (PDT)
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Wed, 27 May 2015 19:36:24 +0200
Message-ID: <CAAzKXnhRDirDffx7krgxbCjgjWV2pORdB8g2c7csohzkjp_hqQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-browser] [PATCH 1/2] chromium, cef: Fix install path for cef library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 May 2015 17:36:45 -0000
Content-Type: text/plain; charset=UTF-8

Wrong location of cef caused QA errors.

Change-Id: I56743864f9e7d47e7c87fb26c478cd812d5d6961
Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
---
 recipes-browser/chromium/chromium.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium.inc
b/recipes-browser/chromium/chromium.inc
index 377e685..cd8bfb5 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -44,7 +44,7 @@ do_install() {
                install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple
${D}${bindir}/${BPN}/cefsimple
        fi
        if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so" ]; then
-               install -Dm 0755
${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so ${D}${bindir}/lib/libcef.so
+               install -Dm 0755
${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so ${D}${libdir}/${BPN}/libcef.so
        fi
        if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome" ]; then
                install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome
${D}${bindir}/${BPN}/chrome
--
1.9.1

