Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0083.outbound.protection.outlook.com [104.47.41.83])
	by mail.openembedded.org (Postfix) with ESMTP id 280B9719B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 01:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=gWJkJDFS7jLt/l7JRxXag3X+Jnl2mTWyZhfXkxPCxk4=;
	b=zqOv8g6csbVC8YYRf2w5vpwJy8C4rWrB9Gf324JEqxGsMJHGqhS8PKvGrzeHMAyj+cmoLLDltOw3Kjx7zZaD1J+xN7FTiv1Vb0/LxD7ZV3oB4624xDTvLrMlXN3gs9Ye9+ndwYE6YJI5y5wS1if8atpF+yfMNney+8LdflsXu6Q=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Fri, 17 Nov 2017 01:10:22 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Nov 2017 17:10:11 -0800
Message-Id: <20171117011012.359-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR12CA0059.namprd12.prod.outlook.com (10.175.47.149) To
	CY4PR0101MB2933.prod.exchangelabs.com (10.171.223.138)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37a30442-4c92-4e6a-bfd5-08d52d57fa87
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:CY4PR0101MB2933; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	3:j+ZfvmH45CJ2Mmp2HHDmpAarRuxIvT77dK/cKhXkHjm1s/SvikDdZu2txOXdgyJ+B7y+rzs4RL13bbl0Bf/Gi8YnHlMXBegUMktEO9atMOuMVgmeJL9MGh4QFhM5FHyt8oSt5YCzQAgaSYOEd11i7AEX+htEKMsUlVUhhovD22siXDcNaD8bFi61i+vARRZ7oBBwkOXE5rx/ZWELVvtO3dvc3drlrXsPycdti8nJdJY4qkStRPfhgbz7iEeluMMd;
	25:Hwo8JWrWXf2hZHJX051GP7X31xqZzpDGzw0/M8ZpJCBd9PaJ0znoTFz9rcXLfdejrdwDCLy4N2Z8B9i1Or0OU83YPqPKVAfi3WLOkhHQtt9urEvTENVTXalqryNTkoGa4ucA7oO8Wa6xeoGX5TtdwryKTAC2WjAZUVMgPqISLAlxchNdTQV7bWW6HsYhxd6UnxKc15X3yu2AcdNzjinDZrZ4upqBogldbRzHjq8q5VUJwNEneGRVmnXdvbjSLTIeS+9n3wLSCyhPeMSdAQv2WRLNn3dayAq3UC8wIR0iNKBxAtKaRuSKknK7fcdmnGqrG5bSFdEgoAShvMSGTgWZzQ==;
	31:3KdYTgP9aHK8el10gSitkZLYI+kMG6XoNHxLg4isGgnuKk5ynbUQZJkeuWromFXDCV8XhBiwj4aVOAIPoWrhEwV4lv5SgL39V/Bcf7o62+UzsXECjukLfzyl6GYuzkUMKhYGRAZrshmRShbDjTojqSWJuI7GZLrbCee8neiWps9eZSuhohDu7IFYE/2G/ciclsuCkZLKTIvIH1mL/cE93mgiOnEwCDC+3vImfb++yG4=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2933:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	20:UHnXh7yz1AGTka6OZlQE6xkntrUove33EsPwxECSyYEYVrqzGCShznoD5owR/kgKdFc8kdPPUDb+3QPbMDRYClUu6jQq9shhlFBmnC0U5K4JGvLVuvDfNhM78wBCk+yS1aKQlj1QMeH3JoZWAeC5PsKQOmFlAbAW8TXbaRADEtj2P540RToZwsBJ66Fr0FFKZJDprMlnO6WejEjEum1ocZNnYxMM3ZTN34cKKV4SoMHXaUAqY2+YWVtVbT62wPiteMBgzgMPjiiH6/FhM1+A/UdMRy9K1tEa/8s1O3pGIRhcVNcfKy28W+U8UFBpex2MQTaN1oNtMyivZDpfEgkW29NzSJiduozc0JXIbK4wQARKX+4iz6XcGhG0q8rx9ZNU7rccHVONS1LVpxUJudndiRWDRwuH+5rMPXS98kKgc5o=;
	4:yhdBnvQ7e/PubSwJiqJokNgqtkGpzKSHGFOfRo/5aUq+AkBdW7nZtc9TrZvnHrP6V7+5KnpQsesRiHyCO7wIoF+ux53Bbu9SH7O+LNuZsGMAioreNZSRzPtPFrIYggDubBBwvrmbDQ99UbpQ7NxEkpAWXkAtchQE0PVAAPJjBBP1WHEHWMVJStQntrD+r6fnTx3WvXx1Zq5WYdpl0z6vuJtmOvGCEeRhv0W5Z+WMHorCUG+URJ5AtN15uNAMjh4LrCy2FFtgKDhZo+wrxfc1NyIu4tiCVq+lWgXzUR6ZIs7vmtA9gJCCXG+fpJM9as7G
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29333D1698099AEBA0D342B4AB2F0@CY4PR0101MB2933.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(3231022)(6041248)(20161123564025)(20161123555025)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2933; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2933; 
X-Forefront-PRVS: 049486C505
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39830400002)(376002)(189002)(50944005)(199003)(66066001)(47776003)(36756003)(305945005)(1076002)(3846002)(25786009)(6116002)(7736002)(50466002)(50986999)(107886003)(16586007)(50226002)(68736007)(5660300001)(2906002)(316002)(45080400002)(2361001)(54906003)(8676002)(101416001)(33646002)(6486002)(97736004)(106356001)(575784001)(6916009)(86362001)(2351001)(81166006)(39060400002)(189998001)(8936002)(5003940100001)(81156014)(16526018)(478600001)(4326008)(6666003)(53936002)(105586002)(48376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2933;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2933;
	23:E/ilk4brg7eJKdXz/sPvD2UdNQjsaFWsEe2fRd/?=
	=?us-ascii?Q?DZD4kWbL3LndBnWh1R7Br12hAXHOGZFxsPn8wxO1VhBHJqsuQ5bzFRVd4QQ7?=
	=?us-ascii?Q?1P1+Rk+b5jOrMzJWkOaBOD0mTNSfsiJYxSpqzHI83EBKtP1R/YM3D3wGoyYL?=
	=?us-ascii?Q?Bu8tkvRELfQJtFzfObudogJV4y/nFGWrPSYAf0e0EI5sfyxftbNCPwrq5v0w?=
	=?us-ascii?Q?t8P3DzGDaA/eKBwrF3VtdBcNBUJsVzw64ERjmJbE1FOZHiaTpwdYl+BOfN7g?=
	=?us-ascii?Q?hCIZVyEQPf5u4wTSjP1xhUyOrLywGYY5Co7FkfLBFjw4UtyaHYydn8xur3i0?=
	=?us-ascii?Q?rC7NtinrNIW+DhicalsC9BqiderLxaHxk1uadjrtvQ0B621BFB/km09w1+jX?=
	=?us-ascii?Q?P4PlN4wqJXG1WgvHSvtmPk6q1yAIvxqVH5sIirfJPbJV4tYpQmNEoRiqahZK?=
	=?us-ascii?Q?BkUgNHFOMTl2k+t6yb0UbD+jLdhHQVEt9RGLYwlgGvS3HpHUXQ64kMirScyJ?=
	=?us-ascii?Q?7RM0MVzIxqKEfkXiV+zDtNcpceIoVQI+Pwc7BwdiopmnRSYgQrTTBfNGjAt3?=
	=?us-ascii?Q?vrw0lB2JQfD5jPUbsUaSBiWVbtfwD2O5LTItu8lz2pTtJ3oBA3hJCZ324BaA?=
	=?us-ascii?Q?A5lSi4WBDrFgQebYc50fUMHhKpeq471eYJ0Gp+v/2gkv2LDWmotxmO7fd6Hr?=
	=?us-ascii?Q?K512kzdNFrdw6eX1iIF8MwNtwKvq73dXtad1MTKUW1Ad+5oZ/heeOAOmNUR8?=
	=?us-ascii?Q?mjon0Dri/rVbJmXfieCkDTlW4HWfOaCrHV5lLKW1TeM2EpbytKc4FgVT9hC6?=
	=?us-ascii?Q?aOtIFJ0lFzWGka3KbzJdctojuK4zNDHHdd6+aIlRf7qgvBi7zkMYwGHYH3zn?=
	=?us-ascii?Q?8StAmkU3c405yKj4iM7n4PFcQtij26KJZAsn9DqjPUPXBNJT5SYzzwtTxawo?=
	=?us-ascii?Q?rOV1VasfFFt0ZJ61hZYdbzD0d7Ycs+VfOoHGi1K2h1nA3oRvr2eJ5ZGNDnah?=
	=?us-ascii?Q?r20LCkEm+hCxuAilZJ4RP3dCPQ5ML2MO7RDTEQA2/QnPOy83facfduZ1mC3Y?=
	=?us-ascii?Q?3gIzdZ3EOpekJWpmb2lwItVy/dDLTeOsLuj+jXDzTUBukZt8ja5KFLG7575f?=
	=?us-ascii?Q?brVqwXg0hvWZBaxW/ackPF3z6jWNpqGIBJqyyafoMqSXkKzTIHLkvPCvW8uJ?=
	=?us-ascii?Q?1KppfYEHsEK7K443hmqoh2KtVKwwEb8LQkldI?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2933;
	6:AUZbY0Z7VSxTH8H3KOzJPpYK+iq26vhUfs7L7WXHX/D/MIJg/n7ZRe9fHvqy7Tiac0HZMoWeOn1wi2yuslP1pdqxgLUjr6vzLYniKq1uCFttB8Y/a4RU99OA6FRE8jORojhs5yORsgVU3Phry9Bx2uEk0mTkycZhIM9DucZuf+CXc2dCqKdNSNM8u8zCxyed3kRa2zYOqm61gKVYGVlYUf/f2+ItM464WEYWZyh9I7IT0VTUTmULxah7XvMB6v5TLaAPyrCDhCB6iO7KLbum0DLoIr13o6WmOz7dja7kCxErrbtZ/1Fgo8p1y1QbObZx7qjO+Z9wBwpON4vEpToJ/zAre/ZCKrLRG2GjsTdj/nw=;
	5:giU/TPen/0pt5LdFyVHCE8CJS/EUTA1Yt+gzWnBz6GWPKdVrmne6Wp4MXoMGdvVMz5RclsAnioeKTODZlqBZqpPAcyvIuRIVLUpJeBFTsZxdFxgRsI2C+RmYAVb3dzwn8XAenNnUt4Wf1YtNxbr2Dw39m53VBtHVX7rWqVXUbNE=;
	24:TBlEuPRd0g7hS/8DM+mFgcDXXlDcxokjyBWXEOTjFQdJ8cICQIvUdNcJMpe2TlTLreS4t3m9wTQk6WWOxv+yfOlPnD31vukS/lR1CAUauro=;
	7:ZEEniZkzkH2g69/SxFE4I0tep1mupMK/piixf5m/2QUmiw07XaxICBv8C6Sx7Ov9uxqSoxBW7/zhzO9ThQr4YquRWnOjFTIQAxDfo80Xb4eJujwh5V3KMdPS+G2J7ULmcEcVgfOLOo+Ip9/QdLVDJKgKCGM+I07+hScZshjFRZCpCrDbj8OB+a92qmc6ryKvdOuEP5fBc+zkGWthCCDDmBl36xm1mwwDdtwa92ylsWT53wEeGIY9/leJxE9+QdrV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2017 01:10:22.9992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a30442-4c92-4e6a-bfd5-08d52d57fa87
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2933
Subject: [meta-oe][PATCH v2 1/2] gpsd: use upstream config instead of our own
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
X-List-Received-Date: Fri, 17 Nov 2017 01:10:23 -0000
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
index e23d63033..47db41f22 100644
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


