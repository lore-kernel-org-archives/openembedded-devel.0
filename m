Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 967657FF2F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 19:32:40 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p9so3799349wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 11:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IYRAL32lbuJ9nHlGshU2iP5LgmxGXVPOsRHZsC7Ua8U=;
	b=j8Cfb0Za3/X1t0oFe4M6QSwIWPC9v0uICog54N9BncBMbHsMhTNoO2mAvd3wQ02zBs
	agEJelW9cUvyzHQS9808+ctRn9FVqM7MKZN4bSdLedkjh2wBXE9tUu04alTjq/i1QCVI
	WcVfVNkNLvGoMklcRoZuXFOiNMrJcGe9aXUpj+Ii2yAbbrawpc5SXI8X8TJSVYVAksx9
	6uW81j86sDga1cUDnLAjq7RrfyCbnrhbZHbQJ88CaLWG/6bL4CDSBdL+HcotCaKNzj3s
	qlNF04yVU2PYl5syqz+Z3X3uC5/KLDpZJW2IN4FZIAfHj0LMy5bmcHlV9nGWvsrkbkzI
	5vMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IYRAL32lbuJ9nHlGshU2iP5LgmxGXVPOsRHZsC7Ua8U=;
	b=gHzIsx5xpU7qiiiMUf2eXiKpwXVydzA2lzFsff8YtQKihfFWNCWKKLDbTXkhLsxq49
	zNgL2Z8Iw65hlb5SdJ+s/zn7NV5GyjmoZVkUVkzCoRv6QVg99rRca05mUUNWtlbGDQ25
	XbzUcPdaELzI6RwDbeVWYxhYCEMTBFA1yGNnSzXsgC2xVkHE9J6dKi9d6oFDwBrPLfYT
	RNaQqZC+dljrx+Qdl4COGy2LeKhGksuRmHu/JI7W9DuuNdjweIic1Jt3I/p9GiXxWRaa
	ax2h2OGvrmIQKmyeNSkX73bknA1QSJLDYthXWoCsoVnDSkOZOHeKIPhUUExzHXEWqRMZ
	51mQ==
X-Gm-Message-State: APjAAAUmHOiTqK+MAXQTDrPbH8SkVTTRg8Dkqq61f/hJ/fH+UjjZOPhG
	mk8AkGQsz0GRoNR3Z7RTmBJaqczziOY=
X-Google-Smtp-Source: APXvYqw4KD6Pma23f8IJgF0UVFKdPWzfC/FMN8uMQ9MDiw20co+eTT+K//Ud4MquDKwmm7JCbOj26Q==
X-Received: by 2002:a05:600c:21c5:: with SMTP id
	x5mr6872527wmj.72.1580239961181; 
	Tue, 28 Jan 2020 11:32:41 -0800 (PST)
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch.
	[146.185.2.7])
	by smtp.gmail.com with ESMTPSA id z4sm4191336wma.2.2020.01.28.11.32.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 11:32:40 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 19:32:35 +0000
Message-Id: <20200128193235.19868-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] dstat: update recipe to use python3
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
X-List-Received-Date: Tue, 28 Jan 2020 19:32:40 -0000

Update recipe to target python3 since python2 is EOL and has been
dropped from OE-Core.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 meta-oe/recipes-support/dstat/dstat_0.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
index 8eb715740..2e37dd72e 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
@@ -19,4 +19,4 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
 
-RDEPENDS_${PN} += "python-core python-misc python-resource python-shell python-unixadmin"
+RDEPENDS_${PN} += "python3-core python3-misc python3-resource python3-shell python3-unixadmin"
-- 
2.17.1


