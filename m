Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URlMo-0008BT-Fa
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 17:30:57 +0200
Received: by mail-ee0-f41.google.com with SMTP id c1so2373762eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=2Zp8smFJWbXGu2u4lRiAadq+F8Q3wOUbUSNF2xBL1l4=;
	b=LgPp2bLsOS0BA5Es5ODPL3dxk+2lNrRakvtfyIcdjiS3NYdSRhNYcY3pw9fWN1pvN1
	KlFiikuhhuR0zOj3B7BAwFvzERJjzTG7AryykehXi/lmYEwCAhhCim2tpCh+uSVWK33H
	KPI3MD3MF/XdYPxLagjZ2QfjaHz1tQBqn3TWzEir+pRKwOlWo6JHlVqVYQe+78weiBm6
	zyManx2nGsWB1krR/hE39g3VzD8k/3nJMZzQuBBecQFzmgbNv18DXdLupsGCInXvceSs
	nMFjjvJqucElskDF2/9VOyMSfIATizuAkgOkd6P2V0fVGqvaVVMO3yNAM/7gOkDlZsC8
	BbNA==
X-Received: by 10.15.76.132 with SMTP id n4mr62816386eey.16.1366038801678;
	Mon, 15 Apr 2013 08:13:21 -0700 (PDT)
Received: from ?IPv6:2001:610:612::cca6:34a:e25:a440?
	([2001:610:612:0:cca6:34a:e25:a440])
	by mx.google.com with ESMTPS id bj2sm27415939eeb.1.2013.04.15.08.13.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 08:13:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LY7XoYcC9F0N2qCPzQRF6-VPkR+MZUDvfMP=NNUp9a6LA@mail.gmail.com>
Date: Mon, 15 Apr 2013 17:13:20 +0200
Message-Id: <695A7205-3EAB-4CEC-82E3-3455F19D0024@dominion.thruhere.net>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<kkh3q2$gl0$1@ger.gmane.org>
	<CAJTo0LY7XoYcC9F0N2qCPzQRF6-VPkR+MZUDvfMP=NNUp9a6LA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmICSNm2sVmXB+PK5AZ4n7IBekRez6dGxYqZJBDU0rzmVl7UrxQXyCHY/qI4UXufJjw2hao
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world
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
X-List-Received-Date: Mon, 15 Apr 2013 15:31:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 16:52 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 15 April 2013 15:45, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Speaking of GNOME, I noticed that I have to manually (re)run postinst =
for
>> gconf schemas after first boot to get the apps to work. Is anyone =
seeing the
>> same?
>=20
> Urgh.  No.  There was recent changes (breakage/fixage) to the postinst
> stuff, are you totally up to date?

I was at 6af6df6, the changes since that are:

[koen@rrMBP openembedded-core]$ git log --oneline 6af6df6..a608d74
a608d74 initramfs-live-boot: explicitly depend on udev-extraconf
15a9136 systemd: fix bootup with 'ro' by re-adding util-linux-mount to =
RDEPENDS
929c738 busybox: Add inetd related files
5c088c2 busybox: detects customized configs when do_install
087a680 allarch: Drop various problematic allarch usages
bcd68f1 nfs-export-root: Update to use packagegroup naming
7f72562 qemuwrapper-cross: Inhibit default dependencies
71b3a15 encodings: Set RDEPENDS correctly
00cc684 ttf-bitstream-vera: Use fontcache class for postinstall
1fa8909 update-alternatives: Ensure DEPENDS is correct in multilib case
1392f95 kernel.bbclass: Ensure we have correct version information in =
deploy data
10f64d2 oe.terminal: add tmux classes
6c97259 rpm-postinsts: remove erroneous call to /etc/default/rcS
be21829 udev-extraconf: Add -o silent to auto mount for mount.util-linux
dfb0c2c qemu: define fdt_t types in libfdt_env.h from qemu
ff0fd25 initrdscripts: look for new systemd-udevd location
d612ca2 systemd: move the binaries to /sbin/systemd
b847f87 hello-mod: Ensure the produced package name begins with =
kernel-module-
1a1927f package/image.bbclass: Fix multilib rprovides
46b00fd classes/sanity: fix handling of bblayers.conf updating
6310e66 multilib.conf: Workaround opkg multilib issues
4f85bb5 udev: Update initscript to check for devtmpfs
ce1d262 gdk-pixbuf: Fix libpng determinism issues

that doesn't seem to have postinst fixed for opkg based systems.=


