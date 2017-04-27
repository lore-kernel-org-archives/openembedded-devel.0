Return-Path: <cshore@cshore.thecshore.com>
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id AB12360939
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 06:46:26 +0000 (UTC)
From: <cshored@cshore.thecshore.com>
Sender: "Daniel Dickinson" <cshore@cshore.thecshore.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Apr 2017 02:46:24 -0400
Message-ID: <093b01d2bf21$fdcb22a0$f96167e0$@cshore.thecshore.com>
MIME-Version: 1.0
Thread-Index: AdK/HX5utxMUPetlQlWKh5RsQ1R2uQ==
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
X-List-Received-Date: Thu, 27 Apr 2017 06:46:34 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-ca

Hi all,

I've done some prototyping of some ideas I was working on with OpenEmbedded,
what I learned from the efforts (which I'm posting here for the benefit of
someone who might be interested in this or similar concepts).

I was initially interested in OE as a possible replacement for OpenWrt/LEDE
on my router.  I quickly discovered there are some issue with that, however:

* OE doesn't have good *router* networking support (i.e. nothing like
OpenWrt/LEDE's netifd and friends for a headless system, that one can
configure by editing a text file, or by using a WebUI for handling multiple
interfaces and VLANs and bridged (or not) wireless and wired networks, with
easy firewall configuration).
* The routers (ar71xx) I was interested in have a lot of OpenWrt/LEDE
technical debt and have drivers and BSP that has never been upstreamed.
* OE's default build can quickly exceed 16MB flash, which is the larger of
the flash sizes on the devices I was interested in.

I started on the latter by creating a poky-tiny inspired distro which called
CShore Embedded Device -- CShorED (cshore is a nick I've been using for a
while).  That layer can be viewed at
https://layers.openembedded.org/layerindex/branch/master/layer/meta-cshored/
.  In the process I created meta-runit-init
https://layers.openembedded.org/layerindex/branch/master/layer/meta-runit-in
it/ (which uses busybox's runit/daemontools-style applets a the main init
system, because systemd was clearly too large for my use case and I wanted
something more resilient to daemon failure than sysvinit or busybox-init)
and meta-earlyinit
(https://layers.openembedded.org/layerindex/branch/master/layer/meta-earlyin
it/) which allows initramfs like pre-init setup when not using an initramfs
and also adds what I think is a lot better support for read-only-rootfs that
doesn't require special handling after earlyinit.

Oh and cshored uses squashfs-xz read-only-rootfs with the objective of
having an easy 'factory-reset' capbability, however it doesn't take the
overlay approach to the entire filesystem, but only overlays a subset of
files, and uses a lot of symlinks for data that is either volatile (not kept
across boots) or which is persistent (and with earlyinit has handling of
auto-setup of persistent storage).

I was successful with cshored in getting build sizes into potentially useful
range (~8 MB which my smaller devices have for flash) while still having
useful commands/capabilities, but it compared to OpenWrt/LEDE OE is always
going to be bigger.  The lack of device support got me looking at x86/Pi
etc, but I discovered that when going that route there are already a
significant number of good players who take advantage of the power and
usually available storage on x86 to create high-grade
routers/firewalls/gateways/VPN gateways/switches/etc, so not much point in
being a latecomer to that party (as a new entry).

runit-init was an interesting experiment but the ultimately systemd is much
better on systems that are large enough (which is even most embedded devices
these days), or procd for smaller devices (from OpenWrt/LEDE).  The problem
with run-it is that it doesn't have meaningful dependency support one ends
up with a lot attempting to start, fail and restart during the boot process
and a lot of delay while trying to figure out of the dependency was actually
up or just hasn't reported down yet.

Earlyinit seems to me to be the most useful of these, but I've heard systemd
is wanting to take over the boot process too, so I'm not sure that earlyinit
is a useful road to go down for further development.

If anyone has comments on the layers, or wishes to see further work on any
of them, please ping me, otherwise at this point I consider it feasibility
research that led to no-go conclusion.

Regards,

Daniel






