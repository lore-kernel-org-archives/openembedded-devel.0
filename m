Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id ED1A6745AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2018 23:01:08 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id r24-v6so362141wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2018 16:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=52bwNQYO/xNTFR5nNAlDg0WU+xMmN+tsNkVEfwZTk+Y=;
	b=BFk5SuW8Vk47dYYl2oYme+bDifc+FEd0BYekxz2TLBiOYYAfa4SGQeG/bWl5ol6Ikz
	0vLy7uzEMERjiwFuEaf8iGWy6lBV1pHU48kAHT5RVKxygAimtdhVUMG0hEh5DCTiTFt9
	dyOcGav7Hyv1/+BlnxSWE2k6f5FHNRtB/r7rHyry527+IVhTVvPyo7+hW+GZX4uS6qar
	vMdxELDBeHWaMarmLylJ35KGuojmW+ueBaRhCND99FNuO5SKpKuSY55gF+iFlr+LppCx
	sLtgpmm8LXv00gDRHODaRlzHNID6KQPNMgA0VMbYSamlzA2MmBVmb8y+gLD9VfBXB3k/
	HHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=52bwNQYO/xNTFR5nNAlDg0WU+xMmN+tsNkVEfwZTk+Y=;
	b=XbJL1uy54sOk/TUWvTPXGezMNL26Y+KU+2VAaGztSb+PWxzIyAYXzrnkSblRxYT/ZW
	U7Jib2eA+T8tSR7BHLCxDhCRvRfGy+pPhi/jfeLwqN8Yb0TrPUxMQHatodvCsTobJrgW
	nNFHTB6bl7BJokuJQHM0TGqFY14nXmQpiXREI6b0VffXReuyHA0MCqsAdkDFmUZmiW6t
	yJB/s52PgmCKVV/34d/FKz+pD+pgqTQBxyMJsL0OSfrA/P5/qbyt3HBspZwEYFifB+h9
	c3KY68JiSBt5Aa9KRJf1DkjvcHOXJJ64cKDCuyQv3wFQ0rso5JE7f0QSOlG8UgwUq1YK
	2xlw==
X-Gm-Message-State: AOUpUlF8e0nNEWmvPF1rjGerX78UmjSUEBchbtuX8O9pBfw3ev1rGIXy
	xWLSYJmNtVC+Jk7KBC1skgcVdYDh
X-Google-Smtp-Source: AA+uWPzARmWjAoHX1rL9OmmRrlDs2eWOQifRxjZ0pK+sa7ov8N8kZ4DHVadPCgTlhna4wx3/I+A0eA==
X-Received: by 2002:a1c:b49:: with SMTP id 70-v6mr216009wml.149.1533682869308; 
	Tue, 07 Aug 2018 16:01:09 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	l72-v6sm7388972wma.17.2018.08.07.16.01.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Aug 2018 16:01:08 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2018 23:01:03 +0000
Message-Id: <1533682863-25087-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Alex Kiernan <alex.kiernan@hivehome.com>
Subject: [meta-python][PATCH] python-m2crypto: Move swig fix to configure task
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
X-List-Received-Date: Tue, 07 Aug 2018 23:01:09 -0000

From: Alex Kiernan <alex.kiernan@hivehome.com>

Fixes:

| DEBUG: Executing shell function do_configure
...
| SWIG/_m2crypto.i:10: Error: Unable to find 'gcc_macros.h'
| error: command 'swig' failed with exit status 1

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
index 272c76c..7e22163 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.4.bb
@@ -27,7 +27,7 @@ export SWIG_FEATURES
 # Get around a problem with swig, but only if the
 # multilib header file exists.
 #
-do_compile_prepend() {
+do_configure_prepend() {
     ${CPP} -dM - < /dev/null | grep -v __STDC__ | grep -v __REGISTER_PREFIX__ | grep -v __GNUC__ \
 	| sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' > SWIG/gcc_macros.h
     if [ "${SITEINFO_BITS}" = "64" ];then
-- 
2.7.4


