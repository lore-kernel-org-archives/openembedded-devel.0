Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 37B5771ADD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:19:21 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e2-v6so4975484pgv.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2018 23:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=At8I21gmxjvSxiofpqKNaO0U66Dth2f/vWIqi9zmUDk=;
	b=KOl0a3RJmz/LBZ8joYpL6w7UE3uJEzPXqsi5iTaa7E5tLNaKnDZL1g9TX69xqZiHYa
	kJasFSS7QXzxQfDsy4H2FBw9+C70l/vAC6HvMDZaD1hZmVaNIyLSaSFjcsfibqrQGedF
	WN7u1qfaTkLJ8fDe34gmSZ4MxI5Si/YmUEkSztzzzjYK801l7vdQ+1qWC3auK2dqEg4e
	JkbO2YlAkalRibO4UcRhnwsEDhlS+86xX/ec7cIeywgPNOcDvXF58a3y86YzgmIufuRv
	z1lm2zPRfKqZVZ/lN66CCEXiwCr21mMfDGjT/tap9M2jN4Ja3+S60RdDYLVQBjUx2Mxi
	muKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=At8I21gmxjvSxiofpqKNaO0U66Dth2f/vWIqi9zmUDk=;
	b=i1YD+CA3tHmYD0o3knQGQfgMtxf8gfcc97AW8kyt9q/TtNCcbJ3SpiFv7HNrD5R7jY
	z+0lGP42yWQiNoesTFa+ITTI6ATH4LzDSymKcGN1VY6K5j88dlHpaBl2P31tywA35mJx
	w4UrWnf4I65H920wuwx2jou6IXHRVOnURW9lVQDxW8SgMrieT0iXYU/SKOCK5RJWXzCs
	wr9SuLmNkMeq7D6TXq9QhxocN9q3K7CKQGNnbkZ6ysAJ60XfgGkQ85BDmit3uE6Bl1aq
	6ZPuuBWOyjVJ0wulpTaWK4dsxdHcN/CY8uzLqFyM34O/c5ssslhbMRxtSfRIZfgfMHaS
	iegA==
X-Gm-Message-State: APzg51AYBlM0DVi37dIYoKoLVfPzvHyrpM60jYv2cwiuAMvSWFX+Lznd
	Cq1b5R4TLqYgG17YYT1aCktnUY6V
X-Google-Smtp-Source: ANB0VdYq76FW1hP7IAxCrtK+TZgsGxiFklAM4vpscItWtjVllGKEhu5iZCTGX3DwLZre+adEuXreSg==
X-Received: by 2002:a63:c608:: with SMTP id
	w8-v6mr12994021pgg.16.1535696361847; 
	Thu, 30 Aug 2018 23:19:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	q62-v6sm14462926pfi.185.2018.08.30.23.19.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Aug 2018 23:19:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2018 23:19:12 -0700
Message-Id: <20180831061912.13845-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-networking][PATCH] ndisc6: Do not use gold linker and disable rpath
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
X-List-Received-Date: Fri, 31 Aug 2018 06:19:21 -0000

It builds with clang just fine so remove pinning it to gcc-only recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
index cebc1d9cd8..ec4879752a 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
@@ -19,13 +19,10 @@ inherit autotools gettext
 
 EXTRA_OECONF += "PERL=${USRBINPATH}/perl"
 
-LDFLAGS += "-fuse-ld=gold"
-LDFLAGS_remove_riscv64 = "-fuse-ld=gold"
-
-TOOLCHAIN = "gcc"
-
 USE_NLS = "yes"
 
+EXTRA_OECONF += "--disable-rpath"
+
 do_configure_prepend() {
     cp ${STAGING_DATADIR_NATIVE}/gettext/gettext.h ${S}/include
     ${S}/autogen.sh
-- 
2.18.0


