Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.2446.1625965723555040881
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jul 2021 18:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=arb8nM61;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id cs1-20020a17090af501b0290170856e1a8aso10504562pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jul 2021 18:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S3QOu34GGnOsv49/9S3DmYRiB0uR5XM1I2HMMqRh8xw=;
        b=arb8nM61tYu/A2hLQOGkhaipaG0IMLyhElGn8QhOJTO6xkrnWUe9O/Qr/mKGzLtWSV
         W1JJF+MaZO9yqSqkxuuo/ujb812F102QMMFHhBpG6QVSy1B1nKeVYIR7zQn3m+h3IiGR
         ipm6EKnADiew/OlGaMAcEWCWODC++1AJOnAGguEqswYnwl+zNQY+aBealmAjvVqFzR23
         CeVJq+rD05Ei7ibIez56kZ+K4i6KQwI6VnYh7WhtxfX8jy6CdS0erqP/iubgCNdfgVPu
         7CjJzUyqZ78DXpyL2CohdK790x5xR2RjF5pS+cKwKYumo+6IikRsc7TLHxwjsfvVQkmr
         Lbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S3QOu34GGnOsv49/9S3DmYRiB0uR5XM1I2HMMqRh8xw=;
        b=A7UGuj4XTOPRSZsHfPmz9q8k+PurFJl2QvdDdeRLut4f3l8hHPWSIqZrjTHEZTkM1M
         cy9QwsMzx12ARjMt0ytUJn99ZxF9HjP/EL8mCJDMHAM6q3wUREjSR0eGccoDjWkaaerL
         SwfBzWCcFttKUQdu6X0bCzBi3jzo1gqFanWTH8mv4V1/VI6e39Q1aip0mtKyE75yEore
         tRmES3PG9/aj59J/7YnDQrIIVXRj7WEJaeY8NbE65pbUiWwynWEBv2SXlvt40g3RwDzo
         uywC7BG3tZeYc2dawWEh042EMZv6aIzV78zJWgjjTd/BGWEzrisTzzaX4ZPeY9M0nJUv
         LMpw==
X-Gm-Message-State: AOAM5338w7ubwxB07iXxUMYirYCodaB1B5nXW0+D2DmszbqbQYc4LNP9
	GXgprU5zA5P8v3bqlLxZTc8PiGvfvxqkMg==
X-Google-Smtp-Source: ABdhPJy5dsRcnzAWDzVh5iW+o0tF30V1RTbKnZpxxAPHsd1xmhXcDu5MWf0OXps7h1JbEqDP4AkfWw==
X-Received: by 2002:a17:90a:a511:: with SMTP id a17mr6927331pjq.69.1625965722960;
        Sat, 10 Jul 2021 18:08:42 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::7ed6])
        by smtp.gmail.com with ESMTPSA id z3sm12199024pgl.77.2021.07.10.18.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 18:08:42 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [meta-perl][PATCH 6/8] libnet-dns-perl: upgrade 1.26 -> 1.31
Date: Sun, 11 Jul 2021 01:08:02 +0000
Message-Id: <db624b072bb4072655d29398b8b3886cea56de38.1625965484.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1625965484.git.timothy.t.orling@intel.com>
References: <cover.1625965484.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

**** 1.31 May 2, 2021

        Improve implementation of SVCB record.

**** 1.30 Mar 30, 2021

        Simplify parsing of multi-line RRs in zone file.
        Improve robustness of "dry" resolver tests.
        Avoid deep recursion in non-fatal test report.

**** 1.29 Nov 18, 2020

        Include test number in summary of failed non-fatal tests.
        Remove Net::DNS::SEC specific tests.
        Fix faulty test plan in t/08-recurse.t.

**** 1.28 Oct 23, 2020

        Eliminate indirect object syntax.
        Eliminate grep/map <expression>.

**** 1.27 Sep 11, 2020

Fix rt.cpan.org #133203

        Net::DNS::RR::LOC erroneously strips non default values from
        string representation

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../{libnet-dns-perl_1.26.bb => libnet-dns-perl_1.31.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.26.bb => libnet-dns-perl_1.31.bb} (92%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.26.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.31.bb
similarity index 92%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.26.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.31.bb
index 3b960778cc..c806456192 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.26.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.31.bb
@@ -9,8 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6db2562b6c42619e9c7d7e62422af8c4"
-SRC_URI[sha256sum] = "eabaecd0fdb3e6adef8c9e016e8509319f19caa8c76836253f7db72bafe56498"
+SRC_URI[sha256sum] = "00024a8e371605c6d8422a27a0a87af8b7cf66f26502102e68ddd4baf7cfc615"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.30.2

