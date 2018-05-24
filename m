Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2306674BB6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 18:27:11 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id j186-v6so3633395ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 11:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=uZNaZcxj8ROjQJlW/jKIJCB4MCIa9KXidU1MY3baigM=;
	b=ipdBAxmNqqhJGcPYoEnKf+QirJoXv6yt3AlWfD77WC3pzLAJfmntM+gZaWKWmYP6TN
	DPOJDRSm0kFTqqfbbozm0oufXmqijtsRDr2CHn6CldF0S4Y4TOfR/XRODbXHvJxA5VDb
	Ub1MPCW28iC6D+Lgf+8403OeB8qgH9tILEceY60+M046+v8E4eLRlCfsHKyPeOaOiHXG
	400BYnXtu9xyWEIGPEfgVfmTRT7tnzDrplvCG1JU+PL2Nybq20e5H/HJ0kVn076X26Zi
	pydvakr+mzsQpvl/nMwU08dZFOVKvqZLjwYvjmYEEni3+7Z4JtakuD78Nm2Yl7hPwwGU
	NFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uZNaZcxj8ROjQJlW/jKIJCB4MCIa9KXidU1MY3baigM=;
	b=CF6AqrRtPMO7tdVkSjubqjXAS4l4xqCauFaOrRi02qCIxhoJf3KzD6qXPXmkE7m6IW
	WuuL8zt52vJ+pC33dTmrJRIL0ZZ0X4iNIWgsd5ZkxnTbzouBdtRd53RHnVJkYhp4xRHf
	5SalMJTFjcUwzyxwLn+TKpdUWRm+d3BCi1nrPX8FrV57Ck4fn/pD/RLkyb3FDt49XS6c
	7e3RN2WFoXsm8ppCKTe7VUfkchTVu39glew8m8LAB9Bje+fMQiOdPxr9yjtuDs9rVnlw
	fqusSNwpxI0X+nA72BOKSHS/EaVRyDwcNzQPOyDKQ0Fka9rk8Pn7yCeV015CjqqoptcL
	scmA==
X-Gm-Message-State: ALKqPwdBhbrJEl2Tfy7odOLUxcTd2odGM5f/nLSSjGmhoTwGxp6l7woo
	hKVT/F7B0aB2yFUY2vxPm8fU0khE
X-Google-Smtp-Source: AB8JxZpWa6pTEGFYpftZfa+6qidubDp8Y2V3Fe22B5m0JDqonkwh6zpPVWU5bf9xiiu7IS4e8MUywQ==
X-Received: by 2002:a24:94c9:: with SMTP id
	j192-v6mr10389760ite.153.1527186432646; 
	Thu, 24 May 2018 11:27:12 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm2746196ite.37.2018.05.24.11.27.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 11:27:11 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 14:26:48 -0400
Message-Id: <20180524182659.19986-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Subject: [meta-oe][master-next][PATCH 00/11] reorder variable
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
X-List-Received-Date: Thu, 24 May 2018 18:27:12 -0000

When Andre McCurdy originally submitted the "rely on cmake.bbclass..."
patches, he intermixed some formatting changes as well. A clean version of the
"rely on cmake.bbclass..." patches have already been sent, this patchset adds
in the formatting changes as well.

NOTE: there are slightly more formatting changes in this patchset than in
Andre's original. These formatting changes are restricted to variable
ordering as per: https://www.openembedded.org/wiki/Styleguide

Trevor Woerner (11):
  poco: variable cleanup
  libssh: variable cleanup
  libftdi: variable cleanup
  gflags: variable cleanup
  ceres-solver: variable cleanup
  openjpeg: variable cleanup
  glm: variable cleanup
  msgpack-c: variable cleanup
  json-spirit: variable cleanup
  capnproto: variable cleanup
  openobex: variable cleanup

 .../obex/openobex_1.7.2.bb                    | 13 +++---
 .../capnproto/capnproto_0.6.1.bb              | 13 +++---
 .../json-spirit/json-spirit_4.08.bb           |  4 +-
 .../msgpack/msgpack-c_2.1.5.bb                |  7 ++-
 meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb  |  3 +-
 .../openjpeg/openjpeg_2.2.0.bb                |  5 +--
 .../ceres-solver/ceres-solver_1.14.bb         |  5 +--
 .../recipes-support/gflags/gflags_2.2.0.bb    |  3 +-
 .../recipes-support/libftdi/libftdi_1.4.bb    |  6 +--
 .../recipes-support/libssh/libssh_0.7.3.bb    | 16 +++----
 meta-oe/recipes-support/poco/poco_1.9.0.bb    | 44 +++++++++----------
 11 files changed, 54 insertions(+), 65 deletions(-)

-- 
2.17.0.582.gccdcbd54c


