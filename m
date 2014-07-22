Return-Path: <kapare@rogue-research.com>
Received: from mail.rogue-research.com (mail.rogue-research.com [68.67.54.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6AC16707D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 23:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.rogue-research.com (Postfix) with ESMTP id B24C63B6F58F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:07:09 -0400 (EDT)
X-Virus-Scanned: amavisd-new at rogue-research.com
Received: from mail.rogue-research.com ([127.0.0.1])
	by localhost (kingu.rogue-research.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 1IoJ2o5sCD4i
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:07:02 -0400 (EDT)
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.rogue-research.com (Postfix) with ESMTPSA id 41ED23B6F580
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:07:02 -0400 (EDT)
Received: by mail-vc0-f180.google.com with SMTP id ij19so694205vcb.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 16:07:01 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.52.34.46 with SMTP id w14mr21454189vdi.64.1406070421501;
	Tue, 22 Jul 2014 16:07:01 -0700 (PDT)
Received: by 10.58.237.200 with HTTP; Tue, 22 Jul 2014 16:07:01 -0700 (PDT)
Date: Tue, 22 Jul 2014 19:07:01 -0400
Message-ID: <CACgAsMdT_ZUw+z2qQ0CghqLYmKDUybwDYwvHwqu7N5SO6yqWYg@mail.gmail.com>
From: =?UTF-8?Q?Kevyn=2DAlexandre_Par=C3=A9?= <kapare@rogue-research.com>
To: openembedded-devel@lists.openembedded.org, 
	Yocto discussion list <yocto@yoctoproject.org>
Subject: [Yocto 1.6] PAM _pam_load_conf_file: unable to open /etc/pam.d/system-auth
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jul 2014 23:07:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Just trying to found what's missing for PAM to work so ssh will stop
exiting with Broken pipe? Quick fix to solve ssh broken pipe is to
change in /etc/ssh/sshd_config "UsePAM yes" to "UsePAM no". But this
does not remove my PAM error?

Here the log for PAM:
root@ka:~$  journalctl | grep -i PAM
Jan 01 00:00:11 ka systemd[1]: systemd 211 running in system mode.
(+PAM +LIBWRAP -AUDIT -SELINUX +IMA +SYSVINIT -LIBCRYPTSETUP -GCRYPT
+ACL +XZ -SECCOMP -APPARMOR)
Jan 01 00:00:16 ka kernel[116]: [    4.918701] systemd[1]: systemd 211
running in system mode. (+PAM +LIBWRAP -AUDIT -SELINUX +IMA +SYSVINIT
-LIBCRYPTSETUP -GCRYPT +ACL +XZ -SE
CCOMP -APPARMOR)
Jan 01 00:40:22 ka login[132]: pam_unix(login:account): account root
has password changed in future
Jan 01 00:40:22 ka login[132]: pam_lastlog(login:session): file
/var/log/lastlog created
Jan 01 00:40:22 ka login[132]: pam_unix(login:session): session opened
for user root by LOGIN(uid=0)
Jan 01 00:40:22 ka systemd[194]: PAM _pam_load_conf_file: unable to
open /etc/pam.d/system-auth
Jan 01 00:40:22 ka systemd[194]: PAM _pam_load_conf_file: unable to
open /etc/pam.d/system-auth
Jan 01 00:40:22 ka systemd[194]: Failed at step PAM spawning
/lib/systemd/systemd: Operation not permitted

So my image contain pam:
bitbake -e nirs-console-image | grep ^DISTRO_FEATURES=
DISTRO_FEATURES="alsa argp bluetooth ext2 irda largefile pcmcia
usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ipv4 ipv6
libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets
libc-charsets libc-crypt
libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg
libc-fstab libc-ftraverse
libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales
libc-locale-code                                        libc-memusage
libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn
libc-streams libc-sunrpc         libc-utmp libc-utmpx libc-wordexp
libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc
                                libc-posix-wchar-io largefile opengl
ptest multiarch wayland pulseaudio systemd pam"

Any clue or advise on how to fix this and why it's not working?

BR,

-KA

