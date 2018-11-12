Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2065E6C257
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2018 02:56:59 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id n11-v6so3564049pfb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Nov 2018 18:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ylQIR7/4qsGQeb6arC3wzeKKi6N3q3Nov472rg6+Q8o=;
	b=k+VUbrtExO96ccBJs3LLsm/LyWak2d8lQFdnEhyUk1Im5ZVkcd86AeZTHJcxO+lO81
	ctFmKCJMTVxw3r9kJFl3m29o866Ya2aM6E3Wa/lpYcau8QGspagzIM3JySJUKG9Ocsp+
	oc6SJYa4gm4dhQ33s6jGWBfV1dw/oaP2Er9GYX2AQ1Cjt62Ba43OZPa1OlOj9C4razHU
	+KNZlRmHntgBOjaZquz6IyFh9PywgDkYytettg1z1l9xMQSlN7O1H2wApaRwqFBsKELX
	L7Y45M7oKflZDtU1TEbgZeOtW+erKAct6sT8f33ACtymmj8iDlzv1jA9AIQAIO8M+NHh
	8rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ylQIR7/4qsGQeb6arC3wzeKKi6N3q3Nov472rg6+Q8o=;
	b=IVc19ttl7rP3+sUmCWUo2XiUVmrZdPKfptCVhycLS8g5XiOGVsQ/tYLjzCG0RnWqLx
	3A12nIzhUXh30d6arctkbeSSscj3WAwTMWlcW+Kw4NThM0Y/j4QyPWuogxeuE7HG2zz8
	3uCMirDindBmcVoESBMx28Yfy8Fn37u5njzedkt9c2SyG/3FuQTHk1ixzIVuwdrI3DXp
	yZEt6gEEIXrCDUWT2JmMRD69V+VJ8bhpcmZJ63pnAV/WRi5FKsjL33+g1uETiXxw3Jy8
	5KNoncp9zC50OBEbg76X45QkWHEoyvFUCjYAn7gpI9KcisXXNIpjK80vJMwNHhdzV0PK
	gKHQ==
X-Gm-Message-State: AGRZ1gIAa4wxo1yr5EP+gYgCUIK60wC09BoqtN5ZKmGSX1UeYb4L9i1z
	sJ3fx07n639Kun9IBpcJvCs=
X-Google-Smtp-Source: AJdET5fXL6KSQENJXOZepO/ZBDcEW29oyVGuvFiw4dqruPGSwYYtx3vvnkVeM0FJdOeyWd1IMnbLMA==
X-Received: by 2002:a63:b54f:: with SMTP id u15mr15832304pgo.420.1541991421092;
	Sun, 11 Nov 2018 18:57:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7077:6962:50cb:42de])
	by smtp.gmail.com with ESMTPSA id
	b69-v6sm16128554pfc.150.2018.11.11.18.57.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Nov 2018 18:57:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun, 11 Nov 2018 18:56:58 -0800
Message-Id: <1541991419-8898-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] Add ptest image for testing
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
X-List-Received-Date: Mon, 12 Nov 2018 02:57:00 -0000

We have talked about layer quality for years. This is on small step
towards that by having meta-oe specific image to run ptests. Not all packages
are included but this is a start.  
 
Armin Kuster (1):
  ptest: add addition packagegroups and image for ptests

 meta-oe/conf/layer.conf                            |   2 +
 meta-oe/recipes-core/images/meta-oe-image-base.bb  |   7 +
 meta-oe/recipes-core/images/meta-oe-image.bb       |   5 +
 meta-oe/recipes-core/images/meta-oe-ptest-image.bb |   5 +
 .../packagegroups/packagegroup-meta-oe.bb          | 251 +++++++++++++++++++++
 5 files changed, 270 insertions(+)
 create mode 100644 meta-oe/recipes-core/images/meta-oe-image-base.bb
 create mode 100644 meta-oe/recipes-core/images/meta-oe-image.bb
 create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-image.bb
 create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

-- 
2.7.4


