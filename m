Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFE67E069
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:52 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id w22so7834622pgi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QLUxQ5ngfUqmRRn0zUVyqguittuceCP3vzCSq7GCLFo=;
	b=HLzvSMvqV6DNRqlWcBxCetDKU/rjXCDBC7YNnvwfZITf3rSs/fmsA7L72y2Vsj2v3x
	s4jprplZ0/RoY2rBJibnZkeXorjMKHlmd4t/5IB98a420/YZA1IMDJQJBgEEtS3g1Jhp
	3YZgo0OvpiCLCm9D3qdK3vXB6y4JlA1PXaPYgpXgPh+3YoQDQZs7EzE57ItCaJhV5lFO
	QsM7eaIyjiewn5afaQfHD49oxMHanvyuEitWntSQpYLAHlZ9Pa+3WIg3rWg0ZIH+9m2T
	6NjFzXZVwQu81TUGDk2eDDufzxJlCHG8El1dRfREQXKT3cMwh6th+hOIaFwYKyG2hb64
	eZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QLUxQ5ngfUqmRRn0zUVyqguittuceCP3vzCSq7GCLFo=;
	b=LS69vNiYb6Z0zZIvhSx/W/LxRG1PEdb4gmZDNkwhisTDSDXsELfBU3PzTazDe2TUX5
	po7dD7JyMEkdg3eBr0Tpg5BJj4NBCiUCF40vD6XbuGurR5qe8rlmcNjH7FBD5xG0BhvR
	luYUMFVssMBnaBfbWbia3JjI7KI5cmGnWVhm1dHeiHJg2iwZvPLReauY8jXU+XABABT4
	yIAHfDopy0INf8YUHFWM5yfOt6w21vXguJnNedV5uzrOyP+R0QdGzZj5hVjc8U1JbSjr
	rIMB56hz3VxYlbnO/AWeOYXAsVXHsEme4zkdJfwm7Hxe0Kp4NF2Pkw5u+0YLcb6lxb/Y
	o3Wg==
X-Gm-Message-State: APjAAAXb6xGx2nTQK6F1Nae2Szt2yqSg1iljPNzDvvNFNx3RLqWywpbQ
	VkeHMdv1bANspTwLnf2Uu06CoLbA
X-Google-Smtp-Source: APXvYqyFuXbi/DfE/c1FW5+XfV2SFpIlNgaZUTu3raoJp4I5ijkfDcBuR2XxPWX3oeX+CA9JCdDagA==
X-Received: by 2002:a63:c50c:: with SMTP id f12mr78596095pgd.71.1558411013278; 
	Mon, 20 May 2019 20:56:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:18 -0700
Message-Id: <6f1b1f94e32359c36b023a9217c2ec2e8c5d9cff.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 18/34] php: correct httpd path
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
X-List-Received-Date: Tue, 21 May 2019 03:56:52 -0000

From: Changqing Li <changqing.li@windriver.com>

Configuration:
IMAGE_INSTALL_append = " modphp apache2 phpmyadmin xdebug"
PACKAGECONFIG_append_pn-php = " apache2"

Apache2 service start up with error:
[php7:crit] [pid 3943:tid 140477147074880] Apache is running a threaded MPM,
but your PHP Module is not compiled to be threadsafe.

Fix:
after apache2 is upgraded from 2.4.34 to 2.4.39, apache2-native
installs httpd into STAGING_SBINDIR_NATIVE, correct it so that
ZTS feature is open, and php is compiled to be threadsafe.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/php.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 6f893ad..785c2f5 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -102,7 +102,7 @@ acpaths = ""
 
 do_configure_prepend () {
     rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
-    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
+    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_SBINDIR_NATIVE}/httpd!'
 }
 
 do_configure_append() {
-- 
2.7.4


