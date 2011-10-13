Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RELDz-0007Ao-8P for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 15:21:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1REL8S-0008NM-0H for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 15:15:44 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 15:15:43 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 15:15:43 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 13 Oct 2011 15:15:25 +0200
Message-ID: <j76o9h$504$1@dough.gmane.org>
References: <201109222337.30836.schnitzeltony@gmx.de>
	<201109251506.30431.schnitzeltony@gmx.de>
	<j6ugs9$j5b$1@dough.gmane.org>
	<201110102141.56124.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <201110102141.56124.schnitzeltony@gmx.de>
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
X-List-Received-Date: Thu, 13 Oct 2011 13:21:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 10-10-11 21:41, Andreas Müller schreef:
> On Monday, October 10, 2011 12:19:53 PM Koen Kooi wrote:
>> Op 25-09-11 15:06, Andreas Müller schreef:
>>> On Thursday, September 22, 2011 11:37:30 PM Andreas Müller wrote:
>>>> Hi
>>>> 
>>>> For my xfce-image ( lives in meta-angstrom/recipes-angstrom/images
>>>> )  I want to make use of network-manager-applet which came in meta
>>>> oe few days ago.
>>>> 
>>>> It seems that as soon as I add network-manager-applet do_rootfs
>>>> fails with something like:
>>>> 
>>>> 
>>>> | Configuring openssh-sftp. | Configuring xf86-input-evdev. | 
>>>> Configuring cpufrequtils. | Configuring systemd-compat-units. | 
>>>> Configuring gvfsd-ftp. | Collected errors: |  * extract_archive:
>>>> Cannot create symlink from ./var/run to 'volatile/run': File
>>>> exists. | + '[' '!' -z '' ']' | +
>>>> package_tryout_install_multilib_ipk | + multilib_tryout_dirs= | +
>>>> '[' '!' -z 
>>>> /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/multilib_check.py
>>>>
>>>> 
']' | | ERROR: Function 'do_rootfs' failed (see
>>>> /home/Superandy/tmp/oe-core-eglibc/work/overo-angstrom-linux-gnueabi/xfce-base-image-1.0-r0/temp/log.do_rootfs.28313
>>>>
>>>> 
for further information) NOTE: package xfce-base-image-1.0-r0: task
>>>> do_rootfs: Failed ERROR: Task 8 
>>>> (/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-angstrom/images/xfce-base-image.bb,
>>>>
>>>> 
do_rootfs) failed with exit code '1' ERROR:
>>>> '/home/Superandy/data/oe-core/sources/meta-angstrom/recipes-angstrom/images/xfce-base-image.bb'
>>>>
>>>> 
failed
>>>> 
>>> Looked around a bit for this issue. As soon as there is
>>> networkmanager included, do_rootfs fails with with something like
>>> 
>>> | Collected errors: |  * extract_archive: Cannot create symlink from 
>>> ./var/run to 'volatile/run': File exists.
>>> 
>>> In 'image'-folder of networkmanager I find a folder 
>>> 'var/run/NetworkManager'. At do_rootfs this folder has moved to 
>>> '/var/volatile/run/NetworkManager' ( see 
>>> <build>/<machine>-angstrom-linux-gnueabi/<image>-1.0-r0/rootfs/var/volatile).
>>>
>>>
>>> 
Seems as do_rootfs tries to setup a link 'var/run' where still a
>>> (remaining) folder is present - or the transition from var/run -> 
>>> var/volatile/run is somehow incomplete.
>>> 
>>> Any ideas how - or especially where to fix ( not only for
>>> networkmanager I guess ). Maybe this is an oe-core issue but there no
>>> networkmanager is available...
>> 
>> I've finally managed to reproduce this! I vaguely recall you finding
>> out some more details, could you please give a summary of your
>> finding?
>> 
>> regards,
>> 
>> koen
>> 
>> 
> Hi Koen,
> 
> In historical order trying not to cause confusion this time :-)
> 
> 1. I found a conflict between OE-Core creating /var/run-symlink by
> 'package.bbclass' together with 'meta/files/fs-perms.txt' on the one side
> and angstrom 'base-files_3.0.14.bbappend' trying to create
> /var/run-directory on the other side. I sent a patch [1] which fixed the
> issue. Unfortunately I was a bit over-enthusiastic and sent the patch
> together with [2] in a series. 2. On the first run, I recognized, that
> the second part of the series caused missing directories and wrote that
> in [3]. Here I meant to skip only the  _second_ part of the series. 3.
> You committed a workaround for /var/run issue [4]. 4. I asked if this is
> neccessary in [5]. Your comment in the source ('we do not want that')
> made me think it is mandatory to have /var/run as dir and I hoped to
> learn the reason. 5. The broken do_rootfs still scared me in [6]. 6.
> After none of the mails were responded, few days ago I decided to give
> your workaround a try, reverted my patch and - surprise - did not get an
> error on do_rootfs! So I thought I missed some magic and decided not to
> cause further noise on that.

