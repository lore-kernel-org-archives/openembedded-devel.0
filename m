Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2437FA55
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:31 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c2so1022812wrr.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MWN8D8eaGdE2COCdvrAfWU2E9WFFEl2UW2o2ua1cb04=;
	b=Od8E3VzAOscuOsD8x0IAw0eDbzlB9SAu+85h0HS+GOsCPZZY6k1H4R4U33oGBTS/X4
	Yi+phQ2w1FRrMa4V67Z8TDku1b4ySq2hG0SWU61KtgvQ+hG9vqwHWX1D4Xdx3JYxBBcu
	OTjziIGPrLHjLbYASJrJI+w5JzxZircmuNYRHjYjEwY6lx6PNyqbHviZO5T4ntqH73jb
	79qGY2mZFeTuuS7eiIugbKioQU32k0u7WXnVN2RTrTPnn+mdA/wmXZN9gW2fxVNdr0Ns
	tLrnJiigV0NmHx/xr/Lmx8zC8hOb/AKpy9ztGM9eZBErqd6L0oA62UW1LuZiI6MrT8sQ
	AyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MWN8D8eaGdE2COCdvrAfWU2E9WFFEl2UW2o2ua1cb04=;
	b=K6eH70TGd9lOKGwCcAl8TqLIpg7Z3uz1gCoeGMblyMPv88HzjDHzEMKjt9i3FtNWmC
	WV2ef+hTczKrpl9SAza7Hkn05S+8CvHihmloKmA5X6K2npzqYkrJWo87iaHcplwO0HaB
	BY/Bft39lSrRBRU36jACitYB42GVMz9itMrEedX9VOm72ilZZoOjzg9FBkcddvX7RC2I
	Pfi50NIafXNiFx9SdqtyCppj+XiIZvjbw+noAN+hns8X7yF6B81hmEjhvlO2H/kpL1mI
	Ii9yROq82iEzAxbB7ZQbJnB0l4AyCSO13D3r91qQ09QYFHnkTCSKL4VcIVLjz1lJrmn0
	Rdbw==
X-Gm-Message-State: APjAAAWcEwoGDAddISllEa7py9do1NurlD/PtQI5D1mtDwfTLop7rzPp
	Lw72V8qRK9nKE7VAgLH7lPScLdUf
X-Google-Smtp-Source: APXvYqw61ZBDfSoCMgZtl9fePnuCsj/cvRYpooKcXrgNtqCaU+4gyU63vw41n8yMGUU2BjmDqYqzyA==
X-Received: by 2002:adf:dd87:: with SMTP id x7mr1413343wrl.278.1571988092020; 
	Fri, 25 Oct 2019 00:21:32 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:21:05 +0200
Message-Id: <20191025072113.11172-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/15] yelp-tools: initial add 3.32.2
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

yelp-tools is necessary to build gnome-help files

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/yelp/yelp-tools_3.32.2.bb   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb b/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb
new file mode 100644
index 000000000..6a6397cee
--- /dev/null
+++ b/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Collection of scripts and build utilities for documentation"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=d67c6f9f1515506abfea4f0d920c0774 \
+    file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
+"
+
+inherit gnomebase
+
+DEPENDS += " \
+    libxslt-native \
+    libxml2-native \
+    itstool-native \
+    yelp-xsl \
+"
+
+SRC_URI[archive.md5sum] = "7856f9ad0492aaf9adf097f5058bfc2e"
+SRC_URI[archive.sha256sum] = "183856b5ed0b0bb2c05dd1204af023946ed436943e35e789afb0295e5e71e8f9"
+
+RDEPENDS_${PN} += "yelp-xsl"
+
+BBCLASSEXTEND = "native"
-- 
2.21.0


