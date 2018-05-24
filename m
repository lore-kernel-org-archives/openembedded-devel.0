Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6CDCF74BA6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:29 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 144-v6so2640587iti.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uFEpXgUzpNXPteyMsOGmbhaIr6XNwL8JCMH39ZlVxP0=;
	b=MJMefrdEG+LMq5ZxY2lISsWfqmGSx7/rUISEWSvn9eSTF1DIQiIwVQ30QZH4LJF//7
	Ty5BDpcMVVipHC47qk4axR+9m6L83J7CmJL/w+q6EqNsRUJUU+0PefbT6kpBcxEyJB2n
	zYcFOex6Z8ZTQ6lmKWuBWeDk4E8yYDl/QwFotimDai5KkG9AC8XtGATPU+t7whbh/EIy
	hJ8HhX2DCRSJNrMTiV8eMWZoLsBRXu6xW0TL4ono46Cm2evvASTpf9sbdrSWYgJ47cP7
	a7XlCaYuWaAvZkRwAZUGFcjWdeyj0MD7jce6Co8y4HKuZyC9ni/2lP6fHz7gpmJgt9Cr
	IQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uFEpXgUzpNXPteyMsOGmbhaIr6XNwL8JCMH39ZlVxP0=;
	b=n/4hgAFM5/LJkGczJOauG65BMlP+WDOc43YJhZJgkWt7nN1nRCrsjuxuk8bSdoRI0X
	RsA/w/tmoc7l/nYJZWPQZyVlLVWbvXgnAGizXLSPeIxAEMYTskxH6N9faqXpGfv5LbxW
	F87gjZLVwt8/Yxh++D/+A1HhjV3OGidIi5+n7MCFMcQOrjHZioeYYKCwzE06dTiSJJXL
	kyWzXYv1BIy2H2OPiWAWOTX5AM7rad5Bm7aqboD7Y04VyzyiZQ53O622gD4xwQiJRTfy
	MDCUOJHD18ICPpsJNg8H5Uu4iKNQ/skTjN1zPgKM98PkvDBdmF6UbUWpFbVE2d+BWivK
	bbCQ==
X-Gm-Message-State: ALKqPwfUSzyN3zydo5BHTe0nkzeIsG7cZG5XouKZKfs4D6Kn3Dg5fEHO
	JsXfBUBDC31UtS5Qi9+H0FjzHgdw
X-Google-Smtp-Source: ADUXVKKb0oCro6+pt9ZsMB1lGzUhlMBh1Paz5D4+jwYhqS/PuMAqB6QAyy5NBzpYUVYXpZkCR2ITpQ==
X-Received: by 2002:a24:fdca:: with SMTP id
	m193-v6mr9499645ith.77.1527172770812; 
	Thu, 24 May 2018 07:39:30 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:29 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:52 -0400
Message-Id: <20180524143854.24096-16-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 15/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:30 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
index ea262f855b..f38414862a 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_3.0.0.bb
@@ -23,5 +23,4 @@ PACKAGECONFIG[testapps] = "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,
 
 PACKAGES =+ "${PN}-testapps"
 
-FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
-- 
2.17.0.582.gccdcbd54c


