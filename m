Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 520CE719B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:21:54 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a188so132654pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7+IU/lK9BgM/kdo/M9P+6PNh2VIvkxB7PAOK1CzbsFw=;
	b=fq3Xdm7wkhnMa/HWS50ViyZjxip3aDODV1NLPIpfeKyxIlJkJk3mmEk1G6mL4vXfPZ
	jejj1QFmqW8o2ygcGeYhdV6eUrduZcjQ5U01OIjUUXFxuJcwYy8/rX4uYo8oTbsv88Ju
	l0UanJg/luphZm3zsAsgfBWuJJ+jOJzziAdCrGFNpJWk5wQIhXMvCMvWwQ7Y2elc+CIF
	u/NFpoy1y3CNyermoIQxZxr5oiQNxsQpudnsBTqJrj4f8bxXySlzIbk4gysZNtHYAlXX
	e2M6BNSmzg/eWkZGn6uGAWlHPPYY/uxlw6sLAOx5dDxi1bUr+VXbNqh9fRPzxvnfMXqn
	iPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7+IU/lK9BgM/kdo/M9P+6PNh2VIvkxB7PAOK1CzbsFw=;
	b=J4KC7E8bAGyzTDGJ5jUs00WFTzUMp10kB/txrxia4fKGIABgkuJAFwiE/IYChneJf1
	QQFRmi80O7CToXReFAtY4aiKHiBLaHtUL7CLY2HtrQ+dmuGQZlWgGUcqr4Cgf1gouCrj
	r5Ak0jexnDiltZHU+maUHvC8gN/Z7aP9fKxAIK6nZe3EKP3TnaH7crqpZ8qNnZWBUM3C
	FiFs0S4AgBjivv7JA0vze/KDlHFgQeW2uZmO7A7FaAuchhmeE5Phxv2T9fh6Rplq9a6j
	xrwvFACRX4/TktSeCBbKERv/ffEruAl6eJZ+JsEj7MkS++h4Qm0Q3VpUvxLCDtCl84Y+
	2U5Q==
X-Gm-Message-State: AN3rC/4gDgQDV7VnRYLWWIXVQmFd623md9HA22oSsW0xz8W4dTlwPFBK
	HJKJG3TXv3oT9g==
X-Received: by 10.98.110.195 with SMTP id j186mr18733682pfc.25.1492539715976; 
	Tue, 18 Apr 2017 11:21:55 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.21.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:21:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:13 -0700
Message-Id: <20170418182142.27253-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-networking][ 03/32] ez-ipupdate: Fix formatting security warnings
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
X-List-Received-Date: Tue, 18 Apr 2017 18:21:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ez-ipupdate/ez-ipupdate_3.0.11b7.bb                     |  1 +
 .../recipes-connectivity/ez-ipupdate/files/wformat.patch    | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch

diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
index cb5375c1f..51e220c9e 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://sourceforge.net/projects/ez-ipupdate/files/${BPN}/${PV}/${BPN}
     file://Makefile.am.patch \
     file://cache_file.c.patch \
     file://conf_file.c.patch \
+    file://wformat.patch \
     "
 SRC_URI[md5sum] = "525be4550b4461fdf105aed8e753b020"
 SRC_URI[sha256sum] = "a15ec0dc0b78ec7578360987c68e43a67bc8d3591cbf528a323588830ae22c20"
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
new file mode 100644
index 000000000..1de267f08
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
@@ -0,0 +1,13 @@
+Index: ez-ipupdate-3.0.11b7/ez-ipupdate.c
+===================================================================
+--- ez-ipupdate-3.0.11b7.orig/ez-ipupdate.c
++++ ez-ipupdate-3.0.11b7/ez-ipupdate.c
+@@ -798,7 +798,7 @@ void show_message(char *fmt, ...)
+     sprintf(buf, "message incomplete because your OS sucks: %s\n", fmt);
+ #endif
+ 
+-    syslog(LOG_NOTICE, buf);
++    syslog(LOG_NOTICE, "%s", buf);
+   }
+   else
+   {
-- 
2.12.2


