Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1C75A73285
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:18:31 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n66so7406559qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=2UzUjNS3Y8T4rgccVnmvpysaKY63me7/2DV75nV/sJ0=;
	b=j+6sZObOF09cyQwePMb8as8Alo7hXmhbwUHpZhQHp/1hFUwB0hC5nNU8k2/QOejyWC
	zTdT4uYUd/+b72N8arYo3GIMgeSvYBchgTMIGO/vZ/JYTfP4+lIwuIdwDEDqrbWqmg4C
	sKOFn+SGY53h3xQeq7iu3H0MlXrlJtHRsYSR/PjLjAoMJnmLHA/l8+gQ1h8EUBszfIQV
	M1wm/k/r88ePVoDkC1DDXJdeptcJlQ0XBVss3we7AvZQtATYsbcirFs58i0zAs5fabEN
	Q7A50WFxHXucSMRVY8Q+5V0td5k8wePy30CaHh01x+v3ELQ5sz4bDliBs1cxtw9oWcTI
	t9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=2UzUjNS3Y8T4rgccVnmvpysaKY63me7/2DV75nV/sJ0=;
	b=KXqL4TyaLXIp0+hJdbfYu+f2WwOzxL6ycbYzZ0EdPKSL0Dk53EZ5fXAW+31f+0tzEF
	XSlWMjHhFICrciTu2B4KYy9djihSg82bujH2y314LBuqrinC87WCfFf1fZKlu0Pr140G
	SzBlRuxCG7ZWSqQhdW74am/K7wI3gAQuweGUei45+X2veV6vCBRiLSbZJfgrXInxT1Za
	2twvRgjCOQNSBhal2xjORmAxwxOtdPwdggfC9XUU//OD/2H2oHYV4YxLf7Y9lA735wOa
	uLqanxIsQy+Up+ie8/Q5SpH4ISmpjfAjEn9yNZurqqHpBORx3Tnbwt3Q9yphHNAHmmLF
	QgjQ==
X-Gm-Message-State: AEkoouudXsThVg6JTBTm0c0xOLk0dF2w2CwOezGy2mA8HI9GeFGbPzOtaKAOi90DP+DXeA==
X-Received: by 10.55.53.6 with SMTP id c6mr2202940qka.141.1471439912412;
	Wed, 17 Aug 2016 06:18:32 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	r187sm14680639qkc.49.2016.08.17.06.18.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Aug 2016 06:18:31 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2016 10:17:43 -0300
Message-Id: <1471439868-10118-3-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python][PATCH 3/8] python3-click: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 17 Aug 2016 13:18:32 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-click.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-click.inc b/meta-python/recipes-devtools/python/python-click.inc
index f3d5b36..90809af 100644
--- a/meta-python/recipes-devtools/python/python-click.inc
+++ b/meta-python/recipes-devtools/python/python-click.inc
@@ -15,3 +15,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-threading \
     "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


