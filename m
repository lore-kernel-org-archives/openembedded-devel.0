Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE2A65DE1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 17:24:55 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ur14so1332615igb.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Apr 2014 10:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dOw+oQJAoseQMrckLbbRumxhGjM3FEA8vygiuyo/Awg=;
	b=mkmCpSF93+zB8bVlVQEPnOAaJ79Qe66gh3SK796AdrXZEP7O2gFTdtuOhgF/FTSDKi
	wqUe2RmWkZVXhhGTrS98IePFbfQxe3H9bD+fz6LvZvKgiHgNNbwFq8y35CDFqj846/xx
	kiTaBNZIcEhgduS69Wp7PctJKRyqfMqeP8MRiCsZeKApwhNciC0tsthFKm8rcwypsXvL
	TYJIo64esqBCAG1zXyHZZhiNkdndsrykVhfeWAFhN70LmbbMTHqRF0+RgAfuIPmWqTYV
	wIggm9mXu320Ks0w0iVFzFu+fDFEeE4ApBz/m0qGS9XHJRDyzoGlUAsF1vIgkXVePRH4
	Ctfg==
X-Gm-Message-State: ALoCoQkblz+i5dMAy5TLcDoFAQKJ9lD1ZesH53wS2K9Ihuv6k/i8wRDIQAX73XSSUCctI0EdnfaU
X-Received: by 10.43.138.210 with SMTP id it18mr3869149icc.23.1396977896551;
	Tue, 08 Apr 2014 10:24:56 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id s8sm4624836ige.4.2014.04.08.10.24.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Apr 2014 10:24:55 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Apr 2014 13:24:46 -0400
Message-Id: <1396977887-26644-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: patches@linaro.org
Subject: [meta-multimedia][PATCH] libdc1394 SOBBW patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Apr 2014 17:25:01 -0000

Here is a patch for a build issue discovered while doing a world build.

Trevor Woerner (1):
  libdc1394: disable building examples

 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.0


