Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B7FF560767
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:27 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g2so5433831pgn.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Tkuj1/EOPvYuXkZLIcLVzsoVtxJ89eABu7K0oY18XJk=;
	b=Dp15ow+Qswhh8LHdJAprieYb+TclGKgolpqzXpxm+2vU+w2DroWfFuS9rWnpEErNNG
	DEH/MqwqfhVRDjRK/psXktT3DQioZtbY92S6nyk/QeHo+a6Ko87xwPYM8B3MqiZe4hMO
	W8PIE0Bd7OHMyU0Y7+2y72oBLQN0+orpcT4/T6H3CeiOAPX1P4feK4gOh2kq3h1cDmIO
	hBLVsvM406PErmSS4soxrNivai0Cw1D1FJsZnna/lfs69DHSILCVSvysWqJtgydx3fUd
	lSQbf9qqFzsar/YqrIy8gCpHHDuwFSmvd5OR3ZXNnx5P3YjTdGlecswswFAvEKVcMkLR
	C5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Tkuj1/EOPvYuXkZLIcLVzsoVtxJ89eABu7K0oY18XJk=;
	b=P8IUreRJn8uFRskWDsyiz0UmV/0mAJYsaPPUu9sLO04RzmUpKziJvVmyTYuKwSxxI3
	2ut87gWGroB8AMjdnS84BPHbg5myD04AR+oDqijAwN8+AnG0T6Hkg3eE51h/vY979+Js
	V8PLpo7Gn+dnuKa+RlMpPEDNBAczQPzHNOPrR+1t2ogGizo5KvPviOvvzwg5SPPvYJ/B
	jIYqIV8LQTQyCENAXXm1ReOgfbiP3Ln7qDVPhfk4spduTyTcb9dfwZL5o8bvPuaMdy5r
	/orzZ9iUyh7n9NVuz5uv8DWGbtJ/QjzwXA1fXg+MYzuFuNEhI9m2NR5hsDeZsSPR8oW7
	tnmw==
X-Gm-Message-State: APf1xPDcvKhk4MgjNniKDDFEs1Nf8aefiYzmIV18RBWpZ724b1ig2TTM
	gwqF4gWYGgzxhw79UUz1K0/s7w==
X-Google-Smtp-Source: AH8x225wHK34fPa0f4bZBTc4tRn2H+0/w3npbRHaYkJo/prbtjUO26VzWLjh6/KTIDrhzMkIs/bgdg==
X-Received: by 10.98.135.76 with SMTP id i73mr8454076pfe.140.1519594408867;
	Sun, 25 Feb 2018 13:33:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:32:52 -0800
Message-Id: <1519594406-24490-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 02/36] tcsh: move to recipes-shells
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:28 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch                | 0
 .../tcsh/tcsh/0002-Add-debian-csh-scripts.patch                           | 0
 meta-oe/{recipes-extended => recipes-shells}/tcsh/tcsh_6.20.00.bb         | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-shells}/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch (100%)
 rename meta-oe/{recipes-extended => recipes-shells}/tcsh/tcsh/0002-Add-debian-csh-scripts.patch (100%)
 rename meta-oe/{recipes-extended => recipes-shells}/tcsh/tcsh_6.20.00.bb (100%)

diff --git a/meta-oe/recipes-extended/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch b/meta-oe/recipes-shells/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
similarity index 100%
rename from meta-oe/recipes-extended/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
rename to meta-oe/recipes-shells/tcsh/tcsh/0001-Enable-system-malloc-on-all-linux.patch
diff --git a/meta-oe/recipes-extended/tcsh/tcsh/0002-Add-debian-csh-scripts.patch b/meta-oe/recipes-shells/tcsh/tcsh/0002-Add-debian-csh-scripts.patch
similarity index 100%
rename from meta-oe/recipes-extended/tcsh/tcsh/0002-Add-debian-csh-scripts.patch
rename to meta-oe/recipes-shells/tcsh/tcsh/0002-Add-debian-csh-scripts.patch
diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.20.00.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.20.00.bb
similarity index 100%
rename from meta-oe/recipes-extended/tcsh/tcsh_6.20.00.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.20.00.bb
-- 
2.7.4


