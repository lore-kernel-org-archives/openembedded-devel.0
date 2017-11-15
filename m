Return-Path: <mkelly@xevo.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0082.outbound.protection.outlook.com [104.47.42.82])
	by mail.openembedded.org (Postfix) with ESMTP id 0F137786A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/5aoh4hLwHePPzIgBQmUj2mo8goUGoMoBw4lwvpN9A0=;
	b=pFYJcLlGx14V2j8ceXgty04EApoPuXuj24lvg/42NNGuHG/uezdzcxGWP9LGMCv5MDyB0XURfkhVO0F52tkQY37CBHGQDmy3uVNN4qp74F81h+3iBEmwOWNrfUYN9T87SBKpleUu3JW6uVpMKXIVVShTnQ9jPLnVo7duoO5AsW8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from willamette.Home (71.35.172.156) by
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.239.5; Wed, 15 Nov 2017 20:38:25 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Nov 2017 12:38:05 -0800
Message-Id: <20171115203806.25651-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: MWHPR20CA0003.namprd20.prod.outlook.com (10.171.151.141) To
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0780bc35-2bf9-43ca-3379-08d52c68d222
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:DM5PR0101MB2940; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	3:kisSJtvrwO9svy60fgp9BVn7ExBWBt/Jxd4fTkciJsfow8ghTpP5kt/0f8XRNfarPQSCDWGOwwrwqyC9siaankysGJ2/v/AY/li4Wrdwawh+nqUp7nj3dDSW5ogg/lSnmU8K01S+mt4+0tOp1h/m8EWzfEMLR61KA9mEa+UUmpfb4rdrwb5ydPll4dxQsJDZBOstCowBV8rd7TLSj94JzJSbXwno0I7VlfE0JfhSUh4yxA/eDXoj9lpUl6P7sSRv;
	25:PPE8RXq016+Fq7dRk7p0Ru52NMlXkXpFMMXwBDopKcvcn302rJIJKVSCLEA+JmBGa6XaMZ8+KsvNll76MbHAw+d6YF/sxUkGaKSIxTf652OlWc6I/FJaWqFRIAVonbMh0JFYRm/aqgGiQhqf9OAOAqMpnCsh0FxzwKUejgnI1EY1lE0OogU6m5JM09egIwa8JJkcxMTsc+fY04BrEeB5Rf9cb/Ppi+izm2TK0jLkpcnf37ysk0XAQQYhxbEey3L/oH2713YDUTQKDTwVy5OsVFuQz4hziIdsIm8uRhZkP8ux4yEIuz+qvJy1M4+MOE0NPftzyA9vyORjanfMfeEeXQ==;
	31:V8mGdIo+Ike9vCk3ifm40apsWCBTtREPE3CqzNDbavVoBw3nKnjKa/Hnw0WanJG3U1Gh4VqzGP9yeDJx93OwmxsTvOW2VTDjvBATACJtz/ut+3ur5+FTobvLVxf/Yh50sC5t/jhrszYSOXqEAHb72dzbPHjxZnASUqR9IpOpvCFbTQ/uUfa5LGJW5XKF2mmmcd/n8rTnb5GRPnM879VsRrjc4VIMbH1ILd2+gnyKde4=
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2940:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	20:dA1BqAR8j0chaCC+dcVkex0/31vAfm6qo5vq4PzlH2wf0txX7uaXpQ+95QyNPuhw+SLHfICPeNYJ1dxo4cErJOC8ZRmBlutBj1HwVTsBs2UYXsD0Etv4dPtnDWVOi3kCuXoURk3U4Q70iGUBgDrDr6JVsyj0zWG+EmmHcO8WsPPW8sNgV75otJgbzWQuXLmd8fBGM/w2Su3rjNhaIkN9/AddzxWqF1WGc+700419RMMJ6EFmBQGDn4huCLKOUfvF6lxODX8zieY4xK3wPdR5TyYeNU2Ar0ohaIVMqX3NTlgQIQv5BtK7p1QJJEVzzJKOoxsfS3d1uBVEoFBdkBtVT432tzlho3cUPPIbKrEfWv2oHxcZNa0Rzk+HFbsA2M3A4B2PtPUO9QYBNizCNytck4OSqleqXZFsSLHC4xfF5MU=;
	4:JlpboruCYpIWipnq/I2AKL0V3TcOns4jn9qVOiV5xrnSfsX7mDQSSwU+wtFyxVbatC96S7lxOWT5YcNpa86PFq8FrAUDWs967pL+fljYnIar+y070/G1PGbEKKfCpy8Xjd8eUeL66BhNMeNB2C8dqVZH0moEAihQP0VKft1i+Az+pL2Fkcst/BxznZI/KOrLCPy5Q57kR3dBvgQBlZ5yG9WL8KU2coYL++CWDIt4uKfReM/eRIPSE+ynN3ZkEVkTSyzg8pQuShiHiOKoxQEFp0QyboUyNgVUxrcAZlIgdSbuU9INTN4EsUb1aaZ3z3xZ
