Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 02C7A7C749
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2019 13:59:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id h4so3941422wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Apr 2019 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8MQh8h0/3HsGO+UZNBpts93Gqsp4RP9J/xfBFhWDNdg=;
	b=DXAO9X8qH4n9+GWPupzIB34CYY7p2batCFP6+jIGMVUnrFrgwhq5cN8DCP23weAQP5
	jRWCJrsAE/MvZ1kWmKkc6ucQ3cp1hiZuXali90zYO3avJYYXORp//ibnvJPNz6z4wNFB
	/r6HlAGAyPTC8mfn4lnfVt9IkFYVGsZPQa0Nx1FNAA6FBROXIx35gPumwb4e2F2rEI0D
	csJX8r8ue8tNNc5uIUMfYDdzFZXbNjioEzwHnmMDV45saR1ErtUKnkSN4iHNriXDFiRi
	TEbtRmzcS9+MhrpDkIir1DH3nLkW2xct6dhced2oWsdaFWH+ZN65MThKOjREsYmH6bPr
	bOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8MQh8h0/3HsGO+UZNBpts93Gqsp4RP9J/xfBFhWDNdg=;
	b=f3oV9Oe7S2WxBlx5o2yAi5bpNDLO2Igu+7b48tHgELSyNQakhP/ytxtTF8Gp9NNapu
	y5owtkFSeZAW3ZKWsDzo4Ntn3gDrmm65siDVlp/2RkBSky8JwX0jT3uGn38QS3OdbIQ4
	zWQt3dV8PGxfwwWAsKzhvjjdk/KsSPU7+vTVkOII8pT0dsnjOmxXVdA27aggRykAOsSh
	B+KghU4QCBiEdnN6hjXzwWLpM+cuiTYkVpIZsi3IC5bYQLirmQHzp466dkHD4UPJB8ti
	l0jJz7oFNtSPm1Rbf8zy+kcez4VCbMy242ezQ/AZsmSZM6ITI+nO7TeCVXkPHswyoWUf
	lUiw==
X-Gm-Message-State: APjAAAX/GJYSOVXd+34Ke9T7taMOj3p+ZIRlqfNeNJ9k2anYNrznpgVa
	FShYqfu48Bu5bHWyg49DuTsm7ZpCwBo=
X-Google-Smtp-Source: APXvYqyW6Xvz/VOB7BOfZGWYsd46w5LubRtdgnP5lCjeHwVoySBzNkaTn0vVs76/FRm5747qLJUiiA==
X-Received: by 2002:adf:e40b:: with SMTP id g11mr4080307wrm.207.1554386359321; 
	Thu, 04 Apr 2019 06:59:19 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.214.126.255])
	by smtp.gmail.com with ESMTPSA id
	q4sm26056547wrx.25.2019.04.04.06.59.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Apr 2019 06:59:18 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org, bunk@stusta.de,
	martin.jansa@gmail.com, raj.khem@gmail.com
Date: Thu,  4 Apr 2019 15:58:56 +0200
Message-Id: <1554386339-20076-1-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe] [PATCH v3 0/3] Bump zeromq libraries versions
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
X-List-Received-Date: Thu, 04 Apr 2019 13:59:19 -0000

These patches are intended to bump zeromq libraries to latest stable releases including:
 - libzmq
 - czmq
 - cppzmq

Vincent Prince (3):
  zeromq: bump version 4.2.5 => 4.3.1
  cppzmq: bump version 4.2.3 => 4.3.0
  czmq: bump version 4.1.1 => 4.2.0

 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb  |  6 ++--
 .../zeromq/{czmq_4.1.1.bb => czmq_4.2.0.bb}        | 18 ++++++------
 .../0001-Problem-out-of-date-with-zproject.patch   | 31 ---------------------
 .../recipes-connectivity/zeromq/zeromq_4.2.5.bb    | 32 ----------------------
 .../recipes-connectivity/zeromq/zeromq_4.3.1.bb    | 26 ++++++++++++++++++
 5 files changed, 39 insertions(+), 74 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{czmq_4.1.1.bb => czmq_4.2.0.bb} (56%)
 delete mode 100644 meta-oe/recipes-connectivity/zeromq/files/0001-Problem-out-of-date-with-zproject.patch
 delete mode 100644 meta-oe/recipes-connectivity/zeromq/zeromq_4.2.5.bb
 create mode 100644 meta-oe/recipes-connectivity/zeromq/zeromq_4.3.1.bb

-- 
2.7.4


