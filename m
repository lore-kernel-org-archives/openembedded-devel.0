Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <openembedded@hrw.one.pl>) id 1GHdUY-0002lt-DC
	for openembedded-devel@openembedded.org; Mon, 28 Aug 2006 11:33:14 +0200
Received: (qmail 10934 invoked by uid 813007); 28 Aug 2006 09:31:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 28 Aug 2006 09:31:16 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Aug 2006 11:31:30 +0200
User-Agent: KMail/1.9.4
References: <1156715171.5536.60.camel@localhost.localdomain>
In-Reply-To: <1156715171.5536.60.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200608281131.31893.openembedded@hrw.one.pl>
Subject: Re: What is task-base?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Aug 2006 09:33:14 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 27 sierpnia 2006 23:46, Richard Purdie napisa=B3:

> I've been asked to explain exactly what my last commits did. Basically,
> I broke us free from being tied to task-bootstrap by creating
> MACHINE_TASK_PROVIDER which you can set to the task-bootstrap like
> provider of your choice. It defaults to task-bootstrap so nothing
> changes in that respect.

I like that idea :) Will have to look at it and add to .oz354x branch so=20
it will be much easier to create working images for collie.

> Its not perfect yet but we needed to set the ball rolling somehow :)

I think that we lack "serial" in MACHINE_FEATURES - this would be needed=20
by "irda" feature but will be also useful for machines which have normal =20
serial (RS232/RS485) here we can put lrzsz.

"pcmcia" feature should recommend "serial", "bluetooth", "wifi" features=20
atleast. It also contain now hostap-cs without checking for "wifi".

"ext2" feature could be renamed to kind of "internal-storage" - most of=20
our supported devices use ext2 but not every of them has internal storage=20
with ext2.

"wifi" feature need some work too. There are machines which does not have=20
Prism based wifi cards (so no need for hostap-utils) or do not support=20
WPA (wpa-supplicant is not needed then). h4000 has internal wifi on=20
ACX100 chipset (iirc) so it need only wireless-tools to have it working=20
(chipset related packages should be listed in machine config).

=2D-=20
JID: hrw-jabber.org
Palmtop: Sharp Zaurus C760
OpenEmbedded/OpenZaurus developer

          Warning: Dates in calendar are closer than they appear.


