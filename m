Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id BED9278A3B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:46 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id m22-v6so633800pls.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vPiROMbuGuNlEmhMgmWWBLjwEB3MW7/srlQX2dos2s0=;
	b=dChLNul7OawHk30WAR1cwomPsyxm9FlUNB5zipwwZjCS2/ryKtfBRyCwFXo57MAY8x
	onUA2zkB2XgE8N2T+hSO0kTeWe4aTn61evUZskxo0mOFTOKHSsq+I5EyQe5sqMH68kfh
	Uk6feGajgTCpriKT4qNTF3YdsnhImGZz+965IT5YzBJaO6DhG1Krdz5KgEOcmjTOoyCE
	eYsp6yCpDUKDE3ohHO9eLIrtnmHbgYUlYbiuyrMhUE6u56Osg26qSswr0sddaesUrDII
	Bu+fQTRZep4jfGWB/clmwlfTznr6XoPnllJL/yUlQUvIqrmnzIT+zisYcVxXXRtr0Ipn
	ByoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vPiROMbuGuNlEmhMgmWWBLjwEB3MW7/srlQX2dos2s0=;
	b=L3AVmfXOtbn7QEqivHpGtvCmPGRw8WdWPgX4NYZZ+cy2FLs2cjkfCMUH9l3hR91fn6
	e+5WCF15PFzrxhUBgmsGoGGGQa/ZhPqggoMUEMWN7SV+8eKlys7qhXnP+Udy0K4pjHy/
	0xsonUZiT5a+0hGq7IAdJ9Dh8TewB4VML4MmHYPgxERNMhMcDqPhYE6vlUNp9uzky8aI
	KDbXbChfqPtlhvDMCV/IeQiPbndyzcktZZ+E9DQzdjKpneV0eUa5pfdR3ZmRyjD2MUuB
	5lAR6sDQXZ7pInIjTH6p7L/XIJCmapB6h7Qb4zihpLCLa2b8JzdXP1YpDTAQngIkCLr5
	9qfw==
X-Gm-Message-State: APf1xPB56vzvUWf4BLvTfYlqwAl7Lc2wDjg2KYCbQ8DTJaH0BSCCsPxR
	osNeZeoaB3JZcmVYO4Iol4s=
X-Google-Smtp-Source: AG47ELvCJEt4TLLtVpHQRm6j7sa2s/s39oLXMYxikIrUTYlGL2qS/tJ9MgznG+J6ZzwQ8sZMH9H8xw==
X-Received: by 2002:a17:902:4d:: with SMTP id
	71-v6mr19033918pla.341.1520395428475; 
	Tue, 06 Mar 2018 20:03:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:23 -0800
Message-Id: <1520395408-19266-20-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 20/25] libxml++: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:47 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/libxml/libxml++_2.40.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
index c001c18..c3d647c 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
@@ -16,7 +16,9 @@ SRC_URI[sha256sum] = "4ad4abdd3258874f61c2e2a41d08e9930677976d303653cd1670d3e9f3
 
 DEPENDS = "libxml2 glibmm"
 
-inherit autotools pkgconfig ptest
+inherit distro_features_check autotools pkgconfig ptest
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_compile_ptest() {
   oe_runmake -C examples buildtest
-- 
2.7.4


