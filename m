Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id CFBA562134
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 20:56:58 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id m198so14062849oig.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2016 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=odDLMZR/PrTco/+MG/5MgExSzDUUeQnF+fNZFjoU8C4=;
	b=CeKiydgBq+3pe125if4KFh5SeOlJHFEdBEllw1Irn0n/0kRoto665cc2dQJTsXHJIh
	cvVRxxAMFe/jNi/cqP8PzpJSYrbqx407ViO89gbiAj0SCLCU/wm+vyFgevrCx4pEeKdW
	DlHIrAmtGvJDBlinQShF58L74q7x8TUlbNfCSlTUgM+Fd6eT4YpnZcqBki2kVGnF4p56
	zf/+YZPbEPy4eo8n4gFxx+9QtnrQDa8SRJ1vcn4sbZJyAQC0QlphYD6kFCL5gLfq3c6n
	1sKccdq0s86foYShOzmKVvGcLmkQGE5X8m02YMuZJkw19S7Gd0cNyDw9DhBRsc9sOA2n
	0qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=odDLMZR/PrTco/+MG/5MgExSzDUUeQnF+fNZFjoU8C4=;
	b=jLuVwVW/+Qv2NRHjitAvNJWcT/yHeDCeBcAemn+XE1IA4S2qs+5zAIS5o70NGpy6E9
	RzU1kYkxpsklzO5KoP/U8kwrF9ECs1R4DrfPSle2nj6p040u0e8hMB+/otQ9hNjo0ThJ
	Wo428Pu9xMLhPM4/fPqpyYx8cM5Yth5vPegubVKwE8yzAXoH6R1nw1r+YfewjfumlnoG
	UvNlFemDJAVtXdLqa5ZAq2wdXnJAhSQVxCU3I/1rQOC2AsJw6hZHFWeycm5epS/aPW3g
	eylXm5u8dK75Yre9zd6G+EM0o93BhzAs6S8mPHnYAvQV2i8CSl/LdKDeVpY1yxqOdT4Q
	3Llg==
X-Gm-Message-State: ALyK8tKS5ToLyBA+nflL2bVRv/o3I1VYkX49PCH+SAR19MUpqRIbbcG/vJfBDYmM+sxczg==
X-Received: by 10.157.2.74 with SMTP id 68mr10570770otb.155.1464382618545;
	Fri, 27 May 2016 13:56:58 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id x65sm9932518ota.9.2016.05.27.13.56.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 13:56:57 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 May 2016 15:56:35 -0500
Message-Id: <1464382595-10966-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: derek@asterius.io
Subject: [meta-oe][krogoth][master][PATCH] python-simplejson: change to setuptools
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
X-List-Received-Date: Fri, 27 May 2016 20:56:59 -0000

Change from distutils to setuptools.

simplejson's setup.py is written to import setup, Extension, Command
from setuptools and fallback to distutils if the import fails. Prior to
this change files were being installed to a host polluted path
/usr/lib/python2.7/site-packages/simplejson-3.8.2-py2.7-linux-x86_64.egg
(even on ARM targets). python was unable to import simplejson. Switching
to setuptools corrects the problem.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb b/meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb
index a2a6c40..0c9112e 100644
--- a/meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb
+++ b/meta-oe/recipes-devtools/python/python-simplejson_3.8.2.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "d58439c548433adcda98e695be53e526ba940a4b9c44fb9a05d92cd495
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit distutils
+inherit setuptools
 
 RDEPENDS_${PN} = "\
     python-core \
-- 
2.8.0


