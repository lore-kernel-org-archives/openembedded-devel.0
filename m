Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8D69274EB2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:37 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id u16-v6so1657586pfh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i2SBWAFNc2JMJRRX0m4naYebXnX14Cf8i65weh/cZKs=;
	b=bWSyfL/XNruWD8B/UJ49nQJQcih9yCFuUB8u7L8LZgjF99B8gD2D854QTK8M6hrbE4
	kTiX1GkI9jsc2bvITjOPr2MljI/U6OihCCGkBRtP7bUQdG04Czf0lnSBsz7ZCvPSKMfS
	KWc3VtcaLW5n8ddJhsjgpKn0sGMqhIBpNFIY8pcrADz6VpoP7niLr/apjpU8c/TETI1O
	GTrrYT0U2x+UV1kM44NMGaysILBDAcn7Aw6kVWaB4oMzB/eMTssWS9JwkjjzMgf98CZg
	hUSVAKs4E9pT8+Vb3cKuVuoGyULkYhKzd+sdRfT+kx8nOiJVdLl38TND6Cum8R31vAdd
	U5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i2SBWAFNc2JMJRRX0m4naYebXnX14Cf8i65weh/cZKs=;
	b=IvzpPGJ5uK9UvRmT5sT+AY9lhaU6rwNCfgsiG1/1h6kVz8tZRqROj2Ofryjumn5bxl
	mWAGkODgo6+Cq4j7ZHCImt6XQQFGJbGz0xwDdzGeBBA5yIrWSFCm4dPfHbc2uT+5gqnp
	2ydDefps16ad4DSJD1iwc3qGcZUUS7hyhOjKUKrrVzX0eIyOViqj37mf6o7GfI5AK+my
	FdLxH9+ArZ/aEPRq04f30yphyCKSfJf5j3ELwz6tGWNdxDQX+ogOlXFATic/kg/UCt/H
	NSlfLJMa9eusPUIIlgo62TkSiS436rf9kp6fAABr1THd+yg6PftTpI9CTABW2zYAN8Hk
	7VJQ==
X-Gm-Message-State: APt69E0J7/MgkoHsdaDI+WytTZYFQQdbf2r4H80A8QJCGBo1iUdSkUBx
	vVv0U21A3+l9IFc6gp5Tc3gA1Q==
X-Google-Smtp-Source: ADUXVKJOLuT9FLk1X7Mx709jVbqk4V5L/EI0m156IX0gD+Mut9Pk3s398W1SkqxAVDqZW+5GgIiDsA==
X-Received: by 2002:a65:52c3:: with SMTP id z3-v6mr8382630pgp.69.1529867978442;
	Sun, 24 Jun 2018 12:19:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:34 -0700
Message-Id: <20180624191845.31082-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 09/20] corosync: add corosync.conf.example
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:37 -0000

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add corosync.conf.example as the template for
  /etc/corosync/corosync.conf to make the cluster
  works as the previous default config doesn't work
  as below output:

  root@host1:/# crm status
  Stack: unknown
  Current DC: NONE
  Last updated: Mon Dec 25 05:30:59 2017
  Last change: Mon Dec 25 05:30:32 2017 by root via cibadmin on host1

  0 nodes configured
  1 resource configured

  Full list of resources:

  WebSite	(ocf::heartbeat:apache):	Stopped

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../corosync/corosync/corosync.conf           | 58 +++++++++++++++++++
 .../corosync/corosync_2.4.4.bb                |  5 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/corosync.conf

diff --git a/meta-networking/recipes-extended/corosync/corosync/corosync.conf b/meta-networking/recipes-extended/corosync/corosync/corosync.conf
new file mode 100644
index 0000000000..6aef9de950
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync/corosync.conf
@@ -0,0 +1,58 @@
+# Starting point for cluster with pacemaker/openais
+compatibility: none
+
+corosync {
+	 user:  root
+	 group: root
+}
+
+aisexec {
+	with Pacemaker
+	user:  root
+	group: root
+}
+
+service {
+	name: pacemaker
+	ver: 1
+}
+
+totem {
+	version: 2
+	secauth: off
+	threads: 0
+	interface {
+		ringnumber: 0
+		# Cluster network address
+		bindnetaddr: 192.168.10.0
+		# Should be fine in most cases, don't forget to allow
+		# packets for this address/port in netfilter if there
+		# is restrictive policy set for cluster network
+		mcastaddr: 226.94.1.1
+		mcastport: 5405
+	}
+}
+
+logging {
+	fileline: off
+	to_stderr: no
+	to_logfile: yes
+	to_syslog: yes
+	logfile: /var/log/cluster/corosync.log
+	debug: off
+	timestamp: on
+	logger_subsys {
+		subsys: AMF
+		debug: off
+	}
+}
+
+amf {
+	mode: disabled
+}
+
+quorum {
+	# Quorum for the Pacemaker Cluster Resource Manager
+	provider: corosync_votequorum
+	expected_votes: 1
+}
diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
index b760c117cf..5ebec08b99 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
@@ -7,7 +7,9 @@ SECTION = "base"
 
 inherit autotools pkgconfig systemd useradd
 
-SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
+SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz \
+           file://corosync.conf \
+          "
 
 SRC_URI[md5sum] = "69db29ff4bc035936946be44fc8be5cd"
 SRC_URI[sha256sum] = "9bd4707bb271df16f8d543ec782eb4c35ec0330b7be696b797da4bd8f058a25d"
@@ -47,6 +49,7 @@ do_configure_prepend() {
 }
 
 do_install_append() {
+    install -D -m 0644 ${WORKDIR}/corosync.conf ${D}/${sysconfdir}/corosync/corosync.conf.example
     install -d ${D}${sysconfdir}/sysconfig/
     install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync
     install -m 0644 ${S}/tools/corosync-notifyd.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync-notifyd
-- 
2.18.0


