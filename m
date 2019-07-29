Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1FA7F285
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 14:34:31 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id i2so27616992plt.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PB7hMAmTa7CpY4gGDb1AktZmHv4jWMVWKjXHxIvtHqg=;
	b=FsEzGzI38Ob++pOQBmvsxThrLUIYdVQ7MYre4RDl53HKj8GFBgH+U0uo7bwvTvapsZ
	rGgjAJ81gDk+/BCHPv+j9ssHvdqYnvpljQfn88GnmTuGdTCqwgqrInnhWZda773CKvP5
	oha861vvuxxtIjNjGtBWoh39KVf/f7c61IZ/e252V2sSTuZsuRePYbYnpZZSMh+TYzoD
	VHhFh2uqFSaHlnwQ1E2oYlKgxsr9npecMbPmnKfQ8GSKnRzp3831R5RT65z1k/f/s9JX
	ebhJdA2dG4MaMjcWsyLttetQJqwTteEjHymw4CKM9ztfHofl1X550ohgGfYeeHITwwS/
	j51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PB7hMAmTa7CpY4gGDb1AktZmHv4jWMVWKjXHxIvtHqg=;
	b=f7k2TjynZ7Lpgt9AerE4Fl6dl52wmezKspE4GbBJYKhkAaI5KhZcQzm/+wTGQltpQT
	+Ztys4YqrqGE+18nsz499dzb1tJlDFAlapA7avOb4u5zCAVfRULQo0frVZg3BAXI0SOY
	PVTWepYXJ27LglRrS+pLg2J2W53ToSRzNEx/KJovIzH7D8ioX4tvMzBDKEimdrclwqDl
	2VBCX60R2Y22XINGZXnOzgE28Zm89FqxljpUSlc372xtjS5ILPUuLbsitb68WjISaJrB
	4hC3ibhj/fOb1jgLGAA7G5IcoOmNMc0Wb9GRyENVdzhB/aMpMvDopmuetJAq6lzXBr0p
	Q2lQ==
X-Gm-Message-State: APjAAAUCjG/t1OzGodgVAXooKfkrFYlB/bvWCqX6Ki4JNymen71GOyI2
	ZDXFWRVHhoYkMEveL66edDpfEp/TiPA=
X-Google-Smtp-Source: APXvYqzaOwCx9y/7U46bRIY0td6NgYMNH0u8GzmHQz8a9k8+h0m8CtRPRdun9FvkUfet/tRLRq4UpQ==
X-Received: by 2002:a17:902:a03:: with SMTP id
	3mr109042746plo.302.1564410872019; 
	Mon, 29 Jul 2019 07:34:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	s43sm76924747pjb.10.2019.07.29.07.34.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 07:34:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jul 2019 07:34:21 -0700
Message-Id: <20190729143421.32165-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netkit-rusers: Add dep on rpcsvc-proto for rpc headers
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
X-List-Received-Date: Mon, 29 Jul 2019 14:34:31 -0000
Content-Transfer-Encoding: 8bit

needs rpcsvc/rstat.h which is no longer in libc but provided
by separate package now

Fixes
up.c:51:10: fatal error: rstat.h: No such file or directory
   51 | #include "rstat.h"
      |          ^~~~~~~~~
compilation terminated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
index 9b8af27f88..c62126318f 100644
--- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
 SECTION = "net"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://rusers/rusers.c;beginline=2;endline=3;md5=f4fc634a4ce8c569911196b72b10770e"
-DEPENDS = " tcp-wrappers libtirpc rpcbind"
+DEPENDS = " tcp-wrappers libtirpc rpcbind rpcsvc-proto"
 
 SRC_URI = "http://http.debian.net/debian/pool/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
            http://http.debian.net/debian/pool/main/n/${BPN}/${BPN}_${PV}-8.diff.gz;name=patch8 \
-- 
2.22.0


