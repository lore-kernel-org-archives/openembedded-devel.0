Received: from edison.awellconnected.net ([83.167.180.132])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1OXx6C-0004ZC-8J
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 16:01:41 +0200
Received: from [127.0.0.1] (helo=localhost)
	by edison.awellconnected.net with esmtpa (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1OXx1P-00018W-9q
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jul 2010 14:56:43 +0100
Received: from ip-80-226-0-1.vodafone-net.de (ip-80-226-0-1.vodafone-net.de
	[80.226.0.1]) by webmail.htc-linux.org (Horde MIME library) with HTTP;
	Sun, 11 Jul 2010 14:56:43 +0100
Message-ID: <20100711145643.q4q6l3lsow8ccogs@webmail.htc-linux.org>
Date: Sun, 11 Jul 2010 14:56:43 +0100
From: lukas gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.6)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 83.167.180.132
X-SA-Exim-Mail-From: lukas@htc-linux.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,MIME_QP_LONG_LINE,
	RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_SORBS_WEB autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: htcleo: touchscreen driver & configuration
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
X-List-Received-Date: Sun, 11 Jul 2010 14:01:41 -0000
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

except for the 6 keypad buttons, machine htcleo lacks any working
input device in its current state in OE.
The present touchscreen driver is designed for use with the andoid
user space. I would like to make it work with tslib.

In ts_print_raw a touch event looks like this

670.031357:    110    227      0
2670.071314:    132    266      0
2670.111229:      0      0      0
2670.111236: -947150040 -947440328      0
2670.151243:    285    200      0
2670.191285:    285    202      0

Instead of a real touch event, the pointer will dodge to zero and then
to a large negative value.
Am I right the driver will need patching for this to work with tslib?

Driver is here
http://git.linuxtogo.org/?p=3Dgroups/mobile-linux/kernel.git;a=3Dcommitdiff;=
h=3D6a2efb17dced8b2989a4359d98d66b0446743fdf

I know this is not 100% OE related. But since I am trying to get the
htcleo device supported in OE I should take a try here. On the tslib
list nobody jumped up so far:

https://lists.berlios.de/pipermail/tslib-general/2010-July/000302.html

Thanks

Lukas


----- Ende der weitergeleiteten Nachricht -----




