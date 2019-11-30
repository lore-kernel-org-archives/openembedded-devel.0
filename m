Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id B83507F7D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:56 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id s35so1456058pjb.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tQpD8VmJgA3JWlrvsuBshzHb5+DIJy4Vo2jmblQKYmg=;
	b=rT+m/NmbYNZWlbntcgvRF64eaOkS5TlcgFwB1Vsj0wzGzPwF87Mz1B/bGpuAkaa6aP
	R87nb9cxzjlQlZJJXDRtzApmIIjjf5LrzdWNbWg0lsyiuUP8NQoS48dCkuCvTrZ/RDtQ
	Rt0NxZSqWpWqmhd3rTnjctW4ekUkLinS0sljynz9kJoie/i+DK74bShXctPbvhpgg3g7
	9RV2HySAOMuhpoLql4xwMjV3lgNYBzDFIsyjkW643fIeEo1sus6TpEipaZOBQkkFxj63
	M7oJMCogP/WXnCzF3iYogi6CSk+7CC7iHKOAaWn5Bfk/60sU+DdguklxPknPbnbMcoWr
	58/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tQpD8VmJgA3JWlrvsuBshzHb5+DIJy4Vo2jmblQKYmg=;
	b=TXNqav8MQDnePZJDyyvZ5EAMdIKnAjnEigeHpMXKNuebrM35f+IfOKWojBwRvNtWZ7
	S58uKeegBG0Td7Ju05Nl1XjGqu/M72CP/bK4c03SrrMHfTzmpXS2Zthz+3MEJ4gaZHwU
	fPLM1V1MtslVZDAfXBQmIXeqOGF/GmSDtoBD5MDkjDVE7fVLobFsY1glDBN7Lcvjt3rn
	F6LL0hwatrNxx5AUOj79rQ52krlKyhefAVAJvFBCY3gfmzh75Is0jIqUM/RtK3eG9XIe
	b74NXxwB7QqOnAlFH+Ob6ahXa6Ogdp5Xp6ahjZyKZWZ0Rph6GxcAPMFZuHaz39STGMSF
	gfKg==
X-Gm-Message-State: APjAAAW4irNF/X3nGXg9dbVbC45gdLIBDNI2n1Y6naIfQ0gce1Dq07Li
	MiIj8fXEDg1Rsb1MyHo1HUDe5uhj
X-Google-Smtp-Source: APXvYqxqLTOkRxYqienYoAy9pxNjIK18pY9EqKJEEBxyyju0WhPUiPyHKyKJ8tXeMRiNADyG3LkfkQ==
X-Received: by 2002:a17:902:fe12:: with SMTP id
	g18mr19785035plj.20.1575137457639; 
	Sat, 30 Nov 2019 10:10:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:39 -0800
Message-Id: <fdfa4cde192952ca7a63eb058d691e86a8e163fa.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 09/15] wireshark: upgrade 3.0.3 -> 3.0.6
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:56 -0000

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
[Bug fix only update
includes:
CVE-2019-16319
]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_3.0.3.bb => wireshark_3.0.6.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.3.bb => wireshark_3.0.6.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
index a3c0b49..ccaa0c9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "e945d76a57db2c3e6cf776f95da2cf0e"
-SRC_URI[sha256sum] = "af92729c781d870110885c31ebcbe4c4224ed51bb580d00c896fe9746994211c"
+SRC_URI[md5sum] = "c6f8d12a3efe21cc7885f7cb0c4bd938"
+SRC_URI[sha256sum] = "a87f4022a0c15ddbf1730bf1acafce9e75a4e657ce9fa494ceda0324c0c3e33e"
 
 PE = "1"
 
-- 
2.7.4


