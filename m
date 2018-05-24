Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 97F29745D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 13:43:52 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id a10-v6so2324868ioc.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 06:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=6ZGS57gUdAql0jSqYPLsD5YAJ/WREdZCm8qvGKeK2uU=;
	b=ZywqgHrOWOIpBwEJooZuUDaEYXvFhMhmWo88364iXTqHXQ5tHibNiO3A3ccxZsiL3p
	jgU1z/CtYR0GpBU/q9ACaiLXMhMwanYDRw3cblFpNlEddytJUVmHyQ31NArRvSNjaz96
	3MdR2YjeaMeRktMCcH5SqbpmfvWcyvK9LxnKCwUlDiqCkZj19o2ggfAwCH2MYMODiyx9
	WJChLi8b8Eojz39MKrcUVCrwDIyXhvzbE/RNd9mgrGDHXZSVrncxmIZxk+c6yhXAdFUW
	RVvVusF2vrdN/I1DsR+EczgJ8JIa/6BIaDoRBtEJAZH/UV5osEfEG0b+ZFLKoJMxxvB8
	nCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6ZGS57gUdAql0jSqYPLsD5YAJ/WREdZCm8qvGKeK2uU=;
	b=nxg24pbBA5u8XEDS4QqoFuKVXsibd/sE+PasSX/x8WaDPtRuDR/5Yy4hIc/Kl2uwrK
	Q5mijN0Af2VHPMAi21RPXbLhwNIUy4RNkexrbxlXb0kOmQmKdiP9ou5YRsj2gnSbT6oT
	6t343CYuaQmEUC5Wh2fHXRgD6b2wKBt+TQgajubi3SVcor9r24ifSSVuMOwdOw41tdcq
	0iYnilRSSjXCHTSOFGd919SRvtQ61yw2zGUYQKUU/qerQdUjzCZ6hCLdnPzPut457FHo
	OvwtvhTP7b/qiTKepJK/m4GVcZ2TmGoPtd/trCYx7YeHWfCIfIHCYWWtwFZ85uU4TvUR
	Eklg==
X-Gm-Message-State: ALKqPwedTDlYIwnT/+zafjUbs9oYYvqZHjbuGEAaFIkAC2/gLibN4Xu9
	TeKr+X7wzsTWAnSVQ4upLpUbdeJi
X-Google-Smtp-Source: AB8JxZpvDZtkqmd0knpg+TsO0zaND6RKsIKg4aRVzK8ulD0P8aNaDlVgi0dXcDEPomIIfmiAH3rA+g==
X-Received: by 2002:a6b:5f14:: with SMTP id t20-v6mr802925iob.0.1527169433687; 
	Thu, 24 May 2018 06:43:53 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	r9-v6sm10999984ioa.49.2018.05.24.06.43.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 06:43:52 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 09:43:35 -0400
Message-Id: <20180524134337.31572-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Subject: [meta-networking][master-next][PATCH v3 0/2] rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 13:43:53 -0000

v3:
- break patches back up into individual patches for each recipe
- avoid including fftw

v2:
- re-spin Andre's patches to only include this change (i.e. rely on
  cmake.bbclass) without any formatting changes
- combine all such patches together into 2 patches
  (one for meta-oe, one for meta-networking)

v1:
- Andre's original patchset

Trevor Woerner (2):
  grpc: rely on cmake.bbclass to put cmake package files in dev package
  c-ares: rely on cmake.bbclass to put cmake package files in dev
    package

 meta-networking/recipes-devtools/grpc/grpc_1.8.5.bb     | 2 --
 meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb | 1 -
 2 files changed, 3 deletions(-)

-- 
2.17.0.582.gccdcbd54c


