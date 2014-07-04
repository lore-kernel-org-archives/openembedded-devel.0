Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 247846AC9D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jul 2014 16:01:31 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id bs8so13152840wib.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jul 2014 09:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Bf73GuOmFPLqyDDzbH6i6O5IbY85g2wafevKClyq7zs=;
	b=hVNGs1ANB3/tiWM7i/hJzttfK3nkypW7q+yioTGH/6Fd39qe5YgX6HTb5rDmy4B4ex
	cfkcM5fIxI1g+aFNYtWFbtCJ4liwxLZ/4AcbOL3d7hX3zyevexePmiFeHDY+7CBaTRuF
	w0dd1/uUhVhf0Zm9FP8VMkn4gb5MbSbQkTOZGfI6cXgNT49zsNLrRHIhdneyh8S3muJS
	6RpDPo7bUE64MmvJkH/RiWwC8VEqKzdEYIQwn3n1aVVAzBWQ0AknDdRXNbHIsT1jPxnT
	0mPiaD4z4B4vipwv2wYModKriPEoeX/iJJVCciI6HC6mazyV/SOvGIF0qxOXgturvzpY
	g8fQ==
X-Gm-Message-State: ALoCoQl4uL767/ycwXZHurfKXQ5ZfV+1T2RGh3t27utj8NfQt1NimXB1Kr+S1MilrTl2uVUqNJbG
X-Received: by 10.180.90.132 with SMTP id bw4mr48920976wib.42.1404489689187;
	Fri, 04 Jul 2014 09:01:29 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f6sm69829321wja.25.2014.07.04.09.01.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jul 2014 09:01:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jul 2014 17:01:20 +0100
Message-Id: <1404489682-30529-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] poppler: inherit gtk-doc
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
X-List-Received-Date: Fri, 04 Jul 2014 16:01:38 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/poppler/poppler_0.22.4.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
index 7aa0dfc..bdd4144 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.22.4.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "4f438f34e63265e2da8427f3423f940ff41c26088922a9f5d976f795c1
 
 DEPENDS = "fontconfig jpeg zlib gtk+ cairo tiff lcms"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gtk-doc
 
 EXTRA_OECONF = "\
     --enable-xpdf-headers \
-- 
1.7.10.4


