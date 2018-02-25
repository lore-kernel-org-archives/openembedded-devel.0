Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id DDD556006E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:26 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id d26so5711576pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=V2fG2/SAEIr3u/E9nRtU1BgdMiMlGpSXGh7KDMcFb/s=;
	b=Xfw8vzBGWWM2bWnCiq5HS1EHLOEzSJxL/CEoE2FXJtSFtmjOrujS9yDZP4CQTDq0A+
	tJhu4ATbw7lJrGS1kGoXg9ISHpfW+a/ODNC9CNC0j9mVut3ahivz+Cd9Vk15mjTqBF0m
	L+qVscQOoeUOwkwiFm6oJjPtgExBMHRnD7RE/NhNghsKQ1w/FHa/MWJ/yzK7ZTp1FTW+
	DxV9zxe4HTyjbcaDaiKhT9w8v8g1/d7dBa1oI6HYsURGH+4xg+4FQljGa9vNPxSv/XF3
	dfxollKmnHmvEzSN1mzr2sg3wJEE0HbwPp05mlIgirzsJmjz24qUgt3Yb+pOtb+TheLP
	y3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=V2fG2/SAEIr3u/E9nRtU1BgdMiMlGpSXGh7KDMcFb/s=;
	b=OIYx4lakdcECWGff4SlimaJ+R3pzQvUE+tFp+VxrLY87qWIVa1eDQQaDo/4N13mYXt
	d4xVtheqfF/hLuLVg+W7So1//9IvgrY3VuxzzAeek+psoBe5eQ8G6y3kw39DDNL3APqy
	ckaBTwg+YW+2ziFpRuavnbUf2GUVubEf7GnG484vDn6OhLNDDScLkRABWjqK7jHrnnEf
	7dyw0NpVacpHy2+qCsdwy8VOmVk6owESpLFFPEpAeSJ0AxrEnhES47C124O0k65gWz0C
	oGRK6lDM4O8ZFP3K6F4Ex+ULbRcxoXhnYce6ewgbLbuuuGUrJd0EZUdEuk7UM9iKeRcH
	JFkQ==
X-Gm-Message-State: APf1xPBx9nNxMLMXQusRUk2H+Y2CWNt1MT4HJYpyVSLSNPGkJECXOnYv
	IBrrD8mfw+7AdR0sE60GEcIpwQ==
X-Google-Smtp-Source: AH8x224SreadECTcD/Npn6IJbm0bNOgavguJrnOXytaVoKosM/c78UMdHXfNBE+hKnp7O/pFGGVnlQ==
X-Received: by 10.98.234.22 with SMTP id t22mr8453847pfh.56.1519594408055;
	Sun, 25 Feb 2018 13:33:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:32:51 -0800
Message-Id: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 01/36] zsh: move to recipes-shells
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:27 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-extended => recipes-shells}/zsh/zsh_5.3.1.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-shells}/zsh/zsh_5.3.1.bb (100%)

diff --git a/meta-oe/recipes-extended/zsh/zsh_5.3.1.bb b/meta-oe/recipes-shells/zsh/zsh_5.3.1.bb
similarity index 100%
rename from meta-oe/recipes-extended/zsh/zsh_5.3.1.bb
rename to meta-oe/recipes-shells/zsh/zsh_5.3.1.bb
-- 
2.7.4


