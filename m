Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id DA89165DEB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 10:04:32 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ex7so4010877wid.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=+Lx6w4fbaBx2AxSriG1cWrkL1UmLdOPX2i0EsdSckcU=;
	b=WS77dZw25wvKznYx/BGatNq27fvKw8RW/iyvuzQUJ4/dhP/uSYjWbEN1k/1VkfJNqm
	uqBI7IuQqOV6OUPXyk4+fiG8mz60bXhQapvZ40sUriWmRSSE/UMz//F1yz6rTZT2ACFN
	D5hk58ffvacxOaqyw6WD/MRkIOIRB4vW5z5hC8lTUUbMy9nAy9OMevgnz6KzPrudx5oc
	ImBjKaOaop6qG/OULpkjRpFITJ3gxVR1xEgFEHnJ272lG6tHhoOMm27cIOsABugWi2ur
	880FzLUUHKghq5KqXVzSBbAfj41fUGN0CvX/QPnMpoJ0fJGaGGq3i4xjLofErshToLUz
	Xm4g==
X-Received: by 10.180.100.106 with SMTP id ex10mr43262880wib.63.1414663472368; 
	Thu, 30 Oct 2014 03:04:32 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id l4sm4721448wjx.14.2014.10.30.03.04.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Oct 2014 03:04:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Oct 2014 11:04:21 +0100
Message-Id: <1414663463-31222-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [master][dizzy][PATCH 0/2] minor fixes
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
X-List-Received-Date: Thu, 30 Oct 2014 10:04:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A bit too late to get into dizzy directly...

Andreas Müller (2):
  xfce4-weather-plugin: make work properly after met.no API change
  gvfs: replace deprecated g_memmove by memmove

 ...daemonfile.c-replace-g_memmove-by-memmove.patch |  36 +++++
 meta-gnome/recipes-gnome/gvfs/gvfs.inc             |   1 +
 ...-ready-for-met.no-locationforecast-1.2-AP.patch | 162 +++++++++++++++++++++
 ...et.no-locationforecastLTS-1.2-API-bug-109.patch |  27 ++++
 .../weather/xfce4-weather-plugin_0.8.3.bb          |   4 +
 5 files changed, 230 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gvfs/files/0005-client-gdaemonfile.c-replace-g_memmove-by-memmove.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch

-- 
1.8.3.1


