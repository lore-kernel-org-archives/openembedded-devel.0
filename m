Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA36D10393
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:25 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.6195.1729801150450636518
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TiNzFUS3;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e3a97a6010so16369297b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801149; x=1730405949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWl89J5hkI/I6XtV2ZUDlYhDKv4jmg82Bz/bTLxZwlw=;
        b=TiNzFUS3y7bxbN3IOxswLWkriV40RB2hLpUeF65FQAPOVEBXlqsHCUm8hkjbElHfsK
         tHhMuJ0ZRHhB60/lX1EO2JOoxfE3DfqecERRbl6dpt3M0hC+3qMiCwnm49ga9RmdF9AV
         vaoVRlEp+dQ3yxcvVPL35iLRZWZ/72mPjWzB2+1r3FEFVc9pgGmQDGQlyDqTy9eucCSp
         w+oDhNeEXFV0hzDcC3bBShqPhzVAjj0Wjz6waJYBCp+YNENEg623+NsYcHNNS5pQp7C6
         8bIpEriQ7mnWCXejRXY+48SXIcFGLUgZiFiSx8DRI+kKs9t7J8OQMn+XN8E4HSgx9w9x
         Pzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801149; x=1730405949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWl89J5hkI/I6XtV2ZUDlYhDKv4jmg82Bz/bTLxZwlw=;
        b=ec9K7Q85Xz7jdWFrw4KHkG6SHe79kAFDEKXiWP+qT0GLo+D1Bg0XDVfEMPZ4GsdOl3
         ppUnuC8rJarx3y9955PD/7I8k7PeA34jN3ZaoUnLQTan4JOL5D4WMaj+sHCibDWiJTru
         X2s8/WydoKAhYXqGdUZmtlnlHah431rwCzZgJKmOAkYBQPrr+77MSyOIAffxE/HLpjCg
         q8HhNmItNvqQsW0f+PkGqJaM21TEWnQ+EWAXtQccsHZ3Man1a/pyGAYhaaZLL4hgcIs6
         C5wcdP5zIsJg7ERlI3v3GGbMrUa2en2NUk8RrJjqkpBG1OvlPGu83d1pJkDd3GnfJU1t
         ++Og==
X-Gm-Message-State: AOJu0YyBF2B9+wlY4g/oCsVKlacBd3xsxFTTVIKh+hIBxKFgXVPFBPkc
	ooW1sPQiVzDw2WvgoIC5YrXRNlzIRChh5iBRnH0wr0sEWsLyR4nbOmVILA==
X-Google-Smtp-Source: AGHT+IEix01bCAMCWJBML46pC3Uz10pAd8Al68L47nd4C8DIGxpG17N4uL3PhgFWubIQXQUTkY8UeA==
X-Received: by 2002:a05:690c:a:b0:6e3:1e5d:fe2 with SMTP id 00721157ae682-6e86632061cmr33020327b3.31.1729801149036;
        Thu, 24 Oct 2024 13:19:09 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:08 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 25/42] libmime-types-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:44 -0400
Message-ID: <20241024201806.440273-26-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113203

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
index fa4ad6fc4..67b29019c 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
@@ -5,13 +5,13 @@ is transmitted. Sometimes real knowledge about a mime-type is need.\
 \n\
 This module maintains a set of MIME::Type objects, which each describe \
 one known mime type."
-HOMEPAGE = "http://search.cpan.org/~markov/MIME-Types-${PV}"
+HOMEPAGE = "https://metacpan.org/release/MARKOV/MIME-Types-2.26"
 SECTION = "libraries"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
+SRC_URI = "https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "bc738483cb4cdb47d61e85fe9304fa929aa9ab927e3171ec2ba2ab1cd7cefdff"
-- 
2.43.0


