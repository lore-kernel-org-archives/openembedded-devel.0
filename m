Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8DC794AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 22:05:12 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k8-v6so3315912pgq.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 15:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qmfZDBcLLaGW4cMwj0qAj/5B/LEITCS5ZpNb6/NFpLk=;
	b=hp9qk642xQ0uRGz5Ji4iY/nrCfWh8tJ7GQz/ZqvRgWOD2Zd6wi50N67LtEgBikS+VT
	ADsexpL52HsYek3t+kEL/JAMf69HvXqAf8CHT/Xgf8wJ8d1oT8a+QbXwTE9UTl8Gl3rK
	9fo29bi4kbzq6UdLJ7S0fQMxH2WZNrv1yjfFn1WvhOypNPjCVNoLDRWIPi+eJECiMOz4
	8UzVVwb2SYZjyG7HB+NQw3RIGaaxZN8FyLz0e207lBdiKAscga48nzZzcbaifOQam4UG
	rgegYJfH0iwVxzwSz6IzSD0UOh3Px5oXwFUnxNHSOtzRoUZt48Gxz5XNltLxFaqBk+GL
	5/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qmfZDBcLLaGW4cMwj0qAj/5B/LEITCS5ZpNb6/NFpLk=;
	b=hmrBj3aAG8nUCbun5UZ0pJGQ+gh1Id1GB9Qm/CqosXFuP227VYbRO7Jbyjjb+S4pvx
	RSefdLbeWBoPGnhLyffGqRoVAypFTS7ZX3uuycskrS3cc+BYrN1P/CS4oUI0pPscP/qH
	On2HIXOeCnjejGVRaK5NMoJHdcEMAFk90eTvfh8AP0Ug6mA6uiVgJGlDFWks1ax4t1tR
	CGBJtdjS25yNpYvlC7587jeTUXoDg+WQ1l2cqbY5iIqgnC9HlzQWsVCfQwLf77dDJzNB
	thHcE1la4xdFMf9jKMth1lHWy1EJZ62DwN0GdU2TuLCIhfOav+xD0rIMfULSM+YOC7dF
	DBCQ==
X-Gm-Message-State: AOUpUlFGJC3LpEcBPN8lfx89lASOfas76ugETBDWtFoZQGYsGTif20Pc
	ke/JgwnZmzcI5iMqxNxUvvkPwNKY
X-Google-Smtp-Source: AA+uWPzv/1w4sd/9yyrfv34SwfG8QBJyEVhIR8UYHBXsyQgo6OLwSjBsHpLLKgPvWWn8bYrgq6+rKQ==
X-Received: by 2002:a65:4cc7:: with SMTP id
	n7-v6mr26458234pgt.451.1535061913139; 
	Thu, 23 Aug 2018 15:05:13 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	z6-v6sm7069581pgr.41.2018.08.23.15.05.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Aug 2018 15:05:12 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 15:05:07 -0700
Message-Id: <1535061907-18786-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] eventlog: update SRC_URI to fetch from git
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
X-List-Received-Date: Thu, 23 Aug 2018 22:05:12 -0000

The tar file releases don't seem to be available any more so switch
to building from the github git repo instead.

Take the current master branch, which is based on the 0.2.13 release
but with three minor updates / fixes, so include them too:

  a5c1916 evttags: improve handling of NULL arguments to evt_tag_str
  b34e3d2 configure.in: fixed a compilation problem on Windows
  649eabd evtstr: readd the escaping of the CR and LF characters

Also drop unnecessary "inherit pkgconfig".

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb b/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
index 13eb794..85e29b0 100644
--- a/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
+++ b/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
@@ -13,9 +13,11 @@ DESCRIPTION = "The EventLog library aims to be a replacement of the \
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b8ba8e77bcda9a53fac0fe39fe957767"
 
-SRC_URI = "https://www.balabit.com/downloads/syslog-ng/open-source-edition/3.4.2/source/${BPN}_${PV}.tar.gz"
+PV = "0.2.13+git${SRCPV}"
+SRCREV = "a5c19163ba131f79452c6dfe4e31c2b4ce4be741"
 
-inherit autotools pkgconfig
+SRC_URI = "git://github.com/balabit/eventlog;protocol=https"
 
-SRC_URI[md5sum] = "68ec8d1ea3b98fa35002bb756227c315"
-SRC_URI[sha256sum] = "7cb4e6f316daede4fa54547371d5c986395177c12dbdec74a66298e684ac8b85"
+S = "${WORKDIR}/git"
+
+inherit autotools
-- 
1.9.1


