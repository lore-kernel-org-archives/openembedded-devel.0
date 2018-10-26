Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 64CF379C74
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:49:17 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l6-v6so872779wrt.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=k5sY+s+6SGLAwyj7K8H6PA6v2VCL7WlHtFZvPmiVGzI=;
	b=QqCWeQJN/fSRXK3HwzAeUAR7PFvYYez4tNvAyIntso1rsnDk/x5FZLW0g9klaY34kg
	s9fxEVogcEvu1L0kCbttY0P8qvI2KZwlFFEBQMcWSX5XzCIsfMHZzsGm6rgiFfc7zFpq
	L2XEdRjpcvdzom4TWLejWPZ3SPbBy0AB8H0Uceya/kFrC6xTdGJXqC20CfmxawbCnKBN
	/YiTDsxWIB9+j53EBMPTgarpZrU5xBQRfHuz7gI0kpSJErUoCUAusSoonU2X4MGDoif6
	aLxRBShyxJba4G1x75mE597m8YAvadZqvfTdtFO2iwhVd9fTxS3jKL5wb7+CAKQUsNv0
	JvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=k5sY+s+6SGLAwyj7K8H6PA6v2VCL7WlHtFZvPmiVGzI=;
	b=LZfF96pAMyC2MyzDiki/MXjU0QkN0wO/3h+N8PVk9mseK9ORnTYjzBjJK8+nE6cHVI
	kTNzre8VhkbBto6IikxUAAUiOz0Z88aG2P1eCTOePR6T+Fgr3CuyC3gNqYlhYXTGdzp2
	CZQ7ahwDP2WnFr/SrLeHvrb/JEL3x0GWzADhzAEUu9VczPX2A8SWViCkhecHJlRbDJc+
	CsuH8cLVnqNayU7JwWnJVppZOrMihA/W8EA78beDjhTJrDY2zkG7snEN6DjoymMsryxE
	ztFX7CDZnf5B3Opds7YEy7eS/3W34PZceOvNrMaSY2hImgLdYjHilXNFA8/WjLgVDNwq
	90Wg==
X-Gm-Message-State: AGRZ1gJYKoDejDrzkja96pvA10QdckZRTrhwudfD7XjvAyz5c9BTpsW0
	X/HdS9Ab/+/NmQNwX5vs2h28xAeT
X-Google-Smtp-Source: AJdET5fhUMu9VT2XXVu9MzttXk1MWYiabiYPAs5fUlaNAOJHnhIJmW7I7r3X2CqoAkNnahGzsqjpMA==
X-Received: by 2002:adf:edcf:: with SMTP id
	v15-v6mr5259787wro.47.1540550957925; 
	Fri, 26 Oct 2018 03:49:17 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	x8-v6sm23905660wrd.54.2018.10.26.03.49.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Oct 2018 03:49:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 12:48:55 +0200
Message-Id: <20181026104857.32142-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181026104857.32142-1-schnitzeltony@gmail.com>
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] packagegroup-xfce-extended: add catfish / xfce4-panel-profiles
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
X-List-Received-Date: Fri, 26 Oct 2018 10:49:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index b438c7fe5..5f8c03cc5 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -69,4 +69,6 @@ RRECOMMENDS_${PN} = " \
     xfce4-taskmanager \
     gigolo \
     mousepad \
+    catfish \
+    xfce4-panel-profiles \
 "
-- 
2.14.5


