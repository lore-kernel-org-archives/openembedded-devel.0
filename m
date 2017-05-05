Return-Path: <cshore@thecshore.com>
X-Greylist: delayed 317 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 May 2017 08:11:39 UTC
Received: from smtp73.ord1c.emailsrvr.com (smtp73.ord1c.emailsrvr.com
	[108.166.43.73])
	by mail.openembedded.org (Postfix) with ESMTP id B941A77D4E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 08:11:39 +0000 (UTC)
Received: from smtp26.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
	by smtp26.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id
	3217AE02FE for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 04:06:24 -0400 (EDT)
X-Auth-ID: cshore@thecshore.com
Received: by smtp26.relay.ord1c.emailsrvr.com (Authenticated sender:
	cshore-AT-thecshore.com) with ESMTPSA id 01065E02FC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 04:06:23 -0400 (EDT)
X-Sender-Id: cshore@thecshore.com
Received: from DanielW (135-23-246-254.cpe.pppoe.ca [135.23.246.254])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:465 (trex/5.7.12); Fri, 05 May 2017 04:06:24 -0400
From: <cshored@cshore.thecshore.com>
Sender: "Daniel Dickinson" <cshore@thecshore.com>
To: <openembedded-devel@lists.openembedded.org>
References: <093b01d2bf21$fdcb22a0$f96167e0$@cshore.thecshore.com>
	<20170427130608.GA15538@linux-uys3>
	<006e01d2c147$48974e40$d9c5eac0$@cshore.thecshore.com> 
In-Reply-To: 
Date: Fri, 5 May 2017 04:06:23 -0400
Message-ID: <1a2ac01d2c576$7ca9eed0$75fdcc70$@cshore.thecshore.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJER+JJ3hDcRBpWps2femoNEHH/sQMWyh1cAiXhILoCc6HWLaDE2nzw
Subject: Some experimental layers and conclusions
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
X-List-Received-Date: Fri, 05 May 2017 08:11:40 -0000
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-ca



-----Original Message-----
From: Daniel Dickinson [mailto:cshore@thecshore.com]=20
Sent: May 5, 2017 3:52 AM
To: 'openembedded-devel@lists.openembeeded.org' =
<openembedded-devel@lists.openembeeded.org>
Subject: [oe] Some experimental layers and conclusions

Apologies if you get this twice; I got a bounce due to sending with =
wrong email address.

> -----Original Message-----
> From: Trevor Woerner [mailto:twoerner@gmail.com]
> Sent: April 27, 2017 9:06 AM
> To: cshored@cshore.thecshore.com
> Cc: Openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Some experimental layers and conclusions
>
> Hi Daniel,
>
> Very interesting report, thanks for the info!
>
> On Thu 2017-04-27 @ 02:46:24 AM, cshored@cshore.thecshore.com wrote:
> > * OE doesn't have good *router* networking support (i.e. nothing=20
> > like OpenWrt/LEDE's netifd and friends for a headless system, that=20
> > one can configure by editing a text file, or by using a WebUI for=20
> > handling multiple interfaces and VLANs and bridged (or not) wireless =

> > and wired networks, with easy firewall configuration).
>
> I wonder Khem's if meta-openwrt could have helped here? It looks like=20
> it has a recipe for netifd and friends:

I hadn't actually gotten to the point of needing to worry about the =
networking yet. I was trying to avoid procd because of too many =
hard-coded openwrtisms (assumptions about how the system should loo) in =
a niche C project, and systemd for being too large.  From what I saw in =
the changelog the meta-openwrt is not working yet, and my guess it has =
to do with a lot assumptions about how the system is set up that are not =
well documented, and are openwrt-specific (I have some knowledge of how =
this setup works, so I can make it work, but I'm not sure it's worth =
it).

The real showstoppers where the lack of kernel (especially wireless =
support) without getting into e.g. wireless development which I don't =
have facilities to do legally and hence is off the table.

>
> 	https://layers.openembedded.org/layerindex/branch/master/layer/
> meta-openwrt/
>
> Out of curiosity, did you try using musl? You don't mention which C=20
> library you're using. I'd be curious to know if musl can help with=20
> size reduction.

Yes, using musl, that's part of how I managed to get the size down as =
far as I did without getting into major patches for debloating.

>
> Is toybox mature enough to be used in these situations?
>
> 	http://layers.openembedded.org/layerindex/recipe/28902/
>

Last I checked (about three months ago) it is not (I've peeked at it =
from time to time, but there are some important things like POSIX shell =
and working dhcpc that would have to come from busybox or a larger =
traditional sources.

I'm not sure how much size difference toybox will make over busybox, =
although I am interested for other reasons.

The biggest size challenge compared to openwrt is that openwrt has a lot =
of custom stuf to cut things down, mostly by excluding not needed =
functionality, or as with netifd, odhcd, uhttpd, etc, by writing =
minimalist versions of things that are needed.

Regards,

Daniel


