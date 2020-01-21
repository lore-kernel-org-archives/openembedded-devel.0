Return-Path: <sumit.garg@linaro.org>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id C2CC57FD9D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 08:56:53 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r11so1132300pgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 00:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OWFnCX3cV7aOK7B9zoVypzS8EbsrfIOD7VI4VfNar/w=;
	b=hzTvibbnmH2kBiJ/noURYQ7nWfcX1v159J/3gqNmZs/RKroqqlpQoBcVv77BuCSBE4
	3fpTNXOKicJDTwjeNYg4HnoU16X37p/NDTqe9TgiwwsrGRnoFRH1YjtPD6SrRnEvyq+B
	nEFXbEVzTVI3lSZzxWBljlcs39W8NYA3yxAx7vCGqi/isbaNPy+sbEnPnj22nQ5FUZvg
	M5mzbFW00kxfbg4PwD2xKtqsyPCq5ecBp528NOk+4Z7QNtjie24eBW7gl7OIkWUI3+DN
	W2dKtxaJ5QkG97hmHbEAOquZsEurLey1IQcqzj3ZCaPpaJzooF1Y2EQbu7kMYve5Ki8I
	SOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OWFnCX3cV7aOK7B9zoVypzS8EbsrfIOD7VI4VfNar/w=;
	b=N9E/0lysKmZpgV6fK+OO4nyZ3rNvgw5MNTXp1++5O0t0CD0NRBJTfZ1yJb9WVS97Io
	x5OEzeLf0g7Ea7Rjfkl4Ze6BEf7XycQ5Gm9jrY7HRcHriJ7efX5Q4jMayMfTIQ7Ca2Md
	3XkGQ3UXWjvdH7SzhjQFeOl4ookryY25LZHg6+MnU+Hmz0ZDcA2GxS0IYH8oX/md1Pz3
	tl/ovPEqQctU64wzdeDEs9TESWZfZL+58Rn1Gp6i/qz/eFFAP+ehts7aXWERO4PqESPw
	HZaRI7U+2jaBCohEESFHe5L8jFG/mmECAkTXPpPjuJ6ylkonlP7LxtddAIqgsZoUteRO
	bdBw==
X-Gm-Message-State: APjAAAVIgH88jz3T1LbFbf+L+F3S/Bs23PLpgUFfHia2km1ZcXb8uzyU
	/CH/QEosq0NsdiztzUjBfHb49TcotA0=
X-Google-Smtp-Source: APXvYqwyimjhqnecDjQpAPlUU+yqH/f7UaBKRKMDFPeYzDP6llV/fao/ap8ffk0YS6pFzYRpj5g6kg==
X-Received: by 2002:aa7:96b6:: with SMTP id g22mr3498709pfk.206.1579597014631; 
	Tue, 21 Jan 2020 00:56:54 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	m22sm42546378pgn.8.2020.01.21.00.56.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jan 2020 00:56:53 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 14:26:11 +0530
Message-Id: <1579596971-24752-5-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579596971-24752-1-git-send-email-sumit.garg@linaro.org>
References: <1579596971-24752-1-git-send-email-sumit.garg@linaro.org>
Cc: daniel.thompson@linaro.org
Subject: [meta-networking][PATCH v2 4/4] ndisc6: fix coreutils-native tool dependency
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
X-List-Received-Date: Tue, 21 Jan 2020 08:56:53 -0000

coreutils-native tool dependency was implicitly met while building with
source GCC tool-set which isn't the case with external tool-set.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
index ec48797..5f86605 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
@@ -15,6 +15,8 @@ SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http \
 
 S = "${WORKDIR}/git"
 
+DEPENDS = "coreutils-native"
+
 inherit autotools gettext
 
 EXTRA_OECONF += "PERL=${USRBINPATH}/perl"
-- 
2.7.4


