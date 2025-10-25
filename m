Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4A1CCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 12:35:45 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.4661.1761395738645948583
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 05:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gXlVEYq9;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7836853a0d6so53718167b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761395738; x=1762000538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIByDpVF8D3qqcLQaASvr+b8dCTb1sn9mzzQvQ4LjkA=;
        b=gXlVEYq9buldohQdz+aBVn3hvecJpfaZ0/w1pmz5Zex1ePIN3cVI4TeHsNzBtc2rlx
         gEz9kyfecFxFyKCjdVeRVnkbScw5pWXB+fSOMu7yFyNR37YpUpvyC00yncGgiJbthunp
         8vYpczrGreWRA6NcxFK36iW0RmfXbjkPGaaK5YLx2JhNhdHdD+WNBdtJUdUa8MnmRtUB
         HoMWxhGRFLTSHvoZzRJdBqD0JG108z693v+m9RsivtcZdwK9J3evWPy8oCcIwqvrOPnD
         wDwvuXz2RJRuw/IxO4sNFwNlRgOA+ucElqX+WgNMyC6lsS/9TyaSOClRuysHSN2+DI/J
         KneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761395738; x=1762000538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIByDpVF8D3qqcLQaASvr+b8dCTb1sn9mzzQvQ4LjkA=;
        b=Dr15cfytlAPBSk132phj8WJ2OOJCVtwOqpiS9sfbHe+9OYd16k+75lbEgDVRcc0BKc
         BPOACUek4VsxSboCfMpsQB6ojCBML0obQuE5woTfsj04sW1jUa2uAiTMZE4+yfm9LDzg
         6CSQaYYtN87vUfEV4Dug0rVzEqk+3qGVnFOqlORB+i3Ze9MZN5XQJJU0y6cW+nsVehPX
         Y7O8DHoqrGBLpsZ1CX9sq02wUgbXh7j80iZrInhmRtz/dLDpHtk9kzmbDJDp+WTER7mc
         C+VsbsQuWGI8D4b4Gypu/QTMt9YB91Q+k/bk3PaiNHFUdjhfA4RrMCZgJWbM0bUJFH2E
         qXCg==
X-Gm-Message-State: AOJu0YyYmElbaQJvrbaLO2IXh3/U/8/gUEIJL/xoHRbYGhvHkyjMQcqP
	zhLBdiBbORVfiVHkZCwp9c/uGQE9FId6qpSWpRc/ttluXMIjeMhjz6tEAhKg/RWQ
X-Gm-Gg: ASbGncuvS/UT07wHiUzqj6wpEWrcg6ITByKIGYwaEpvfxcuuFhl5X2jFVBo/+Rhp1w2
	CLgKt7aoN1P7jaHCzXO5/16/SUyr+ket6PoJHB68b7WTM9bivvyBHh+he4LIf1ottOYAbv4PIGo
	u97cDUBSVJVjT6t/gJh0XyI2dVsYQJHuOp100zZbMFVpzBU1POTImXx+gMfVlpZoAyboX1dfdLn
	HHBjUa+7c+M+f+YlYMDDGyBsg+KuK+Oy09n4H4HS71uz3TxYVxyRkEfa5RIqaaFUU3lVIIc7vPY
	IbjsNbrR4q9/gLjNFJpCu2UX9SGrVYS8ZivZKZo4XVoEiTpKAmYEgtA4iuVOKGu19okQfS9Dy36
	ir2bu4HOU0zW9C2+2ffpw5N4InEKW+NJnpLegaRYgHFekZtm/XNgpLF1I3H+IghlmKkHNHtDngB
	mZmUTlhSMvgdOVStPs79lJnGb4+6Gv7VFupcLhpU5HBJl8yzlFbwpb
X-Google-Smtp-Source: AGHT+IHQtTUGavhAuxoGXwaAoVcFzwgqT2yiEVHh0FJaakZEwobeOf8A8nzbr7VUlXpe2xhRw4ORkQ==
X-Received: by 2002:a05:690c:9416:10b0:782:9291:493b with SMTP id 00721157ae682-785dd68a30cmr43817887b3.32.1761395737239;
        Sat, 25 Oct 2025 05:35:37 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-785ed1ebdefsm4937277b3.56.2025.10.25.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 05:35:36 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH 2/2] phpmyadmin: upgrade 5.2.2 -> 5.2.3
Date: Sat, 25 Oct 2025 08:35:13 -0400
Message-ID: <20251025123513.154475-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025123513.154475-1-schonm@gmail.com>
References: <20251025123513.154475-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 12:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121000

License-Update: Copyright year updated to 2025

Release note:
https://www.phpmyadmin.net/news/2025/10/8/phpmyadmin-523-is-released/

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../phpmyadmin/{phpmyadmin_5.2.2.bb => phpmyadmin_5.2.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_5.2.2.bb => phpmyadmin_5.2.3.bb} (91%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.3.bb
similarity index 91%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.3.bb
index f0e8b749aa..5b9f306a16 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_5.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.phpmyadmin.net"
 # Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
 LICENSE = "GPL-2.0-only & LGPL-3.0-only & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=72bda492a00ee8c4121987c6afdefc07 \
+                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=06da7ef2f2b2874be8528063198fa994 \
                     file://js/vendor/jquery/MIT-LICENSE.txt;md5=de877aa6d744cc160ff41c26a8e4811f \
 "
 
@@ -11,7 +11,7 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-la
            file://apache.conf \
 "
 
-SRC_URI[sha256sum] = "f881819a3b11e653b0212afaf0cc105db85c767715cb3f5852670f7fc36c9669"
+SRC_URI[sha256sum] = "57881348297c4412f86c410547cf76b4d8a236574dd2c6b7d6a2beebe7fc44e3"
 
 UPSTREAM_CHECK_URI = "https://www.phpmyadmin.net/downloads/"
 UPSTREAM_CHECK_REGEX = "phpMyAdmin-(?P<pver>\d+(\.\d+)+)-all-languages.tar.xz"
-- 
2.43.0


