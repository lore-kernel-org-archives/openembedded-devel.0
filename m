Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PJki0-00007S-Ox
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 11:30:17 +0100
Received: by fxm11 with SMTP id 11so3501331fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 02:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=CnUaw83BbMMdjpyleN9Wpdcfn4d+Fwb67kqmEJ2Qj/0=;
	b=ACOeqdkoHGkdbeLDCefEGsyStusAiHhrfiLUjDaMTYbhN2e0xXyvbG23UuCqYuxWnc
	paq8gk/o/qfeqI00APElGwadfzj/bJax+wBiqf8hSXSk/VDl7Fo1+ZNIa757V7EwLXev
	8SAUHVbrxgY3ab7uQmQ35O75bfgaR543JI+7w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=ladu/pGnOcwR3DS0H4DZIIOAy362sZuu7Iel+C+QMzRIKCPZIR8/BVfFEhMMrfREVl
	lxdquPizdZMGjC+8deelbRDX4fLIv6yQwAPhJ1hu3FZRUwmGLLDOscyGk+s7pUZ5Yjwf
	95Nh3QqVvYkYbAl8nRg4Glt6ViZQx18HitW0A=
Received: by 10.223.73.207 with SMTP id r15mr736927faj.141.1290248944729;
	Sat, 20 Nov 2010 02:29:04 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l23sm785076fam.43.2010.11.20.02.29.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 20 Nov 2010 02:29:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Nov 2010 11:29:03 +0100
Message-Id: <1290248944-13342-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: eglibc packaging broken, too much stuff in eglibc-dev
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
X-List-Received-Date: Sat, 20 Nov 2010 10:30:18 -0000

Hi, not sure if this happens only with DISTRO=micro (I haven't noticed 
it with SHR, but here is size of packages before (.old) and after applying
following patch.

Sideeffect of this issue is this:
09:10:18 < JaMa|Off> hmm any idea why I got:
09:10:18 < JaMa|Off> Package: libc6
09:10:18 < JaMa|Off> Version: 2.12-r15.7+svnr11982
09:10:18 < JaMa|Off> Depends: libc6-dev
09:10:28 < JaMa|Off> with micro/spitz?
09:11:58 < JaMa|Off> it's probably because libc6-dev has more files than it should have :/ ie:
09:12:00 < JaMa|Off> |  * check_data_file_clashes: Package libc-extra-nss wants to install file /OE/tmpdir-micro/rootfs/minimal-image/lib/libnss_nisplus.so.2
09:12:00 < JaMa|Off> |       But that file is already provided by package  * libc6-dev


bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ du -hs eglibc-2.12-r15.7+svnr11982.old/packages-split/* | grep -v locale | grep -v gconv | grep -v charmap
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/catchsegv
2.4M    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc
357M    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-dbg
209M    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-dev
^^^^
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-dev.shlibdeps
3.8M    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-doc
0       eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss
^^^^
0       eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-pcprofile
202M    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-pic
0       eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-static
0       eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-thread-db
893K    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-utils
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-utils.shlibdeps
8.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/ldd
0       eglibc-2.12-r15.7+svnr11982.old/packages-split/libcidn
0       eglibc-2.12-r15.7+svnr11982.old/packages-split/libmemusage
0       eglibc-2.12-r15.7+svnr11982.old/packages-split/libsegfault
112K    eglibc-2.12-r15.7+svnr11982.old/packages-split/nscd
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/nscd.shlibdeps
428K    eglibc-2.12-r15.7+svnr11982.old/packages-split/sln
bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ du -hs eglibc-2.12-r15.7+svnr11982/packages-split/* | grep -v locale | grep -v gconv | grep -v charmap
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/catchsegv
2.4M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc
357M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-dbg
3.1M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-dev
^^^^
3.8M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-doc
100K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss
^^^^
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss.shlibdeps
8.0K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pcprofile
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pcprofile.shlibdeps
202M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pic
205M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-static
28K     eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-thread-db
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-thread-db.shlibdeps
893K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-utils
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-utils.shlibdeps
8.0K    eglibc-2.12-r15.7+svnr11982/packages-split/ldd
180K    eglibc-2.12-r15.7+svnr11982/packages-split/libcidn
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/libcidn.shlibdeps
20K     eglibc-2.12-r15.7+svnr11982/packages-split/libmemusage
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/libmemusage.shlibdeps
12K     eglibc-2.12-r15.7+svnr11982/packages-split/libsegfault
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/libsegfault.shlibdeps
112K    eglibc-2.12-r15.7+svnr11982/packages-split/nscd
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/nscd.shlibdeps
428K    eglibc-2.12-r15.7+svnr11982/packages-split/sln

eglibc-extra-nss detail (interesting that what was only link to nonexistent file before is now 
real file, maybe that's because ${libdir} ${base_libdir} points to same dir in micro and files
are overwritten during install?

bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ ls -lR eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss
eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss:
total 0
drwxr-xr-x 2 bitbake bitbake 160 Nov 20 09:22 lib

eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss/lib:
total 0
lrwxrwxrwx 1 bitbake bitbake 23 Nov 20 09:22 libnss_hesiod.so.2 -> libnss_hesiod-2.12.1.so
lrwxrwxrwx 1 bitbake bitbake 20 Nov 20 09:22 libnss_nis.so.2 -> libnss_nis-2.12.1.so
lrwxrwxrwx 1 bitbake bitbake 24 Nov 20 09:22 libnss_nisplus.so.2 -> libnss_nisplus-2.12.1.so

bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ ls -lR eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss
eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss:
total 0
drwxr-xr-x 2 bitbake bitbake 360 Nov 20 09:42 lib

eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss/lib:
total 100
lrwxrwxrwx 1 bitbake bitbake    18 Nov 20 09:42 libnss_compat.so -> libnss_compat.so.2
lrwxrwxrwx 1 bitbake bitbake    15 Nov 20 09:42 libnss_dns.so -> libnss_dns.so.2
lrwxrwxrwx 1 bitbake bitbake    17 Nov 20 09:42 libnss_files.so -> libnss_files.so.2
lrwxrwxrwx 1 bitbake bitbake    18 Nov 20 09:42 libnss_hesiod.so -> libnss_hesiod.so.2
-rwxr-xr-x 1 bitbake bitbake 13840 Nov 20 09:41 libnss_hesiod.so.2
lrwxrwxrwx 1 bitbake bitbake    15 Nov 20 09:42 libnss_nis.so -> libnss_nis.so.2
-rwxr-xr-x 1 bitbake bitbake 38496 Nov 20 09:41 libnss_nis.so.2
lrwxrwxrwx 1 bitbake bitbake    19 Nov 20 09:42 libnss_nisplus.so -> libnss_nisplus.so.2
-rwxr-xr-x 1 bitbake bitbake 42588 Nov 20 09:41 libnss_nisplus.so.2

Following patch was tested only with micro and maybe it's not correct at all, that's why it's just RFC.

Regards,



