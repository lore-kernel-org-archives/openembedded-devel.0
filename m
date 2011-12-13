Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVbK-00021p-Ig
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 17:53:10 +0100
Received: by eekb15 with SMTP id b15so3169269eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qyrMZgxuQejuH+xdBTPDQeufavwTcBgFq4qppLV6FLg=;
	b=GIw/abURmT2w7E33bw5dm7pNHoA0mIV7Ovx4+cbZdytRcEybrmiN6FTxmnVn+mwQXd
	9v47qtzLIWPrk//fmwjtp17Ts0B8Ad2zSvjmk1fZstakmib6k0x6rwnwxK1cMXpRWI5I
	jjDCuCvVBkdvAX5XPyDiddzztI4nRm0O8esYw=
Received: by 10.180.95.170 with SMTP id dl10mr27486579wib.31.1323794774926;
	Tue, 13 Dec 2011 08:46:14 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	n9sm27277056wbo.16.2011.12.13.08.46.12 (version=SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 08:46:13 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:44:41 +0400
Message-Id: <1323794683-24233-5-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
References: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie 4/6] opie-button-settings: make whole recipe a machine-only
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
X-List-Received-Date: Tue, 13 Dec 2011 16:53:10 -0000

Currently bitbake spills warnings on opie-button-settings
recipe containing machine packages, while being non-machine one.
Disable this warning by replacing all PACKAGE_ARCH_xxx stuff with a
single PACKAGE_ARCH = "${MACHINE_ARCH}"

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../opie-button-settings/opie-button-settings.inc  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-opie/opie-button-settings/opie-button-settings.inc b/recipes-opie/opie-button-settings/opie-button-settings.inc
index 4cc0908..15b46ee 100644
--- a/recipes-opie/opie-button-settings/opie-button-settings.inc
+++ b/recipes-opie/opie-button-settings/opie-button-settings.inc
@@ -18,7 +18,7 @@ do_install() {
 }
 
 PACKAGES_prepend = "opie-button-settings-pics "
-PACKAGE_ARCH_opie-button-settings-pics = "${MACHINE_ARCH}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 FILES_opie-button-settings-pics = "${palmtopdir}/pics/devicebuttons/z*" 
 FILES_opie-button-settings-pics_h1910 = "${palmtopdir}/pics/devicebuttons/ipaq*"
 FILES_opie-button-settings-pics_h1940 = "${palmtopdir}/pics/devicebuttons/ipaq*"
-- 
1.7.7.3



