Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6A95A7ECB9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:41:41 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id d5so32002017lja.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Bo2jOwMoc+yY1pre5GU+tXw9kTGmSxbO1O2Tc6oRX9o=;
	b=uKcpZVmgh0PB6vSrOSCS4uOP3VZeqcq+yLxlEkuDXJyOna/mRW+zOuEbkAvKrYIMtF
	W8IEuExymgltUXfrfUxUPRKU3ratdhxXO8agCNRRiFSnTrh6MtDFbbQ/f2GWzX2XJ/rh
	4WZDPqP5V7yB0UdTYsjDTcjr2AeX2Y5CjU5AERwBtotj7p34Fd6dbqGnL6yRjjMEKa0h
	y14pn1sffDuA+wDVElqukC4k0jV4gQ2ABH1KWjDhwfWnUWYLvtdpqjhK+5kwq2t+qFdM
	lw5j1EwTnTFd9VzFpTHZV5dL2ecKutVvZTvgsmC/+vkr4Vzgcr1vaHlq2VlQpzzbfdaD
	Fp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Bo2jOwMoc+yY1pre5GU+tXw9kTGmSxbO1O2Tc6oRX9o=;
	b=sG32XVxUv1mXE6lPQjn79keXbhQC3f4Bjzdu2ffRc+lRIzd96YbQ5BgLxQp97Fl0AK
	Qw3T301jnGuY5rRx7Qtf4Gws/cH89G3fhnQqzMwn0PPHqkagspY1pb5kJSFLyUGXmsUn
	W4PdcwQQNMlG/p9YgF8PR5cuUxD+PMEbtOe5abPmUqKSLzNnz2dO6wG1tXISgTV5Lb8f
	7DOWlwJHR9QnSQfwJb+3uX33cP6qQhy+9RCznaSm5TCihPNcvYx+IQLEsaGZE0rxyQuv
	evK24UmtxOG5IzlCTTlHguCoPaX0IQiJjL9uqv9xuupT6ySC8W9YOgzqWPh89ZSWf6cA
	vyQg==
X-Gm-Message-State: APjAAAUWCP6PBnHXNkYoJtAZCXGBIXVN8Cej+WtJI/aZj+XL7mfguz/z
	5m/QfXUXecWNoz6vpEqpJE6rRDDfmbw=
X-Google-Smtp-Source: APXvYqziX1KE32XgDyuh2Xv34orADb/jeOrpg+X7/AyvdDjTnxsOQlN/fnszjoBLPziV9LgbF/4QpQ==
X-Received: by 2002:a2e:88c6:: with SMTP id a6mr36419761ljk.39.1568590901590; 
	Sun, 15 Sep 2019 16:41:41 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	h12sm1206668ljg.24.2019.09.15.16.41.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:41:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:41:39 +0200
Message-Id: <20190915234139.12373-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] python-cpuset: update to 1.6
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
X-List-Received-Date: Sun, 15 Sep 2019 23:41:41 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python-cpuset_1.5.7.bb => python-cpuset_1.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python-cpuset_1.5.7.bb => python-cpuset_1.6.bb} (89%)

diff --git a/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb b/meta-oe/recipes-devtools/python/python-cpuset_1.6.bb
similarity index 89%
rename from meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
rename to meta-oe/recipes-devtools/python/python-cpuset_1.6.bb
index 156e52a3a..1255a51f7 100644
--- a/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
+++ b/meta-oe/recipes-devtools/python/python-cpuset_1.6.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 S = "${WORKDIR}/git"
-SRCREV = "ae629aa1dc959342745ad97406adddf63bb6dbdd"
+SRCREV = "6c46d71a1c6ee711063153b9f7787280128f7252"
 SRC_URI = "git://github.com/lpechacek/cpuset.git;protocol=https;"
 
 inherit distutils
-- 
2.17.1


