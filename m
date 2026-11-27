Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8220.1795739730880574680
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=w7iZ4oQA;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38190551625so14472858eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739730; x=1796344530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUb5E0GwQGQjuub47bCJTaIkNItg2ACTCtyDR/xYdj4=;
        b=w7iZ4oQAJ10BGzgBZrTpaDGQfuQiWg2IsqIYS7u69MmJO0KXUVQ9j/xAE9+5E3eqXz
         mVZgp2QHrOPLPH29kxEtnltQll1gArkas49ktHZrj7VgmZUWNo2mXcnmIKh+5ucEDsAY
         jB4yWPmSfxAfl+JNFqqYvWx/06lETG0LKBxhoke6frVOCTRArc09mDw6Kc5XOUT//rvr
         nC6BNo/3BVghp9bevAeD8qxR5BPGQdPLA3CsupJBerdfbdKU+omEo6XIJGDO+yomDMuu
         W/e93DwVUwmtuOb5WvCPBEx39r4I6u31xov7Nkln2K1jYbg3NZQfKqa7NoBtRpTuvPnJ
         8G2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739730; x=1796344530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUb5E0GwQGQjuub47bCJTaIkNItg2ACTCtyDR/xYdj4=;
        b=O6m6DnX513H/T+UAvwlT9n49e6nc/EFlIre6cUUUjAwN/9UNVOJaXZ9lLzjnUJ37gv
         GZyOtB0YjVrj+ZV4hU4av/LaBpDtI9kex00USztiKCFkv58K80RzU6XoHTK1u+2nWErT
         YcyV96DdrFbuukG8BTq9CrbOHabNbFs4B7KQTciF7zi+2XcX/j5vGNBn2+xcyy9m4GUw
         uoyrYXEwd1iigBRoU9VR+TmsNeQyrsnRMM+fSW/64mRJ5Wra/Y7tzb75zn16VOyfLqRw
         yU5T8/7DN8VdgiUtf0AhJvWYyYpk7624q7J70AiSm4jxk+z8WPe8P6GxiUUt2o5mni79
         IBNg==
X-Gm-Message-State: APuU4Z8UOmvBqh1Uw7aPJn5dWx0TLV8nSklKMZCMSsNWAZfBKyZp3Xyh
	PHNNT1o2ii9idj7ei/bdxTfLRiY8uiuBCbiLp8KpVz+BzATYB4MUUd/w9WL0e5Pq
X-Gm-Gg: AZFdTZf7i5fSKSLdVkr5CObxQxwsNsNpCQcByyh1lWwn0HRAltl+6HRghUyMPOvnh+h
	X9jG1HhV80nisgfQLdZjahZndJ6vYouxk61Th6w28tglnN6SXSD20T5YdlifYWQLBm2XSsp8bob
	rCXtvT4rZYIDUSReyE5SZf4UQbGC5gjlPbhlCgbNpUuPxXisTndUWQVsSjLRxFInuK0eyaBWeXC
	0t+2qQKo/s+EsSzpwOtuebmAhahJt7XkGp/r4/NwWAeDBIF5lZKqHQqUiVn6ePtUp2UDMzJA7iI
	yFMWmKkWnT/hyY6MwJcq/yCxqgAXsEg1uGf1/2XA065MlHDijHm9TtEtIq+HwCIs4R01zmf1UIo
	PrJY7RgJxSuKbID32nLLVChJW5M0rzaYUHHKcA1EPNn46nXA3NbX0+m6LnjS0KQPqdYof0Bjfm4
	21cweYZfg9nQgAhnBq2u+SOILxLHbq3PXsJ0HTyfDkj5h1WccVUZkhmmJITAV0KnwRIwZeU4SbD
	dGzoq35Gf0Nca4ByKw9G+jyccaMFSI6206fhLhqt3/iiBEHRdgTRSO9pPU9ko6cjsUQueSkq6uF
	UTso6AowC33BEY7Yt0yb1Iy9+CmaFAjCWOSPIy1GRRMEPE22hx0/+RLhFoTntVWtrSaa52cZe2n
	Y9pSyBydS86nrWBY+BEGgLtBocGkeMHyK3ansIRgsdrbIqznS+UidwjVZGWn4scBilkbu5jsudQ
	8f7jOrstw4DWeb6BR4lxgBIJYcgIZX6hEr2LMRaMO051rdlI52ICBomhxuzxZa4prECpof3JcY/
	GUqjXm/xg3EZozVQosbL+IXJH9ESvjDRPvHTsp1g//MggXjMIb99/re238e7E9XidBl93pvXac5
	2SrH
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr21494567eec.4.1795739730161;
        Thu, 26 Nov 2026 16:35:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 57/69] gnulib: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:13 -0800
Message-ID: <20261127003425.2166632-58-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133157
Content-Type: text/plain; charset="utf-8"

gnulib publishes stable-YYYYMM branches, not release tags, so the
default tag regex matched old CVS-era tags such as kfs_20030524_pre.
Track new commits on the stable branch the recipe follows instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/gnulib/gnulib_202601.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_202601.bb b/meta-oe/recipes-support/gnulib/gnulib_202601.bb
index 763be6c11a..c98e146e7c 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_202601.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_202601.bb
@@ -15,6 +15,7 @@ SRCREV = "4a3650d88725e8fda6387fbdbaa0ed98cdca76ce"
 
 SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=stable-${PV};protocol=https \
 "
+UPSTREAM_CHECK_COMMITS = "1"
 
 
 do_install () {
