Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E711073285
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:18:35 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id u25so5090978qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=XfTNprshmp15SYfMxMkV6nnQOWFcK30ctwjDExfnGtA=;
	b=ogG9lox+BRy4+FPAj9JL06A9WDxMvCAueh8BXdD64UI+PRDrp1ka3NjC1pIttTOwM/
	5zIm4gP6PXQu20bdlTMlzHoBDp/T7Xi3JMIyoDK7wMwnT3SIMCbn0pOmxIRErePs0Pi+
	HbTW4H3bgLsZOkVNC36Y5cDp5k+OooPa/s7NuQaLEHBzVfB7H9GvkPgYBdFSLKO686i5
	HM47heSuWcUEKLCIfy4ItBlUmDf3iYLVSM3zpBTe4wdfA8lDoxgreSYCdjGCaCpDygRU
	grGbAweDHfN+NMPdiQW3ytCzsUh6N+k33W/iSYm1BwUaoow1BtHgXDr1j2+LkkLmj0mx
	k+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=XfTNprshmp15SYfMxMkV6nnQOWFcK30ctwjDExfnGtA=;
	b=BXR1cnu5deOtRYTi5ct3PiyXpP1LvqsMkv4299qwU/WFraWRs7Tyw1n2voWAEx7HtX
	7zBJZTxpxDe13TNCGqYLJvO3FFpVrqvmXS1MACI7uE7S7QAFYBht0JT/7ZKaRB0t4FaQ
	S7y7lXXcX70p1Y6WCyNhIQMAv3VpQaY+13BgW9NDblmtxnbXpdxnSQ0htfjidy98N9nH
	48yHOsN1zcvooyC4fDb0kP4EN8kcRuCZ1981bWAq1Y2vJaShYGw3yw3GCFADFQGzVr+4
	EmfPN70I1hbLV+Q/MA84/027bOJLpL5e8S7Mkcsz32+zIFg3rSqa1TvpKbig+u5q1xy8
	jJCQ==
X-Gm-Message-State: AEkoouutjt2ZfhhfUO6hxaEFAss6PQPA1DfB7TYJufyQUA6pb9ddDyzU7skcIswrz1r1xQ==
X-Received: by 10.200.48.42 with SMTP id f39mr44576669qte.81.1471439915883;
	Wed, 17 Aug 2016 06:18:35 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	r187sm14680639qkc.49.2016.08.17.06.18.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Aug 2016 06:18:34 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2016 10:17:44 -0300
Message-Id: <1471439868-10118-4-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python][PATCH 4/8] python3-requests: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 17 Aug 2016 13:18:36 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-requests.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index e00b257..84609f1 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "a36f7a64600f1bfec4d55ae021d232ae"
 SRC_URI[sha256sum] = "63f1815788157130cee16a933b2ee184038e975f0017306d723ac326b5525b54"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-email ${PYTHON_PN}-json ${PYTHON_PN}-netserver"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


