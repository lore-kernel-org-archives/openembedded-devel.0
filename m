Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 72D4C78472
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 13:56:34 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id n73so860540pfj.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Sep 2017 06:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ICKVdq/5yrV40dYbuMq0B97owZvAiYVDakj4mqjZd3I=;
	b=MwhldU3gUQbV8QrtSjskZsxrCUR119RZNP4U3xBR+qbqMladnJ0Jlh6oEC78zm4QLQ
	qYc9UIT4sIPNYxDK/cJRwkEmK0RZy/c2AbNw67Ca3vQ36zssP9/JpYogs3zvE639BAqq
	7Beo/mNDnTmSrPe1QB2ANQnlSYrihV1YolqSoExiIdVB1GqQRzYwDXP9kRbglPgXua/e
	eOzhuCx6zag7toxbsiuvXrQVScSOQT3qiXq8VWXVsoRRbCFwWckE5DisCkcQahV4ofb+
	AjEYVgXiP1hnK9DAyYx6/FjuZzACSCYt6SmesnaNtSPAw3LwoJnoAV0X/sn+O7rSrJzx
	TsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ICKVdq/5yrV40dYbuMq0B97owZvAiYVDakj4mqjZd3I=;
	b=lQzyGkhWK12YqTay+GwaTu+1xBoyajIUO4CmUtfE8rwwhGEele30QnM8CWRwdNhO7G
	tDw4cN8NlifQc9z7mpuMsiyEkANMlF+OTm2j/PjFSXwV8Q++l/XAe45y+5S6WA8i4QvO
	DiN7j3jeCpiBmlNmk/Ckjzds8qlTZACtZGHGKREgGft6MtgLXMZTLSZPsrI42jHHSCsX
	vBZGWAqKE2iNmWH+zssw04+q/RJE8oI0gCKSiXs/ghe2ONDIf/dL6ImutHj6uoaBJV+A
	81y5EVB/gCeZd7Pe2ANEcw8z2qSMiqPxTjA9Fw/eXOHysTNZZE5iJdhRvT1ydemeCdmj
	5Epw==
X-Gm-Message-State: AHPjjUiWUqVmRBvYntZTcGcmHmcWeCI2xXovJ0SWWKy2gWoDtGW9JZF2
	CM0Xmq7P1n7SGA==
X-Google-Smtp-Source: ADKCNb418zzlnJcfHDom4FJeQbIr5j5U6bFWUjiT9akmTLn33gZabgjLZ70+v8Rr1AgGn2o1B/pqqg==
X-Received: by 10.98.57.135 with SMTP id u7mr2348264pfj.220.1504274195949;
	Fri, 01 Sep 2017 06:56:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:c400:6ad5:9d97:9621])
	by smtp.gmail.com with ESMTPSA id
	q66sm338652pfb.132.2017.09.01.06.56.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Sep 2017 06:56:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, joe_macdonald@mentor.com,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Sep 2017 06:56:33 -0700
Message-Id: <1504274194-21845-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][V2][PATCH] wireshark update 2.2.9
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
X-List-Received-Date: Fri, 01 Sep 2017 13:56:34 -0000

rebased against master-next that has the 2.2.8 update

Armin Kuster (1):
  wireshark: update to 2.2.9

 .../wireshark/{wireshark_2.2.8.bb => wireshark_2.2.9.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.8.bb => wireshark_2.2.9.bb} (93%)

-- 
2.7.4


