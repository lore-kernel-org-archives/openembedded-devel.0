Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f46.google.com (unknown [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 35F4C66046
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 09:47:50 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so4468111eei.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 02:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=vixbjI63d9OJLcUta/n5XaNC1knX5xpsFNwsPrRn0h0=;
	b=B3a77/cOi0Sb4DiC5jr7mvZxR5ajDAe8KPz4T8YqPtna8HJ/j6CU4qXJTGRH9MP8g3
	Prs18bijGnhrEVB8GoTTdkypu44TVE2+zw+NGMkvYphil8NqAEtbxt6ELtDdrKxRHPIM
	OFVbpk4a3ffLKM/Y/esR7q/kB/L0uRitCi55jFlT0OddiAR0q828sxxhx10QLMigzhgR
	uRVEsYRbrDb42mKzLngwJtJURqA2CNWDgcSo7avG+HNeDsbFozCETvEOBr0PKnqOSMlL
	c4PtleGXPBEpobEao1voa9UYJVU3a8m2NsXdGTBIjkjU9yXFe5ZlXLy0uAR273q8jvlE
	80wQ==
X-Received: by 10.14.251.4 with SMTP id a4mr31007956ees.20.1399887706538;
	Mon, 12 May 2014 02:41:46 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-161-153.unitymediagroup.de.
	[95.222.161.153]) by mx.google.com with ESMTPSA id
	x45sm31617322eeu.23.2014.05.12.02.41.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 02:41:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2014 11:41:35 +0200
Message-Id: <1399887698-19336-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [RFC][meta-qt5 0/3] qtwayland updates for hawaii
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
X-List-Received-Date: Mon, 12 May 2014 09:47:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I know building hawaii is some corner case but...

Update of qtwayland within 5.2.1 should be not a problem since qtwayland - as 
far as I know - has no official releases yet.

Andreas Müller (3):
  qtwayland: move to latest revision
  qtwayland-native: make qtwayland find qtwaylandscanner
  qtwayland: install created private headers

 recipes-qt/qt5/qtwayland-native_git.bb             |  5 ++
 ...0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch | 91 ----------------------
 recipes-qt/qt5/qtwayland_git.bb                    |  8 +-
 3 files changed, 11 insertions(+), 93 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtwayland/0001-xcomposite-glx-Fix-build-on-Qt-5.2.1.patch

-- 
1.8.3.1


