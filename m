Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4D578515
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:48:04 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id l24so2673128pfj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 21:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oE0cooxPmMK5tDtvimU9x3FmYaIA3jZIVzAIQ+ROu5E=;
	b=FS7tP8jp9vUH5t4U5rimtoW7AsPq+IwuHnd4YUHWtiZ29m3NIgFqe3cyQfMGzxEpsa
	Sw7wLq0eaXPs2VX0qrxFjh95xWECV7O5KO2HuupHOickeNSeSeWcyoji1XEESjowDm1i
	o7jmDGMaIUCJbBMP8SFm+UfuQvcddkHHT8hmgV+pn7dH0mLPd4iKqMHdUg0Vr3SYTpSb
	Miir4wBZ0VcSdfBmMIgB/ATxuH3hHRx0dFKJq4HIe8XWE7LtFd0mb0gaVgK8evT16/G7
	eKHTD0DfnDwLTd1aNpsRReRQLdh7U5Gi/VQLZwj81RGoPIzX0ZvgENvtZDmiwsj1HAsV
	fUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oE0cooxPmMK5tDtvimU9x3FmYaIA3jZIVzAIQ+ROu5E=;
	b=aG27rFtGno6x3EaJN4V1BU5yuzGEf53amjHpD7Mf/vddmb79xJBo11i559N2sRhFv7
	6ExQOytNri2/3I6AnrGmTFfm206oMKlwxdWcevCHAEiCOnS9fmB4O1d54liF5Vo7x6ON
	PumftviTbWZ6yUJxzlWTTqP6qN9UQoz1NwhHe1x6K57BHit3maiD8dYFw2HGYkEPKSlI
	yU5PyB2+jECGs5pyemc3Usryk7qsRwF1XPqEqPafeqWbYPctqx1hCy3bRGfcSvcNOtSO
	sylG+c3q0tSVj5+2oSlXUFeqhiJCA66qaw1YqIG1TZxNTKoQGlJv3w0JGO4mH+jPG+Mm
	Ss7Q==
X-Gm-Message-State: AJaThX4zQZIwG2t9FrzTgSto19BjXh//T+tk9paldk+iEiayebMeOiLc
	z/8HT3Qw2OPWivrOQNSrCzeusw==
X-Google-Smtp-Source: AGs4zMbzEbcj2Fvo2YMTqqsNOV05H8FP1tZJzvKIYCC6Ab5Mt77MhvmMwPm9B+hKOXEvmZbwGEKjeQ==
X-Received: by 10.99.184.25 with SMTP id p25mr1303193pge.337.1512020886008;
	Wed, 29 Nov 2017 21:48:06 -0800 (PST)
Received: from neosoft.neocat.org (184-100-239-238.ptld.qwest.net.
	[184.100.239.238]) by smtp.gmail.com with ESMTPSA id
	s68sm6387336pfj.81.2017.11.29.21.48.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 21:48:05 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 21:47:01 -0800
Message-Id: <1512020828-4040-3-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 02/12] python3-dominate: new recipe
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
X-List-Received-Date: Thu, 30 Nov 2017 05:48:05 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb
new file mode 100644
index 0000000..5304ccc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.3.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-dominate.inc
-- 
2.7.4


