Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 04B6A6BB17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 10:33:18 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id eo20so2171173lab.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xCbkyW7GfIEG9RrODZ3Kf43ri2YFtDdSg4COioquhTw=;
	b=Ez5XiP6crIS2gwSTF+/2SqD9ZIyjbof3fj/oikJq96dxnz2pX5JDkr3C9IkGUEKLhO
	dxtzBh+ajQJeofseD0+XYEyNG8PcrSiLGYmX/n63ZukK4PwIKSqQtdfGEUrkKZNLvGfn
	smMEQqp2gYs+n/04gOY30xnrmRen3sXzT5dee548zo1CczktSBf8nFY+ZoWHHlbUigTq
	RfvgWaMa6a8ORQiog9ZRudKuyXWWLyZxUqBV/OwW5TXqAakJJQHglM/jPM5YlMxOyE9D
	9CsjEK0g+dBeQzxGk6S0QHPkP4xr598s7pK2tWIjUCSkQ34zcye+r6GHiA03vdmdrZmd
	t6Lg==
X-Gm-Message-State: ALoCoQmHe6Xa7B43DLwYaoSlWToZtI/mp7amCX5PEm0s5GOLR8dr9znUEphGSWMAWAGYXRxRD/hi
X-Received: by 10.152.44.225 with SMTP id h1mr13445500lam.15.1377513199233;
	Mon, 26 Aug 2013 03:33:19 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id ap7sm5461308lac.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 03:33:18 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2013 13:33:12 +0300
Message-Id: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH 0/3] ACPICA updates
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
X-List-Received-Date: Mon, 26 Aug 2013 10:33:19 -0000

Fathi Boudra (3):
  acpica: fix parallel build
  acpica: fix recipe to be OE compliant with spacing
  acpica: bump to version 20130823

 meta-oe/recipes-extended/acpica/acpica_20130626.bb | 37 ----------
 meta-oe/recipes-extended/acpica/acpica_20130823.bb | 37 ++++++++++
 .../acpica/files/fix-parallel-build.patch          | 80 ++++++++++++++++++++++
 3 files changed, 117 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/acpica/acpica_20130626.bb
 create mode 100644 meta-oe/recipes-extended/acpica/acpica_20130823.bb
 create mode 100644 meta-oe/recipes-extended/acpica/files/fix-parallel-build.patch

-- 
1.8.1.2


