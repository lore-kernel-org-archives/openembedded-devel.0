Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f41.google.com (unknown [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id EE7C26FBD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 12:02:36 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so11171361wgg.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 05:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=j7vANaNB7IatYGNVLg0j8SzOIN5r7Vy6MEuoRptts8s=;
	b=NgSd7P3FhebCRfS83jf5aFlcX37vahM39rnNDABNPLhQXvKU9fHW5HhCdJjVmvFLlg
	Y9t6DZ/Ag7vBiZK7vmKw9Ux6SsXTck4kcb012Jb3Rn+KFbowAj3AB0NjMzmq7JxwMpOY
	MDHXwMfbWp355DJ6cciA9nDSPHWisbwr0nnMddRqQ6xP2/mf4w0nnep8gw3m5r1rwKD8
	UL5zFqwIO2GThRRUEYJJZcjUi962XU9kF6c0+2rzfvX/5B9vtn/nEEufurpzy9oB7eua
	WIryGwtih9+Q848OEley6hGEZmJHeG7N6bV6ltMzrIXVUIGET/STlZ7CZnBTqa1I3KLq
	hFfw==
X-Gm-Message-State: ALoCoQnMtIcjFA0D8DhieYAiMUwV2UZ5rrMOKWUcJTpq6cBVCXRG4pKLvYpYx0MenOQlo+qiK40t
X-Received: by 10.194.71.71 with SMTP id s7mr52196238wju.48.1401278207858;
	Wed, 28 May 2014 04:56:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bj2sm16345631wib.3.2014.05.28.04.56.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 04:56:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 12:56:24 +0100
Message-Id: <109f78bb2752d4397069129e8db1a71f233b4d86.1401277810.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
Subject: [PATCH 2/4] readline: exclude autoheader from autoreconf
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
X-List-Received-Date: Wed, 28 May 2014 12:02:42 -0000

readline ships a hand-maintained config.h, instead of letting autoheader
generate one from configure.ac.  The required arguments to AC_DEFINE are not in
configure.ac so autoheader will produce warnings and the generated code will not
behave as expected.

Solve this by excluding autoheader from autoreconf, so the upstream config.h.in
is used.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/readline/readline.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index c33e91a..2c5ad00 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -21,6 +21,8 @@ S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools texinfo
 
+EXTRA_AUTORECONF += "--exclude=autoheader"
+
 LEAD_SONAME = "libreadline.so"
 
 do_configure_prepend () {
-- 
1.7.10.4