X-Microsoft-Antispam-PRVS: <DM5PR0101MB29401A80218671A0E20E31CBAB290@DM5PR0101MB2940.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(3231022)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123555025)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2940; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2940; 
X-Forefront-PRVS: 0492FD61DD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(376002)(39830400002)(189002)(199003)(50944005)(2351001)(6486002)(6116002)(305945005)(6506006)(7736002)(3846002)(50466002)(25786009)(33646002)(47776003)(2906002)(189998001)(8936002)(4326008)(106356001)(97736004)(66066001)(48376002)(105586002)(2361001)(50226002)(5660300001)(8676002)(6512007)(81166006)(86362001)(575784001)(81156014)(478600001)(54906003)(69596002)(101416001)(21086003)(39060400002)(36756003)(45080400002)(6666003)(6916009)(107886003)(68736007)(1076002)(53936002)(316002)(50986999)(16526018)(5003940100001)(16586007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2940;
	H:willamette.Home; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0101MB2940;
	23:2k5c3zWbYMv55roitzLlAmLu25wRcmjWZDM4Jtv?=
	=?us-ascii?Q?AiflsLWY5OjY4CYXU87O9/P/fElvt2Lv3DKTE56Iym8/MOKWLOID3XkfYFA3?=
	=?us-ascii?Q?JrEH6NivEVSYHWxv/nMme6ASvbdAupnXlVoGwGb4DD5/3A7XZ2Tf7KQVpRiI?=
	=?us-ascii?Q?sTVFbUktx0WUIK5HvY16rDaS+JgPlNFcCdQAp/1CGRCxMCk4qdZBSNTw49oL?=
	=?us-ascii?Q?ld6zpnz6s+Wdp2X7mUNEJ75dQWWSGzGQuLwoSTuHsWGMUWm8EMDhJGZ6hsl4?=
	=?us-ascii?Q?17S8vfajkcdWxVRk6Lmbs3gFYTW4/ZxozcHyUzfJLnbi4cinQEuGJqiEy/HX?=
	=?us-ascii?Q?kMwnMTEOxQIuJ/2dxGkY+HqkgUTBk0o4w/g0mMEqURfjljXjgdjj8iO1zi7N?=
	=?us-ascii?Q?3ZIKtPaVUGQ3W+xc/jY5MO4H9T/oxpkMFndSpcZwVEZ27/IsZdC/53U+3JJC?=
	=?us-ascii?Q?1gCYHT4SZgmUnytX2ndNvtbVqA2tBaxM+yGowWv0d8qOXF/cp66uLn+igGlb?=
	=?us-ascii?Q?pL0DPvr6JjC8oixQQrTfWGx3pDPj+px8O+qjIi+lPqsE29xv2WX829ZBKaly?=
	=?us-ascii?Q?ESJvYypUA+b2OLsTrTZSlJq1EgIxePJfXi9KG5j6N2r6hDdB9V/NkKHlwDWU?=
	=?us-ascii?Q?TNemfwd/jXUgY0EpZXYXq97igeDw+7SXfRxvOfMyvRjW1IBKy9tQbTQSCXyL?=
	=?us-ascii?Q?H7dG9EFMkDRKcIF9avXN18l8lpKnxXfWbQqUmc6Rw1rIxRfGFM3ih2Dkpnqz?=
	=?us-ascii?Q?67PHYoYQi0ZpvhyEZaLsJnEvXyDyvRR33Qr/weeyJbOlW48hlfl4Owyz3j+M?=
	=?us-ascii?Q?QA1dtTAWoYiIGDpkNYX3xO5dJ21db3JBzkloYiSKpUa4x7uaLdi7O5kyp1ii?=
	=?us-ascii?Q?lKGQHeIh2I4k6NEdo78G1uJ1wDdtD0kNyE6izopCvzUk4zzzhRpdupTm9XyB?=
	=?us-ascii?Q?ayJAw/G2HLVF+uIcyLQgbmVSA+Lc3AxkgQvzYa1XgbTCenLhhl5YXlISWBNB?=
	=?us-ascii?Q?YqFdRSwOwMKM+ivNUgeFVAFtXZdhDIP719PcSqfvIGxEcMo7qKXt8+E5+ytM?=
	=?us-ascii?Q?CETk2fRpuUjFzS6zLZV7UYyIeEd3YuZf3S3JuJ2V4J/fyMyzwGNcV0runUjb?=
	=?us-ascii?Q?LNiqfrNkIDyF8F6advFme0SxnNSaBVx/qxCxSIuQrCZ/p08EL0hLsS+8uk0U?=
	=?us-ascii?Q?lBqe8T1J/5f8pkv+0bS1wrjo79UZbBkGkx+HbmvJ6572Ki61nsM/6S7e79eC?=
	=?us-ascii?Q?BZTnF9PyH8vA3vxbUjHXesfzxuurEXItOPJ2+m9xLMW8aciweLAGhU5rOilj?=
	=?us-ascii?Q?Diw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	6:0jem0K1mXpZoUJbKSPwcXjSfR+srH+HJz7gYYPCrjC5YrUdNV757BbvAkFd8r1iC+U+v40P6Vq7y09KDig/jiwX0PFWcXccc6TaIAwRJBS6xSz+rlfHmuQfSjlQ+KyCnMpE9U+j8dubsFlC2puCAhBeHTzl5ZlXN2sdxel8oPF9XQ29eimNQv/JKpwyThUh83DNtXkhagjypPiGo/cDWF8igdre4QdP79HKhjamdVnuqvMA3FMVtZYt08emoj0X5kjJaztkOOqvFCffi93z1dLfrnoxAoz0FgPX+cW5JF6LtIvE2BkuGhJOJ8PylUWTa18kMQeGAC5aXjDIymzwG9qTt/bWYX994xSpGNcU3HhA=;
	5:UH0WzMwwrXt+yjo8b/3lrlmMxQeAI+JaYP82M8s9f3r73kodW/zEyKNwuWO7pWMsZA6wS2u8XwUCmFwqx6AIw38TJED9cUXS4QYUowuWdkP3xl4JFSTspRuKkyV1EiJfQbj6oDH9TKCfwUDB0C+7/tKANnGGOEc/alxm48PQct0=;
	24:SS8lJ6IrOS9cxXdvRPMry6cWtNYvQydXGQ4rml6DF2RqESTshl25IviFt+hu9/5k7NbzAX5kT2sr5jbLH3tLkKuVRThSNX5AMVdIesBp9n8=;
	7:e1YLLSQ3GnajoMO0rof5h3NjzCSX5iP1QuWSGwdcrQjCqjapuV3OX0+WwVEv9chXX1cOmOYcHPxwPhNhFLEVgUK/JJ4ppF9DZQOehSKNBYfhY1jyA+tt9XqNOS2x66hrPbTOfcQh0yebg7gLfXZWmVnI+qAYx+UQrfVtVNlP05yeFAaz7D8AjzzaA9grTWLjPr8P5PWqXVfnQsTyoPgzVQpqEC9dfuLrBE6puftS2DVDGYyyGOqRRXtzeIif2/S9
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2017 20:38:25.4283 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0780bc35-2bf9-43ca-3379-08d52c68d222
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2940
Subject: [meta-oe][PATCH 1/2] gpsd: use upstream config instead of our own
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
X-List-Received-Date: Wed, 15 Nov 2017 20:53:31 -0000
Content-Type: text/plain

We have our own versions of the udev, hotplug, and systemd scripts,
but at this point they are several years old and were added to fix bugs
at the time. As far as I can tell, the relevant bugs are now fixed
upstream, so we can move back to the upstream versions.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules |  47 -------
 meta-oe/recipes-navigation/gpsd/gpsd/gpsd          | 136 ---------------------
 meta-oe/recipes-navigation/gpsd/gpsd/gpsd-default  |   5 -
 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service  |  10 --
 meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb       |  12 +-
 5 files changed, 4 insertions(+), 206 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules
 delete mode 100755 meta-oe/recipes-navigation/gpsd/gpsd/gpsd
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/gpsd-default
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules b/meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules
deleted file mode 100644
index 61143b8f6..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/60-gpsd.rules
+++ /dev/null
@@ -1,47 +0,0 @@
-# udev rules for gpsd
-# $Id$
-#
-# GPSes don't have their own USB device class.  They're serial-over-USB
-# devices, so what you see is actually the ID of the serial-over-USB chip.
-# Fortunately, just two of these account for over 80% of consumer-grade
-# GPS sensors.  The gpsd.hotplug.wrapper script will tell a running gpsd
-# that it should look at the device that just went active, because it
-# might be a GPS.
-#
-# The following setup works on Debian - something similar will apply on 
-# other distributions:
-# 
-#   /etc/udev/gpsd.rules
-#   /etc/udev/rules.d/025_gpsd.rules -> ../gpsd.rules
-#   /lib/udev/gpsd.hotplug.wrapper
-#   /lib/udev/gpsd.hotplug
-# 
-# Setting the link in /etc/udev/rules.d activates the rule and determines
-# when to run it on boot (similar to init.d processing).
-
-SUBSYSTEM!="tty", GOTO="gpsd_rules_end"
-
-# Prolific Technology, Inc. PL2303 Serial Port
-ATTR{idVendor}=="067b", ATTR{idProduct}=="2303", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-# ATEN International Co., Ltd UC-232A Serial Port [pl2303]
-ATTR{idVendor}=="0557", ATTR{idProduct}=="2008", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-# FTDI 8U232AM
-ATTR{idVendor}=="0403", ATTR{idProduct}=="6001", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-# Cypress M8/CY7C64013 (DeLorme uses these)
-ATTR{idVendor}=="1163", ATTR{idProduct}=="0100", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-# PS-360 OEM (Microsoft GPS sold with Street and Trips 2005)
-ATTR{idVendor}=="067b", ATTR{idProduct}=="aaa0", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-# Garmin International GPSmap, various models (tested with Garmin GPS 18 USB)
-ATTR{idVendor}=="091e", ATTR{idProduct}=="0003", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-# Cygnal Integrated Products, Inc. CP210x Composite Device (Used by Holux m241)
-ATTR{idVendor}=="10c4", ATTR{idProduct}=="ea60", SYMLINK+="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-# u-blox AG, u-blox 5 (tested with Navilock NL-402U)
-ATTR{idVendor}=="1546", ATTR{idProduct}=="01a5", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-# FTDI FT232
-ATTR{idVendor}=="0403", ATTR{idProduct}=="6001", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-# u-blox 4
-ATTR{idVendor}=="1546", ATTR{idProduct}=="01a4", SYMLINK="gps%n", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-
-ACTION=="remove", RUN+="/lib/udev/gpsd.hotplug.wrapper"
-
-LABEL="gpsd_rules_end"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd
deleted file mode 100755
index ba73dafb2..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd
+++ /dev/null
@@ -1,136 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:          gpsd
-# Required-Start:    $remote_fs $network
-# Should-Start:      bluetooth dbus udev
-# Required-Stop:     $remote_fs $network
-# Default-Start:     2 3 4 5
-# Default-Stop:      0 1 6
-# Short-Description: GPS (Global Positioning System) daemon start/stop script
-# Description:       Start/Stop script for the gpsd service daemon,
-#                    which is able to monitor one or more GPS devices
-#                    connected to a host computer, making all data on
-#                    the location and movements of the sensors available
-#                    to be queried on TCP port 2947.
-### END INIT INFO
-
-# Author: Bernd Zeimetz <bzed@debian.org>
-#
-# Please remove the "Author" lines above and replace them
-# with your own name if you copy and modify this script.
-
-# Do NOT "set -e"
-
-# PATH should only include /usr/* if it runs after the mountnfs.sh script
-PATH=/sbin:/usr/sbin:/bin:/usr/bin
-DESC="GPS (Global Positioning System) daemon"
-NAME=gpsd
-DAEMON=/usr/sbin/$NAME
-PIDFILE=/var/run/$NAME.pid
-SCRIPTNAME=/etc/init.d/$NAME
-
-# Exit if the package is not installed
-[ -x "$DAEMON" ] || exit 0
-
-# Read configuration, if present
-[ -r /etc/default/$NAME ] && . /etc/default/$NAME
-
-if [ -z "$GPSD_SOCKET" ] && [ -z "$DEVICES" ]; then
-	GPSD_SOCKET=/var/run/gpsd.sock
-fi
-
-if [ -n "$GPSD_SOCKET" ]; then
-        GPSD_OPTIONS="$GPSD_OPTIONS -F $GPSD_SOCKET"
-fi
-
-#
-# Function that starts the daemon/service
-#
-do_start()
-{
-	# Return
-	#   0 if daemon has been started
-	#   1 if daemon was already running
-	#   2 if daemon could not be started
-	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON --test \
-        -- $GPSD_OPTIONS -P $PIDFILE $GPS_DEVICES > /dev/null \
-		|| return 1
-	start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- \
-		$GPSD_OPTIONS -P $PIDFILE $GPS_DEVICES \
-		|| return 2
-}
-
-#
-# Function that stops the daemon/service
-#
-do_stop()
-{
-	# Return
-	#   0 if daemon has been stopped
-	#   1 if daemon was already stopped
-	#   2 if daemon could not be stopped
-	#   other if a failure occurred
-	start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $PIDFILE --name $NAME
-	RETVAL="$?"
-	[ "$RETVAL" = 2 ] && return 2
-	# Many daemons don't delete their pidfiles when they exit.
-	rm -f $PIDFILE
-	return "$RETVAL"
-}
-
-#
-# Function that sends a SIGHUP to the daemon/service
-#
-do_reload() {
-	#
-	# If the daemon can reload its configuration without
-	# restarting (for example, when it is sent a SIGHUP),
-	# then implement that here.
-	#
-	start-stop-daemon --stop --signal 1 --quiet --pidfile $PIDFILE --name $NAME
-	return 0
-}
-
-case "$1" in
-  start)
-		echo "Starting $DESC" "$NAME"
-		do_start
-		exit $?
-	;;
-  stop)
-	echo "Stopping $DESC" "$NAME"
-	do_stop
-	exit $?
-	;;
-  status)
-       ;;
-  reload|force-reload)
-	echo "Reloading $DESC" "$NAME"
-	do_reload
-	exit $?
-	;;
-  restart)
-	#
-	# If the "reload" option is implemented then remove the
-	# 'force-reload' alias
-	#
-	echo "Restarting $DESC" "$NAME"
-	do_stop
-	case "$?" in
-	  0|1)
-		do_start
-		exit $?
-		;;
-	  *)
-	 	# Failed to stop
-		exit 1
-		;;
-	esac
-	;;
-  *)
-	echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
-	exit 3
-	;;
-esac
-
-:
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd-default b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd-default
deleted file mode 100644
index 0ceff0382..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd-default
+++ /dev/null
@@ -1,5 +0,0 @@
-# If you must specify a non-NMEA driver, uncomment and modify the next line
-GPSD_SOCKET="/var/run/gpsd.sock"
-GPSD_OPTIONS="" 
-GPS_DEVICES=""
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
deleted file mode 100644
index 7131a589d..000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=GPS (Global Positioning System) Daemon
-Requires=gpsd.socket
-
-[Service]
-EnvironmentFile=/etc/default/gpsd
-ExecStart=/usr/sbin/gpsd -N $GPS_DEVICES
-
-[Install]
-Also=gpsd.socket
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
index f8e6a2b13..e94d6a108 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
@@ -11,10 +11,6 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
     file://0004-SConstruct-disable-html-and-man-docs-building-becaus.patch \
     file://0001-include-sys-ttydefaults.h.patch \
