Return-Path: <gaylord.charles@veo-labs.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 498A36C1C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:20:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r19so2759893wmh.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=veo-labs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=B2Of+z1LjwAsaAKXUKsXyrFefxltqhDH6kSKck9C0kc=;
	b=DKgz8pWi5O2vwjj7/BUep17Bye2ZWLegEB4x77Z317UF5fWJFWMxZc+TMoeGhO1JcK
	AUShaiwQQxJtBeI8H99k8PBz8Nf8c/0b1yoqSR4e0mSi68UFmBXZzm6YOw+WEtlEU6bB
	FZdxCsloxRLSHav0BFYunrABuTEjQqtI9nexr/Rg8RCzYbAvFLBGeVZECH4KbUBpcdOe
	voh8g/kLdu71G8CtsWEFUCd79BPtY/ELMLrW3xX9BioxyX9Wuil2w7ZIicc/8/ot/679
	YU3kPyEvfugzk/8aCwTvpvFDBBvRpxrN0fWbr3F1x0Av875l12FVs4nhWWG+hRDPVTyc
	SvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=B2Of+z1LjwAsaAKXUKsXyrFefxltqhDH6kSKck9C0kc=;
	b=Vavhr01ffTFBVDzeK6IgEq7USs8BCflqRdkfu0rCkINHWSSPLYfeUVKBQWuON2Cew5
	QBmYwm9OXqloY2HFIG5ZJpOCR4il3NuiQWBIQYA6uqigqdj+Z/MLrxWiDImNfmg/shJN
	ervzdDOUnQ1H8M2cetDGcXPCsPifZr8ALHtP6Bp5yCpBLcVIj4wuYuQgaE+RabLp6Hvh
	YIRyqpotU4lUMrz4R2zzGQ/zgBvfo+nI/+BSY8NHLl2jWJYr0mgudO181hF1xaEyiQq1
	cCDQJ40qVOZuf/JVqMRdDHODzqQln611jkC9hILHQt+MCAaDUxQrFg8TZWX2ks+UzQed
	t5og==
X-Gm-Message-State: APjAAAVv8fB4hhnDsdLuvmujNbKUwmi+9gvsTdRuPyqDe7uZhmSPWm0Q
	MzJTM5mQNhTX9J3wRM/vbsjWQa9XF1G3pP3frwyLsaGmCdM=
X-Google-Smtp-Source: APXvYqxfgFotV950piBXWV3knGKSbMSKzhd2H0EB9L0sjOOkVyicqokJO98hQOpr6kI+S5jmUyqTXeyTu5nxJ7cA0hs=
X-Received: by 2002:a05:600c:2311:: with SMTP id
	17mr6378591wmo.39.1569403232603; 
	Wed, 25 Sep 2019 02:20:32 -0700 (PDT)
MIME-Version: 1.0
From: Gaylord Charles <gaylord.charles@veo-labs.com>
Date: Wed, 25 Sep 2019 11:20:06 +0200
Message-ID: <CAAqXYd28BP4hUHjs215ebh+JOp04hHEaK0jxSmfJYosWZfYYeQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-webserver][PATCH] nginx: fix install paths
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Sep 2019 09:20:35 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

This patch fixes Nginx install paths. I tried to build the native variant
for testing purpose and had errors.

Regards,
Gaylord Charles

From b6dc845b645cc8667b2d89412c292c0801de9270 Mon Sep 17 00:00:00 2001
From: Gaylord CHARLES <gaylord.charles@veo-labs.com>
Date: Tue, 24 Sep 2019 18:56:45 +0200
Subject: [PATCH] nginx: fix install paths

- Use path variable instead of /usr
- Replace the absolute path symlink with a relative one

Signed-off-by: Gaylord CHARLES <gaylord.charles@veo-labs.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 29e7efc14..1e9d2e1a4 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -92,9 +92,9 @@ do_install () {
             >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
     install -d ${D}${sysconfdir}/${BPN}
-    ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
+    ln -snf ../../var/run/${BPN} ${D}${sysconfdir}/${BPN}/run
     install -d ${D}${NGINX_WWWDIR}
-    mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
+    mv ${D}${exec_prefix}/html ${D}${NGINX_WWWDIR}/
     chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}

     install -d ${D}${sysconfdir}/init.d
-- 
2.20.1

