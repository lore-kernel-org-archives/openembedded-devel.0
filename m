Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 64AA86EDAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 17:11:48 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id a41so2990547yho.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=U1IIAGHynkG/15nFVoX7MXpgH4oCqPBV+yXn5xTKo/E=;
	b=AO2icMDn1vYeIScJTi0QxRjVjXyfxVcw7JKSHEUdPMamoPlQCyEDpBfgSQyiEz6qG3
	5KBEQslm9wkwS6qh+cQ3Z+t/htyuuuvwSjQDttypOjJp2QUkuTrNtfbx4nac0Q3Upr8e
	5aXBKPrQGaJ5cXwQYfmd+/atdhoSMLRFERLUcdjRpI5HJWO0GlJPr6CvgymjPiRXsN9I
	0mk581nRvSZeziDIwISlm8w80mK4EXFJe9a+oXxYnVuFPAA6RiobebWzJuH3WoxbNwHQ
	aT2E3fZsklsc/mA1mIqe5W3hluj5A4QIKanI0E7xYQwNbXobJ6rc+zyZvydTUecT3CYH
	2HLQ==
X-Received: by 10.236.13.110 with SMTP id a74mr1016859yha.150.1393521109490;
	Thu, 27 Feb 2014 09:11:49 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id h66sm15484529yhb.7.2014.02.27.09.11.47
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 09:11:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 14:11:28 -0300
Message-Id: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 0/2] QtCreator integration improvements
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
X-List-Received-Date: Thu, 27 Feb 2014 17:11:50 -0000

Hello,

This patchset improves the QtCreator integration a lot. With it, it is
possible to deploy, run and debug applications directly in target,
from QtCreator.

This v2 patchset adds support for QML remote debug.

This has been tested in a i.MX6 based board using our qsiv application
and QtCreator 3.0.1.

Otavio Salvador (2):
  packagegroup-qt5-qtcreator-debug: Add package group
  populate_sdk_qt5.bbclass: Add support for qtcreator-debug

 classes/populate_sdk_qt5.bbclass                          |    2 ++
 conf/layer.conf                                           |    2 ++
 .../packagegroups/packagegroup-qt5-qtcreator-debug.bb     |   13 +++++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb

-- 
1.7.10.4


