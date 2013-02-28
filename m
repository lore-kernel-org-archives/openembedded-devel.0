Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UB2aT-0004Wc-Jp
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2013 13:28:06 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so7579896wib.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2013 04:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=7UR5OYTVsVMKeVd9zwxZBmhTR9AI1ahN+3JteeRIfWE=;
	b=gogd6lNxzCa80YgSHCJ3GXzHn+/M2E+Mo8kj+608CXpCKwQkO2pjU9YAx6ImG4VmTg
	RghxyCV3V1evmo7gy/T3+YQI+hrXIc+JR+aRbqz+70zr/4VGAh3BOgaDxx89ab5BpGT4
	8Asaru+BipQI/bSQg13SBibC630ox//hFnfgujXbgTFhQ4iWSruUIgwxcT9/Zxg63TpY
	se/0mE1IzpUcaMPQz0f9NHOyFq/WhbHm1QNurL9iVGPq9/JtWEdyygWK4rGCKxPMTJWf
	QPlgmCibMyUs0Bb3B6y9Tdo+JsHnmRzA6guDL4CBaacVNW0g3gAf1325d4AgkLsfTLnC
	ScFQ==
X-Received: by 10.194.92.65 with SMTP id ck1mr10372300wjb.54.1362053487355;
	Thu, 28 Feb 2013 04:11:27 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo1sm32969583wib.8.2013.02.28.04.11.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 04:11:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Feb 2013 12:08:59 +0000
Message-Id: <cover.1362053187.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnInPFzx6R/fXVZJUe8MbgFPYo9tXiG6mcA+kir935SdwFYeH9WkJXU8YO2QhQWq+j/N8Gz
Subject: [PATCH 0/3] Additions from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 12:28:15 -0000

Hi,

Recently libgdata, clutter-box2d and gthumb were removed from oe-core.  These
are all still useful, so this series adds them to meta-oe.

gthumb and libgdata are in meta-gnome, clutter-box2d is in meta-oe.

Ross

The following changes since commit 84ea5433739ddc2551216902f6053d5c2368e755:

  macchanger: added 1.5.0 recipe (2013-02-25 09:59:56 -0500)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib ross/from-core

for you to fetch changes up to ff4c100c5e51ac6227325ea1ea319c902bf554bf:

  libgdata: add, from oe-core (2013-02-28 11:56:21 +0000)

----------------------------------------------------------------
Ross Burton (3):
      gthumb: add, taken from oe-core
      clutter-box2d: add, from oe-core
      libgdata: add, from oe-core

 .../recipes-gnome/gthumb/files/parallel.patch      |  158 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |   27 ++++
 .../recipes-gnome/libgdata/libgdata_0.7.1.bb       |   15 ++
 meta-oe/recipes-graphics/clutter/clutter-box2d.inc |   15 ++
 .../recipes-graphics/clutter/clutter-box2d_git.bb  |   14 ++
 5 files changed, 229 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gthumb/files/parallel.patch
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
 create mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
 create mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d.inc
 create mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb

Ross Burton (3):
  gthumb: add, taken from oe-core
  clutter-box2d: add, from oe-core
  libgdata: add, from oe-core

 .../recipes-gnome/gthumb/files/parallel.patch      |  158 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |   27 ++++
 .../recipes-gnome/libgdata/libgdata_0.7.1.bb       |   15 ++
 meta-oe/recipes-graphics/clutter/clutter-box2d.inc |   15 ++
 .../recipes-graphics/clutter/clutter-box2d_git.bb  |   14 ++
 5 files changed, 229 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gthumb/files/parallel.patch
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
 create mode 100644 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
 create mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d.inc
 create mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb

-- 
1.7.10.4



