Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id B049F7D165
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:45 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id s15so19098202wra.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=/eESw6jN71ApdaL35irMR11jXw5YwIunfclNPnsNrVM=;
	b=fGsRfznYN3oE3ar9oB3XCKT7a2ZkpQkjXkI3TgtW4IPOLok9vD297CZBn93Ceuuxso
	g3nmUcb1XYcJhsHwBsIeaWg6Rc+nHPDjDG7Z5aKddO3+6dxdVai9aU8QEb9UDqv5QP6m
	GpWS0yChkUvezAKYGDXHz4GnsxhutRpaHXtrJijYaNdo6+GjHJx+DbTP9yGO0M/IDbnH
	5d27IsLlr4ZJ3dFFGGmMCQGGbTm3oMAda3e0krDg+Dl+aeY41I2qdRSEoK8Kgn2l8H8x
	+Ms0/tvuPpY+ubaz9ugwLzAUIL4I8m6DZrH992RCqnuFtOXWZr3T9jo6Xbh5kO+SiD5n
	SNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/eESw6jN71ApdaL35irMR11jXw5YwIunfclNPnsNrVM=;
	b=ICGteNTLmrrJja+dU4VujvNYrX9SwW+0cb8vNtP+TKTzBn4kfi9vMWEqrZ5+Dx6Bec
	TIoUqtVkmepk585Qu/5kHqYmPXLSUZPm59Dv9L/Dg6jCe2wC3ieu1jfJ5gfnPbEfAZXg
	A0oqBTNrvAcWApzroiPYJFiZbmROCffdsS4dg4UKaaDE/MZidXmJWyMpKBkYxCK4Yatv
	K7UYif7edXCz61rvZ3cmuZBDAXDW1bZwKPeRIXuVnVvGjktLyA3dJNVPh/bJYXLwTU8A
	fauG8VDHb3XT9uQclOo5bkW+1cjieiQn+j+6yXvAp7FPLcREGVw98VVRWcfjSiY8KKPA
	oQUw==
X-Gm-Message-State: APjAAAWxffBanJ7F2emxtmpj2U6MAOaJlOYPcTjRzWanIE09MSEkgmfI
	h33vwr11JGEV1EfoZnUgJyD6g/jO
X-Google-Smtp-Source: APXvYqzWkVGD32PCcm3sILAfYKauUQBFZ4hK45iumBjHIjzO2oLYK/8hcL2C/50i6sQndvaYYFx6Nw==
X-Received: by 2002:a05:6000:1292:: with SMTP id
	f18mr24479821wrx.115.1553700946323; 
	Wed, 27 Mar 2019 08:35:46 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:35:09 +0100
Message-Id: <20190327153509.23928-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/15] cppunit: fix patch fuzz warning
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| Applying patch 0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch
| patching file doc/Makefile.am
| Hunk #1 succeeded at 8 with fuzz 2 (offset -14 lines).

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...akefile.am-do-not-preserve-file-flags-when-copy.patch | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-test/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch b/meta-oe/recipes-test/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch
index 6a20c1283..441876e40 100644
--- a/meta-oe/recipes-test/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch
+++ b/meta-oe/recipes-test/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch
@@ -17,15 +17,12 @@ diff --git a/doc/Makefile.am b/doc/Makefile.am
 index 8815476..3237499 100644
 --- a/doc/Makefile.am
 +++ b/doc/Makefile.am
-@@ -22,7 +22,7 @@ htmldir += $(pkgdatadir)/html
+@@ -8,7 +8,7 @@ htmldir += $(pkgdatadir)/html
  html_DATA += $(static_pages) html/index.html
  
  install-data-hook:
 -	cp -pR html/* $(DESTDIR)$(htmldir)
 +	cp -R html/* $(DESTDIR)$(htmldir)
  
- # Automake's "distcheck" is sensitive to having files left over
- # after "make uninstall", so we have to clean up the install hook.
--- 
-2.5.0
-
+ uninstall-local:
+ 	rm -rf $(DESTDIR)$(htmldir)
-- 
2.20.1


