Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC5BC44508
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:55 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69117.1782634305583295398
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K57/Khal;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3078e0dcd67so4006465eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634305; x=1783239105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRMZF887OF49xNPHsgogT0yuIb83l5WMb5C/VXv63uI=;
        b=K57/Khalmhvs1zUlenx9W35fHpxlCiAzZ3sVmTciWk9JCAURNks7ASnGstnYDD/ZUg
         cCA4ueHc0hX80Md1DW9HzsIjEGtiNYELk2DDSOdOpSZvLtyIaJiIwVIwKR7X+ryjjgcb
         T38T43Xj9RghIRicRgMJExTGP12PIJhpzAZMwthW3qhgvsLcEFLbxB+gH5IgdEAohpbS
         bnD1Ml2kjpre3dnjpz9vMckkfgTnVkkyweSqRAryZDLfvjJXneXuQeXMNJnZFWYMbngz
         q63TQIgdnRMo7PmbwuHs5QirehRbHOwVp0ICxIx9Esm0NMUjhMLL4wQg0GcTUq/dd8VV
         Mj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634305; x=1783239105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRMZF887OF49xNPHsgogT0yuIb83l5WMb5C/VXv63uI=;
        b=VTmYsDQaqUeidq5CoxZ8RPiF7Dbuv4LfkT9q+8t5VbRJLDTOKhOo3nSeAbfL6wPf2i
         3I5+NMu4leQ3Vbx7JSxp0yUi/rKE6/v+BYDgAFtbQExwmpVyQNDyNgJ6S3ke0lQ3lrvW
         G2aECuPoFb0rP33Hol9clIP/KKuBnC8lhwgDVJXePUPhUlHU9VCxJXT+G5JuTtV0EzL4
         Lj8g5qy0keqLKkOUT91uHTjigmIPxx/ryQI0WOhGDZLQgfh0ee0DhW23riPESZlepsTd
         3/kimNyVP/F3JHWqErMBB2DUN3+iFiVPduqhRCBOdu6O+fq1jvFnMs9VUixcmGB/bPRO
         YWcg==
X-Gm-Message-State: AOJu0Yz4ZbLITiuWlkNaM2FY4hIM39X6upEhmfVmEiQgVSvHE8tPKOoG
	fMI3XO8JEdjR/5nZZjBXAlwIJrL7m1BlWV+evcLCcZ/BOciAJUB5q0fF1raOQhjVdnvuxQ==
X-Gm-Gg: AfdE7clskHbKyKL72Qtqjblodcs/0znz5Jj6UbblA7VTe/ry3W2QmQ5IUwh9KwEfQ+l
	wsZwpLN//m+f+h5yeEiSyfkZlAd/jaeWNqdtwNiSjmJE6jmSIElogqwqWXAutVLe6eRQ4JgvLvG
	jf5eijsgJW72c7XghmrHUcIfTEeDUwHOKQTi6zh1A6gKEzG6Yi4qy3191zRowVrDaiFApZrtE3u
	AMg/S6JHvDPqq9LGNOhqToOA2lHi8GMQmGel8RFrlLnP+k6ZorLdbFMGoy7JHgUcUEeVp4qIUoE
	NFmVPygKmqMjP4GCtRG4fdRo/qNlEC3K7MFcgOI53w3eLqNAhCfo7VkzioLyQ2kdxYmY4M4sQDq
	95nwaGb/BiVYfTVBvPhsubH0lDgLYS9Y0ADlLWhIwQBT/UPmxhoPug2547K0bgwgwrnpgh2RZoH
	xuUmw4yyCoj7cvWhCk3CRUwHgb27KiTlL4GGBCYQ3ntTl3QVQGi3Q1xDkddWZDDSDqbBcR8YZl3
	Ug7HQhE5rk6G/3wjtAReeSpVNMSv2QL+zY8tv6G2F+uApPtDbZ6g3QSOCFisUFbj4rcvuAkPVXr
	/XkX9Nqab02+SG3ANnPVk3lvuMt83g==
X-Received: by 2002:a05:7300:c001:10b0:30c:9f31:b5ff with SMTP id 5a478bee46e88-30c9f31c193mr5007849eec.8.1782634304837;
        Sun, 28 Jun 2026 01:11:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 021/128] pgpool2: upgrade 4.6.6 -> 4.7.2
Date: Sun, 28 Jun 2026 01:09:32 -0700
Message-ID: <20260628081122.178348-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127831

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../pgpool2/{pgpool2_4.6.6.bb => pgpool2_4.7.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.6.6.bb => pgpool2_4.7.2.bb} (95%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.6.6.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb
similarity index 95%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.6.6.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb
index 668e506831..c6b6a22c64 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.6.6.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://www.pgpool.net/source/pgpool-II-${PV}.tar.gz \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "a4021c06b9fbdca975e62bf15a54d93e1b38854c53b5ad9d53cd082ec185dad0"
+SRC_URI[sha256sum] = "e72b9d0ff3620f7da7e33a58dda44b77919d056752dc9bd86b2985c4988d1938"
 
 S = "${UNPACKDIR}/pgpool-II-${PV}"
 

