Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 211CB78398
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 21:38:41 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id a7so3358715pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GtjljN3m4zD8q0TYVBN+qPKwJjIE1XTI19G4+YATh04=;
	b=VPNmdzIhOImQANjmAv8NnWVrtbpxUSHJ3mHvJJoJs7AGGvMUSk7CzjmnAyrxMIiNOg
	S7UArLukEx9EhhUoDAt5EgMfJmznZpB3WDh4gMfBio8Ei1zVc4EcZQV6f0PvWNjhkzBl
	BrrFnRvfXjwdCMi+nDRRQXvpxcjlZI6//X9ruCJVa33eBlk9g4P4GlS+q+zd7DHVmnY9
	AqNCPJBtEhsfIZ4Ud304QeWOz/ZLPcsJwVaGMQx5mFKqsZ1Sxpne4ayghL/xZQqJt96v
	5NscKRyBr1JbSeQZ0v4BxocMkxDW7L19nCGpoHhBTJDLnPcf/xm+W7upT9Kq+jf4//1q
	hdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GtjljN3m4zD8q0TYVBN+qPKwJjIE1XTI19G4+YATh04=;
	b=QmMqK6Ta6VIeGFy7xYt0mQi0jrIepICo9D6hbYZXXLTqEO1rPZagEZYtowNWQ+gpDd
	zmjRlQX4KS30K2W818kOm9KP2rDJCbQX/ToCTVoj+aHGcY0EKiFD2uVxyYD1VQK3cnrF
	2ie/vL2NzDxzTCny4qgsBzfSRz+TU6fe6uZI/j7SSpDhRMw+dJ0L3SWJFjyS36Uf8cal
	+IWuWDKVPdfpSxxhOzNuUdV4yMeLdvrwCovuz+iF7YDcY24evzCtwgaohCg9WxLvFAAo
	G05gZJzE7XL+Y9uYpyIKpxaRqNWusqim/WDQM2lWwxMel+nMe5hZLR9W6C8N9iULcrG6
	XdVg==
X-Gm-Message-State: AHYfb5jaAugMoPm47Kt+g/BBZrOmvkUD7J2Sopq/Q/pR8SCd3qaSxMqA
	Lxbmg9ovYL6yG4bB
X-Received: by 10.98.80.131 with SMTP id g3mr7883173pfj.156.1503610723349;
	Thu, 24 Aug 2017 14:38:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id b27sm9076560pfe.6.2017.08.24.14.38.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 14:38:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 14:38:28 -0700
Message-Id: <20170824213829.41431-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824213829.41431-1-raj.khem@gmail.com>
References: <20170824213829.41431-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 5/6] libbonobo: Pass PERL_PATH to do_configure
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
X-List-Received-Date: Thu, 24 Aug 2017 21:38:42 -0000

Fixes wrong perl interpreter getting into target perl scripts
QA Issue: /usr/bin/bonobo-slay contained in package libbonobo-bin requires /
mnt/a/oe/build/tmp/hosttools/perl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index ce34957fc..e4759a87c 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -7,6 +7,7 @@ DEPENDS = "gnome-common-native glib-2.0 orbit2-native orbit2 intltool-native lib
 
 inherit gnomebase gtk-doc lib_package
 
+EXTRA_OECONF += "'PERL_PATH=${USRBINPATH}/env perl'"
 ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
 
 RDEPENDS_${PN}-bin = "${PN} perl"
-- 
2.14.1


