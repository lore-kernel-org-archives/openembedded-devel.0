Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GYuZs-0004au-K7
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Oct 2006 03:14:09 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 09EC49E0A2;
	Sun, 15 Oct 2006 11:07:31 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13522-06; Sun, 15 Oct 2006 11:07:29 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 51DC69E0A0;
	Sun, 15 Oct 2006 11:07:29 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 441E513A4741; Sun, 15 Oct 2006 11:07:29 +1000 (EST)
Date: Sun, 15 Oct 2006 11:07:29 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Message-ID: <20061015010729.GA17887@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Marcin Juszkiewicz <openembedded@hrw.one.pl>,
	openembedded-devel@lists.openembedded.org
References: <200610142209.32403.openembedded@hrw.one.pl>
Mime-Version: 1.0
In-Reply-To: <200610142209.32403.openembedded@hrw.one.pl>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Review of revision cdf57334d92107e67da0a4fcde849921042f581a
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2006 01:14:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 14, 2006 at 10:09:30PM +0200, Marcin Juszkiewicz wrote:
>=20
> Can someone look at revision cdf57334d92107e67da0a4fcde849921042f581a t=
o=20
> check my hack?

Looks wrong... you are building for arm right? With your hack and
building on i486 I get:

  | ccache i486-linux-gcc -nostdlib -nostartfiles -Wall -I. -g -fomit-fra=
me-pointer -O2 -fPIC -c -o io_getevents.ol io_getevents.c
  | io_getevents.c:43: error: redefinition of =E2=80=98io_getevents_0_4=E2=
=80=99
  | io_getevents.c:25: error: previous definition of =E2=80=98io_getevent=
s_0_4=E2=80=99 was here
  | make[1]: *** [io_getevents.ol] Error 1
  | make[1]: Leaving directory /data/oe/build/wrap-glibc/tmp/work/libaio-=
0.3.106-r1/libaio-0.3.106/src'

I think the real problem is a typo in syscall-arm.h

--- libaio-0.3.106/src/syscall-arm.h	2006/10/15 01:02:35	1.1
+++ libaio-0.3.106/src/syscall-arm.h	2006/10/15 01:02:43
@@ -97,7 +97,7 @@
 }
=20
 #define io_syscall5(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,ty=
pe4,arg4,type5,arg5)	\
-type ffname(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5) =
{\
+type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5) {=
\
   __SYS_REG(sname)							\
   register long __r0 __asm__("r0") =3D (long)arg1;			\
   register long __r1 __asm__("r1") =3D (long)arg2;			\

This file is added by 00_arches.patch. So updating that patch with
the one line change above should be enough.

--=20
 Jamie Lenehan <lenehan@twibble.org>


