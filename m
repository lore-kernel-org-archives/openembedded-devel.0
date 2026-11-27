Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8065.1795739692904880608
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OAM6+7C8;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38190551625so14472162eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739692; x=1796344492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jyJ5aL8VqDX8kdtyGd/F9RnM0eQ2qlz0L7ioCekQ90=;
        b=OAM6+7C8dqpROQaKTg2T8Ff+CfCKdCCVskRO7p67LDlsq7s8VlezfXQv88diVmy+Dh
         EWhv69wDokN4NIVmw6Hqcjuf/ZNbTkTwwT7ERj3jiVnskNk6Csf8+jX+NzmkgVy0mitk
         WLp9TfEADwBwDWqF5dHoAmp9G1mK19ksLpIWgPEm3TKuT7zYC/c7oZ1gDCIK9vVzzHxo
         zg0GsuhnpLeqkVU2pzGxwynqE6tc2r/Q2ZivOhq7ToGBOYmIeIiXbyORaqQyJ5SWYAoK
         watWvq2ggwOycVDa7oS+KVdGigeuO83u7zksS4z7PgRUegiAmQRyJDRDIud74GJU5tKf
         6SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739692; x=1796344492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4jyJ5aL8VqDX8kdtyGd/F9RnM0eQ2qlz0L7ioCekQ90=;
        b=wLoWm3WmjA+udxfqoI1MCFf2/AChkfGdS4fT0D2YlV69KsqIxSeFwNM0jAorLUZp4M
         MBT0fCoF8QV7Y1ZNugRRpKSTnoW6iGhYOn+xnuJeBVI9v099DkX1Q4nvGqm0W4Yu5T7m
         sEAdl0TZk5BLWh5EIHjg3w5Plzsun0nXsJFpDJf8mbNzCKHLlj2BNNnN2goPigzpUlxC
         1ovWId2sW9fjddT7KffinKXegFDd5vIxcaBJCKi2abK+/8EfvNP3Xkgzsyq6QoPXUTJy
         2jHX6aBn7fHrVPZwFYpi3RkL5+DSHsVqAoB2Om4WeoqwSbFfAU4Wp2+j8+0ld3NzBv0J
         NMGQ==
X-Gm-Message-State: APuU4Z+MDvPYUQV0AtTvR8vARUFc15xjLArETp+D8Fdf3FeW2mFTnQdr
	9QpDRQljtO2jaPhBhXia9z3/fzHEqZFt16QISpX7JZopMl4A28h06za4NwkEFigY
X-Gm-Gg: AZFdTZe2CimRMxVdwvWpTcQF7ogOz2PyCOGP0WStlKyFTHWkLMkayG4+6ysE2pWjPy1
	K/v+31G7xFG4wSXLi2bbr7ZrUeo7n5cTFkUJcdFNwBSSArTHzsUahaW4eZhpFoCZ1sLFXjYGpY/
	utu8QzFs+Idkh6Qd1pTRLrYHNhvm8Bi4maxtEFbjJasxFheSqAXws7aw7GoboodXUF206LyoK3d
	dtBrE0BxSW7P2QoQPGcHk4W1fZ3t2MjOMXv/dI9FU/0UlnIZheJiYhS3vkC4qcYMr0F9GDpsZtH
	gGJHN0BjZU50TbmVPndQFAY+XU89u7ejeVx5mXC67f5aUEd2HJjUYWzPaXBDKCZR+/4PDnMniZ1
	h1XnLNqYSizY3AmjNLUf5sM4p5SuaHGelFnYXfKqrz3x5nRvyIvL94jrMzREYJ9vcI1juqOR4Ts
	B7TJoEKrD7eTTrs5jUdf1jpV7vXT5SSOC4jKBouZQ51BcuqJvAFYCV6/bijSwoC/PpsBBmF/AdP
	STWmgbhuuHbEkfJYcQDttwZWlOduC3iy38EZf5QOe1+d8F+D26zKuuNX4Z3SUva2Uws2kiRfbJ6
	ca95QW8kJYb5eWJBLUwlUwT36QA03hwB3ZqYXZfIkFf4vJ9r+zdtPaSl7tyg9yk6sjSo/bvY5jI
	ozggkU+YJzzJdzLK27/n/FR1eDXc5GDQzPUDHCMUzQ6pzRU9QGU487ZxIi/ElaeO8yx9twvmMBM
	9kGIpahh8l+L5NALMyKTYn0uY15hj1pASWCLDpSHJWK1i9W/VAXqQFFwe0IDYJQDzh0UT+LB+Se
	a/dtPVEVfXd7APKdrXLFy2JdJlfYhmNuoZflsxG1bMib6XDxDN0qvrsS45NbckVEna/VC/B7wfK
	ftR9
X-Received: by 2002:a05:7300:f68e:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-3857015357fmr22166322eec.25.1795739692221;
        Thu, 26 Nov 2026 16:34:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 21/69] sysdig: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:37 -0800
Message-ID: <20261127003425.2166632-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133121
Content-Type: text/plain; charset="utf-8"

The default tag regex picked the s20171003 snapshot tag. Only match
plain X.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
index b9bf8ba90f..7741bdf86a 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
@@ -35,6 +35,8 @@ SRCREV_driver = "d4efc80ece48174a71c1a420cb52d233fa94f946"
 
 SRCREV_FORMAT = "sysdig_falco"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+
 #Add this function to generate driver_config.h
 do_configure:prepend() {
     mkdir -p ${WORKDIR}/driver_Make
