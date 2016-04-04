Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 945F27680A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 13:36:03 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id f52so53305469qga.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=XV0b2mnVuWkp83qSNtE9kix5bBhUyYxgi37njsEitNg=;
	b=BdRnuwRCqm4bta+Bq8xfDkzt+jxAN/zF1SQieGIFbJ11qk8TPrYhPHI80TwOaFbo58
	djemg+PBJ2W5CbQlGQxkoZ0YF1ArTvVCqulu0zVFWn1Przvq1gxS8qb2hMM2g77Akwdr
	8qCIlsKQyD8/w3SHdIqs0/6YGU9GtD6NF8quY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XV0b2mnVuWkp83qSNtE9kix5bBhUyYxgi37njsEitNg=;
	b=QLOsCFisJN9US6Kl1tVBnwVLToqiSuxNsXJ6UnSJO3SY9LNze9Bx0W0VkwOw4N1dFn
	YNAmL72x/CTWhE2vO0ZiT/hZJQptfSz6siXlhj++kXLS712gVYU9AV9RAapZt63/VSUt
	jPmqqmVq6p1ot5dS/9etCdgUtxgEa32P88VL4LqK0+gee8Q0Q55nvH3VWQ3p+YpkAtc+
	uh7xmvBN2uv4nTfZJo9XvJrv4LCARVVX4/PDunROwYAD/CnIuzCLO15MYG1pcQCYDGRS
	SLOyHN+IIfPG4U8WE9TN/Z/WimMHFALE1BAOcAKZeJh+4GF6BafJonb6ndT8tuJ9Y+Z+
	vytw==
X-Gm-Message-State: AD7BkJIrHdDKRJCgGM9r4CVRStFz8gR2sMHmnaMYs7jzE9aJh3ZZnusDyRo88iCdNuxD9uOX
X-Received: by 10.194.83.134 with SMTP id q6mr5755107wjy.131.1459776963721;
	Mon, 04 Apr 2016 06:36:03 -0700 (PDT)
Received: from localhost.localdomain (cag06-1-82-234-133-133.fbx.proxad.net.
	[82.234.133.133]) by smtp.gmail.com with ESMTPSA id
	j18sm14070473wmd.2.2016.04.04.06.36.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 06:36:02 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Apr 2016 15:35:44 +0200
Message-Id: <1459776944-1846-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.8.0.rc3
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH] openbox: add run time dependency on openbox-theme-clearlooks
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
X-List-Received-Date: Mon, 04 Apr 2016 13:36:03 -0000

Without this default theme install , openbox is unable to start, and shows the
following message:

dragonboard-410c:/home/linaro# openbox
ObRender-Message: Unable to load the theme 'Clearlooks'
ObRender-Message: Falling back to the default theme 'Clearlooks'
ObRender-Message: Unable to load the theme 'Clearlooks'
Openbox-Message: Unable to load a theme.

As discussed in [1] , the solution is to make sure that openbox-theme-clearlooks
is always included.

[1] https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg47153.html

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index 9f42177..b354ae7 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -37,7 +37,7 @@ python populate_packages_prepend() {
     do_split_packages(d, theme_dir, '(.*)', theme_name, '${PN} theme for %s', extra_depends='', allow_dirs=True)
 }
 
-RDEPENDS_${PN} += "${PN}-core ${PN}-config"
+RDEPENDS_${PN} += "${PN}-core ${PN}-config ${PN}-theme-clearlooks"
 FILES_${PN}-core = "${bindir}/openbox ${libdir}/*${SOLIBS}"
 
 FILES_${PN}-lxde += "${datadir}/lxde/ \
-- 
2.8.0.rc3


