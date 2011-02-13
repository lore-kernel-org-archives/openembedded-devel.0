Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PoS40-0006Yt-NC
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 03:51:53 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LGJ00CQABWGDD40@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	12 Feb 2011 20:50:44 -0600 (CST)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 11D922; Sat, 12 Feb 2011 20:50:33 -0600
Received: from [192.168.1.2] by rkmorris.us with HTTP; Sat,
	12 Feb 2011 20:50:31 -0600
From: Russell Morris <openembedded@rkmorris.us>
Date: Sat, 12 Feb 2011 20:50:31 -0600
X-Mailer: Axigen WebMail
To: Khem Raj <raj.khem@gmail.com>
Message-id: <1297565431074640500@rkmorris.us>
In-reply-to: <20110212001656.GF1010@gmail.com>
References: <1296592622161142500@rkmorris.us> <20110212001656.GF1010@gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 5
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-users@linuxtogo.org, openembedded-devel@lists.openembedded.org
Subject: Re: [Openembedded-users] tslib Issue
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
X-List-Received-Date: Sun, 13 Feb 2011 02:51:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

Perhaps a dumb question, but - should the recipe for x11-gpe-image be upda=
ted then? I ask because it's what set up tslib (rather than xinput-calibrat=
or), and then evdev.

=20

Thanks!

=20

... Russell

=20


On Fri, Feb 11, 2011 06:16  PM, Khem Raj <raj.khem@gmail.com> wrote:


>=20
On (01/02/11 14:37), openembedded@rkmorris.us wrote:
> > Hi,
> >=20
> > I have successfully build and then run several OE images on my target =
hardware (h1940) - and have noticed an interesting oddity (bug?).
> >=20
> > If I run the opie-image for example, everything works just great. Howe=
ver, if I run an X-based image (like, say x11-gpe-image) when the GUI start=
s up tslib calibration is run ... but then basically thrown away, as the dr=
iver for the touchscreen is set to evdev by default (and the touchscreen is=
n't calibrated / does not work right). If I manually build and install xf86=
-input-tslib, and then configure the input as tslib (not evdev) - once I re=
start gpe-dm it works as expected!
>=20
> are you using X11 with evdev driver then tslib will not be used at all. =
You
> have to use xinput-calibrator.
> >=20
> > Is this supposed to be the case, or perhaps something not configured q=
uite right in the builds?
> >=20
> > Thanks!
> >=20
> > ... Russell
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-users mailing list
> Openembedded-users@linuxtogo.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>
From martin.jansa@gmail.com Sun Feb 13 07:08:10 2011
Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PoV7y-0000AN-Qc
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 07:08:10 +0100
Received: by fxm17 with SMTP id 17so3929381fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Feb 2011 22:07:03 -0800 (PST)
DKIM-Signature: v
