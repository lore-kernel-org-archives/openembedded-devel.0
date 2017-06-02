Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB1277E31
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 04:41:16 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id w69so11062524pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 21:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AQ4qok9QnjaFmu2kU/0tXhrjELjK8IhB4SjV45GZt7k=;
	b=I8kTuInT1WBOm+X4uTuVbxUrRPLt6XyrJnXrjRkBaof0bpMgUxydi56/XnIqYwg/Gm
	l7hmCoza0mso6inKDZEKWP2K6Yqyz+mtICAz4fvtWoiDNxH01PeSV6Twu5oZSF8tJS6J
	YRYIe/T/A7ONQB9ViSa9/wGK1M12/m5WPiqNduWad29HtWgyPJQTXDC4boJ4e5DxuYoG
	9PiekQQJ+kC2hy1RpsJ8Qg9PXvfogcyY2HRrSc0U4ITO5qBQ1X+BJu3npV48JzKIY9Gi
	rAND303ZdeNm7vxNH6SDhZmQvFdBgKVlKkyJJHPantrNZfNsBiz6oRylxA/KJjzg/0Zd
	UWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AQ4qok9QnjaFmu2kU/0tXhrjELjK8IhB4SjV45GZt7k=;
	b=UxOTVuDQxvuAn3sps1bXAZy+4TY38LeE8NpKRT0XMmnPhD8c3t6/oTXX+7srmPVuao
	t44I+nZEKK7XRoKt1zEBfBNqjSJ1zSAuovUmd9TYwuB3ofo9VAMpDT2SmFmjgpMB1MGG
	fusuhCjI4U9Jay3SqKM7uRY6yj+vHDQvMcX6DjbU/PJCKIoSJ0IBh+JPvruf+jzgnNlh
	SmZUAPEs9NGmKPhhe2v9c5jqUh+MZmvBoe3zJIC2RT+xxalxt5M9hutyxALDRNjG3tA3
	mlqU90CBnwf+ACNSl/TjtgvmbxiTN/qIZHNs1SGfUXyamhCfefk/1FnvHQ8w8hMVnfD7
	nrZQ==
X-Gm-Message-State: AODbwcDCdydqXb2Bu+vAAzEQYT7qFalVnmMhP0b4JTo5+kMyOQsoQBlz
	R020u6N/6TBvBF+9
X-Received: by 10.98.74.211 with SMTP id c80mr4807841pfj.58.1496378477797;
	Thu, 01 Jun 2017 21:41:17 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	e20sm38502792pfd.34.2017.06.01.21.41.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 21:41:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 21:41:05 -0700
Message-Id: <20170602044106.9484-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [meta-oe][PATCH 1/2] audiofile: Inherit pkgconfig instead of binconfig
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
X-List-Received-Date: Fri, 02 Jun 2017 04:41:17 -0000

Fixes build with musl
../audiofile-0.3.6/configure: line 16964: PKG_PROG_PKG_CONFIG: command not found
../audiofile-0.3.6/configure: line 16971: syntax error near unexpected token `FLAC,'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index b23bfed58..f4e19e4ad 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
 
-inherit autotools lib_package binconfig
+inherit autotools lib_package pkgconfig
 
 DEPENDS = " \
     asciidoc-native \
-- 
2.13.0


