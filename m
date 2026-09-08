Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FA3C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:31:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3190.1788859870511874697
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=juarnS5g;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so2726987f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788859869; x=1789464669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qv8RZOsZarIsD84oeRUHubkzkdkX7JTnEq8PF95ByKo=;
        b=juarnS5gZxzzpvc0B/Wx+KqccRLfi5RLaYDTJq61xNaNhx+T62UBF0k8PMUvUeWH9u
         Tev6oBY6ZMSMRro4jVL2WJzay+JBbLotWxmQ14NGcx0SSj3Jlime7MGRSwtwM36LJzpt
         lF0knzJS83VOZXBTeUmbG4/O8aB5o7ZCRDQvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859869; x=1789464669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qv8RZOsZarIsD84oeRUHubkzkdkX7JTnEq8PF95ByKo=;
        b=UXxwDa4c+Lru341oBlvVuCo7iW3ip6AwsmFjp55eALacm1qDlJB2yIPV5WHeqKK5Jd
         DM2DFfiIY/9GHi0B/8y6aMK+9ytRio3Y6nhtQeZlSrkndivsPOm9TQq0vecy9SMdi8Dh
         g5aaxYurkVE860ExY/aRiWsQQ0q2jpbCxup2jqzmKHFZeEYCKTFED97gE8lzzZBtHXFj
         mKumniHxijFRVLY/n4shSMugZ5Tp+98v9cFjQelhTVOyb73otGB5IMj3GKeL6DmMqFQk
         cqC51uEzj/1ThZmHMaLHKSr1vzcSeYSaM+/CZ5UtfdvAdnGDNyQ5WY/wYDQDzEiG/rRi
         6JuQ==
X-Gm-Message-State: AFuF++lJZUhd6gh6q9fJRfBgCma+P7mMM4VXnmawEExVGsGqbb5RFh8e
	Ugl7rM6gFv6wNNDSoSk+0u/LU5bMV12OEgmx/Z342dX3KfMcpKrEVrGo7W+kI8zusvB04yZRTer
	ZjE4L
X-Gm-Gg: AYBFou1AlGijjG/BMKYjaKxVDMgb49Y3FL6/wXmiQGRH+5Dd/uLtc8j2YQpmKok47qE
	8M2AJd9I3pFfTh5p8eqXp95hsWD8EAE2oopzF3RDBJm2EZsiH6H+x0zy2STckB4+RowcyHB6Fry
	XzoGK24EHpl4AOv19ov/mZqYwpBGHTo6oPKrRh7LCkxHGiw+uFJwZN6U3ao8ZQnutB2blssIqHo
	s/o7BwaLEL3/Oy0wq34Dja0nDGWrZh2Uxc1gjpV63tOOWlM4cx3vfOshDiWiLbgodR90CH3D9vd
	ZpfrvhpJGSAqmGbn3XoeBCWVihF1PdxVVhFXyXWyfSYKSgAv66UpYZWaT7oAfuPCh5tXsbS906j
	bkDaSDv46zv5KP63rf5Fi/l2yjxbFzARUTAJZ4JYLxKZeDFWSGbntNl/DqnCV390u1iKa/Gyi8J
	BbbnPbkRDV3hwzl41M4lGKLvx/YxPsDQQJSjtidd8UwukJo4/z4M/PeMEShRe5vsEG1YHSjhJdw
	IWjjknGGUgTLQkVvJvht3wxxgJ1KWXSOlXGh7ypxD4SEmRwFkA4vCgAe3tL4j7tmeTQaWmWKD65
	d6QTfUVBM5PHkAs=
X-Received: by 2002:a05:6000:2283:b0:484:3acc:d06b with SMTP id ffacd0b85a97d-48587097094mr52170015f8f.20.1788859868586;
        Tue, 08 Sep 2026 02:31:08 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm33664644f8f.16.2026.09.08.02.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:31:08 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 2/2] ostree: Upgrade 2026.3 -> 2026.4
Date: Tue,  8 Sep 2026 12:30:43 +0300
Message-ID: <20260908093043.249127-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908093043.249127-1-leon.anavi@konsulko.com>
References: <20260908093043.249127-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 09:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129857

Upgrade to release 2026.4:

- This release reverts the static delta decompression-size safety
  margin introduced in 2026.3, which turned out to reject legitimate
  large deltas at apply time -- most visibly, Flathub Firefox
  updates were failing with Decompressed delta part exceeds
  configured limit

  Both the margin heuristic and the flat 512 MiB per-part
  decompression cap it fed into have been dropped for now. This
  deliberately reopens GHSA-7cgc-gp99-6jmm (unbounded decompression
  of a given delta part) until a precise, per-part exact-size-based
  replacement lands in a future release. The LZMA decoder memory
  limit (100 MiB) from that same advisory's fix is unaffected and
  remains in place.

- core: fixed a double-increment bug in
  _ostree_validate_structureof_xattrs that caused every other xattr
  entry to be skipped during validation, letting a crafted xattr
  array hide unsorted or duplicate entries in odd-indexed slots.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../ostree/{ostree_2026.3.bb => ostree_2026.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2026.3.bb => ostree_2026.4.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2026.3.bb b/meta-oe/recipes-extended/ostree/ostree_2026.4.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2026.3.bb
rename to meta-oe/recipes-extended/ostree/ostree_2026.4.bb
index 5e2e9ee078..b48fbb0a62 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2026.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2026.4.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "e560e47631d1f703e9ed3425e8909ccd87fa2992422c07348ca88ec98943c8fb"
+SRC_URI[sha256sum] = "b26c9016eb03bb4ee52cc00c642d56e00fc79ae7faac6bf4aa317d7451339ef7"
 
 S = "${UNPACKDIR}/libostree-${PV}"
 
-- 
2.47.3


