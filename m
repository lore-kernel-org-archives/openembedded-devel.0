Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Ocmzx-0004cK-KH
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 00:15:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id B89DF1416BC6;
	Sun, 25 Jul 2010 00:20:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ke+VF9P-kLyz; Sun, 25 Jul 2010 00:20:20 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 8B7E31416BB2;
	Sun, 25 Jul 2010 00:20:20 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Andrea Adami <andrea.adami@gmail.com>
In-Reply-To: <AANLkTik35dsZ6rMfu8KJNo7ZoKd6071ELAhYmzr6T7Y+@mail.gmail.com>
References: <E1OcfGN-0007DB-9C@melo.openembedded.org>
	<AANLkTik35dsZ6rMfu8KJNo7ZoKd6071ELAhYmzr6T7Y+@mail.gmail.com>
Date: Sun, 25 Jul 2010 00:14:55 +0200
Message-ID: <1280009695.11135.21.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Stanislav Brabec : akita.conf, spitz.conf: Set PREFERRED_PROVIDER for udev-compat to udev-compat141.
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
X-List-Received-Date: Sat, 24 Jul 2010 22:15:14 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
> Stanislav,
> 
> thx for your work.

You are welcome. I wanted to boot my Zaurus Terrier even after opkg
upgrade. And the latest vanilla is still one step from going to the
production quality.

> Please note that other machines (c7x0 and poodle) are needing the same
> preference, thus I propose you move this in zaurus-2.6.inc.
> Collie and tosa are not concerned, having 2.6.3x kernel.

Feel free to do it for more machines or move this preference to the
defaults. The setting of preference has no effect until you add proper
lines to udev recipes.

I don't know, whether all Zaurii (and in general all old kernels) can
live with udev-compat141. I only confirmed that udev-141 works with
2.6.26 and udev-151 does not work with 2.6.26 (needs signalfd, CLOEXEC
and inotify_init1).

udev-compat141 recipe contains short manual for other users that may
need it.

Cloning udev-compat141 to udev-compat124 should work for machines that
would not boot even with udev-141.

Well, also libudev does not work completely with 2.6.26. Hopefully,
udev_monitor_new_from_netlink() is the only function that does work, and
this functions is needed only by udevd. But we run udevd-compat, which
is statically linked with the old version of the library.

Note: I committed sanity_check fixes as a separate patch, so people who
tested patches from the list can easily review these changes. (Well,
those people may want to force rebuild, as they will need to rebuild the
same PR.)

I guess that Koen can now remove udev-static.

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



