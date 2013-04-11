Received: from mail-we0-f169.google.com ([74.125.82.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ndec@linaro.org>) id 1UQDbW-0005GL-Ow
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 11:15:39 +0200
Received: by mail-we0-f169.google.com with SMTP id x43so1067432wey.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 01:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=Qr1Z6wnQ2clH9/qat9VxvxUKh5JZ+tronXyvFUSGGH4=;
	b=k3JYgIuh8FhRYgSgeYqtcMK5KyYyiQW2exp5nwLRQZWJB2AqQF3teY6RCa4h9xQZFj
	KiaILOvqCnCCURVhE4TOjt9nRdVK8rhIDSbLxoP12dGSZ4w8O+jgM1vL+vJQ4BbWwMTq
	HzAWWdVxjr2p4EisQEoQFiEfhmi23uEDuCzWFRYkZvJqcWpbuIi2IOk2T87+iL50PPkP
	hSxXOC9G8yG4W6phMf8uL3b/+MK73qBOfaBgv8gen8seSIbEGyU1XdY68jixrTcQsCGZ
	J4OjbOlpwr39cpAmqaDRllT1aCs84qeGtsyTeOMmUXf0FMarIY96xo6UjYtqGwuzcdim
	CNeQ==
X-Received: by 10.180.208.47 with SMTP id mb15mr32406999wic.16.1365670696227; 
	Thu, 11 Apr 2013 01:58:16 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPS id ed6sm1970084wib.9.2013.04.11.01.58.14
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 01:58:15 -0700 (PDT)
From: Nicolas Dechesne <ndec@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 10:57:05 +0200
Message-Id: <1365670626-18585-2-git-send-email-ndec@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1365670626-18585-1-git-send-email-ndec@linaro.org>
References: <1365670626-18585-1-git-send-email-ndec@linaro.org>
X-Gm-Message-State: ALoCoQlivYhDAM6dzXb3hK5mZkRXU8PJ4+sBwwez0hDBb/QqU1Cxe3euuA/jRl78K+/RQaMYbgcj
Cc: Nicolas Dechesne <ndec@linaro.org>
Subject: [meta-multimedia][PATCH v2 1/2] gupnp: add support for PR, and INC_PR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 09:15:41 -0000

This set of recipe was not implementing any versioning with PR
variable. Also, since the .bb files include .inc file, we also add
support for INC_PR.

Signed-off-by: Nicolas Dechesne <ndec@linaro.org>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp.inc       | 2 ++
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb | 2 ++
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
index 81db3ea..31dd407 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
@@ -2,6 +2,8 @@ SUMMARY = "UPnP framework"
 DESCRIPTION = "GUPnP is an elegant, object-oriented open source framework for creating UPnP  devices and control points, written in C using GObject and libsoup. The GUPnP API is intended to be easy to use, efficient and flexible. It provides the same set of features as libupnp, but shields the developer from most of UPnP's internals."
 LICENSE = "LGPLv2+"
 
+INC_PR = "r0"
+
 DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme gobject-introspection-stub"
 
 require no-vala.inc
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
index 4fb1d05..5e6ea35 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.18.4.bb
@@ -1,5 +1,7 @@
 require gupnp.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "http://download.gnome.org/sources/${BPN}/0.18/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "0e15fa26be7b1a0255e6dec07c285527"
 SRC_URI[sha256sum] = "6b437d5711b212292c6080626b97480268310da636a6cf937ad6119291af78a1"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb
index bab74b8..c064d03 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.19.3.bb
@@ -1,5 +1,7 @@
 require gupnp.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "http://download.gnome.org/sources/${BPN}/0.19/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "8165c3ad3d16576a0a99250b75df23f8"
 SRC_URI[sha256sum] = "0d3097c419e1f8af0ff8ee91318d75e8896b3b92924cb1a5cf93010795a7118b"
-- 
1.8.1.2



