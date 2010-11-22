Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PKV7Y-0003zM-EN
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 13:03:45 +0100
Received: by wyb40 with SMTP id 40so82931wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 04:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=A8acyC8UiDRTB2JZFyI2tnhx93AQzGIJeyWNqoZmhTI=;
	b=JT8wZOycme9WiOLYlDyq01V8ul9BUkT5Bdce+5Exw1v9ui4o3i5dQEZDlngrY73klx
	hd+EC2pfnfaXfl1t9aJ7MjrGa6Bg2RQKNax44AALt649esU5qF8OZgFUYgaV8C6BN/5e
	f3oVCd0m7fNTRJngSyMacnNbIlSl26EPlmeJM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ys+N68SBRDsOFQbkAci2jV2h/bQojg+t8jNXxrkRBLmMqcuYu5wKyBH3m14BEQ3KcG
	oYovk2JRuxJWIdhfHWDF44q/wfO4sZirEs7eTkLWctGhMUBTChJwZmV4mpacuGS6EpLM
	LU2H1U3wJ13Z4BDODmBO4MM7PgD8R5h3L1Npk=
MIME-Version: 1.0
Received: by 10.227.147.129 with SMTP id l1mr5787203wbv.55.1290427349306; Mon,
	22 Nov 2010 04:02:29 -0800 (PST)
