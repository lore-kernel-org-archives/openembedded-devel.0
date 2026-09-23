Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB0EC9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:57 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4293.1790160112749085340
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g07ZJG8H;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8623e5d435cso247957b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160112; x=1790764912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=22PIhhhtrrEAnJMy61c99rwBaZVQ24XfDHsj365IUU8=;
        b=g07ZJG8HbkYU6pXJC7giIOUyd7CP8AXF4ycGAwmw7w6b7caCKtJ1u1YNyC/omWXpYU
         JFV+vRTnIZCtnSsd2RFNytFgYC+ugMAioP7gbsMMFGbJ0D/5RwbNTD8OpJWvM39I9sLN
         R9auqG0EqjwyQKb78xJ0ddWpBV2lKnwTPb1w1599swITHQQM66vpV8zFSFT+rHC8tKxV
         euaBIZlmbWdwzj81mmm5KZdHZP18vWtp5iLmbvVOuTaaYBfz7OUwXdJMxYMxvbqouQpL
         MJSc6FwRRx4kIDiWied2wxQRi5eQlNHKWB1n3IE40mQDCumcXGxdAdoLZUBegkttTT4M
         QVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160112; x=1790764912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=22PIhhhtrrEAnJMy61c99rwBaZVQ24XfDHsj365IUU8=;
        b=yP8vlUly0Ss6b+k0keDQp+aR+x5eY+8q+CE9pmy+cMjzw9UwVG6j1GlCSXr48iybYR
         9NUN8T+oFln0haOqbEHo0ugKNTqLHNXCIcUzj5aRH8ea9DqWqlG4kB15F1JElgyM8e24
         4e5EM6Fte/+PHKDOzEA7FdGpNNNvZqJPq2yCvOz242j5X5DAczMkcpHC2Ej51sAjOaUk
         BfO1CVxPdb3/RCPQsXZzEL6Cuuj7bpdrH1QauJz8ET8nWQRwLmd23K3jfIx7q6Zi/zpy
         zZT7CA5fHNQCkQ9+si+vG+c0f6GukoQ+708+Efub1ulpd0mHC3UUgKK0hA91ldTulJPd
         BIgg==
X-Gm-Message-State: AFuF++nY1iLksnYZrsXZTSO+Xr6exvz6oHKG+3yYy6NAecveN1b8d9JH
	WLX7jIVQupSFeUBd2mFGM5WILJwphUdxuKP2SVjDPSIkMuGbDhfRCOKUW2sJQg==
X-Gm-Gg: AYBFou2GXY6sRoSmEzF9uK0dTBWlFjy+v11VyeENue5Ay//6w9C5VUW4pjCrNQej23a
	H5XBDu4MUOWwvP5fQ1Io0NfVIxnNmySwKv4GNKj+TYQenA12W0gIOAF2MGftbbJYGjrG0t9h/8E
	y9n3osYPuxSjHlbvK6PWgbCx6URdGmdR0EcYB6Qfee06Cuu+JEOPZNDHTloDslerBn6H0qLa8tR
	ZMtdRve0Tq/GWKqCQXT4CUj5abjZok6dVyTGuzjGe3CdTW/C++yZoDSpgFmQfpXbNkUjNjjidT6
	sQxVCU6tO2lKcLUBVAZ0D6u578zkiL9FXoKQvJFoYVbPleGMersyCKH2Zl2j8KNsTPFeue8q2w7
	Dc7aT+vL81v+FL344wCxL8aA0bmmDVAMAPCNGsVHklJC8pr1l8eF3h1ZoPXsuk4sszOtAa/FVVN
	fN7D37bas8sNJI85YjijbEnD0nhIm/js8a8vE+TBoyDlJhxmHbzfJsm5icTsifsFZSO18ZTqM23
	gqmClpvg411PaJB2rPPs17F5otwxZsDYA==
X-Received: by 2002:a05:6a00:4c91:b0:878:3704:e0ec with SMTP id d2e1a72fcca58-87d24c6887dmr1402546b3a.18.1790160111976;
        Wed, 23 Sep 2026 03:41:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 25/42] ntopng: ignore CVE-2026-84989
Date: Wed, 23 Sep 2026 22:40:39 +1200
Message-ID: <20260923104056.457360-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130212

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-84989

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/ntopng/ntopng_6.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
index 3c039781d8..57d2848ace 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
@@ -49,3 +49,5 @@ do_configure:prepend() {
 }
 
 SYSTEMD_SERVICE:${PN} = "ntopng.service"
+
+CVE_STATUS[CVE-2026-84989] = "cpe-incorrect: This vulnerability was introduced in v6.7"

