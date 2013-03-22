Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6El-0007hv-2m
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:59:26 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so8140164wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=958vYwHxcuKpUFynxx2Uv3B9Mq3IPT5oSOB2QahcQbE=;
	b=nKcZ4W/Ay7HzvAZPFNLcNfSrvj9BgevAL0Zt4FQ83a/gh2IqS/9w/QNdaeAkTnDgdQ
	4sZ1sw2rHYukz392qJWr2S44ieKDRSdkvqT9c3FZQ2UawQbip5VeMQWGIfceLZUY4XY3
	hRaRYBtd7992jBB/2UFE341NiqmJau3Cu8IWmm+EwxoiUVty2nZ3a6z1jKbAIKld34Vc
	DCjkNvSKW+v6j7Aj7piX5uCATWtQH4X6pGAX+M6jDSRHV2IIS3xAyd6EE6R4OrWwjw+g
	NkE8ldbtNKq0O1GB0U/0XdNNAXJ/GRwjLxWT88MZGXgv+Ayr6Kbb8eBwf5ezuCN+1eie
	RdIA==
X-Received: by 10.194.92.231 with SMTP id cp7mr4768363wjb.19.1363974109286;
	Fri, 22 Mar 2013 10:41:49 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.48
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:34 +0000
Message-Id: <b93b6a12cb661026efc5864dc59e5bac3b8396a1.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkE4vq6WFy77WQDcXu3XDbJEFLNoC00oGs58YZwaYSy+oHF9nInOJ4SD9QhUtrX8JVU5JER
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/22] update-rc.d/systemd: change communication variable name
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:34 -0000

Rename SYSTEMD_BBCLASS_ENABLED to INHIBIT_UPDATERCD_BBCLASS to reflect the
action, for clarity.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass     |   11 +++++++----
 meta/classes/update-rc.d.bbclass |    8 +++-----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index cca2152..42fa554 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -10,11 +10,14 @@ SYSTEMD_AUTO_ENABLE ??= "enable"
 # even if the systemd DISTRO_FEATURE isn't enabled.  As such don't make any
 # changes directly but check the DISTRO_FEATURES first.
 python __anonymous() {
-    if "systemd" in d.getVar("DISTRO_FEATURES", True).split():
+    features = d.getVar("DISTRO_FEATURES", True).split()
+    # If the distro features have systemd but not sysvinit, inhibit update-rcd
+    # from doing any work so that pure-systemd images don't have redundant init
+    # files.
+    if "systemd" in features:
         d.appendVar("DEPENDS", " systemd-systemctl-native")
-        # Set a variable so that update-rcd.bbclass knows we're active and can
-        # disable itself.
-        d.setVar("SYSTEMD_BBCLASS_ENABLED", "1")
+        if "sysvinit" not in features:
+            d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
 systemd_postinst() {
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 0997702..9f1e28a 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -80,12 +80,10 @@ python populate_packages_updatercd () {
         postrm += d.getVar('updatercd_postrm', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
-    # Run if the sysvinit feature is present, or if the systemd feature is present
-    # but the systemd class hasn't been inherited.  We want to run in the latter case
-    # as systemd has sysvinit compatibility, but we don't want to always so that
-    # pure systemd images don't have redundent sysvinit files.
+    # Check that this class isn't being inhibited (generally, by
+    # systemd.bbclass) before doing any work.
     if "sysvinit" in d.getVar("DISTRO_FEATURES").split() or \
-       ("systemd" in d.getVar("DISTRO_FEATURES").split() and not d.getVar("SYSTEMD_BBCLASS_ENABLED", True)):
+       not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):
         pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
         if pkgs == None:
             pkgs = d.getVar('UPDATERCPN', True)
-- 
1.7.10.4



