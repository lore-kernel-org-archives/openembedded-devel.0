Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEB6D35E53
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.27865.1730831925786445691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OocW8T0d;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e290554afb4so5843261276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831925; x=1731436725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejdb11TPBVRIz0dn3hXxUnddBXWqEzYXkSATs5Wn0iA=;
        b=OocW8T0dqbFIeEwZ6owUwFMsih3xi6Wl59fYOuZK9nyCGQg4mGQucKWm6JkMOuL5Rv
         TyGLYOTeCu1A2wcpV3SNWpTitYlUijjJDhcuakNL432IfS++ZuQLscrJNUYiLV8TWHWf
         bQ3BElcqir6C+90pi++tQdP1NFm6lLkSbpw1puXQE02gjkc3oWfZ+IxkVry0ocNRC+HZ
         ASPw9fXzU7ON7NBqYEsELg3NJiRQbOKK528nvgISYBplMq5PKaeZ03YeJtvXx2jZUx8Y
         n9qrP3Cpf19iVFWipKYrvUxkPnvFGN+fZlMzKOb3nuE/di+dDE6QzJCIBP2B+enh+s8K
         DRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831925; x=1731436725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejdb11TPBVRIz0dn3hXxUnddBXWqEzYXkSATs5Wn0iA=;
        b=gv7HnIPtdhQ2AIpFhGRxz366XUOOnp50owL4lE5sIi4BTmdSmbSH/tjmtM2JrM7a0N
         MXS0ZFzV1PDL2xzCVaxLzEF5d0LsmaroWbDY9BP+C1AgwKzNSmrBwW0CgZW9QZQFu4fI
         P2D0rIoI5ID6kp4c5E8328n68kYvyMIQWojatvWXFBOdjozNvm9SFK+gmAJh7xCmEwwy
         LzcOuEhDPT2u6Jt2dSnuB76QBfuI9A2wmPejiOqSljAR1JAN2BJ72wDv7bO2NXS+Tzkj
         OOYZLvUTevuFG72ARj0S5fIqCMfP34ZhT+9CvMKJoAMVA8EKBcHzptHBz38P/eLBYnoz
         KnFQ==
X-Gm-Message-State: AOJu0YzVLrqWktgaXidrZTEPzRMj9Zp2q0qa6n7Ogck9uIvwP3MpHk0/
	+8PCP80ZLf+iwDaz8buq22EGRYt2doA9K9BCUgkPp7oXtJbd1J2QTZj4EueG
X-Google-Smtp-Source: AGHT+IHb0i/kCXL6jmSloBj+0nCvE6hFs+s04SiAEHf9GTmoniGIRn5nnxcEEllYyEa8Ln5fN1Fimg==
X-Received: by 2002:a05:690c:4444:b0:6ea:34b1:62e3 with SMTP id 00721157ae682-6ea523295bemr223676937b3.7.1730831924400;
        Tue, 05 Nov 2024 10:38:44 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:44 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 056/161] sblim-sfcb: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:32 -0500
Message-ID: <20241105183658.34982-58-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113571

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 6126a3a38..083cfcb81 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -31,7 +31,6 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://0001-include-missing-system-headers.patch \
 "
 
-SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
 SRC_URI[sha256sum] = "634a67b2f7ac3b386a79160eb44413d618e33e4e7fc74ae68b0240484af149dd"
 
 CVE_STATUS[CVE-2012-3381] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
-- 
2.43.0


