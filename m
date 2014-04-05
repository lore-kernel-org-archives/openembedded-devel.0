Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id D531C6E3DE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Apr 2014 12:40:08 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id c1so1973110igq.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Apr 2014 05:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oNjscI1313aIOaSr/M3+rb5UxOLdKSdaX9MXJP8opOA=;
	b=RA1HF29AXzphGxXHnsXl4zJOTWj1imi23/MHG2OMHlIK0wp/BcliI64uQRSAZdYj4Q
	vjFbXEJjIqrZMqkbMf4enkzrMscrziKBdAc5rk8tA+4n+78nL8ofPOP+cFjdbdgP52sE
	fnlm/xMF8a22X7mD/XYXS9Z9NNHP/pqcyJNueGI5cVYk5+M4+kYCPDoD/J3V4cgyGIBg
	AKDNbO9ayCn+E4Boi9bXODXyK7FSW9daNPebLjT4+ib/A8iv/KdJjmasffmBtdDc8ECg
	JkaRtsid9j1bWQnfxBIRDTJD6hSsfMKfVTnUBvkriRgRwcxS5mbYjpLqQRXHB66NtetL
	SCHQ==
X-Gm-Message-State: ALoCoQmLytlYKlO1VFfERxWnY2FDJjw6hsI0j9nDPbV69i3KUl4sgNuBcxnN6WW9H5pXKlJdOOST
X-Received: by 10.42.44.4 with SMTP id z4mr17961689ice.34.1396701609517;
	Sat, 05 Apr 2014 05:40:09 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id b8sm13735966igx.3.2014.04.05.05.40.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Apr 2014 05:40:09 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Apr 2014 08:39:41 -0400
Message-Id: <1396701582-15906-3-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396701582-15906-1-git-send-email-trevor.woerner@linaro.org>
References: <1396701582-15906-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 2/3] liblockfile: remove dependency tracking option
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
X-List-Received-Date: Sat, 05 Apr 2014 12:40:09 -0000

--disable-dependency-tracking is only available where automake is used.
liblockfile doesn't use automake, therefore remove this option to avoid a
configure warning.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
index 67d2221..f59c783 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
@@ -15,6 +15,7 @@ SRC_URI[sha256sum] = "16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a069
 inherit autotools
 
 EXTRA_OECONF = "--enable-shared"
+CONFIGUREOPT_DEPTRACK = ""
 
 do_configure_prepend () {
     touch install-sh
-- 
1.9.0


