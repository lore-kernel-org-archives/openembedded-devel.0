Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 97A38788D7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:34:00 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 68so5720334pfx.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7RFetBpNGY14uTOsmimFTe4vOY82eFpFZJi9Uxzw3BA=;
	b=b+ISwGNGPG5YLdKUb0Q/ajs+XOVCjIEP9R+vXUGcaXEJzTcSswEfnxcay8YxjhiaAu
	GMS//OsL3SBshcegDnVWRkMF4IcZsSc8jl3SP0dianq3mfRLhmQFOhKvj8NH2tD24yH1
	v0NepKQsZTB9N2OUuoZBp4ZvIvXSzCSg+lgv52m8X14MpBFpIUFsDEExm6yWwmsmTdz+
	hbS6yYPARz7nAzAEdeshB9EScQnLPWali7BKA4L+O7gAJxG4TnwdnTioVGogX3Yj2sHg
	/HcHrzqQRfE45Xg5i9NSNi+6JmlGP/ZWEjfdj/rc4/m5edd2VUz5VavxIVK0TH/JrjMc
	B8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7RFetBpNGY14uTOsmimFTe4vOY82eFpFZJi9Uxzw3BA=;
	b=rxyNtySryBH7+Od7zfE2mC20LXkwxnb+MlHul7RvCxRFeE5JqEkIb0rX/zIzadUqGh
	annyjY//SRbDwCohcWLzMDWheoP0rnGaBgc1fgBL7OyoTlWYJM+cGwIZAX6XcIF+gQv8
	kuj9HnLsIbp9d00n+4W6ZC1fsPbS5ELONvCvXIQrRWkaklsDCEXBOllT2vDZD0TL/okH
	cquirNZnBWdgf4CHYZYpaXRn9U5IAdcUrRXdIlv+cvZAOdeaxFntOoeGY9oGYx5QnxXc
	I3VmA11iNsIqZpQ9XkC7VVjw7sUePM8dl6LvLAqGQ5utX/KlLJrPAjmX0TqmqQ8BH6DD
	I9zw==
X-Gm-Message-State: APf1xPCff3Mtx69xo88ppDLtV6gpgrFfcvzehnsPe8n2p7eCV721lzEY
	CAkXB2LoxGlUtUWF4T6/zcW9iA==
X-Google-Smtp-Source: AH8x226hZl0/ZbKQjnxowiZHjA/DA+Bt9n7xCY5H6BE0oUl56/B1CjNvU2YWj0B5RGZgo9yP1nqBqw==
X-Received: by 10.101.97.139 with SMTP id c11mr6651731pgv.449.1519594441760;
	Sun, 25 Feb 2018 13:34:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.34.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:34:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:23 -0800
Message-Id: <1519594406-24490-33-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 33/36] acpitools: move to recipes-bsp
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
X-List-Received-Date: Sun, 25 Feb 2018 21:34:01 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-extended => recipes-bsp}/acpitool/acpitool_0.5.1.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-bsp}/acpitool/acpitool_0.5.1.bb (100%)

diff --git a/meta-oe/recipes-extended/acpitool/acpitool_0.5.1.bb b/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
similarity index 100%
rename from meta-oe/recipes-extended/acpitool/acpitool_0.5.1.bb
rename to meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
-- 
2.7.4


