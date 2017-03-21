Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB4177A0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 06:32:43 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id g2so23643815pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OKepw+IRSrajTvtxIP7XsXoGvvEx3JiUQ5oMwMQuFGo=;
	b=GjKtYnYVQG9XeMEA68/UuWgHXH+RcJ43lNaKbxjMBZ59khsqRMF7laJETnXDEHE8mn
	zj2At+YF/kgmggKkxhUb5p1dx844lbSEUQsECYRd8suOGtBJhdPh7mAdPKqXHeQEpliS
	kLi+CaWlu3MqaTgnY4TnJdbdb15n/7VumvBANgDcJjy9Yo0Geq1wG6nLtVkZh9AjLbda
	Gk8FT7/b/QhTCipuwehFikx6KtzXXch2a1bW9N06v1UbpwVx/AXL8I/POxcQV99tOiKq
	NaJmIcb1eL7IZa3pA5WjkACNPxi+CzvTYhxIQnwPAip1KN9d164cBRePhcnSzZm/fMd2
	YDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OKepw+IRSrajTvtxIP7XsXoGvvEx3JiUQ5oMwMQuFGo=;
	b=Bmf1ThkdN3mEh45zebgS1G1imUkkCAjoTd02THgNM9VdjqbdmWXEzdKIFUAf47yMjm
	UNj0DU0Vaa0VJwh0Dmi+jZ0XZdR67D2n/zuOe/sk6/XDkUQTVlScnrZGx+u5NILjQCA1
	s1/SwvHTcY2EML1b6gTHVtzbEYbbotuW1EMY4Sue5nsVw9MYMwkxH3FIVfHK1Se/QWZP
	i08jhRIdoGQ0lLMSvSiCLHOjlcDWaTBcKcakPaNiEa5iMA2r1eTJt+yeykTOEvyfHabV
	NJ5iKhmw91pDkEA0EqQAoMdVRj560pNXgfJKpkhwzwynrvkq78m8ugbBDWH80393kMZ/
	lA+Q==
X-Gm-Message-State: AFeK/H21f/ApJxB+fzAhtrA/vKsyJ1dGlhv7mOcGZF0piJ3zzY0N7jRDTrxiV3W+ZFjoPg==
X-Received: by 10.99.55.85 with SMTP id g21mr26608562pgn.62.1490077964692;
	Mon, 20 Mar 2017 23:32:44 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	23sm36902528pfz.127.2017.03.20.23.32.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 23:32:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Mar 2017 23:32:25 -0700
Message-Id: <20170321063227.11565-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170321063227.11565-1-raj.khem@gmail.com>
References: <20170321063227.11565-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 6/8] dovecot: Use libtirpc to provide rpc on musl systems
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
X-List-Received-Date: Tue, 21 Mar 2017 06:32:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
index b2ead4b19..243dda70e 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.25.bb
@@ -14,6 +14,10 @@ SRC_URI[sha256sum] = "d8d9f32c846397f7c22749a84c5cf6f59c55ff7ded3dc9f07749a25518
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu"
 
+DEPENDS_append_libc-musl = " libtirpc"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+LDFLAGS_append_libc-musl = " -ltirpc"
+
 inherit autotools pkgconfig systemd useradd
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ldap pam', d)}"
-- 
2.12.0


