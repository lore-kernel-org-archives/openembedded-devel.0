Return-Path: <samuli.piippo@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0119.outbound.protection.outlook.com [104.47.2.119])
	by mail.openembedded.org (Postfix) with ESMTP id 018F360017
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=1e3xjA5TCcfcW69ODySSS1qKXUIMWWB5krU9WskBk+o=;
	b=WbaTixyXFIXwxIIKE7M+7sni9iSN1P9LhL4h3seAW8oAt0OLwtmnybNw6SDro/LlPwdBNSR1wLSDnNs+xUsC/jHrZHkb+LIpZxAorAAHsSqwNEKaXpSm2izREP13BzPBdVJWD6NvywWCefbVO+enhAtzgghWwfh3yZE0bshYBPI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	AM5PR0202MB2577.eurprd02.prod.outlook.com (2603:10a6:203:6d::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.197.13;
	Fri, 10 Nov 2017 07:11:39 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Nov 2017 09:11:19 +0200
Message-Id: <1510297879-771-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: VI1PR08CA0229.eurprd08.prod.outlook.com
	(2603:10a6:802:15::38) To AM5PR0202MB2577.eurprd02.prod.outlook.com
	(2603:10a6:203:6d::14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6448d3f-25b0-454d-96c3-08d5280a49ef
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:AM5PR0202MB2577; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0202MB2577;
	3:Jyia8hrCLr5WvXExOfXAS5UVHBvkz9yyn8KIcrdC7bhOUzibWpxWPj1zbeVqR7OF/0uGDpBwO+vIhO2e6UspQ7Rgc0g263frEPB4GhtXDEP58eQtuW0fDOfrD59hGXQFy7tPIgV3gCn8xdElaqdua3rs5saJ0q63x7HuGWqxu1m+KgWJeOHJABFoQOh1KfIePgrO1dUoE8v+VAqkhWKZTLRrh16kiVym+IwgROnWJKMpv5VX9Mlb3vvhVuCiYcY7;
	25:s0mU33oN0MROHNeiCn4RTBmve5Y2rSNleTD8Liezf3Gp67fMxECXtYltgjxaX6hXrNeQaDAVLqgrsuF/HoZX3JQYOPR7lY0VeIIRvzAyfVfaiCdJK65G14bFAp5pb8kqDtZj5arM20/xZHD7TztRGX5PHTZdWmFGlzzfHgcrcFfaxyDRkMDC30hdmrGcnQVJojxAz3g7GW8KbCOFjgRK60hgTm2uZKqWM+WGaefF2rbreYgKWt/Arm2Rz8yMQ/Wy+N96Cx5w0nTTvd1iuFQqGfdJgLJ9T0tamv6dVR2dMwD676FjUAnPteBQ/eZUM6tYuoy6PjdTWzOmPh/9Fx/zFQ==;
	31:dgjvUuZDcOkepzhB0B+zJhwOvXqRFsfnGGKqqO1uYHSMOzgA3S9OozQOeI05l9w638yOLV2A4RG7V+/S7GJ+LlM3dJT8DwHwsT/GLMCeQBou9QO37kYzz5U207xe2Zlveax4ZRF6fFfto4MSBxhH9M/nIG+ECBr81Fj+3WRxqmYI/SeT0UuowOate4Ws45ZfJPrBwtIHnlMCkO7mpF7+vfqqgGQIVvTfQwAqoUr1q7Y=
X-MS-TrafficTypeDiagnostic: AM5PR0202MB2577:
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0202MB2577;
	20:su4i3fn+3suW6IfwObngY8JSUjAbEWyE2Xu5yKizYb3R6PLwm5a6Ik+SESYdiujmgo0mHLqo/yfdJ4au2p2WcBXJ4z1ulmaTW/Cfr8sQHZIdmnqOnYwLsb+oOgybGf0x2ZzFHovFKZnXPKhP9deaHmQfDENp6nK8FkdDifmLoCzpxDXzPN6VZxJXS072scJD7+C2ED3lh+qM4pBFqLUqeBRfKih+pFNzf/PJ8txMnYFWiNOAym1HfHCJdtYKSTy9ixni2kbWZZeiySFJQmBPqnLNAoB65sjDXBCJU/7T9tWtvkPs976/VrzDZF640qnAFmf7tKYGPtiQUZaHCqbkBu7zTwi0X0cZTJ1SeFLxOKQGA/YDTB08KqI9X+QpkZW3EtSgNd12yb2FompomlRYBxldlEHej3LtIgVZgOaXQbSfX29+vsbXQtiyctqQc/96HPNs59ji1eW/oRp1GqC/hb7dqJy4wez5EdK32KMNkwKg/NQyrWpnOJcT5f1XoFP3;
	4:GXCYlZg9X1OWtLXVTdfH8cApB/BlT9amp5eqjbP+VNbKzhoqOHEMjbfDumAh7QAE0UlKcqR55efiOdPw/6BanTIyvrkJ02/pLKbjNId3NT6R5aNVBz3QtqRbQeRF0K6dRQnP3NFSOzVdwPIa9DORlW8K9Nmyygs3DAatjshGDuS4xdA7N5aXavVXEUXFZeulJDPoLMRJLKkQ/TsiB+WiQeJ5+cVBN0DDI30NvtZkAtDnCF2rgVvFj97O9bhtz+Bug3mXcmRdKkkoSpuyME6YKA==
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <AM5PR0202MB25772C6F78AD95FC828130BCE9540@AM5PR0202MB2577.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3231021)(3002001)(93006095)(93001095)(10201501046)(100000703101)(100105400095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0202MB2577; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0202MB2577; 
X-Forefront-PRVS: 0487C0DB7E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(39830400002)(346002)(199003)(189002)(230783001)(50226002)(478600001)(2906002)(6666003)(6916009)(5660300001)(189998001)(36756003)(68736007)(97736004)(6116002)(3846002)(86362001)(5003940100001)(6486002)(69596002)(6506006)(16526018)(48376002)(53936002)(50466002)(74482002)(53416004)(8676002)(81166006)(81156014)(101416001)(16586007)(8936002)(316002)(305945005)(7736002)(6512007)(66066001)(47776003)(2361001)(33646002)(25786009)(106356001)(2351001)(50986999)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0202MB2577;
	H:piippo.intra.qt; FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0202MB2577;
	23:hh7NnPZQGaqJmetYpWJm8cbL3YZTb+a4GzioUB0?=
	=?us-ascii?Q?H0wLCRJX//L+BKu5xennOsNxtb3sbpu93BUW3MGBAeL5KRp1LlyxLumyr9H7?=
	=?us-ascii?Q?Zf6lCXQjGIk+tknbLnLzRmzFJJTlasTBzxRQu4d9+KvHHqlMvg217f3cG3C4?=
	=?us-ascii?Q?O+vvD6HyYJXaR6aD1QjvGaC5iSGb82xwjfGA2rTBl4DMbzrHSkVP7WdwM7kU?=
	=?us-ascii?Q?7CUhzswbUlyUPXO2JqS0MhLyYuGO2Btp2MNEfwf1VIjd7gfJJwyIL1UTIxrS?=
	=?us-ascii?Q?BhbiAux0I+5y3D2qYEenhD4wc+70hDeem/1unE3qiWqbr4A0bHXfafJPZgyr?=
	=?us-ascii?Q?+sK4g3LEjSiKF2J3LjLy9+MqQrr9I91sO5wXG2EkHdL57XrL9djjd7He6R02?=
	=?us-ascii?Q?5b1k5vbThxVjIjCazDTc1FSY/PENyIaei7iEAtzz0Nc75mLoa+RomzT/sZwT?=
	=?us-ascii?Q?34d5/oHVTryDTMe1xG1c+lpnTwDI5tIufwhcV3KdB/dEu0V12jg2SYIfJ0sn?=
	=?us-ascii?Q?p1DFXyyabqUh3DrVFdF7TUJda4mEQFxbUR2a6ZIOtB9CV6QUL/Fc+u43svip?=
	=?us-ascii?Q?AoygYU8Uqxgo6rWiE9AN4uPZiXJw3LFR8sNJTKbEXXUmEOM9gC+oHgKRPWP2?=
	=?us-ascii?Q?C6zcL8BRf54WYE38cUQgVsht0fdc+p5FKfR4phG8dDvZVdTTWIL35PcezgB9?=
	=?us-ascii?Q?UucGtpFDxytw6TLJ986NbpSZcDZe7LWLEf5z2dicBavKejpblCc1ZXuPwD7U?=
	=?us-ascii?Q?VulHRx6/pw/wcxVPfhWsidIS80FLIMFKCsHKRwOlC3+h7J1B+dOLyenuCyRQ?=
	=?us-ascii?Q?q+mw/FpKvhl5bbtZPMonfClGIhxzy9xxDKZwvMvMSbH7q7VBeyP2qVeqmZpy?=
	=?us-ascii?Q?Tv0qmHke+DwKEWhZWWC+UvWAoKNq49jxB59y8J3IGCLjw/hA7uLhhxnHUXLk?=
	=?us-ascii?Q?DzJoGQZmAoK4Mih38x2Im/Sg22O7qQnCrVXkZQ7msKTQMocaAdOZu7yJAPew?=
	=?us-ascii?Q?VKEOfx9s453816vLgJwvBb+sMat+U1BA9E6FzzSQEXOYtYonuvKDiCm71eaR?=
	=?us-ascii?Q?dCr7sRLANdr1aEoXajLRMDu0vIB1lkJB7rDZU+kR11SX9cjkpI1yoOsy3SV/?=
	=?us-ascii?Q?kNP2AkWvl3rlxZHa4qaJ3xUjv7fAjHfhx?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0202MB2577;
	6:7tYBIb/OK0jUEdq4uWwABvBDOvNwoxzUclaurqDHmHxOPCtxmOegSuvtM1yDGnYQO94x+PxbXyalwjH70559gerlc9ZH9t1gcec2A1a07vohOdynbzSCXHsQKXbjnca9TRCnxxlSk4yhO9RMf3Ulz/7+faVZwATTzXOdiTuYOk/JbEXWGhc79btaHfcNmW4Wd6lCTttPWOAMjK5JVmMDAWTyBS3w/UdmD0CkwJgR+VUIrHbD3NOm6umqRNDhx65E4D2CT/oQPThr0hl/UXEcSkUX0MGswNAyiCJEJfKiznPEmUL80swFSHc+QWHdUKpbwvJXjIIOSSsGZ7UEQxM8XiXqgT6RCiRDgekWK6aYHvs=;
	5:NMWrxVdtjkvBixi4eMhokCauNv2V2NUAhJu7hMBsEGm4fqNfOmZtv+kKWeA8a9h4vbA8JItH0pESuD1A+pYEgmniSuhrF0OIVZWt0Pg5XcJLAj33pUXsstsaU9kt6Ak1p1/P37/k/CfqDBgG6bcmvW45PqQzq2allrTfeiPQIIE=;
	24:6KPV7cIamZTpIJGfg32qiCZZ1ryKnjZUpl1mSpExITAh4dAfX1ImocvCy7d1geC58yP/p0KCoDUDm4w3sD4hn7iihg/g55Jv0GAw9zyXjKY=;
	7://CIzhPxTd57mRG4GHl4TAPJyX1xB1H1kuOYYmT+XyY0AUzjJeQmMdlyFzDp7OzMMZ0KfC5j9J78OmBusTN71hu5vnz2ETK3syozp8taSj8/3GcE6nl+VCelSiRGURyutR0p9WmBpeXD5wJ495xrmYMWLIYCEllrZnItqWAfAIM28JoORqxus8QIBN118zLsnNpAzDbFxC2q99hLUPs39hHI3F86FM4s4ckwzQcyyHan1ZxGlLDxDJiZTGP/m2HT
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2017 07:11:39.5203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6448d3f-25b0-454d-96c3-08d5280a49ef
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0202MB2577
Subject: [meta-qt5][PATCH] gstreamer1.0-plugins-bad: add expansion parameter
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
X-List-Received-Date: Fri, 10 Nov 2017 11:44:02 -0000
Content-Type: text/plain

The expansion is now again optional, but for brief time
it was required. Add the default value (True) so that
the layer can be used also with older oe-core versions.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
index b186677..b42338a 100644
--- a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
@@ -8,8 +8,8 @@ PACKAGECONFIG[qt5] = '--enable-qt \
 
 # The GStreamer Qt5 plugin needs desktop OpenGL or OpenGL ES to work, so make sure it is enabled
 python() {
-    cur_packageconfig = d.getVar('PACKAGECONFIG').split()
+    cur_packageconfig = d.getVar('PACKAGECONFIG',True).split()
     if 'qt5' in cur_packageconfig and not (('opengl' in cur_packageconfig) or ('gles2' in cur_packageconfig)):
-        gl_packageconfig = d.getVar('PACKAGECONFIG_GL')
+        gl_packageconfig = d.getVar('PACKAGECONFIG_GL',True)
         d.appendVar('PACKAGECONFIG', ' ' + gl_packageconfig)
 }
-- 
2.7.4


