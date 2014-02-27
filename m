Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 35E7760017
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 22:20:43 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id u56so3474661wes.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ANCMcj7Gblkb8QcW9FfkwbTrxclt4kUpuCgvS0y4AUI=;
	b=c3ZsHr7blSsfl33dlrNrIAEDlXyFI2s96YriIo/9IHV34ptjoLS155UZQIrz4+OSMX
	DRZAJzWMR5W2auIfzTGd3wvLUoM5T2x4pLJ1uSMzaLLtdwBDLnow06Y1Ne0OfsmT0iZ1
	zs6ju22uhuWEkZcB19zOg64hWA9ren2CFHQjC9fbAvXv0vOz6K2hlwCy8PvYftX/THqX
	EtdUgrCzu6VQxGUaRWmOR7CPGWE4lKp2KZHkQ2UizhXqv1W/ToqNjkYfZ2GHVJcxjBKm
	wzf9Te4Q835+5GChR0jMwb2G2iHY+V7OG6Waa9U4DpAbYss8oeY/znFaHGI3dNrUoFe/
	3vRw==
X-Gm-Message-State: ALoCoQnvgDlkIytvaIpM+QZOt9TtjBJqSiqkldz/IXJrGgIKsbGKDmlf26b5PP+jNFFtjPBu9AKz
X-Received: by 10.180.19.35 with SMTP id b3mr373275wie.20.1393539644284;
	Thu, 27 Feb 2014 14:20:44 -0800 (PST)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id ju6sm14526019wjc.1.2014.02.27.14.20.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Feb 2014 14:20:43 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 23:20:35 +0100
Message-Id: <1393539638-18126-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-qt5][PATCH dora v2 0/3] A couple of backport for dora
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
X-List-Received-Date: Thu, 27 Feb 2014 22:20:44 -0000

Hi Martin,

the following commits were recently merged in master branch. I have
rebased/backported on dora and tested on ARM board. Only 1 minor had
to be resolved. Can you please merge them in dora branch?

Changes in v2:

 - cleanup commit message in 0003, as per Martin request.

thanks

nico

Andre McCurdy (3):
  qtbase.inc: don't force ARM_INSTRUCTION_SET to arm
  qtbase: configure with -openssl-linked instead of -openssl
  qtwebkit-examples: add RDEPENDS for ca-certificates

 recipes-qt/qt5/qt5.inc               |  2 ++
 recipes-qt/qt5/qtbase.inc            | 10 +++++-----
 recipes-qt/qt5/qtwebkit-examples.inc |  1 +
 3 files changed, 8 insertions(+), 5 deletions(-)

-- 
1.9.0


