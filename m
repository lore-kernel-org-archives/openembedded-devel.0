Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tlg0p-0005C1-GO
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:18:13 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1508858dak.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 05:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=40nRXb3qTqPysC3RzbiWoqXVMJvRVhq1aFPBqfN+1k8=;
	b=y0aRVLc5uUgtsuLMRJN24RsePevMh0g4947NovE7mQpWMBi13GRO45aBqGN7GNjUZ+
	QuJfIgKljsKuCcCWqLjCffTFf/w2PCH7OVT/kWnWsWvRvJfrwl1coZiQ8LWgWA4sM1+j
	2gstQjuuq89/8YI3Tqi+m5ZNp2iPy895fbIxEgJED2yCoyDffAh4XR0HNQElKWEYCIlN
	nzcg8xIqdcs7juE4CRjJ4JXqfwWHRTe7PvUDmTk/7vsR/adzfpb/MWRxvIY+6OoLt23n
	EkVLU9PgEfsNGfbNw+MusxOj4uV/eK+VuhFS9ytBRLtI+QN3TVZSlux/t5S4aXNRPSlw
	zy5g==
X-Received: by 10.68.203.132 with SMTP id kq4mr29262942pbc.3.1356008606001;
	Thu, 20 Dec 2012 05:03:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id nm2sm5023307pbc.43.2012.12.20.05.03.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 05:03:24 -0800 (PST)
Date: Thu, 20 Dec 2012 14:03:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121220130323.GH14543@jama.palm1.palmone.com>
References: <1355312146-24370-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRT1HUF5RcEwRcCrT_XRJzHE+qA5HgeJO-smuymz90JxzQ@mail.gmail.com>
	<20121218153311.GB3331@jama.palm1.palmone.com>
	<CALbNGRSpX154UsyMo1G29G1nJ2qwvfyavO20qto5eT22YPEYnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSpX154UsyMo1G29G1nJ2qwvfyavO20qto5eT22YPEYnA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome] gvfs-gdu-volume-monitor: avoid double packaging gvfs locale
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
X-List-Received-Date: Thu, 20 Dec 2012 13:18:13 -0000
X-Groupsio-MsgNum: 42279
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1xGqyAVbSpAWs5A"
Content-Disposition: inline

--X1xGqyAVbSpAWs5A
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 01:00:47PM +0100, Andreas M=FCller wrote:
> > Btw meta-guacamayo is using newer gvfs-1.12.3 and maybe they also
> > resolved
> > http://patchwork.openembedded.org/patch/16755/
> This one was fixed in 211c2ba382d921519761bc0d241942f927cf692e

OK, thanks, I've updated status on patchwork.

> > Can you check if such upgrade would be usefull for meta-gnome too?
> > I'm not using gnome..
> Will do that hopefully before Xmas..

Great, hopefully it will also resolve latest issue with gvfs build:
| gvfsbackendafc.c: In function '_idevice_event_cb':
| gvfsbackendafc.c:352:25: error: 'idevice_event_t' has no member named 'uu=
id'
| /OE/jansa-test/shr-core/tmp-eglibc/sysroots/x86_64-linux//bin/sed -e "s|\=
@libexecdir\@|/usr/lib/gvfs|" trash.mount.in > trash.mount
| gvfsbackendafc.c: In function 'g_vfs_backend_afc_init':
| gvfsbackendafc.c:2612:3: warning: 'g_mutex_new' is deprecated (declared a=
t /OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/glib-2.0/=
glib/deprecated/gthread.h:271) [-Wdeprecated-declarations]
| daemon-main.c: In function 'daemon_init':
| daemon-main.c:66:3: warning: 'g_thread_init' is deprecated (declared at /=
OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/glib-2.0/gli=
b/deprecated/gthread.h:259) [-Wdeprecated-declarations]
| make[4]: *** [gvfsd_afc-gvfsbackendafc.o] Error 1
| make[4]: *** Waiting for unfinished jobs....
| daemon-main.c: In function 'daemon_init':
| daemon-main.c:66:3: warning: 'g_thread_init' is deprecated (declared at /=
OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/glib-2.0/gli=
b/deprecated/gthread.h:259) [-Wdeprecated-declarations]
| make[4]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/work/armv5=
te-oe-linux-gnueabi/gvfs/1.8.2-r8.0/gvfs-1.8.2/daemon'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/work/armv5=
te-oe-linux-gnueabi/gvfs/1.8.2-r8.0/gvfs-1.8.2/daemon'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/work/armv5=
te-oe-linux-gnueabi/gvfs/1.8.2-r8.0/gvfs-1.8.2/daemon'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/OE/jansa-test/shr-core/tmp-eglibc/work/armv5=
te-oe-linux-gnueabi/gvfs/1.8.2-r8.0/gvfs-1.8.2'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /OE/jansa-test/shr-core/tmp-eglib=
c/work/armv5te-oe-linux-gnueabi/gvfs/1.8.2-r8.0/temp/log.do_compile.12803 f=
or further information)
NOTE: recipe gvfs-1.8.2-r8.0: task do_compile: Failed
ERROR: Task 13097 (/OE/jansa-test/shr-core/meta-openembedded/meta-gnome/rec=
ipes-gnome/gvfs/gvfs_1.8.2.bb, do_compile) failed with exit code '1'

Or we can backport something like:
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/gnome-base/gvfs/fil=
es/gvfs-1.10.1-libimobiledevice-1.1.2.patch
and enable/disable libimobiledevice support explicitly.

Also as you're doing a lot of changes in meta-gnome and I guess you're
also using it, can you check meta-gnome issues from "[oe] [OE-core]
State of bitbake world" thread?
http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-December/04296=
4.html

Some are probably caused because building libnotify3 and libnotify
together doesn't play well with some apps, but some are pretty easy to
reproduce (like failing do_patch).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X1xGqyAVbSpAWs5A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDTDJsACgkQN1Ujt2V2gBy/tACdGCpkB4+KRNay5jYi916JTUtm
IB4AnRuGM41LxDIZwOmMWZ3gdixSMD8D
=uPcq
-----END PGP SIGNATURE-----

--X1xGqyAVbSpAWs5A--
