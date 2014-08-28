Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa12-08.prod.phx3.secureserver.net
	(p3plsmtpa12-08.prod.phx3.secureserver.net [68.178.252.237])
	by mail.openembedded.org (Postfix) with ESMTP id 9798B7117F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:13:42 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa12-08.prod.phx3.secureserver.net with 
	id kC6Q1o0081mTNtu01C6QDb; Thu, 28 Aug 2014 05:06:28 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Aug 2014 07:06:16 -0500
Message-Id: <1409227581-20888-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Subject: [meta-oe][PATCH 0/5] ntpd and gpsd updates for high-precision timing
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
X-List-Received-Date: Thu, 28 Aug 2014 12:13:43 -0000

The first patch restores server debugging capability to NTP, a feature
that is necessary when diagnosing configuration issues.

The remaining patches make it possible to use the pulse-per-second
capability of GPS and Linux RFC 2783 kernel PPS support to synchronize
clocks to microsecond accuracy, either using gpsd as a mediator or
using ntp directly.

Peter A. Bigot (5):
  ntp: re-enable server debugging and control by PACKAGECONFIG
  gpsd: update to 3.10
  pps-tools: add recipe
  gpsd: add optional support for KPPS interface
  ntp: add optional support for KPPS interface

 .../ntp/files/ntp-disable-debugging.patch          | 23 ------------
 meta-networking/recipes-support/ntp/ntp.inc        |  6 ++-
 ...truct-respect-sysroot-also-in-SPLINTOPTS.patch} | 19 ++++++----
 .../0002-SConstruct-remove-rpath.patch}            | 19 ++++++----
 ...refix-includepy-with-sysroot-and-drop-sy.patch} | 27 ++++++++------
 ...isable-html-and-man-docs-building-becaus.patch} | 43 ++++++++++++----------
 .../gpsd/{gpsd_3.7.bb => gpsd_3.10.bb}             | 17 +++++----
 meta-oe/recipes-support/pps-tools/pps-tools_git.bb | 16 ++++++++
 8 files changed, 89 insertions(+), 81 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntp/files/ntp-disable-debugging.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.7/0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch => gpsd-3.10/0001-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch} (61%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.7/0004-SConstruct-remove-rpath.patch => gpsd-3.10/0002-SConstruct-remove-rpath.patch} (75%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.7/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch => gpsd-3.10/0003-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch} (82%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-3.7/0001-SConstruct-disable-html-and-man-docs-building-becaus.patch => gpsd-3.10/0004-SConstruct-disable-html-and-man-docs-building-becaus.patch} (62%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.7.bb => gpsd_3.10.bb} (91%)
 create mode 100644 meta-oe/recipes-support/pps-tools/pps-tools_git.bb

-- 
1.8.5.5


