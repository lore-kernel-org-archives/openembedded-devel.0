Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD759C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:17 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4182.1790160131573397641
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hJZGaKA5;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so487324b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160131; x=1790764931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQjEYnH5Tfxy/GFKuNJKlGNvoONra3aljAhIX6cnrBY=;
        b=hJZGaKA5KGmokYP4lMaiaVbDndsC4Kakb3iFGzsJy6s1O/3WROX7YPAMZPU/IuXxiX
         TKptURiJkUj6MxPEtAz5whDwsp67Wi7mDIANBDHxLmwCK/87X/KVwjQtsKbv+4ZMVK3h
         424pPSWmMguFLw3HNuT2QhzQXHxnAda2G37Lyeks2V5+mL3bK2dsfkB4GhiZ1+RDtIsv
         ELcnxY7xBJmf80wj+KYynXZbus6zuDKQkzItT9ngc+PWJ7SFrNr6t5yvmvnO0nG2Bd99
         cjA8v72y3BO2Trj1KSl4G0/nWA9+HqADZX33QJeFsixCRH8cmquKFq+XVZFdcCoDH0CM
         UMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160131; x=1790764931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQjEYnH5Tfxy/GFKuNJKlGNvoONra3aljAhIX6cnrBY=;
        b=BcvaVK7XDMTWdkttTuhRiHfTbw/afbN1YQV8Bgi8F5W285D/pjiaR+SXNoj/jtdnfa
         TQS0EUdDfkAWvCUIEA0hCSmvtxWypYdXuuMtPR/rAsQUKh1W3bX6+fSLyJwdj5D3YReA
         6EITeE+gE5QAYB7ATUIa3F8kXdw1ONYsuTyzmCncwhnZiK4TWN5CL7uIlWjxO5B3IuxR
         NJzb2XUo0AuQ/3bavzzi6gKTZiqfNDn/rLoiRsoN9o9TuBpk6YzCyD5umRWV8MJGZXAB
         T0Cyc+PVsQGrGEYm6WObHUmp41hn04jMuyIoIUyomxHW5ThYYjghi3R8tkaxQLHLkLI+
         v58w==
X-Gm-Message-State: AFuF++m8x4PhT4PeyvPzqf/UXjyQnntF7F6BAD5CKZM+ucQLaH275q5a
	3jjKo2OR+qupSq4Gc0KHwnuqmLN2xwPcDz1HqfXGtQ/zpP+7SfuvXPgqASSXqw==
X-Gm-Gg: AYBFou2qtCOgNljhA+lXYq785PCGi+9xNo4uIG5f1dcEdNNz5SkV1chQfGPB9seSYRk
	+6gA2VTLjLyxIg4tYezq4G/y8K3cKUpk4nIzakFeL/G0zlx5tsGgZkzspVbGBKRyQhVT+IEAWaA
	KRCebgmp3wyZ9HdafuDbngaYrx/+EYNF6nWH1RQgbt75jVZnStFo3XsWc+SI3BGEjTg8MPkG6vA
	ywfEExXox2lsqFQYYbVgRAVo4FmQEKM+WOQHN4OXN9Te8mQbl1V9QwtHWS1jGy4OaJdNkBkzeYV
	8qEp/W6naD2BiXqVZeFHOpzv/SPh0gXd90fgJzT23mkEZKYR8S2sjhgRnIRmj2AGmmKcJxSdzEm
	n+1rCAgFbIrfY3rPLFY+NKToPRn32J88m677GB5lG5k+8dVCikltAoI+AAyeuOqw0uUNrQZajJu
	7erYo0HZZd1PZ1TcMk//514pGNodHhSQySyNszQsT25Bvp+1Wv9CRHT+7VbeneN9wpExQpsXe2t
	WwnWHFH3Q+kLnVsNoo+3Cc=
X-Received: by 2002:a05:6a00:3404:b0:857:72ba:ff0c with SMTP id d2e1a72fcca58-87d1978581cmr2044950b3a.20.1790160130987;
        Wed, 23 Sep 2026 03:42:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 33/42] python3-ldap: correct python-ldap CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:47 +1200
Message-ID: <20260923104056.457360-33-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130220

From: Devansh Patel <devanshp@cisco.com>

The current "python-ldap" mapping generates a vendor-wildcard product
identity for the packaged Python binding.

Use "python-ldap:python-ldap" so it matches the NVD dictionary CPE and
configuration identity. The generated product identity changes, but
sbom-cve-check 1.3.3 reports no CVE delta with the pinned databases.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ffc1c4a3184e5bb55f3be713363eeffb33fd8e82)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-networking/python/python3-ldap_3.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
index 5a176b5208..623b14c31a 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
@@ -29,4 +29,4 @@ RDEPENDS:${PN} = " \
     python3-unittest \
 "
 
-CVE_PRODUCT = "python-ldap"
+CVE_PRODUCT = "python-ldap:python-ldap"

