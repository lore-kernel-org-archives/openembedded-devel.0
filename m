Return-Path: <nick83ola@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 740557F8A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:27:04 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n19so1192312otk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 06:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TYkagoS5o3iLHRC22t1b/Mh0ldSxm8jJ8FXKcDVin0Q=;
	b=YtQ88oORD7Z8Qz2LyC7tjd2taXKnmWUhHMRP6L07KIHD6opajq1Fnzpf11GIn/3BA6
	45nZ4gYVMkgzd5nuPyaDzd9E2zbfPLycqeNx8idggx0mHlqds3hm5cPladtYmEsFs1IC
	mp7YTcC/4Z0SQadmoAIImH/MCFGqleLTfQUxouBx//Fx7OHoDeT+ua22eI/PsTGhP1Ag
	unzdC59P7XJbYwXsza8duPVaM/rRrcSa9exi5M5ZM5cSki0GZxOPoDsYv5C1UzLPAc5t
	+WnSwoUXDoGf/N+x99OjDGWT1+1i1E8Jf4yzEzdAHbZmOD007cIJgUI/cPalL8xYrlrR
	ARPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TYkagoS5o3iLHRC22t1b/Mh0ldSxm8jJ8FXKcDVin0Q=;
	b=le869JP4YLPX2ZquiIsjUBDD015K+g/jtK+CP/Hvdkor6+AUr1i0NyTAO/VYRVM00S
	yDtZDniwzhWg0WG49QSz5lQZiLY+zkwFw95+J3NcW4YfQMdeSwNKOZce2WenRRC1XaT3
	lyJ+XOtmMzy+LL6YaPtaii4H9huUmH42jND9Qs9I5oWYvS1+qHIG73RB9wk4XSgDYcdo
	2XXC1VcY3dJR9hEpw/4xIn013QZInZBiW+wYrgu2WKOJ9T1erkjizwiLA7QbAr6y/wHQ
	ghNizbGUOCAytfsyqDWqj9H/LY+etWVyLlJGm2P7MeauRis4Ln9SdFGxAo1tXw9Ysnuj
	CE5Q==
X-Gm-Message-State: APjAAAXwnDTkInXJGPiXkwVaWhm+hbcnrpI9CtV6+mor9AtwLPERpiMf
	WewrEJrha+WC+SvKVX1TQEADGqkEs6c=
X-Google-Smtp-Source: APXvYqwagIugg0aLH3XsAZPBppj+k7rhaLfSQmt1GpLxT/txWWlBL4UmA4VPS69MoVNN1T+YkRcF0g==
X-Received: by 2002:a9d:6289:: with SMTP id x9mr8051431otk.34.1573741624827;
	Thu, 14 Nov 2019 06:27:04 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h22sm1747894otr.36.2019.11.14.06.27.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 06:27:04 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 14:26:43 +0000
Message-Id: <20191114142641.17385-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-dbus-next: fix recipe position
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
X-List-Received-Date: Thu, 14 Nov 2019 14:27:04 -0000
Content-Transfer-Encoding: 8bit

the previous patch:
 903bfb78a0 python3-dbus-next: first commit of dbus-next 0.1.2

was put in the wrong folder. This fixed that.
---
 .../python/{python3-dbus-next => }/python3-dbus-next_0.1.2.bb     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-next => }/python3-dbus-next_0.1.2.bb (100%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-next/python3-dbus-next_0.1.2.bb b/meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-dbus-next/python3-dbus-next_0.1.2.bb
rename to meta-python/recipes-devtools/python/python3-dbus-next_0.1.2.bb
-- 
2.20.1


