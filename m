Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0542A6E99A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 17:57:07 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 142so11980541ykq.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=jqZ85t0lI4OKna8jBL6MWvLd8cVLVO+G8JcwvCeSUKY=;
	b=xmliTckxgf8h0Z61Nu+rEldFnVOvPir89wmFfHoaLyrBTo/FEigux2ACUevqbtt+f5
	H8T642nVvYqKVHItcpERe8ojZpqRQT9013A/WcPXWtwKD2QdPNM3DJJZfG3decR7Vqp1
	8BN5B/KOJiX6fN7qRtajj1bOvug2ModGH8vN2eXelLo7X+JO0OjjjHSNltrgTCFRgTEX
	8N/EYnkBSjmAp3SGtzFG1H3GpYT1Qu7ewo/pqTASBXTyZovw2GoMePU7wPxWv353UvRb
	3boZLSVHpTDp6mTQvnldPksWfRtKjHi8fcko1lNza0er7ocvViYAxQxk6D6Ew1c1gJk4
	tRRA==
X-Received: by 10.236.7.231 with SMTP id 67mr35746077yhp.30.1392141428237;
	Tue, 11 Feb 2014 09:57:08 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	b24sm61434799yhl.25.2014.02.11.09.57.00 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 11 Feb 2014 09:57:07 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Feb 2014 15:56:23 -0200
Message-Id: <1392141388-25288-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 0/5] Qt5 SDK integration
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
X-List-Received-Date: Tue, 11 Feb 2014 17:57:09 -0000

Hello,

This patchset integrates the current nativesdk recipes into the
OE-Core toolchain generation logic. It includes many contributions and
reworks suggested by Denys and the final patchset seems quite good.

For every image, using Qt5, to add support for the 'populate_sdk'
command to proper generate a working toolchain, just need to 'inherit
populate_sdk_qt5'; for convinience, Denys also sent a
meta-toolchain-qt5 recipe so it works as qt4.

Denys Dmytriyenko (1):
  meta-toolchain-qt5: add Qt5 SDK standalone meta recipe

Otavio Salvador (4):
  README: Reword the section about github forking
  nativesdk-packagegroup-qt5-toolchain-host: Add packagegroup
  packagegroup-qt5-toolchain-target: Add packagegroup
  populate_sdk_qt5.bbclass: Allow generation of toolchain

 README                                             |    9 +++-
 classes/populate_sdk_qt5.bbclass                   |   54 ++++++++++++++++++++
 recipes-qt/meta/meta-toolchain-qt5.bb              |    7 +++
 .../nativesdk-packagegroup-qt5-toolchain-host.bb   |   14 +++++
 .../packagegroup-qt5-toolchain-target.bb           |   40 +++++++++++++++
 5 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 classes/populate_sdk_qt5.bbclass
 create mode 100644 recipes-qt/meta/meta-toolchain-qt5.bb
 create mode 100644 recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb
 create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb

-- 
1.7.10.4