-    file://gpsd-default \
-    file://gpsd \
-    file://60-gpsd.rules \
-    file://gpsd.service \
 "
 SRC_URI[md5sum] = "68691b5de4c94f82ec4062b042b5eb63"
 SRC_URI[sha256sum] = "03579af13a4d3fe0c5b79fa44b5f75c9f3cac6749357f1d99ce5d38c09bc2029"
@@ -67,13 +63,13 @@ do_install() {
 
 do_install_append() {
     install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
+    install -m 0755 ${S}/packaging/deb/etc_init.d_gpsd ${D}/${sysconfdir}/init.d/gpsd
     install -d ${D}/${sysconfdir}/default
-    install -m 0644 ${WORKDIR}/gpsd-default ${D}/${sysconfdir}/default/gpsd.default
+    install -m 0644 ${S}/packaging/deb/etc_default_gpsd ${D}/${sysconfdir}/default/gpsd.default
 
     #support for udev
     install -d ${D}/${sysconfdir}/udev/rules.d
-    install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
+    install -m 0644 ${S}/gpsd.rules ${D}/${sysconfdir}/udev/rules.d/
     install -d ${D}${base_libdir}/udev/
     install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
 
@@ -83,7 +79,7 @@ do_install_append() {
 
     #support for systemd
     install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
+    install -m 0644 ${S}/systemd/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
     install -m 0644 ${S}/systemd/${BPN}.socket ${D}${systemd_unitdir}/system/${BPN}.socket
 }
 
-- 
2.11.0


