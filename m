Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 927277E14E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:57 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id t1so6418571pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=m7T52ksdFczSwFRipJ4NO2UyqjvhnJeTTAfFYY9gTW8=;
	b=VW79ABjpmgKCWBUMwAVZBgweTOOfiGleS5F+DFHqCEqLX21wJY4jPN/FRiXgL+TGCv
	UGMnwMEL+wE3bNiLQv58ip811Y1uphqpUV0m0oaIoXZAl6A54/oHdFdQGDPeU4EEaOkl
	9ZFZv899fYK09m06FCYpo6J5wo7BbpnL5UepwEM3ua0pwfAFOQvoHvuWSA9yOA12AdHL
	QuknwxeD8naxt/cw5reQaH4RouZ/Ax5ZPnp+BBQ9xgLoo/8JHy14thRu7TvS0dOp93VR
	WrN6J0D8BUpLdapamGG/Du57Tb9Et5VSPgwbc6UPy9vqtvZ0RQQwNYqKC/Fzjpb3t/5c
	SlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=m7T52ksdFczSwFRipJ4NO2UyqjvhnJeTTAfFYY9gTW8=;
	b=QnthPpLfiAL/jRlDcwxY6bQPI9pphlg2GNUBJ1CtXl5lQaC+yiS3hmGNKD3/qrorwW
	KIqCw49Sui9DSUQDGDIqDPDwkHYTlXD2fHiSfVENa4CDJCbCNUK0WNR/uI8mPb6AsU2G
	ubh9/EL8yw6gs5RqbftGaqBOeifCnCogzX9TFLzkx1FRTkqXY3fir2HlMinRJ1ax260A
	HAy6c75uiBIn/K3G1pBa+l8LnXdVWUqpF9aLAhuGXZd5WdZfMMGW88k+5zaH1EAC3XHI
	TmNmLUS8AC9SMjbnEaNdN0RS+LjqMNARh4i6l4G8u9//LAuCqKpyP3YGkOgwPbq7vaC5
	Ffjw==
X-Gm-Message-State: APjAAAWmv5qkMRR1J61Atz2XxbyYv/NmC3fZ/27oMfMSH8wT5FkdWgbY
	Xs1cy3uzOi9wyn3T/JJuiiUjfi8d
X-Google-Smtp-Source: APXvYqx6As86huKinHEFjAJ6rKL+Wk+zg4zni98ikglT1E3XVz0HuyDwbJZ2Sx53965ieh/7uuXKiQ==
X-Received: by 2002:a63:d343:: with SMTP id u3mr79316474pgi.285.1558411018645; 
	Mon, 20 May 2019 20:56:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:25 -0700
Message-Id: <0b8aa0188fbc0886b5211bbfca897b8894b5fe15.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 25/34] ebtables: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Tue, 21 May 2019 03:56:57 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index f05bd61..2767840 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -12,6 +12,8 @@ RDEPENDS_${PN} += "bash"
 RRECOMMENDS_${PN} += "kernel-module-ebtables \
     "
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ebtables/files/ebtables/"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://ebtables-save \
            file://installnonroot.patch \
-- 
2.7.4


