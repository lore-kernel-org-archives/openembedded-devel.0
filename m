Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by mail.openembedded.org (Postfix) with ESMTP id 36B1C7ECF9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 21:28:27 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id r134so25853618lff.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 14:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0fsZLBDjJfAIbTdc8WjHUxGKEwcJPdk7q61vdmtQ6pA=;
	b=EgR9mqZk+naPSW9mMF70cNLPFthwkhWVbPs841NthJ8EH07aK/KgwACLfmfcXAeFEa
	AIJzic5VATtHbNrmPxrttMxEX3sGn0cW+Qfu8VlBAWNqJ/n4hp/Blakhd8GIWZzXB06o
	iiVIOopOf144GMNsCbXk3eMJxS3XYnNmyO8yLY1SC23w1glWUhTSnMj00xS60o/MSqbF
	F3c/LAYgO4AASlxr9uOYthlJHg+OIsjgVQWQcSBt+qfHQwTWiF6GGSRmL6MtSVi71nRl
	poB/y/MbKoPIaoBQw/lbCb/Qn8YwhEsl7ROcubDFo/pu4EnFXYP8MMP9rHQjhNmsey/X
	CJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0fsZLBDjJfAIbTdc8WjHUxGKEwcJPdk7q61vdmtQ6pA=;
	b=SkKfibU4F5VHxIuVPwg4AQvl7V9PhhI4RpvKhyt6wj3NvS6C413OJUYYtlMjOKKFRV
	qpavjEvFlg2d+/rFAGQ1v4a18YQo8YHotEbRdauaEZ7O5sNtT69kRvPlAt6+zvOqdkTO
	vssha+qleZ8gEN3H11HyYTBOmwU5jOWkOEil4S2OMevml1iF+He7Zy+Q+/xneiQBV9JG
	NxSDoARRusPd75LnpcPo+7xsd04iaBYNcz1TgZzauoRnMCIe6VXYASKblZrXa4AeFGKO
	0B/JPTe9PC3Eb7DYADv9Q1/hTq+3gTaGRbzxYv/P0vCko+GRYSrutmvftubC6zkTF78z
	rjxw==
X-Gm-Message-State: APjAAAXRy3+XCPxVI+oPtXS41e4xV6MYFW2XZaPq7jwIdL8AA446qa7s
	3Yn0WfPobZsfYgI5swB8McmmqiaEeeQ=
X-Google-Smtp-Source: APXvYqws+R5ABE3f+RhddVLXoMgR0xLNZGxtQ6yVrJbhLdJGTN6c3FzAcqCWnmOZQvlNe4wkAePjjQ==
X-Received: by 2002:a19:cc4f:: with SMTP id c76mr36232950lfg.117.1568582907416;
	Sun, 15 Sep 2019 14:28:27 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id c4sm8460600lfm.4.2019.09.15.14.28.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 14:28:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2019 23:28:10 +0200
Message-Id: <20190915212810.27364-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190915212810.27364-1-open.source@oleksandr-kravchuk.com>
References: <20190915212810.27364-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 2/2] babl: update to 0.1.62
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
X-List-Received-Date: Sun, 15 Sep 2019 21:28:27 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-graphics/babl/{babl_0.1.28.bb => babl_0.1.62.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/babl/{babl_0.1.28.bb => babl_0.1.62.bb} (72%)

diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.28.bb b/meta-oe/recipes-graphics/babl/babl_0.1.62.bb
similarity index 72%
rename from meta-oe/recipes-graphics/babl/babl_0.1.28.bb
rename to meta-oe/recipes-graphics/babl/babl_0.1.62.bb
index 9d8c90fdb..4a7dbcab3 100644
--- a/meta-oe/recipes-graphics/babl/babl_0.1.28.bb
+++ b/meta-oe/recipes-graphics/babl/babl_0.1.62.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 inherit gnomebase
 
 SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.1/${BP}.tar.bz2"
-SRC_URI[md5sum] = "cc53d8474a43aafb7cdaccea56cfde44"
-SRC_URI[sha256sum] = "63f3ed23e72a857a0e6df53d9d968a325024177b01edbe314a0c98b499eb8603"
+SRC_URI[md5sum] = "28fa9d43549378ceebe2871d7721dd46"
+SRC_URI[sha256sum] = "dc279f174edbcb08821cf37e4ab0bc02e6949369b00b150c759a6c24bfd3f510"
 
 FILES_${PN} += "${libdir}/babl-*/*.so"
 FILES_${PN}-dev += "${libdir}/babl-*/*.la"
-- 
2.17.1


