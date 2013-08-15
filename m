Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 098CB6B7C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:41 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so181153ead.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=qM9SvnxHvzWqHkXEP3kCbwpQGQ1vNZCw9B+8OKvxN3Q=;
	b=jjGbmYcW8kOyfbuZ4ffiU30BIN5aVS/53Ocf+q+4F0+Y6eXE78yKHJOL1A01qzXeju
	mNpRUD9x3moqgdG3joe14CI5iJ2cREyCE7a2JUsVN1iyK+t/OLbr4ub4wyRomghRnl+a
	JiPGyY1NhaztkGWuu3NtRwvIO4XKLyeQZE5GNZuGQQrbT6GrLXIOQbXJcivnz4gZTuxX
	4XKbvXOkF1Z6+ubkdXu3ZAH6DTZ4dbbUpn0l0IU5p/MKJNnH87+aLdNGL1hIUaTPIKAL
	s0MgibDMdpygNvtjjgCahQeRnkMSj/6Kqqe+IpD+hEOuv0Xcpa/V3MnMeVOa768YKmvF
	0bzg==
X-Received: by 10.14.211.1 with SMTP id v1mr20866525eeo.5.1376551182472;
	Thu, 15 Aug 2013 00:19:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm82051094eeg.17.2013.08.15.00.19.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:17 +0200
Message-Id: <f25badda659fb44484243cd3d95f33f7a8a41f7b.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 37/60] mbuffer: add PACKAGECONFIG for md5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 07:19:42 -0000

* openssl is autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
index dcd8a47..bd80c84 100644
--- a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
+++ b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
@@ -11,6 +11,9 @@ SRC_URI[sha256sum] = "e708b66f6cec9ba090877e8eb38e5627ac69aea9ebd9bca1360a29c739
 
 inherit autotools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[md5] = "--enable-md5,--disable-md5,openssl"
+
 do_configure() {
     gnu-configize
     oe_runconf
-- 
1.8.3.2


