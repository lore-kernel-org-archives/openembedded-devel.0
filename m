Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDD3I-0006lG-VE for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 12:25:45 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDCxq-0006A4-BA for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 12:20:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Oct 2011 12:20:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Oct 2011 12:20:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 10 Oct 2011 12:19:53 +0200
Message-ID: <j6ugs9$j5b$1@dough.gmane.org>
References: <201109222337.30836.schnitzeltony@gmx.de>
	<201109251506.30431.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
In-Reply-To: <201109251506.30431.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe] do_rootfs fails with networkmanager (was network-manager-applet) included
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
X-List-Received-Date: Mon, 10 Oct 2011 10:25:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 25-09-11 15:06, Andreas Müller schreef:
> On Thursday, September 22, 2011 11:37:30 PM Andreas Müller wrote:
>> Hi
>> 
>> For my xfce-image ( lives in meta-angstrom/recipes-angstrom/images )  I
>> want to make use of network-manager-applet which came in meta oe few
>> days ago.
>> 
>> It seems that as soon as I add network-manager-applet do_rootfs fails
>> with something like:
>> 
>> 
>> | Configuring openssh-sftp. | Configuring xf86-input-evdev. |
>> Configuring cpufrequtils. | Configuring systemd-compat-units. |
>> Configuring gvfsd-ftp. | Collected errors: |  * extract_archive: Cannot
>> create symlink from ./var/run to 'volatile/run': File exists. | + '['
>> '!' -z '' ']' | + package_tryout_install_multilib_ipk | +
>> multilib_tryout_dirs= | + '[' '!' -z
>> /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/multilib_check.py
>> ']' | | ERROR: Function 'do_rootfs' failed (see
>> /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/temp/log.do_rootfs.28313
>> for further information) NOTE: package xfce-base-image-1.0-r0: task
>> do_rootfs: Failed ERROR: Task 8
>> (/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-angstrom/images/xfce-base-image.bb,
>> do_rootfs) failed with exit code '1' ERROR:
>> '/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-angstrom/images/xfce-base-image.bb'
>> failed
>> 
> Looked around a bit for this issue. As soon as there is networkmanager
> included, do_rootfs fails with with something like
> 
> | Collected errors: |  * extract_archive: Cannot create symlink from
> ./var/run to 'volatile/run': File exists.
> 
> In 'image'-folder of networkmanager I find a folder
> 'var/run/NetworkManager'. At do_rootfs this folder has moved to
> '/var/volatile/run/NetworkManager' ( see
> <build>/<machine>-angstrom-linux-gnueabi/<image>-1.0-r0/rootfs/var/volatile).
>
>  Seems as do_rootfs tries to setup a link 'var/run' where still a
> (remaining) folder is present - or the transition from var/run ->
> var/volatile/run is somehow incomplete.
> 
> Any ideas how - or especially where to fix ( not only for networkmanager
> I guess ). Maybe this is an oe-core issue but there no networkmanager is
> available...

I've finally managed to reproduce this! I vaguely recall you finding out
some more details, could you please give a summary of your finding?

regards,

koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOksbJMkyGM64RGpERAhrXAJ9rz3mPT5cev0cKfmvE/W5aWv+mBQCfSX37
+II5Fpycl0X+ndD8nBwOd5g=
=Xy3M
-----END PGP SIGNATURE-----



