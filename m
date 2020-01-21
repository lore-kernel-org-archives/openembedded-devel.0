Return-Path: <sumit.garg@linaro.org>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 013E47FD92
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:56:41 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i23so1155066pfo.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RtHJ+KT0ceEZgLo5LUpPdfk9GYPjrqHuyJQHBH3dZdM=;
	b=Jn82LbH9J0f5KS+E5CZz3n/XzmHRbm2tx4WbL/8yMk5Pb2YZ6gj10cD+lWTAUxOg3K
	jmVQjkAVQasLXn3/7sclspez7LHU6a5iBoKjTGy56LxwVrPz8cbF7wXtlfo1lzXuQ1Kw
	K/VSGP4kyZ5hmiLOXxc1NwxrtS6BKcNK77Az4BoLm8ktzXmNaS043Y+sA4ifR4QyH3CJ
	qknC/fYftMAcNCMOCN3lNjsT06MNCxB6mPMqjP3NLIt5Zm84+4fYSPx9FJ9Iv9wbPu6w
	fhZm6nbr5zgtrqT2JI14aW6ryFcq85xDT1bP2Y03S5TGzyBMLGD0iPKEdx3xkVDRB7/O
	9V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RtHJ+KT0ceEZgLo5LUpPdfk9GYPjrqHuyJQHBH3dZdM=;
	b=PquFaoAHYAPKKX/mmZIZeV7r2bA/z+NwJEiDwO1saBupxS3NMMD50ih6XcjZCpAcYj
	WrXjBEXNQangucVkaMT7/gurAKlhE5PZ6l4gDV7n+AY7FZJBu+eZX+NsPamOwmG29m7v
	MoEl3Pk9lc6I8OkHW+j1jiwTW/XcD6/YabzhRi13Q6mQO1mS9YlhrdStXfI++mu1VquR
	BSj2zXRbqpdIRvWrMG4pXcdrHY+TExXM4zjHsogjeT81TgarlqlB9GZRd1uGnJrUJxJB
	tNmc9ga3FHzPoRgnyaEVXNSj6V13b0GAv7xfJBEwZt8Kg/kpvJu2EDy6FHlADwVgycWu
	feJg==
X-Gm-Message-State: APjAAAUcqY6jeEb0iqjQ3aosZ2Ua95NWGyaqddTF2M08QaWL+jruFDbX
	s6xpMeyzD+p9u6tg7nqttAkbX5MFiaA=
X-Google-Smtp-Source: APXvYqz9VNZec9iQLIXg96AcqAcg/1on7HrlaPZxNUgYNZH5zmtRup9H2ctAAeGhAjNSnHWF6uex2w==
X-Received: by 2002:aa7:9808:: with SMTP id e8mr3593795pfl.32.1579597002735;
	Tue, 21 Jan 2020 00:56:42 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	m22sm42546378pgn.8.2020.01.21.00.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jan 2020 00:56:42 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 14:26:08 +0530
Message-Id: <1579596971-24752-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579596971-24752-1-git-send-email-sumit.garg@linaro.org>
References: <1579596971-24752-1-git-send-email-sumit.garg@linaro.org>
Cc: daniel.thompson@linaro.org
Subject: [meta-networking][PATCH v2 1/4] drbd-utils: fix flex-native tool dependency
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
X-List-Received-Date: Tue, 21 Jan 2020 08:56:42 -0000

flex-native tool dependency was implicitly met while building with
source GCC tool-set which isn't the case with external tool-set.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
index 286b0f6..01bb16a 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
@@ -23,6 +23,8 @@ UPSTREAM_CHECK_URI = "https://github.com/LINBIT/drbd-utils/releases"
 SYSTEMD_SERVICE_${PN} = "drbd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+DEPENDS = "flex-native"
+
 inherit autotools-brokensep systemd
 
 EXTRA_OECONF = " \
-- 
2.7.4


