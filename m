Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id EF24F7F33E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:48:48 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id f17so36965081pfn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2019 23:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=09XPeSlcl0OuSXOcnTY2EcaDuUtx7eTt8ohKNRSQygo=;
	b=WGRkm058RStavlfYaLe2omJgfskk9yRTtUnSqUf5WO8cGNzQ96wRsysfiFroHF5i6/
	BiEToCIdAAe5vIGZnQ9V6VlahxkhoeOLAxO0AgU787OiaXdTUbbbC+LMlxIF2YQlxp3v
	1Dpu6kjKkMdJ/pzQXgDSqi77agzb6K3g+FJPKNQTAWjqmlvNbM8Wtw7EbLjutzUjBSQK
	PDoRkn7XwE1fuYnvTVqHyvWOsjthvubLYRdgAZUC9sNYZQ2s/cFejcOQx5di1LU8fbe4
	5ydUyOVcsMkdqbk9M02B1y/7eBFv/O/4TIvVNZzW+y0JzDA3KrsGlIx1gfGQYJ2swdmJ
	WnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=09XPeSlcl0OuSXOcnTY2EcaDuUtx7eTt8ohKNRSQygo=;
	b=ptFIdIMZo/6Y1kBXakwDRoLXF2faP2MGLy//hhGEbeuz4ANlapY4hR85Av7uUNMCpf
	QoLNrRtmppXj0L818Kem7rIXqo3MH9yVKum4jZaOwe1tT2JF0i8dFCGiB6d2RAU98x61
	2wh9EGT/+/1T8F1hQImS8HJctl1KVhzThddjgVUzelFVFhQRIPQj4OeTX9qO6twWKFmS
	VhAHew7HpZoPihSdzyMk0ZPD7i5DU4oAVXhL8AezVkQBO1WtI4z7cPiJWqYSbX80PnmK
	eOO+GJ0eV62Fl+g1QXT7MWClKrdHJCzOKrhL+rE1NJIcT3Iloc7HVix5hMY0hpOChbSZ
	9oMA==
X-Gm-Message-State: APjAAAXqs+sPty14jYbJN23OHZEFy8sRIVgQhLMCnpuLHPW/GAcuEfZA
	UebujqkrFZWWyofLfdJ2trrA29SIGUg=
X-Google-Smtp-Source: APXvYqw4uDN7EUj2+8+5zqmllKHOjvn8m+iSnVYT5OHd6ip7Z0CxK0rZCxZ7ySkKGoq2m8J4nn8byQ==
X-Received: by 2002:aa7:9e9a:: with SMTP id p26mr2121625pfq.25.1565074128852; 
	Mon, 05 Aug 2019 23:48:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u23sm89377775pfn.140.2019.08.05.23.48.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 23:48:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Aug 2019 23:48:34 -0700
Message-Id: <20190806064835.33856-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806064835.33856-1-raj.khem@gmail.com>
References: <20190806064835.33856-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] pmdk: Fix packaging errors when building on non-x86 host
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
X-List-Received-Date: Tue, 06 Aug 2019 06:48:49 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: QA Issue: pmdk: Files/directories were installed but not shipped in any package:
  /usr/x86_64-linux-gnu
  /usr/lib/pmdk_debug/libpmemobj.so.1
  /usr/lib/pmdk_debug/libpmemblk.so.1
  /usr/lib/pmdk_debug/libvmem.so.1
  /usr/lib/pmdk_debug/libvmmalloc.so
  /usr/lib/pmdk_debug/libpmempool.so

....

  /usr/x86_64-linux-gnu/include/libpmemobj/iterator_base.h
  /usr/x86_64-linux-gnu/include/libpmemobj/tx_base.h
  /usr/x86_64-linux-gnu/include/libpmemobj/base.h
  /usr/x86_64-linux-gnu/include/libpmemobj/lists_atomic_base.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/pmdk/pmdk_1.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
index c20bdf6d1e..c8688b2c63 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.6.bb
@@ -35,14 +35,14 @@ do_install() {
 	oe_runmake prefix=${prefix} DESTDIR=${D} install
 
 	# Remove uneeded files
-	rm -rf ${D}/usr/lib64/pmdk_debug
+	rm -rf ${D}/usr/${baselib}/pmdk_debug
 }
 
 # Include these by default otherwise the SDK is not very useful
 FILES_${PN} += "${bindir}/pmempool ${bindir}/daxio"
 FILES_${PN} += "${libdir}/*so*"
 FILES_${PN} += "${libdir}/pkgconfig/*.pc"
-FILES_${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/*"
+FILES_${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/* /usr/*/include/"
 FILES_${PN} += "/usr/etc"
 FILES_${PN} += "/usr/share"
 
-- 
2.22.0


