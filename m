Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PkMze-00034v-4v
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 21:38:30 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LFY003RGH9UAL60@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	01 Feb 2011 14:37:12 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 0B2633; Tue, 01 Feb 2011 14:37:04 -0600
Received: from [192.168.1.10] by rkmorris.us with HTTP; Tue,
	01 Feb 2011 14:37:02 -0600
From: <openembedded@rkmorris.us>
Date: Tue, 01 Feb 2011 14:37:02 -0600
X-Mailer: Axigen WebMail
To: openembedded-users@linuxtogo.org, openembedded-devel@lists.openembedded.org
Message-id: <1296592622161142500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 4
Subject: tslib Issue
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
X-List-Received-Date: Tue, 01 Feb 2011 20:38:30 -0000
Content-type: text/plain
Content-transfer-encoding: quoted-printable
Content-disposition: inline

Hi,

I have successfully build and then run several OE images on my target hardw=
are (h1940) - and have noticed an interesting oddity (bug?).

If I run the opie-image for example, everything works just great. However, =
if I run an X-based image (like, say x11-gpe-image) when the GUI starts up =
tslib calibration is run ... but then basically thrown away, as the driver =
for the touchscreen is set to evdev by default (and the touchscreen isn't c=
alibrated / does not work right). If I manually build and install xf86-inpu=
t-tslib, and then configure the input as tslib (not evdev) - once I restart=
 gpe-dm it works as expected!

Is this supposed to be the case, or perhaps something not configured quite =
right in the builds?

Thanks!

... Russell



