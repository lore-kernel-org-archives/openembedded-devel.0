Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SHVmk-0001eO-Db for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 09:46:42 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SHVdj-0007mo-RI for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2012 09:37:23 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2012 09:37:23 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2012 09:37:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 Apr 2012 09:37:28 +0200
Message-ID: <jm0nva$1rk$1@dough.gmane.org>
References: <1332488120-28631-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRSxbZf3-9VoZU6S5V3WoUDA+80kdS-z3tuZ-aF94DXv4Q@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CALbNGRSxbZf3-9VoZU6S5V3WoUDA+80kdS-z3tuZ-aF94DXv4Q@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: [meta-xfce] thunar-volman: add eject to RDEPENDS
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
X-List-Received-Date: Tue, 10 Apr 2012 07:46:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 10-04-12 09:27, Andreas Müller schreef:
> On Fri, Mar 23, 2012 at 8:35 AM, Andreas Müller 
> <schnitzeltony@googlemail.com> wrote:
>> Ejecting USB-memory stick caused: Error starting job: Failed to execute
>> child process "eject" (No such file or directory)
>> 
>> run-tested with angstrom/meta-oe environment on overo
>> 
>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> --- 
>> .../thunar-volman/thunar-volman_0.6.0.bb           |    3 +++ 1 files
>> changed, 3 insertions(+), 0 deletions(-)
>> 
>> diff --git
>> a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
>> b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb index
>> c581d78..c7cc0ed 100644 ---
>> a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb +++
>> b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb @@ -3,8
>> +3,11 @@ SECTION = "x11" LICENSE = "GPLv2" LIC_FILES_CHKSUM =
>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" DEPENDS = "exo
>> gtk+ libxfce4ui libxfce4util xfconf libnotify udev" +PR = "r1"
>> 
>> inherit xfce
>> 
>> SRC_URI[md5sum] = "2f166662dd100d5195da238af417f305" SRC_URI[sha256sum]
>> = "b1afd2b3b285cfcf07c11caa3d37fa5ff1fc06f7dc68fcca07f9a0d70daa694f" + 
>> +RDEPENDS_${PN} = "eject" -- 1.7.6.5
>> 
> ping?

I've queued this and others:

koen@dominion:/OE/tentacle/sources/meta-openembedded$ git cherry -v
+ d03ee17c2e40dcbbed9c6623f2e5169b4729f2e3 nodejs 0.6.x: update to 0.6.14
+ 05203855acb5c484af45e3abdae6a2cc3e9ddfd7 nodejs 0.4.12: rename to node4 to
make it parallel installable with 0.6.x
+ da0fb166a41bdbcfd6c902389c919a278ba31477 cloud9 0.5.1: use nodejs4 instead
of nodejs
+ c2dee445739d62c0c428550bf98f1e12b74b3698 cloud9: add 0.6
+ 15cc3fb0ced0daf18673a8683cf276c159e498b6 cloud9: remove 0.5.1
+ bd0a6a465f73168b86dded0e1d938c170ba45fc6 systemd: bump SRCREV
+ 5fced1d76e2771be2a90495fd26362f8645411b2 systemd: fix vconsole-setup
dependencies
+ 839eeb13b83c2dda89901a2fe1b7f726d5b20b6b gvfs-gdu-volume-monitor 1.8.2:
remove conflicting files
+ 06366a8833d2de85a0641134aa27a1c90577bfb5 xbmc: update to head of the Eden
release branch
+ cd06a14023c12002a40e2ad585d45b521e624ad2 xbmc: fix .desktop for ARM
+ 9d030d368ccffe10a7ab13f82addb1968f339947 network-manager-applet: Fix
missing DEPENDS and QA warnings.
+ 8f6027c1bd6659bc393bb652727456f3daa80832 xserver-nodm-init: use
/etc/X11/Xserver from service file instead of Xorg directly
+ 2cb1ae5c172d51df200cc09eb04ddae66bef6b6c xserver-nodm-init: add
EnvironmentFile
+ f9213eb41af2434f3cb044819f4ff84ba2a71a4d thunar-volman: add eject to RDEPENDS
+ a6d45578d95f7d5cce658ab0472ada6ce4794a9f midori: remove midori.inc and
oe-stylize
+ 8a9e1dc63d9aadb3da17edfd31da9ccf833bfeb1 midori: add librsvg-native to DEPENDS
koen@dominion:/OE/tentacle/sources/meta-openembedded$


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPg+M2AAoJEHZqAkdh1vT6vEsQAKDjkCg0Ia6qJKCO8SluLLzj
YIOpiluL8ivQx2UMGJpBmiBaQ/LkWUMI5qn9JDZ7+JsbbTnR6hmDyZyKMyzRTl2o
GLl2MbpO6BA6aTDFVB6pc07dWh3ZjpwfcQjvNrCHdUUq8IBLuhz6OiCJfu/zE6Eq
e3XZQS1ZUfMOfUgoXa+TyE1uGCqn4B16tePHAyooFrOJjED4q5FZz5ON7zA8dbPI
E6B5PMCJ8pBRQoubKXfif0u15P4bXFuemud/PQqfFcgOryAaTHBYmK/0kjonYGY2
skMe6swa98kz80mxkQPaxoqxnk6rHOXRREBwkUpnNOXuNCAhRpOc4ogSHnBGm3lF
jVkV7y8eQFKLCgAE9bVhMUS5lfHt4jtbyxF4ozkKU0yWASwQ2GuZVaqizTI7q059
ylwRGK45AOuEI5aLnnSk4UEbmuoXmq0dfwyybHOgjsVlXs7GtLIme8J9p60eFdSO
ovYZB3SQ68Jgu9mqskFykXffWLGZ4frVjpLavkYaGkZBSMMUuMnfRsAjvMQ0xYa3
BSq/1BTtEeMUsbimXVLSw+cJqLB2mt65cIhlXOTOBefp2QmJpMwJid1EsDojwemg
7pGDKrKpihP1QXEWniqjWEJpZy3EEfADr9L29PIKgWH6MXb4VW6oRbRR8hIlrP+J
+1k5ucHBD4p6fZsEc3cJ
=2J4y
-----END PGP SIGNATURE-----



