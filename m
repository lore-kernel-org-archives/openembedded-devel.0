Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QZsna-0007mv-IS
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jun 2011 00:54:58 +0200
Received: (qmail invoked by alias); 23 Jun 2011 22:51:21 -0000
Received: from p5B0A330D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.51.13]
	by mail.gmx.net (mp002) with SMTP; 24 Jun 2011 00:51:21 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19zmaUVHG1zfSVSe2ycHutRn+QBGql37eCN+Zhltj
	I8ZY2tYblUD1OC
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jun 2011 00:52:58 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <201106202316.47662.schnitzeltony@gmx.de>
	<201106232258.06911.schnitzeltony@gmx.de>
	<iu0cut$d9l$1@dough.gmane.org>
In-Reply-To: <iu0cut$d9l$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201106240052.59211.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: udev 171 caching working propely?
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
X-List-Received-Date: Thu, 23 Jun 2011 22:54:58 -0000
X-Groupsio-MsgNum: 32818
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_LP8AO/dG7yBW6Vm"

--Boundary-00=_LP8AO/dG7yBW6Vm
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, June 23, 2011 11:58:53 PM Koen Kooi wrote:
> On 23-06-11 22:58, Andreas Mueller wrote:
> > On Tuesday, June 21, 2011 11:31:45 PM Tom Rini wrote:
> >> On 06/20/2011 03:47 PM, Tom Rini wrote:
> >>> On 06/20/2011 02:16 PM, Andreas Mueller wrote:
> >>>> Dear OE-folks,
> >>>> 
> >>>> Working with lastest classic oe master and angstrom it seems udev
> >>>> caching is not
> >>>> 
> >>>> working as expected. On *every* boot I get:
> >>>>> Remounting root file system...
> >>>>> Caching udev devnodes
> >>>>> Populating dev cachemv: can't rename '/dev/shm/uname': No such file
> >>>>> or directory
> >>>> 
> >>>> I don't know why this change came in but there was a change of storage
> >>>> location in Tom's commit few days ago [1]. To me it seems that
> >>>> 
> >>>> 1. The files created by udev (init) get lost at remount so udev-cache
> >>>> (cache) is unable to find
> >>>> 2. Since this error occures not only at first boot the recipe's
> >>>> pkg_postinst_udev_append() seems never being executed. To check I
> >>>> added a simple echo 'foo text'
> >>>> in this function but 'foo text' is not found in log of first boot.
> >>>> 
> >>>> Suggestions welcome
> >>> 
> >>> Did udev change behaviors at some point then?  I've been using an older
> >>> udev and didn't run into that problem.  I changed from /tmp to /dev/shm
> >>> since we don't know that /tmp is writable at that point so we were
> >>> instead getting errors there.  I wonder if we should just switch to
> >>> re-creating the contents for that step?
> >> 
> >> I've gone with this change and some quick testing on a board.
> > 
> > Hi Tom,
> > 
> > thanks for taking care and sorry for late response - yesterday I had one
> > of these nightmares at the job...
> > 
> > Now I tested the patch for two machines and sorry I am afraid to waste
> > your time again:
> > 
> > First machine is overo with linux-omap-psp-2.6.32 and a hub connected to
> > the OTG connector. The kernel detects USB devices at a very early boot
> > state long before udev starts (see end of file 'overo' attached). udev
> > caching seems to work without errors.
> > 
> > Second machine is tx28 with linux-2.6.38.5 (freescale imx28 based - I
> > will send patches when stable). This shows different behaviours on first
> > and all further boots (see udev-*boot attached). Problem is that after
> > second boot nothing connected to USB is detected / working. By deleting
> > /etc/udev/saved.* and rebooting all USB devices work fine and log looks
> > similar as first boot.
> > 
> > Before I merged your patch I know the USB devices were working properly
> > on tx28. Don't misunderstand me: I think before your patch cache was
> > never read. Now you fixed this and it seems reading the cache does not
> > work (on my half cooked machine only?).
> > 
> > I will have further investigations on this...
> 
> With 171 you shouldn't need caching anymore, triggering has been sped up
> considerably, could you try disable caching and see how much it impacts
> your boot time?
Uncached feels slower. Populating all devices takes 5-10s. Is there a simple way 
to create time stamps for boot messages? On the other hand: compressing and 
uncompressing the device nodes also takes significant time on my machine.

