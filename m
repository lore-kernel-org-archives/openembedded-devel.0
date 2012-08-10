Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpj6-00034F-Lf
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:58:08 +0200
Received: by wibhm2 with SMTP id hm2so1141007wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jpVXfNBobTWQBYF90qgQW3GkoG3rDzWZihXiBLpbxzI=;
	b=M3WPq9Qr0wx2gUXtAGatXsr1Or4RaE6FQPYruKrJ5AKowoU6xru4R8VcgyGpni3sAl
	jaavHDa7+gXBaRoJSxDtM7cs/Pk9j6DKmjncPsQu5ryyq+l75wQNgMsDppSYOsn74dgB
	takFNGQSO7MsV/O+p8LP9BwF9ZxUSSeQxmN23vOy6YPryw4DN2JZOQuDw6i0XtzzERd/
	WYxJjuwtqqgQcI1von33rHJlkTXFpmNgN1vGe5AbsjQQ8ygtccM3e5oV6oeGfoZmoM1J
	AC9eYp7wEFdoCsLTqc/1yrqHtRNzuiMTzoE/39v/TfLNl7dbesZcvIusE/zbF8NhjOtU
	+u/A==
Received: by 10.180.78.5 with SMTP id x5mr6043512wiw.13.1344606378118;
	Fri, 10 Aug 2012 06:46:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm7830400wib.10.2012.08.10.06.46.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:46:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:15 +0200
Message-Id: <3ec435a5bcaf15922da54e252cb9b698a42d1ba2.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 20/46] elementary: add eio to DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Aug 2012 13:58:09 -0000

* fixes:
| /bin/grep: /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libeio.la: No such file or directory
| /bin/sed: can't read /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libeio.la: No such file or directory
| arm-oe-linux-gnueabi-libtool: link: `/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libeio.la' is not a valid libtool archive
| make[3]: *** [module.la] Error 1
| make[3]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/elementary-2_1.0.1+svnr74527-r1.0/elementary/src/edje_externals'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index eb28d9a..fa8a8e8 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -4,6 +4,7 @@ SRCREV = "${EFL_SRCREV}"
 PV = "1.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
+DEPENDS += "eio"
 
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
-- 
1.7.8.6



