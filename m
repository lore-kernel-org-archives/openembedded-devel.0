Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 23FAA789ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:35 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id y8-v6so617839pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tOqJzrT+7YekdB44xbv2hYLLrrCunhMumwmZQh4pizI=;
	b=Fdxbw79oqzeqVc/tVc83RziQmEO+tX8HfZAxnZ0h7P5LvgCAeS3jPB7P6Fj83CU/IR
	vP14BVopFgd+3fWzssNtPPYXVVCUlgn8nfgLBiNXapoJB0y+1bayxNovkqcgHOr9zcGC
	OoBH+vYwlO+cvQd30yLAD0QVOhO7/tus4Z72nesZBhrbDL5lcqObQ4niZEbqnNwcoWTv
	ytmwY1a55OhvUDQvjr4+ys20EV9plkN3z5xicceZMCzvXLlkYtWrkeUgjOX8ExjryA0K
	KcS4k7rPbWfDmg8nv4j1rxDv/dPxBUfgoGJq615FmP7PXIQFy94pOwBsEdkpAzqD5Yex
	EYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tOqJzrT+7YekdB44xbv2hYLLrrCunhMumwmZQh4pizI=;
	b=o16aYWLr9lU4UkjK7YXZ39SROMe91JRSTEm37We//MoBW9M6c25oJKg491GQUDZFxz
	9eCKeMZ1FRxCDlxeUyGNaVEAXUvLUO8VsQsz7FTR0E3E4QsrpWm+7c13AZSgZA1AvUzj
	3ySgPxn5qKaPGxp4DLsDXPEipDwZk6h4TUfXpfDBX50iFQHjo9d2D4BDV4gGArOyvIKF
	gqPDsn94J5wGX/kIf3pd7fsNfrBecXuFAf96vfeFGjFA6N6SjwtdZJpth4NyFf6nqcfW
	pRJPlNxW4lC1bHLcIgpyix1d4Dk/eRvEXWGg4nG935QOgbzEwhFWweEuo69OQo0wJ0cw
	FaWA==
X-Gm-Message-State: APf1xPAxhKGYusniRLtjyA8O+T7vG3WX0pDUt7PVJrsvhLBaTEa/UCBf
	dfINZtMB8het2EueTvbxptA=
X-Google-Smtp-Source: AG47ELtHkVXhmKSaW4lPr7hW4OYowIEdnn0sqV31V3Rwa0GGBrVNhErBwt6wlEKp3WQfHXrhdp9utg==
X-Received: by 2002:a17:902:3a1:: with SMTP id
	d30-v6mr18617551pld.409.1520395416837; 
	Tue, 06 Mar 2018 20:03:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:11 -0800
Message-Id: <1520395408-19266-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 08/25] libwmf: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:35 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 8ad5457..2c31a21 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -12,7 +12,9 @@ DEPENDS = "freetype libpng jpeg expat gtk+"
 
 BBCLASSEXTEND = "native"
 
-inherit autotools pkgconfig
+inherit distro_features_check autotools pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=tarball \
            file://libwmf-0.2.8.4-intoverflow.patch \
-- 
2.7.4


