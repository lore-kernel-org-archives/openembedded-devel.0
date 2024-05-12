Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6958EC25B4F
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 18:01:54 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.41066.1715536906261300722
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 11:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cQjMk1Lk;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f0537e39b3so14823245ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715536905; x=1716141705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXwKZMGsT6SFKN2covYToEt1LNeQKtLn1VvzRlse0bs=;
        b=cQjMk1LkaLQpJma+cn7aW2lt/CDSYDaAxiha2zVjoSifY+fdP4gu/6ZMzo7f93Nzy2
         riX58kXzKjUsIyBwDL5YvPbWJod9UigmG69pr4j4VxRgPi8uIgJ80zgiocs1vcCiwzty
         AqAE5p+RidpUf/5yk75s/JYtKWWLPOoAJlo0llEDaEZvh5Jg3EGiJOwG8m7z3It0fqOE
         HUdY47bnbC8BSawsljJh2mWdu91MuU5EFRIWb191lP/Kqb/ZfIk4ST87XMmzYOYLzCUe
         pVVs8v/SXD8gKJhveer3MkZba9BgIK0F7Lbfya2Kdah9OqZb3KryPMmMJFaxmVS7B9me
         zHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715536905; x=1716141705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXwKZMGsT6SFKN2covYToEt1LNeQKtLn1VvzRlse0bs=;
        b=ezICTkL5v9HY7hmm0MmR1Ty2yN0D7DxvfQIxlUju5qFyApnKh1S8TJQnDIS8h1awsk
         BWVL4kK/WHbF/+uu9dLeRuah/z4W1/YyASaq3EmHIceeeCV9t4oV0z1WaiBZs1jDKHu0
         F0HtB9gikBtcilc/Xjoo5K3XH/3iDQ8o20JVw3ZtnW6PYu/iNct0IfarJ6CGPLLf+qds
         8cHosvkSz+ILihLvxvukCm6VkE9L4Y2GvZk28xM0v15DK4knEyBdr9yed98FT+M07uWI
         e+LBiwshld/K9dvkNcYqPJLfEBkxr1CTkibVoGl+52islJoWIlb/ATS3GiYAVznGZHts
         /TGg==
X-Gm-Message-State: AOJu0Yz/EyRvjGaWh9VIVVYEPn4zBn0Nraf1oOmuVS0lJQi6UdNoRlFZ
	gpQKXcCKtX+5z5xmNtSVm/E/4uJbfZoEZ8hHIh0YQ7iKF1JNW6rDa+boliePxFk=
X-Google-Smtp-Source: AGHT+IGrVCxsRzEkb6ZCuC2vbEWuwGnRNKQ7V1Xap5EZxqC0dRO4NWBiAAAgjWx1e1SARM8EG/7ydg==
X-Received: by 2002:a17:903:124e:b0:1ee:9bbe:cbec with SMTP id d9443c01a7336-1ef4404fd81mr91927975ad.46.1715536904880;
        Sun, 12 May 2024 11:01:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c037515sm64333105ad.204.2024.05.12.11.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 11:01:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] geoip-perl: Add ptest missing dependency on perl-modules
Date: Sun, 12 May 2024 11:01:40 -0700
Message-ID: <20240512180141.88729-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 18:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110325

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/geoip/geoip-perl_1.51.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
index d8288f9b49..8e23b66c48 100644
--- a/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
+++ b/meta-networking/recipes-support/geoip/geoip-perl_1.51.bb
@@ -30,6 +30,7 @@ do_install_ptest () {
     install ${S}/t/*.t* ${D}${PTEST_PATH}/t
     install ${S}/t/data/* ${D}${PTEST_PATH}/t/data
 }
+RDEPENDS:${PN}-ptest += "perl-modules"
 
 FILES:${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/Geo/IP/.debug"
 
-- 
2.45.0


