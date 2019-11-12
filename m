Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 534AE7FC08
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2019 05:17:01 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id s5so12473325pfh.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Nov 2019 21:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6EfbnO4Rp3xdO0e982FEFAxoOWuky8UF9kg9l4HkFuk=;
	b=fyx3WbGerZJDK0Gw/zPiUEy/+PVfFMRCRhcfQNsB8VU7Jg2Y1VJcjUSbHXl5mtSerJ
	nKM7f7GolJ8mYcxN0UUVg8S3AhPpzRpuvMAlnSFeHr+PBnnelNsFIoMSt980Ka+FcemR
	kV7tZ+RsuMPrugQpgc4K4Vs05GAlmTxgh8wS41kXUfzPuT0XB1YaE8yauKSG6FIZpfI3
	+mwDXDcn9Tzvu5FRejTCi01gl6XAKxD8CrMSGADJmIhwzl+hhAe5gP7XcgUrcEvrQVYq
	C5srYB8l+GHA/CXUyOSnepIzfO7hO9IA7HciBK3SaNM9LASrTHgsL+HuxDjIvzihpITD
	JD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6EfbnO4Rp3xdO0e982FEFAxoOWuky8UF9kg9l4HkFuk=;
	b=cQ45/TqY036DZaAYPtMBToX4OvZg22q+haTPacL5ZVvEGfndaWIqEXy7CsKhU6jkYT
	PaCa+COSfMZbiL1MM6H+RuZwT4SfR8n3L1o1hadskwcR31496JrKi4IRwkK3OVDLGbY/
	mvPXO8hMhUtRqxyRPJSxRWWb5GgkeZSDyfyCxgznLCS67oJXpirRTs/lVIyZnlxWx6Oy
	nqbasa09iU9TY06M+7nSpZgm4mUSm227Ch2SNbRFBWWtI62uuCZZZkhOmGRRr/5bVf1J
	Z1dWmkVNTYBXddOuAu6r75fKr46sHuQX8Dd85Z20ilHOjMl+a1J959aw/s/k7TRzy6xq
	ejcg==
X-Gm-Message-State: APjAAAXdpWODCmOySPiomoWrN7oDYhwYa/Nuu+NztYKbU0jq8iX94vSn
	eIk2dsT8gbuzpjqXBAt5qlqcGyIVG54=
X-Google-Smtp-Source: APXvYqwGntwa+mlYf1NWURnF+X16t/IcvsBGTfYNElh2uHHRClL08NBlcQ6p5lGFudkzQTsLBcquUg==
X-Received: by 2002:a63:1f08:: with SMTP id f8mr33552999pgf.145.1573535821746; 
	Mon, 11 Nov 2019 21:17:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a99e])
	by smtp.gmail.com with ESMTPSA id
	j14sm15605886pfi.168.2019.11.11.21.17.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 21:17:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Nov 2019 21:16:47 -0800
Message-Id: <20191112051648.472467-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2] lowpan-tools: Blacklist as its deprecated use wpan-tools instead
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
X-List-Received-Date: Tue, 12 Nov 2019 05:17:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Delete lowpan-tools from packagegroup-meta-networking

 .../recipes-core/packagegroups/packagegroup-meta-networking.bb  | 2 +-
 .../recipes-support/lowpan-tools/lowpan-tools_git.bb            | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 8f8d7fe3c8..9109b105f9 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -108,7 +108,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
     usbredir ntop wireshark tnftp lksctp-tools \
     cim-schema-docs cim-schema-final cim-schema-exper \
     libmemcached smcroute libtevent ipcalc c-ares uftp \
-    ntimed linux-atm ssmtp openvpn lowpan-tools rdma-core \
+    ntimed linux-atm ssmtp openvpn rdma-core \
     iftop aoetools tcpslice tcpdump libtalloc memcached nuttcp netcat \
     netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
     arptables macchanger nghttp2 strongswan fping \
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index b70c43f156..585968f836 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -35,3 +35,5 @@ FILES_${PN}-dbg += "${libexecdir}/lowpan-tools/.debug/"
 
 PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${libdir}/python*"
+
+PNBLACKLIST[lowpan-tools] = "WARNING these tools are deprecated! Use wpan-tools instead"
-- 
2.24.0


