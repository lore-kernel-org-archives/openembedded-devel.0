Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 387C674561
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 14:50:18 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y10-v6so5515010pfn.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=23dn2pJ+ZMSz27jDE9g4IoCMdMzF77EUCmca4ZHSDAQ=;
	b=oRtkks97oMadU8u7N/89EeTgW9tVKcWpExWDUkdS3dauiZLcBwY3fZDYMZxyXt9Gse
	dgkfnjadqyoR9o47eCdzlZhaxC5J/3rP1BdeeRZw8i+yFIweCm8EFDmCjC4p6Egkvv3K
	mo9SDgsQp0DtRVPvImHrKYjUNtBKOWAs4HDKbO0WiXdi4n0MUCvPJrrpqIK5ukOki9zS
	/T4jCmzBKbCyQmJo9ZQGthpN/AalhdraBaHC8s2ipC/CqJdbaqpA7ZcDcnERVvovwU3k
	JZVGj2rCB/JcZyOkxYll/RSnj7Ca4z0EP+5BGjbaQT3m5qbuu77JTbZtQvQ40fMp+tl5
	HhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=23dn2pJ+ZMSz27jDE9g4IoCMdMzF77EUCmca4ZHSDAQ=;
	b=fy9Mzt5KEiCsXTVG8i3KMldVd57O5EiOuVW3oqUAtX8Te04FaQ8qy96PKNPWr7EQ2g
	vEWKUrJgKl1qPnGixDH5f/vcay85eluNmDd/JOoIMiYl5HguF3gMtcZ3De3V5kupCVeJ
	50sBrpn/Qx1xVLjTSO1sofwv1vsLgRyIQpcFMi4AicJ8E+i91PhCDOXAW6bLVz6J0Fqh
	TW/QhH0g/8osG7mxNOOXqG+zkqJmYP20eIuvyoUGQ1kMoE99c9x9oC1bLAFtz/eyZI7x
	9kyhLkJfXAKzrcsNYP++BMPpJdIjytlpPrC82ioLNsZsza1voDKKMp4SfWnR3x8pXJyE
	4nug==
X-Gm-Message-State: AOUpUlHQ8fPFJC1UxwsCA0VUFpBDw+TQ02EWS42baz5z2ysPef/hbeMN
	K9TlToOORu0lfOFu+NVlBdnFIzuO
X-Google-Smtp-Source: AA+uWPzK5dU0PO8OUfoc2f685br5Fk+aMn71PQExarnl48HuFXp6Jq4ysBOBn07p4jms4zL5LfipGg==
X-Received: by 2002:a65:64c8:: with SMTP id
	t8-v6mr8447618pgv.110.1534690219903; 
	Sun, 19 Aug 2018 07:50:19 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:897e:7f15:ffed:d0fb])
	by smtp.gmail.com with ESMTPSA id
	84-v6sm15163780pfj.33.2018.08.19.07.50.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Aug 2018 07:50:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Aug 2018 07:50:17 -0700
Message-Id: <1534690217-30223-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [SUMO][meta-networking][PATCH] wireshark: update to 2.4.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Aug 2018 14:50:19 -0000

Bug fix update only

includes security fixes:

wnpa-sec-2018-25 The LDSS dissector could crash. (Bug 14615)
wnpa-sec-2018-28 Multiple dissectors could consume excessive memory. (Bug 14678)
wnpa-sec-2018-29 The DNS dissector could crash. (Bug 14681)
wnpa-sec-2018-30 The GSM A DTAP dissector could crash. (Bug 14688)
wnpa-sec-2018-31 The Q.931 dissector could crash. (Bug 14689)
wnpa-sec-2018-33 Multiple dissectors could crash. (Bug 14703)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.4.7.bb => wireshark_2.4.8.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.4.7.bb => wireshark_2.4.8.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.4.7.bb b/meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.4.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb
index 2b2acae..7c81ad3 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.4.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.4.8.bb
@@ -11,8 +11,8 @@ SRC_URI += "file://libgcrypt.patch"
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "a78f3fd231154d6c93a2fec202c9d2bb"
-SRC_URI[sha256sum] = "5ecb3c68734fb89c83ac283e6cdf264eb15b9c7e7ea63dcfd4f0bad3e77c4f44"
+SRC_URI[md5sum] = "25f93aa6a2b3fdd9d1f01a49f84d224f"
+SRC_URI[sha256sum] = "db8ed7828c157e4ffb91fb8c41fa5a2f37fd44259175951a5c37848bf641f5e8"
 
 PE = "1"
 
-- 
2.7.4


