Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 547D57CE44
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 01:53:51 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id z20so12733701ljj.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2019 17:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5KwT68LyJw81+v+cZpGqE2nPkU7j+BGmoeZvT3X/67w=;
	b=tF0jRy0VBR/O/ETKIyZeae5PcVIZYCcngA/gjvPBpLR3X9wet2OnsDpYC10axkI0Qa
	oL7CB7LLOAYOk4qZWESsVZawlaw9p33nMUSIGymnnWx075nAnb5r5uskDUJCecvNIKDZ
	TOODOelVwCcc09meUy7ZV+KnRjyh5itVvOq3vi2W26GtBsfqt+U87tIfsx5JkgFYOQLf
	ChzoKtdtrG0FJ9fbbdwDoSp0TwhyH0Pzdpe2W7Yyu6IcQFxE5UmR0qXEf0tTmw7Ubr1m
	BSQlKB+xmpIsFXSk/JLFof3rbIIKAZtl5McoH31UwCGAZXWpI7ULqHWlwhQ6SMGhDNyf
	epag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5KwT68LyJw81+v+cZpGqE2nPkU7j+BGmoeZvT3X/67w=;
	b=b7qGXTPg1Hf5gwrO1OLj9vJGF3zvDNOLc+smDZPDbTVrgCOgeSRQMt8uuwBchCqMHO
	U0iHkAKYvQRwyQfbbPSP8fhvDMIoaYOzCwQ1zmdwL2+0BlcM4DqHj7RNyjHJzkCYL/mD
	Au1KggWI0Z/WY3QD4Ot9Gl96bZcoK0HvXEj1YtGW8+fUpK0PiNDvQxVtC580vIa48xVL
	jrYw6tjgQbMANTe5TbYlwpNVhapRPMiG8p/8++m0X0U0M5t1HVKiehlftPtdYHP5WFpo
	6++Y69fSIjC+FNzBSpyc8vWYynvkI+aKYGTZmuqOgPyRk4n2Qne82dAFvq0kFIoWtZBC
	py1A==
X-Gm-Message-State: APjAAAUtgVtYgW2PK84Z0GgLONKlN7hDz5qxYFWhbJx+ubcz284Ez/H9
	SmLkallr3+pT/V6sp9BkoF+woxYQZhk=
X-Google-Smtp-Source: APXvYqwfBCSPSRO/BoSR2ptmVoaa31EdL8JLcD30eVzkFeYvWaRwDxSbcRULH0RvXrD1bRs/Sgacbg==
X-Received: by 2002:a2e:9cc7:: with SMTP id g7mr4142921ljj.33.1551923631577;
	Wed, 06 Mar 2019 17:53:51 -0800 (PST)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id p10sm588358lfk.35.2019.03.06.17.53.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 17:53:51 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 02:53:48 +0100
Message-Id: <20190307015348.21142-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] nano: upgrade to 3.2
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
X-List-Received-Date: Thu, 07 Mar 2019 01:53:51 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/nano/{nano_3.0.bb => nano_3.2.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/nano/{nano_3.0.bb => nano_3.2.bb} (79%)

diff --git a/meta-oe/recipes-support/nano/nano_3.0.bb b/meta-oe/recipes-support/nano/nano_3.2.bb
similarity index 79%
rename from meta-oe/recipes-support/nano/nano_3.0.bb
rename to meta-oe/recipes-support/nano/nano_3.2.bb
index 2c7fbd549..dbc548793 100644
--- a/meta-oe/recipes-support/nano/nano_3.0.bb
+++ b/meta-oe/recipes-support/nano/nano_3.2.bb
@@ -2,9 +2,10 @@ DESCRIPTION = "GNU nano (Nano's ANOther editor, or \
 Not ANOther editor) is an enhanced clone of the \
 Pico text editor."
 HOMEPAGE = "http://www.nano-editor.org/"
+SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
-SECTION = "console/utils"
+
 DEPENDS = "ncurses file"
 RDEPENDS_${PN} = "ncurses-terminfo-base"
 
@@ -12,8 +13,8 @@ PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "74196427a09ec2f82a88facd220d2787"
-SRC_URI[sha256sum] = "e0a5bca354514e64762c987c200a8758b05e7bcced3b00b3e48ea0a2d383c8a0"
+SRC_URI[md5sum] = "2606dc0dc31a088f16c7d603b42d23d0"
+SRC_URI[sha256sum] = "d12773af3589994b2e4982c5792b07c6240da5b86c5aef2103ab13b401fe6349"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1


