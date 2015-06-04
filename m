Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id F34B6734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 03:10:15 +0000 (UTC)
Received: by payr10 with SMTP id r10so19989149pay.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 20:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z4KQFXr9ZFcbfh8ZSe+Ecij3yhhfSJD4GtzFr4VhsRE=;
	b=NqKPKpivHQcvxdy6jlt2gzo87zSjH2DWkfPQ+ghHoXmEu3NJSP2SeYtTybu743L6HW
	6nMOGymhsW9Pn0yU5XVQNDk9sFGT3o3hp/lZNmkkGZmELL+rFDp/eSaycXweyMAzwfn6
	RukoON+/KPCz0qyofgYxvZI5ac6CgkYJbGbh5lvnO9CxMovJmZ0LndEfGanzoSAVvAso
	rWTnz9U5gleXNoiz822y4LieoRQYQcbqhKy9Y/xuhYq07CMyflgnhSG5XRT2Rl57Mds0
	0lQL1Z3iMwBYNTMH3nwkqSWH/xfzv7XBbrCf8frp48HcsnQakXbtcm6AxCCKc3uxerev
	HfYg==
X-Received: by 10.66.136.170 with SMTP id qb10mr64466393pab.56.1433387416871; 
	Wed, 03 Jun 2015 20:10:16 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id k13sm2018242pbq.79.2015.06.03.20.10.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 20:10:16 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2015 20:09:46 -0700
Message-Id: <1433387388-7660-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
References: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 3/5] gst-plugins-base: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 03:10:16 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
index c8a9499..ee4addd 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-base_0.10.36.bb
@@ -37,3 +37,4 @@ do_configure_prepend() {
 FILES_${PN} += "${datadir}/${BPN}"
 
 CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+CACHED_CONFIGUREVARS_append_i686 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
-- 
1.9.1


