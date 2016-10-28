Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C647171993
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 21:00:01 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p190so2720893wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eyceiuN8M4S5c37toW9cU4NkY2soWEvdKtiNTKHuVvQ=;
	b=ZXXmSdFG33VgU7uA5pmyZHK7KlFOd+WRXsGwqbZ9LgFYfH1WVbmv5spVDHy5AiWftR
	38++83QErePHPo/oHI5DJG9uGVW57Ikirl9D1dv6oySC4L6B999djSE1zk2ob/9dYnv8
	8DRvvNTS7+MbAPaiiv1OjubYqNpBQvSzF4eilcGP9TG1SM1ecahk/Xb0yFZydmgmyznJ
	1qyA4psVWOfmwVTrCoG2hXLh3Q/GQ341NBYO10Mr6KG8XjQkj+dJdyF4Xu7eHg42ZWq+
	5RaI67CK8w55cf7syvgf98n00W6HLVeVJ051htx2ocph/x1+DAeI/FBHDjkProZ1L1jS
	RXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eyceiuN8M4S5c37toW9cU4NkY2soWEvdKtiNTKHuVvQ=;
	b=cr/0iJmBlWwUWPzctb9SWSNBonXn4zQqRI4yrHrAV/iufwXLxXD6ZuJY8Hi1SctcZm
	uo4S1GjTACoDD/Q+PqXFHrG2tagOUL7Wy3anxGGD6akCxPT7tsyjHCHNl9jQiGyo/us9
	nhDeBk8r4dKBUl/9XETDiY4AIHyZ8P8f0DaMCAA5GKOACa1yge1R607dIIzaeetmDy8W
	rfB87nfOAHdKlFIvb0pfXJg7l16PJryUbKA7g0T9p87u6aHgsUz4SyDA20F4iBMNjoAP
	TGEaVeBslViYd2ZV1FxuA1J6kDqRFvuzZBatujjJp7uxFOZbSNs0wjkZfqmYFBz3GPsC
	8VXw==
X-Gm-Message-State: ABUngveFkYwgzzY5P5IEGdwWEtFwWm/CmnbJvD7+YhWxRqTCADIt3nbIEcG2HXKh7HaaVQ==
X-Received: by 10.28.128.143 with SMTP id b137mr518939wmd.95.1477688402123;
	Fri, 28 Oct 2016 14:00:02 -0700 (PDT)
Received: from localhost.localdomain (p4FDF08E7.dip0.t-ipconnect.de.
	[79.223.8.231]) by smtp.googlemail.com with ESMTPSA id
	ya1sm15955329wjb.23.2016.10.28.14.00.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Oct 2016 14:00:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Oct 2016 22:59:49 +0200
Message-Id: <1477688390-25172-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] exo fix for thunar
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
X-List-Received-Date: Fri, 28 Oct 2016 21:00:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Once applied to master this should be applied in morty too - thunar is not
usable without.

Andreas Müller (1):
  exo: unbreak Thunar's detailed file view

 ...e-fix-for-Thunar-detailed-view-Xfce-12916.patch | 36 ++++++++++++++++++++++
 meta-xfce/recipes-xfce/exo/exo_0.11.1.bb           |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch

-- 
2.5.5