So I did some more digging and dumped the contents of all the ipks in deploy
and here are the packages (except basefiles) that touch /var/volatile/

bind_9.7.2-P3-r0_armv7a.ipk
drwxr-xr-x root/root         0 2011-10-13 00:35 ./var/volatile/
drwxr-xr-x root/root         0 2011-10-13 00:35 ./var/volatile/run/
lrwxrwxrwx root/root         0 2011-10-13 00:35 ./var/run -> volatile/run

consolekit_0.4.5-r5_armv7a.ipk
lrwxrwxrwx root/root         0 2011-10-13 00:06 ./var/log -> volatile/log
drwxr-xr-x root/root         0 2011-10-13 00:06 ./var/volatile/
drwxr-xr-x root/root         0 2011-10-13 00:06 ./var/volatile/log/
drwxr-xr-x root/root         0 2011-10-13 00:06 ./var/volatile/log/ConsoleKit/
drwxr-xr-x root/root         0 2011-10-13 00:06 ./var/volatile/run/
drwxr-xr-x root/root         0 2011-10-13 00:06 ./var/volatile/run/ConsoleKit/
lrwxrwxrwx root/root         0 2011-10-13 00:06 ./var/run -> volatile/run

samba_3.5.6-r0_armv7a.ipk
drwxr-xr-x root/root         0 2011-10-13 00:18 ./etc/default/volatiles/
- -rw-r--r-- root/root        89 2011-10-13 00:17
./etc/default/volatiles/volatiles.03_samba
lrwxrwxrwx root/root         0 2011-10-13 00:18 ./var/log -> volatile/log
lrwxrwxrwx root/root         0 2011-10-13 00:18 ./var/lock -> volatile/lock
drwxr-xr-x root/root         0 2011-10-13 00:18 ./var/volatile/
drwxr-xr-x root/root         0 2011-10-13 00:18 ./var/volatile/log/
drwxr-xr-x root/root         0 2011-10-13 00:18 ./var/volatile/log/samba/
drwxrwxrwt root/root         0 2011-10-13 00:18 ./var/volatile/lock/
drwxr-xr-x root/root         0 2011-10-13 00:18 ./var/volatile/run/
lrwxrwxrwx root/root         0 2011-10-13 00:18 ./var/run -> volatile/run
samba-dbg_3.5.6-r0_armv7a.ipk

resolvconf_1.59-r1_all.ipk
drwxr-xr-x root/root         0 2011-10-13 00:39 ./var/volatile/
drwxr-xr-x root/root         0 2011-10-13 00:39 ./var/volatile/run/
drwxr-xr-x root/root         0 2011-10-13 00:39 ./var/volatile/run/resolvconf/
drwxr-xr-x root/root         0 2011-10-13 00:39
./var/volatile/run/resolvconf/interface/

Which makes me think the error message we get is reversed:

|  * extract_archive: Cannot create symlink from ./var/run to
'volatile/run': File exists.

I read that as: 'ln -s /var/run /var/volatile/run', but the packages above
have 'ln -s /var/volatile/run /var/run'.

Can anyone please tripplecheck my interpretation of the error message?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOluRtMkyGM64RGpERAtBuAJ4+TFhhrkNjVL7W6orZ6+10EIgifgCfZOEx
axGVAQixLwAzcMTDhrLNB+w=
=hr3N
-----END PGP SIGNATURE-----



