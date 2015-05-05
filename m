Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id DB6FA73EF0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 19:09:17 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so173117388ied.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 12:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C3EgmgJ2mKC1rlSaHXr8XpddFFaHFdKZkMqQVhmbZ4g=;
	b=ZSEbuIGgjz2Cl17IVmDpF/3I6Pr875+PTRqLMd5iylx38dsryC7ZGTa+xIZpFeneJK
	cHg3Esdj5hf0T94NJckZWQ3unBFK+eBQSEB+32FvKo2Fan6AdMyTbzHWSMsU1IAuOzIK
	80fUeJiB3AfWib80pI21EMg6e0+UTTFsyLUNEfGAFMRUMjot8OWh5UI+5MFS9sNlycRw
	cmzl89Nd6YzNm2lZ0Ei2gLpFuoUaTEV6QIpwiz+fkVi+Clehx1zHalQKnPNcfBNQyvu/
	XXVazmkCr3nH72FNm3kjmdLf0OlolrFyds6CqekSHwWeMXlUc4b/sdpThKnqJnktnHtv
	9qwQ==
X-Received: by 10.107.131.135 with SMTP id n7mr9582673ioi.37.1430852958788;
	Tue, 05 May 2015 12:09:18 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id vk8sm135395igb.4.2015.05.05.12.09.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 12:09:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 May 2015 12:09:08 -0700
Message-Id: <1430852951-18707-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
References: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] pangomm: Use http instead of ftp for SRC_URI
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
X-List-Received-Date: Tue, 05 May 2015 19:09:18 -0000

Fixes fetch failures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb b/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
index 45218c2..00f9e36 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.34.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "mm-common cairomm glibmm pango"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.xz"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.xz"
 SRC_URI[md5sum] = "2c702caede167323c9ed9eed2b933098"
 SRC_URI[sha256sum] = "0e82bbff62f626692a00f3772d8b17169a1842b8cc54d5f2ddb1fec2cede9e41"
 
-- 
2.1.4


