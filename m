Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id CF85D77E7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:18 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id o126so12676331pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7+IU/lK9BgM/kdo/M9P+6PNh2VIvkxB7PAOK1CzbsFw=;
	b=k2EsGEoxDzXJGWaFaJMxGr2CVjVTtWdl+56Q6oEsHDyv3KL2AUjrBY1LZivJNBmCtD
	E+inqSz65a+mH6aaTtq7hYyBXNjiL71nAa9OXDmeFIjd3CQEVTzLEfR3xiP/sdI3p9aq
	lOrWbIdGbIEft+qGgoX9dMoE2SkC1Lojhr0v57XnZMWSxDIT4eLVDW30eNFLbNd6qj63
	4yX/Tzx6hO40Z0rAFt+wb332xNWdKq+NNld2LwHFAhIq5I/y7ChX8uX29INZDrlnvnRl
	Chqw9ZYV88+/7n9IydjSGVlFAMJ9H5t+kVN+jbSF7oE5O061MAnKRQzGSEFxvu3wM4eM
	FVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7+IU/lK9BgM/kdo/M9P+6PNh2VIvkxB7PAOK1CzbsFw=;
	b=Q3m0ErbERNTJyUISO36E/W6dLUXuNnNRu8vaD8BnVRI5jFWOWxZDSq1FNj6TsTjxv0
	/LtnjF2QbJLjjurA6bKLlMwzuqriFKkLA6PvkBIHwk9ZN8mQtLynZ16Ts7wtg0v7bTvX
	ck+6uPQY3jY8dpnFnIbcxZAYIZTuDiEv/exaVNuuVZZRLDptAooDRMIpiZiRVc2UYBc2
	+/0YZQnE4KDLewvtSXCgovrUk4+i8WvSuoshQ7H0MzHdJvwkD66BCDZCxfuwHq1sb2Lx
	Jj4hxcbGCaNgt7IclZ6mMneVP/KMNApgSEwWhc0UP4cvdX/sk/qkI8aDxkVmTXf+o5+6
	U+ug==
X-Gm-Message-State: AN3rC/6zuT1F4NXpVA0+fMMBTXUh4FLi+zeejbuvcbT0RThSKz5G7imY
	j+q/Zqxic7YYmg==
X-Received: by 10.98.70.139 with SMTP id o11mr4287418pfi.0.1492116079606;
	Thu, 13 Apr 2017 13:41:19 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:39 -0700
Message-Id: <20170413204106.30679-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-networking][ 02/29] ez-ipupdate: Fix formatting security warnings
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:23 -0000

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