Received: by 10.227.154.13 with HTTP; Mon, 22 Nov 2010 04:02:29 -0800 (PST)
In-Reply-To: <1290248944-13342-1-git-send-email-Martin.Jansa@gmail.com>
References: <1290248944-13342-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 22 Nov 2010 13:02:29 +0100
Message-ID: <AANLkTinfgjppRu8VZPG0H_BsVZEtkeOyNW9reHYyN3YS@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eglibc packaging broken, too much stuff in eglibc-dev
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
X-List-Received-Date: Mon, 22 Nov 2010 12:03:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 20, 2010 at 11:29 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> Hi, not sure if this happens only with DISTRO=3Dmicro (I haven't noticed
> it with SHR, but here is size of packages before (.old) and after applyin=
g
> following patch.
>
> Sideeffect of this issue is this:
> 09:10:18 < JaMa|Off> hmm any idea why I got:
> 09:10:18 < JaMa|Off> Package: libc6
> 09:10:18 < JaMa|Off> Version: 2.12-r15.7+svnr11982
> 09:10:18 < JaMa|Off> Depends: libc6-dev
> 09:10:28 < JaMa|Off> with micro/spitz?
> 09:11:58 < JaMa|Off> it's probably because libc6-dev has more files than =
it should have :/ ie:
> 09:12:00 < JaMa|Off> | =A0* check_data_file_clashes: Package libc-extra-n=
ss wants to install file /OE/tmpdir-micro/rootfs/minimal-image/lib/libnss_n=
isplus.so.2
> 09:12:00 < JaMa|Off> | =A0 =A0 =A0 But that file is already provided by p=
ackage =A0* libc6-dev
>
>
> bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ du -hs eglibc=
-2.12-r15.7+svnr11982.old/packages-split/* | grep -v locale | grep -v gconv=
 | grep -v charmap
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/catchsegv
> 2.4M =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc
> 357M =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-dbg
> 209M =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-dev
> ^^^^
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-dev.shl=
ibdeps
> 3.8M =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-doc
> 0 =A0 =A0 =A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra=
-nss
> ^^^^
> 0 =A0 =A0 =A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-pcpro=
file
> 202M =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-pic
> 0 =A0 =A0 =A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-stati=
c
> 0 =A0 =A0 =A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-threa=
d-db
> 893K =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-utils
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-utils.s=
hlibdeps
> 8.0K =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/ldd
> 0 =A0 =A0 =A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/libcidn
> 0 =A0 =A0 =A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/libmemusage
> 0 =A0 =A0 =A0 eglibc-2.12-r15.7+svnr11982.old/packages-split/libsegfault
> 112K =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/nscd
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/nscd.shlibdeps
> 428K =A0 =A0eglibc-2.12-r15.7+svnr11982.old/packages-split/sln
> bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ du -hs eglibc=
-2.12-r15.7+svnr11982/packages-split/* | grep -v locale | grep -v gconv | g=
rep -v charmap
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/catchsegv
> 2.4M =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc
> 357M =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-dbg
> 3.1M =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-dev
> ^^^^
> 3.8M =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-doc
> 100K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss
> ^^^^
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss.s=
hlibdeps
> 8.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pcprofile
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pcprofile.s=
hlibdeps
> 202M =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pic
> 205M =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-static
> 28K =A0 =A0 eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-thread-db
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-thread-db.s=
hlibdeps
> 893K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-utils
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-utils.shlib=
deps
> 8.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/ldd
> 180K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/libcidn
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/libcidn.shlibdeps
> 20K =A0 =A0 eglibc-2.12-r15.7+svnr11982/packages-split/libmemusage
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/libmemusage.shlibd=
eps
> 12K =A0 =A0 eglibc-2.12-r15.7+svnr11982/packages-split/libsegfault
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/libsegfault.shlibd=
eps
> 112K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/nscd
> 4.0K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/nscd.shlibdeps
> 428K =A0 =A0eglibc-2.12-r15.7+svnr11982/packages-split/sln
>
> eglibc-extra-nss detail (interesting that what was only link to nonexiste=
nt file before is now
> real file, maybe that's because ${libdir} ${base_libdir} points to same d=
ir in micro and files
> are overwritten during install?
>
> bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ ls -lR eglibc=
-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss
> eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss:
> total 0
> drwxr-xr-x 2 bitbake bitbake 160 Nov 20 09:22 lib
>
> eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss/lib:
> total 0
> lrwxrwxrwx 1 bitbake bitbake 23 Nov 20 09:22 libnss_hesiod.so.2 -> libnss=
_hesiod-2.12.1.so
> lrwxrwxrwx 1 bitbake bitbake 20 Nov 20 09:22 libnss_nis.so.2 -> libnss_ni=
s-2.12.1.so
> lrwxrwxrwx 1 bitbake bitbake 24 Nov 20 09:22 libnss_nisplus.so.2 -> libns=
s_nisplus-2.12.1.so
>
> bitbake@jama ~/tmpdir-micro/work/armv5te-oe-linux-gnueabi $ ls -lR eglibc=
-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss
> eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss:
> total 0
> drwxr-xr-x 2 bitbake bitbake 360 Nov 20 09:42 lib
>
> eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss/lib:
> total 100
> lrwxrwxrwx 1 bitbake bitbake =A0 =A018 Nov 20 09:42 libnss_compat.so -> l=
ibnss_compat.so.2
> lrwxrwxrwx 1 bitbake bitbake =A0 =A015 Nov 20 09:42 libnss_dns.so -> libn=
ss_dns.so.2
> lrwxrwxrwx 1 bitbake bitbake =A0 =A017 Nov 20 09:42 libnss_files.so -> li=
bnss_files.so.2
> lrwxrwxrwx 1 bitbake bitbake =A0 =A018 Nov 20 09:42 libnss_hesiod.so -> l=
ibnss_hesiod.so.2
> -rwxr-xr-x 1 bitbake bitbake 13840 Nov 20 09:41 libnss_hesiod.so.2
> lrwxrwxrwx 1 bitbake bitbake =A0 =A015 Nov 20 09:42 libnss_nis.so -> libn=
ss_nis.so.2
> -rwxr-xr-x 1 bitbake bitbake 38496 Nov 20 09:41 libnss_nis.so.2
> lrwxrwxrwx 1 bitbake bitbake =A0 =A019 Nov 20 09:42 libnss_nisplus.so -> =
libnss_nisplus.so.2
> -rwxr-xr-x 1 bitbake bitbake 42588 Nov 20 09:41 libnss_nisplus.so.2
>
> Following patch was tested only with micro and maybe it's not correct at =
all, that's why it's just RFC.
>
> Regards,

Here is the same for SHR/eglibc build (to test it also with not-collapsed /=
usr).

bitbake@jama ~/tmpdir-shr/work $ du -hs
eglibc-2.12-r15.7+svnr11982.old/packages-split/* | grep -v locale |
grep -v gconv | grep -v charmap
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/catchsegv
3.0M    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc
357M    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-dbg
208M    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-dev
3.8M    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-doc
100K    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss.shl=
ibdeps
8.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-pcprofile
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-pcprofile.shl=
ibdeps
201M    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-pic
0       eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-static
28K     eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-thread-db
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-thread-db.shl=
ibdeps
340K    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-utils
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-utils.shlibde=
ps
8.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/ldd
180K    eglibc-2.12-r15.7+svnr11982.old/packages-split/libcidn
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/libcidn.shlibdeps
20K     eglibc-2.12-r15.7+svnr11982.old/packages-split/libmemusage
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/libmemusage.shlibdep=
s
12K     eglibc-2.12-r15.7+svnr11982.old/packages-split/libsegfault
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/libsegfault.shlibdep=
s
112K    eglibc-2.12-r15.7+svnr11982.old/packages-split/nscd
4.0K    eglibc-2.12-r15.7+svnr11982.old/packages-split/nscd.shlibdeps
428K    eglibc-2.12-r15.7+svnr11982.old/packages-split/sln

bitbake@jama ~/tmpdir-shr/work $ du -hs
eglibc-2.12-r15.7+svnr11982/packages-split/* | grep -v locale | grep
-v gconv | grep -v charmap
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/catchsegv
3.0M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc
357M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-dbg
3.1M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-dev
3.8M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-doc
100K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss.shlibde=
ps
8.0K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pcprofile
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pcprofile.shlibde=
ps
201M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-pic
205M    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-static
28K     eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-thread-db
4.0K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-thread-db.shlibde=
ps
340K    eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-utils
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

bitbake@jama ~/tmpdir-shr/work $  ls -lR
eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss
eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss:
total 0
drwxr-xr-x 2 bitbake bitbake 280 Nov 22 10:53 lib

eglibc-2.12-r15.7+svnr11982.old/packages-split/eglibc-extra-nss/lib:
total 100
-rwxr-xr-x 1 bitbake bitbake 13840 Nov 22 10:52 libnss_hesiod-2.12.1.so
lrwxrwxrwx 1 bitbake bitbake    23 Nov 22 10:53 libnss_hesiod.so.2 ->
libnss_hesiod-2.12.1.so
-rwxr-xr-x 1 bitbake bitbake 38496 Nov 22 10:52 libnss_nis-2.12.1.so
lrwxrwxrwx 1 bitbake bitbake    20 Nov 22 10:53 libnss_nis.so.2 ->
libnss_nis-2.12.1.so
-rwxr-xr-x 1 bitbake bitbake 42588 Nov 22 10:52 libnss_nisplus-2.12.1.so
lrwxrwxrwx 1 bitbake bitbake    24 Nov 22 10:53 libnss_nisplus.so.2 ->
libnss_nisplus-2.12.1.so
bitbake@jama ~/tmpdir-shr/work $  ls -lR
eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss
eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss:
total 0
drwxr-xr-x 2 bitbake bitbake 168 Nov 22 11:27 lib

eglibc-2.12-r15.7+svnr11982/packages-split/eglibc-extra-nss/lib:
total 100
-rwxr-xr-x 1 bitbake bitbake 13840 Nov 22 11:27 libnss_hesiod-2.12.1.so
-rwxr-xr-x 1 bitbake bitbake 38496 Nov 22 11:27 libnss_nis-2.12.1.so
-rwxr-xr-x 1 bitbake bitbake 42588 Nov 22 11:27 libnss_nisplus-2.12.1.so

Not sure if those .so are enough (cannot find any package linked to it
now) or if it's linked against ie libnss_nis.so.2, but if someone can
confirm it's enough I'll push that patch (with INC_PR bump).


