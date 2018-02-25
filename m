Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE4678898
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:53 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id t15so5704662pfh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0nZLJAXHzrkob/E2p8uQ/FqqLc3xOjSYohgTCbwLShU=;
	b=RqHPMNeuJg11WN2JqK+n0fqHgTAVXnq8paiD40E64RU4/jZlyCsfd2UtY+qeNzUWLF
	/rUkqVuTHFpcbgPWTmGxOT728U4YdvUirigXerXgqpbPN+PXM08gMpGHGtrBfataDyVV
	gbVfTh8eenji21ji/suUSieL/52nrBCCeLsFF596QyGBhkXFK6UDtJVY6pi6y7HEW0uj
	ssJn5UsgVYy5bDybgD38kkBTfORfuCAJiAJDMvaDAnQRUlrvJxxJoSY7Fv+QuCHymIdE
	EJkyCyLCSC6+pY2a2dOVnAD7dkv0X3+PCOBpmKl/0T5xOhcK77X+kJfPLhIF9ePLJdNd
	S9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0nZLJAXHzrkob/E2p8uQ/FqqLc3xOjSYohgTCbwLShU=;
	b=rzU6LE6fg/ozkQZIneb0c4JdatE653yZLmHFha2MTjHN8UELOezX4cGK41l32iQxeh
	OBYFIp3wbGvyJE/Io2hSXFEUHAQSsafoa6Ct56li3U3M8crVkdCoQ/U4MbegxA/2AHrU
	r80qP2oja8d0MDz1ZTIaBYzcAXqaFRxAO7pqIiT2nJ0rlus4/oOtKfKn8ZmlbspylH6r
	Vw/yKaFje4mxI22WgDMMVrHke1IHG5tlI3nKeLMNWq6cQDvqK8ytqWVvvV03VqbAanny
	XbUqQgcU6pvcuDpuV6dIchD1WmkRSY4UJuAt/n46Ft4bbobPuB/YslWZm+q+4bgE0Mwv
	I62w==
X-Gm-Message-State: APf1xPAKLyHz/S6Htcs9kS5OcINgsgoenFF8bkKG1M7hBFi6dFVl+ewv
	G+2pOl1I4ORT5mYsQvAwY3UrCw==
X-Google-Smtp-Source: AH8x2246W1NXapXzHUOHpKZ4cKIGexjAhSrSPAZkszoJtIqcW3CX0YH0mUwVA35mDh7VNNMLsWJwLg==
X-Received: by 10.98.25.10 with SMTP id 10mr8310474pfz.136.1519594434878;
	Sun, 25 Feb 2018 13:33:54 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:16 -0800
Message-Id: <1519594406-24490-26-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 26/36] evtest: move to recipes-test
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:53 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-support => recipes-test}/evtest/evtest_git.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-test}/evtest/evtest_git.bb (100%)

diff --git a/meta-oe/recipes-support/evtest/evtest_git.bb b/meta-oe/recipes-test/evtest/evtest_git.bb
similarity index 100%
rename from meta-oe/recipes-support/evtest/evtest_git.bb
rename to meta-oe/recipes-test/evtest/evtest_git.bb
-- 
2.7.4


