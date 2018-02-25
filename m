Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8B020787ED
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:46 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q13so5717148pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xBcwUSOpGonBJntB9L9K1ZUgghHsvAZAriMVlPvXWMY=;
	b=vZNcVYJWofE23wFkFmN5EiwyxSviyUSwU+EOJrRokDRGm5L0iNl2iitvNf+yTNL2Si
	jQIDGEzmh5S4AbLjVhjzdYVN20x12FELKA3spYksdiXSRmWh50HuLRishDq8djMOR/W3
	12z6h5X5iP/gMQ5u+r9SRNICBi07pAbl0BghiiKj1D79ktNMFgvLGXUeaZ7boWE14M3C
	4ARscEhXsOHwieaGV4Gy/RsJQo8QPfWCRCwRLQ3TGAHH0MNJ4tDVt6npRpJ2SvyKh/ho
	lbLkALVa9ArcRqRuAcSNH3pXlKsrUqp6sHkxDb/sYhiEzke26PkxqCHJ9xCVLqahSTrq
	X2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xBcwUSOpGonBJntB9L9K1ZUgghHsvAZAriMVlPvXWMY=;
	b=FDlYV4kjQtcjaF0BEVVldvuP2+qcSKyZoVH63kAfatzRx6cJRH5UZFXZODF6bQkZTw
	3gTgX8GKR/0d0dyQVN34JM14B5ubr/qECxk2Xi4tsNuymvqOf9Pemkr4aqlpFd/rgF3P
	1GxbS8QDGmV7nah+jKPtSRZW0lIuLL7w4R4FHcCVop2ZxkWkJYSjlXP9bNQS9ErUpCGS
	vU4eG7xDS6VfrLcAMpbyjObcjFyq4v907ZKBO5GLt5e7zLKpTcgxv5GNh2YjgaJeL/ZE
	UCMdb4XTo2ZBonxhx6lSfSJxPd5mafkeArjFCP4m0Px67eexq09LL6p3h7IE8Pdvtmsh
	f68A==
X-Gm-Message-State: APf1xPCPM1ifdqs5XHbL1Ph0hUgrxmT/RfnEzdZLZ2Kou2fXLDC6PuW2
	1iJsy3vb+QDCyhCwLA03UgB1Jg==
X-Google-Smtp-Source: AH8x225iuoUzEse6Chb2bkvUdpGIW6GRhGjzQhM81Lddp9T4EHpuE9HSe0VLo/In1adO4yICu37xNg==
X-Received: by 10.98.137.147 with SMTP id n19mr8525482pfk.193.1519594427484;
	Sun, 25 Feb 2018 13:33:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:09 -0800
Message-Id: <1519594406-24490-19-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 19/36] cpufrequtils: move to recipes-bsp
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:46 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch                | 0
 meta-oe/{recipes-support => recipes-bsp}/cpufrequtils/cpufrequtils_008.bb | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-bsp}/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/cpufrequtils/cpufrequtils_008.bb (100%)

diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
similarity index 100%
rename from meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
rename to meta-oe/recipes-bsp/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
similarity index 100%
rename from meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
rename to meta-oe/recipes-bsp/cpufrequtils/cpufrequtils_008.bb
-- 
2.7.4