I modified the udev init script in the way that additional messages are created 
and error messages are not eaten up (see attachment). Log for cache disabled 
shows that there are some things not working properly on my new machine

| Starting udev
| make_extra_nodes
| kill_udevd
| trigger the sorted events
| starting udevd again
| cannot open /dev/null
| udev0
| FATAL: Module platform:flexcan not found.
| insmod /lib/modules/2.6.38.5/kernel/drivers/usb/host/ehci-hcd.ko 
...

I'll take some time to follow this..

Andreas

--Boundary-00=_LP8AO/dG7yBW6Vm
Content-Type: application/x-shellscript;
  name="udev"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="udev"

#!/bin/sh -e

### BEGIN INIT INFO
# Provides:          udev
# Required-Start:    mountvirtfs
# Required-Stop:     
# Default-Start:     S
# Default-Stop:
# Short-Description: Start udevd, populate /dev and load drivers.
### END INIT INFO

export TZ=/etc/localtime

[ -d /sys/class ] || exit 1
[ -r /proc/mounts ] || exit 1
[ -x /sbin/udevd ] || exit 1
[ -f /etc/default/udev ] && . /etc/default/udev
[ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf

kill_udevd() {
	echo 'kill_udevd'
        if [ -x /sbin/pidof ]; then
		echo 'exec kill_udevd1'
                pid=`/sbin/pidof -x udevd`
		echo 'exec kill_udevd2'
                [ -n "$pid" ] && kill $pid
        fi
}

export ACTION=add
# propagate /dev from /sys
echo "Starting udev"

# mount the tmpfs on /dev, if not already done
LANG=C awk "\$2 == \"/dev\" && \$3 == \"tmpfs\" { exit 1 }" /proc/mounts && {
        mount -n -o mode=0755 -t tmpfs none "/dev"
        mkdir -m 0755 /dev/pts
        mkdir -m 1777 /dev/shm
}

if [ "$DEVCACHE" != "" ]; then
	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
	[ -x /bin/uname ] && /bin/uname -mrspv > /dev/shm/uname || touch /dev/shm/uname
	[ -r /proc/cmdline ] && cat /proc/cmdline > /dev/shm/cmdline || touch /dev/shm/cmdline
	[ -r /proc/devices ] && cat /proc/devices > /dev/shm/devices || touch /dev/shm/devices
	[ -r /proc/atags ] && cat /proc/atags > /dev/shm/atags || touch /dev/shm/atags
	if [ -e $DEVCACHE ] && \
	   cmp -s /dev/shm/uname /etc/udev/saved.uname && \
	   cmp -s /dev/shm/cmdline /etc/udev/saved.cmdline && \
	   cmp -s /dev/shm/devices /etc/udev/saved.devices && \
	   cmp -s /dev/shm/atags /etc/udev/saved.atags; then
		echo 'udev writing cache -> tar...'
		(cd /; tar xf $DEVCACHE)
		not_first_boot=1
	fi
fi

if [ ! -e "/lib/modules/$(uname -r)"/modules.dep ] ; then
	echo 'uname'
	mkdir -p /lib/modules/$(uname -r)
	echo 'depmod'
	depmod -ae
fi

echo 'make_extra_nodes'
kill_udevd

        echo 'trigger the sorted events'
        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
        echo 'starting udevd again'
        /sbin/udevd -d
        echo 'udev0'

        /sbin/udevadm control --env STARTUP=1
		if [ "$not_first_boot" != "" ];then
			echo 'udev1'
			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
			echo 'udev2'
			/sbin/udevadm settle --timeout=8
			echo 'udev3'
			/sbin/udevadm control --env STARTUP=
		else
			/sbin/udevadm trigger
			/sbin/udevadm settle
		fi

exit 0

--Boundary-00=_LP8AO/dG7yBW6Vm--
