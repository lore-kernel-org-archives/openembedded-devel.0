Return-Path: <paul.betafive@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 20C8561AD1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 22:39:58 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id k10so2838394eaj.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=kJxJgZz7LENUiQaM+roQoax8dlD971tCfcEkS4GEqZY=;
	b=PCvI2HQnT9VY8lU2w/H2cOhm9pOfU/CQpObjQAe2u38mMbc9OrlHSmIdbyGREVw4yu
	xqIQ7w96isROp0QfUe/WFWFMAlOcdjcJ5Ew3BKLzNalbX/jTyh6qiM3RBk0s/LeplMoA
	SP0425A9gGH0aP187XVEXlFhulCI8j8YxdVSekAPz7NFTo0BB6nKHcyFZpRu2tA7moR0
	sEdboLX1gRrWqZ4Iux1v9k+ZS0dQkpr1CNIOyCtyXUx4TnnxS1Oug7pGaHdV9QsRetyx
	QbGoxpMt5C0p7YYmVXjgro8Ygil5lBRi3CjteCze3AHFCUMSnxb4gfZOb93AKYaEOcvn
	/bIA==
X-Received: by 10.15.49.9 with SMTP id i9mr24485465eew.69.1371595199264;
	Tue, 18 Jun 2013 15:39:59 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id i2sm4434453eeu.4.2013.06.18.15.39.57
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 15:39:58 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2013 23:39:32 +0100
Message-Id: <1371595174-14731-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCH 0/2] lzip, openmotif: fetch fixes
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
X-List-Received-Date: Tue, 18 Jun 2013 22:40:00 -0000

Both of these fail at do_fetch because the relevant archives have been removed
from the upstream sources. I've fixed them in different ways but I think I'm
doing the right thing, as explained in each commit message.

I've build tested both of these and both the newly fetched archives have the
correct md5 and sha1 sums.

Paul Barker (2):
  lzip: add mirror for older versions
  openmotif: update SRC_URI

 meta-oe/recipes-support/lzip/lzip_1.13.bb            | 4 ++++
 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
1.8.3.1


