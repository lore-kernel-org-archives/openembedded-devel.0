Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id EC5EE6AD15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2013 18:30:07 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id p61so1513639wes.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2013 10:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=8OXBGbgyDJwh9Uz46RkFMg4S7vCMoWtmGBZLWTCE3es=;
	b=g6hpxL25iOiEfYDOlcFuWwOUjjKrTRexG3k7CC4/SKfjJUO37gsl+0381FEpXyn9DN
	cEWORSpmkL7hLMn1F+7Wk6Lj/6Q1i+sxUFJCimOjpdgHJ0s9jbrwl4Ab99b4e3S7kgbb
	QGYzZPS9tkKICc4nGw9RHh/AKt0oPXRfRai3Sxk7BuOhQ+MrhbD8F+x3+ktUJxLOV1Nt
	PirB2+CKYmUdbC9kNMi0RwyxMkyjJQiV/vhHQJO0C87sBIeL/QC2dpRFgAvMlSzvq+OI
	ifLbPX2eeSO6uVMtLms2JBepWkRRtDVG0VTmIWaHvIi8ne4/iqw2DSaqlM+w2JRqsbqj
	SaZA==
X-Received: by 10.194.6.161 with SMTP id c1mr329325wja.89.1387477808600;
	Thu, 19 Dec 2013 10:30:08 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id 1sm11606551eeg.4.2013.12.19.10.30.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Dec 2013 10:30:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2013 19:29:56 +0100
Message-Id: <1387477797-28104-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-qt / branch jansa/qt5-5.2.0][PATCH 0/1] qtbase: fix paths in packageconfig *.pc files
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
X-List-Received-Date: Thu, 19 Dec 2013 18:30:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Note: Dependency tracking for packageconfig seems broken in oe-core (see
package.bbclass and try to find a *.pcdeps in workdir) so currently this patch
does not cause any effect.

Andreas Müller (1):
  qtbase: fix paths in packageconfig *.pc files

 .../0020-fix-paths-in-packageconfig-files.patch    | 42 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase-git/0020-fix-paths-in-packageconfig-files.patch

-- 
1.8.3.1


