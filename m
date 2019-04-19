Return-Path: <leon.anavi@konsulko.com>
X-Greylist: delayed 2729 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Apr 2019 11:12:19 UTC
Received: from anavi.org (anavi.technology [91.215.217.29])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6EA6025F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2019 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org; 
	s=default;
	h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version
	:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QS2fmeTm0PDVb7+VgyVMS3I7IyePM9rUAjhiqPM7xWY=;
	b=TN8w88Lf200S/KQm9dP0bTExMr
	aBXXYczGLzkyWyE5ZCfpNop8I7hiWQxfrYX3u7qyc9WhchTl4Ef2Eu80NvFuG3qT2ys+e6stieo7Z
	2l76sGz0TKeVpW+8batZDgK32I3dTJKvEq4fYSJxdiK/QyXWDASPcpX9b7BJ1+u8gBaY=; 
Received: from [78.130.245.106] (port=45572 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.91)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1hHQjG-00083l-HQ; Fri, 19 Apr 2019 13:26:50 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Apr 2019 13:26:33 +0300
Message-Id: <1555669593-12468-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [meta-oe][PATCH] openbox: Add python-shell as a runtime dependency
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
X-List-Received-Date: Fri, 19 Apr 2019 11:12:20 -0000

/usr/libexec/openbox-xdg-autostart imports Python module glob
for Unix style pathname pattern expansion. File glob.py is
provided by python-shell therefore it has been added to the
RDEPENDS of openbox.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index f4d21b8..9af3798 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -54,4 +54,4 @@ FILES_${PN}-gnome += " \
 
 FILES_${PN}-config += "${sysconfdir}"
 
-RDEPENDS_${PN} += "${PN}-core ${PN}-config ${PN}-theme-clearlooks python pyxdg"
+RDEPENDS_${PN} += "${PN}-core ${PN}-config ${PN}-theme-clearlooks python python-shell pyxdg"
-- 
2.7.4


