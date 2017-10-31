Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8D25E70101
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 16:46:20 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f8so21531977qta.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 09:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pCK7gEfPS+E4GKxgyFHHlqxP4QeofognVYj/pClO2ac=;
	b=W1Knw9pZXQtANmQBXRvLcmyODtPMmrmbsMga9PfoOfhlcICcDe0V8+i3fbGxZhqDJ+
	M3uxLLi4FhIdH2XrGZWUYrLHh8x2Pmzenq+H+rvtltw3vYkGYTqeW8yN4+lTjumMMy4c
	jELG5d+LrLg2sXem4gXhM8DnmrxoHQHAz73delRpdR2yPu5/TEqM04yf5++0oWAim+px
	a9zkdZ4szaq4bs6y0qEO/3f3ileDKAO7GveFJrB+OcW1O8xgUF6nLB/CaENWkeaD7qIh
	j9u1WyAMdNe2T6OVB2xSg5vGiPm72b2u9xipEgH3WwtwHVKSnW6BOXnPpENKPf9Oh9N0
	F9OA==
X-Gm-Message-State: AMCzsaV3O2lHHYTn0YHYkIaO7TLBL1AGQmRhRIV35zcaps6+LIlQ4yDi
	pxp7FGXCv+R59pdaWWrmK9moaUk/
X-Google-Smtp-Source: ABhQp+Tt61BIRTT5SXatZlWUFe62od5scA4Kz+Kv1ylvj+4oi67KeH3+si8ROs8i0IL0o56UX+ER7A==
X-Received: by 10.200.35.42 with SMTP id a39mr3940383qta.9.1509468381112;
	Tue, 31 Oct 2017 09:46:21 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	b72sm1182602qka.26.2017.10.31.09.46.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Oct 2017 09:46:20 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Oct 2017 12:46:12 -0400
Message-Id: <1509468372-29386-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ply: update to use the pypi class
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
X-List-Received-Date: Tue, 31 Oct 2017 16:46:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ply_3.10.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-ply_3.10.bb b/meta-python/recipes-devtools/python/python-ply_3.10.bb
index 8e61efa..9d019ae 100644
--- a/meta-python/recipes-devtools/python/python-ply_3.10.bb
+++ b/meta-python/recipes-devtools/python/python-ply_3.10.bb
@@ -5,13 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://README.md;beginline=3;endline=30;md5=fcb04bc2f765e46ab7084d6ab6e452bb"
 
-SRCNAME = "ply"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "1d63c166ab250bab87d8dcc42dcca70e"
 SRC_URI[sha256sum] = "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
-- 
2.7.4


