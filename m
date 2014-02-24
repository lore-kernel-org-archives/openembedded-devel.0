Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4166E835
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 20:28:21 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id a41so5852041yho.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/5GAZBPa3p7OsPnJDxMx+tHBMUdCD/W4B1zPVeIb9ls=;
	b=zkEfkogNQplF3jZu+kKwzxDxZPDye1CwzTsntncbKxfK+rg8+p93hvoe0NtXCUmbLp
	U8c666LQVFGAQ9wLyuaN1k26hQ/hajRo4mJe91G88pyVc46AlDcpo/lEsk87n50bWBXE
	5CwPWoBDZOUmD4tarClir3i0nHYkmaokts2ngaOCSVg3vInuz9gbukcql3jO0Huzy61o
	HXtuG8mk9NcDiugL9wYdi5oh1ex3czZYuzwCpTrDdljp2QDjFe+BDwAkKXFpO8Mqu1Nd
	ye32RCpYlHOsBtMoApttiMVQobyyHofrwGm+INbkzbOzWdlvavv1JmRu5ulsc0ED9T0Z
	s+wg==
X-Received: by 10.236.108.202 with SMTP id q50mr1045883yhg.146.1393273702559; 
	Mon, 24 Feb 2014 12:28:22 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id f78sm945753yhp.12.2014.02.24.12.28.21
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 12:28:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2014 17:28:13 -0300
Message-Id: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 0/3] QtCreator integration improvements
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
X-List-Received-Date: Mon, 24 Feb 2014 20:28:24 -0000

Hello,

This patchset improves the QtCreator integration a lot. With it, it is possible
to deploy and run application directly in target, from QtCreator.

This has been tested in a i.MX6 based board.

Otavio Salvador (3):
  populate_sdk_qt5.bbclass: Fix symlink location for QtCreator use
  packagegroup-qt5-qtcreator-debug: Add package group
  populate_sdk_qt5.bbclass: Add support for qtcreator-debug

 classes/populate_sdk_qt5.bbclass                           |    4 +++-
 conf/layer.conf                                            |    2 ++
 .../packagegroups/packagegroup-qt5-qtcreator-debug.bb      |   12 ++++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/packagegroups/packagegroup-qt5-qtcreator-debug.bb

-- 
1.7.10.4


