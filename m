Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB4570101
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 16:27:28 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id e127so15344895pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 08:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=lOuGs0/lt8EJsLOxmiGNbs0E16Z/eGGC0QZOkn26Q+E=;
	b=MkHnI+f0YMFqTx7lBuzuFeSMo0r6vV2TW+COOqBSUVDY+aXji7t/v/n07GeiupX9c8
	Bpj2bwpXfEbgQdTaSnfsljkRvjOarRx4OJh5TETf5KbosOoSXyNUIDRCh95wbPOm2Xdi
	lx3bPgX6z/m+phee9MkjTKhN6/D3xlECIZ+dJVcGdVUayj6YvNuimBW4Gut4TxgFraee
	YKZhKAQXE7hKwukyiGsm8fcmwZ05nJj+XKD8BgT9xZRBfHWp7VH33AJi2aEIdzbqoq2j
	fcVyzL1wHutyFZ0cxrxFo6q75G0lrdZOMt8P/NzChnXHdVDj3wySXAJwq6lHaWFE56zv
	c7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lOuGs0/lt8EJsLOxmiGNbs0E16Z/eGGC0QZOkn26Q+E=;
	b=VhfROpCvzeIuNKSzcN7RjrLUTUUpueNsePo99KSlbzRLtpOL8bZEhKBg+AgfQZ1u+z
	emWT9JqXXk28f2jNwcj0Z794sHrI0U6UdtigZ8zUNIZJ3ekLUsQh5uMYkBD2CxXEMmbP
	tehj+1HEgT+sI7XNQs3m5iume2VxN7AvIlHeco1GWbuNQaoR0XHKbJLT731XPoi2zPaJ
	TnqiHYcyTSb8lBSNidmT5c9tcMfp8ibACyGZecXzDF9s8uJjvebVrO1z3BMV69n4FaDQ
	mm6yuKd4aY2OBzCGX+3ZMwDYotX9tt3VjzbAdS/hJ6ejI74Usu1byAtmCEcAzTEiKWFx
	MWgg==
X-Gm-Message-State: AG10YORjAXdssooUKycXofsdywasGTLBAFVUHITo1wlpkC3/llp96S2/66hG5JLr10VNoA==
X-Received: by 10.98.67.92 with SMTP id q89mr56127176pfa.137.1456331249466;
	Wed, 24 Feb 2016 08:27:29 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ac1sm6145808pad.41.2016.02.24.08.27.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 08:27:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 24 Feb 2016 08:27:20 -0800
Message-Id: <cover.1456331094.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [jethro][PATCH 0/3] Security pull request
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
X-List-Received-Date: Wed, 24 Feb 2016 16:27:29 -0000

please consider these changes for jetho-next

The following changes since commit dc5634968b270dde250690609f0015f881db81f2:

  php: Security fix CVE-2016-1903 (2016-02-10 15:08:20 +0100)

are available in the git repository at:

  git://github.com/akuster/meta-openembedded akuster/jethro-next
  https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next

Armin Kuster (2):
  xdelta3: Security fix CVE-2014-9765
  ntp: update 4.2.8p6

Liu Jian (1):
  phpmyadmin: CVE-2015-8669

 .../ntp/{ntp_4.2.8p4.bb => ntp_4.2.8p6.bb}         |   6 +-
 .../xdelta/files/CVE-2014-9765.patch               | 311 +++++++++++++++++++++
 meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb    |   1 +
 .../phpmyadmin/phpmyadmin-CVE-2015-8669.patch      |  18 ++
 .../recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb   |   4 +-
 5 files changed, 336 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p4.bb => ntp_4.2.8p6.bb} (96%)
 create mode 100644 meta-oe/recipes-support/xdelta/files/CVE-2014-9765.patch
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2015-8669.patch

-- 
2.3.5


