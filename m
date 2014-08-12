Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD4570C27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 12:30:42 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id m15so9836148wgh.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=h3A16hWzFCtW3fhAk8xdiAYGFJAwBh5W8gNMvguGDb0=;
	b=XhikrjNOtqfj84qfEbQJoK/mfn+bDUJd6s828x9oywodPL1GnZZUD3R68ojB0LL0XQ
	FVfcfyid/wEyLT2sqeJOyGn6McUcleNEdYWzUSaS127gQrfj6pB3X7TeLJ5Wfkds2MaO
	MDfRO1tSmX9XkF1sAF4OZJvaU+GZHeEnrVojwQo0kHOfwTKyeRsupFH1UGWawTKvFQkH
	KT+2Jg30SPo8OkySBJn2LWdNkmCN3jtEpVBUqQ2blCiNiowV1kY09MNQlejUjXxkE0jw
	NSx/KAOKJDduo3NQkPByQJyqaY3EjjSTBBTg/E8k91AktiJz0aIGNE1htzQrUu6ga3Jm
	G+lw==
X-Received: by 10.194.19.165 with SMTP id g5mr4975822wje.65.1407846643625;
	Tue, 12 Aug 2014 05:30:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o2sm55716982wij.24.2014.08.12.05.30.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 05:30:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Aug 2014 14:31:16 +0200
Message-Id: <cover.1407846579.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [dora][PATCH] 0/2] Small build fixes for dora
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
X-List-Received-Date: Tue, 12 Aug 2014 12:30:47 -0000

The following changes since commit ee173678383683e972c7d4d6f0ef5790bfa50274:

  cloud9: Fix branch param (2014-04-20 15:41:44 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib 08c6c87275ce97d7dd05bb0d10723f614731847a
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/dora-backports

Martin Jansa (2):
  daq: explicitly disable nfq and ipq modules
  glmark2: Add virtual/libx11 dependency

 meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb | 2 +-
 meta-oe/recipes-connectivity/daq/daq_2.0.1.bb        | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.0.4


