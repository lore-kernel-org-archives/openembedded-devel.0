Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OxvdA-0003Cd-LH
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 07:43:06 +0200
Received: by iwn2 with SMTP id 2so4981866iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 22:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=K9VvEyHt1a2LpD0qgT3ORdrHlFNmJDvCMz/dY7WZIzY=;
	b=vAt6ApYHPrn/KmJx85AQ+bJOLpOZEpIfc//IHMiecF6PpgIj0MQkh0l0feY2c83/HI
	jK0oq9LyBdycNLn7BSbE1Rgd2Z/EV/kwHq/SIFaiQOXyfCjAT+xSRIDIncot1dKkQGFb
	KzfnjD9thpsWevQCgC+5aPzOOOZmYIcrPzqeY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=YNaHKsThIgCTC4E33is9QvEHz+iLUrKf5wIH5EQ7hd9O0SCW+7yd8Lnf87OPytWjC0
	q2CIjbPhBpP8TzsbuWVndWknh2ul7AUhGJydI9c94S8lxJf9tQDZ2+Z8Lrs+fa5YmUag
	xeNgwIDvt2HyyZqIwQPDoqJVFMyuPJ27miDPU=
Received: by 10.231.154.75 with SMTP id n11mr11185332ibw.40.1285047782284;
	Mon, 20 Sep 2010 22:43:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Mon, 20 Sep 2010 22:42:42 -0700 (PDT)
In-Reply-To: <20100921051747.GA3989@thinky>
References: <1284228112.14396.159.camel@mattotaupa>
	<1285021068.2453.80.camel@mattotaupa>
	<20100921051747.GA3989@thinky>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Sep 2010 22:42:42 -0700
Message-ID: <AANLkTim6_S3DW_U5V3P0HkFTcAsSWqbu3T5q2UWPajKE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-uclibc: freesmartphone/libfsobasics_git.bb: do_compile() failed: utilities.c:35:22: fatal error: execinfo.h: No such file or directory
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
X-List-Received-Date: Tue, 21 Sep 2010 05:43:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2010 at 10:17 PM, Frederik Sdun
<frederik.sdun@googlemail.com> wrote:
> * Paul Menzel <paulepanter@users.sourceforge.net> [21.09.2010 00:18]:
>> Am Samstag, den 11.09.2010, 20:01 +0200 schrieb Paul Menzel:
>>
>> [=E2=80=A6]
>>
>> > `do_compile()` of `freesmartphone/libfsobasics_git.bb` fails for me
>> > reliably since today. As with my other reported failure of gtk+ [1]
>> > nothing was changed regarding this recipe in the last days and it work=
ed
>> > for me before. Even yesterday because I could build gtk+ which is
>> > supposed to happen after `libfsobasics_git.bb`. But several things get
>> > build in parallel so that statement could be wrong.
>> >
>> > Minimal compiles fine with EGLIBC and glibc.
>> >
>> > =C2=A0 =C2=A0 $ find . -name execinfo.h
>> >
>> > did not return anything in my build directory.
>> >
>> > =C2=A0 =C2=A0 $ more log.do_compile
>> > =C2=A0 =C2=A0 NOTE: make
>> > =C2=A0 =C2=A0 make =C2=A0all-recursive
>> > =C2=A0 =C2=A0 make[1]: Entering directory `/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr=
0+b163e36f9c960c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics'
>> > =C2=A0 =C2=A0 Making all in fsobasics
>> > =C2=A0 =C2=A0 make[2]: Entering directory `/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr=
0+b163e36f9c960c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
>> > =C2=A0 =C2=A0 /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i68=
6-linux/usr/bin/valac -C --basedir .. --vapidir ../vapi --pkg posix --pkg l=
inux --pkg libnl-2.0 --pkg glib-2.0 --pkg gio-2.0 --header fsobasics.h --li=
brary fsobasics-2.0 =C2=A0asyncworker.vala inotifier.vala kobjectnotifier.v=
ala libinitexit.vala logger.vala netlinknotifier.vala netlinkutils.vala ove=
rlay.vala process.vala smartkeyfile.vala syncasync.vala threading.vala type=
s.vala utilities.vala
>> > =C2=A0 =C2=A0 fsobasics/logger.vala:300.17-300.33: warning: unreachabl=
e code detected
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return "UNKNOWN";
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^^^^^^^^^^^^^^^^^
>> > =C2=A0 =C2=A0 fsobasics/smartkeyfile.vala:117.13-117.25: warning: unre=
achable code detected
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return false;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^^^^^^^^^^^^^
>> > =C2=A0 =C2=A0 Compilation succeeded - 2 warning(s)
>> > =C2=A0 =C2=A0 touch fsobasics.vala.stamp
>> > =C2=A0 =C2=A0 make =C2=A0all-am
>> > =C2=A0 =C2=A0 make[3]: Entering directory `/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr=
0+b163e36f9c960c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 asyncworker=
.lo
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 inotifier.l=
o
>> > =C2=A0 =C2=A0 inotifier.c: In function 'fso_framework_inotifier_constr=
uct':
>> > =C2=A0 =C2=A0 inotifier.c:173:2: warning: passing argument 4 of 'g_has=
h_table_new_full' from incompatible pointer type
>> > =C2=A0 =C2=A0 /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expe=
cted 'GDestroyNotify' but argument is of type 'void (*)(struct INotifyDeleg=
ateHolder *)'
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 kobjectnoti=
fier.lo
>> > =C2=A0 =C2=A0 kobjectnotifier.c: In function 'fso_framework_base_kobje=
ct_notifier_construct':
>> > =C2=A0 =C2=A0 kobjectnotifier.c:182:2: warning: passing argument 4 of =
'g_hash_table_new_full' from incompatible pointer type
>> > =C2=A0 =C2=A0 /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expe=
cted 'GDestroyNotify' but argument is of type 'void (*)(struct GList *)'
>> > =C2=A0 =C2=A0 kobjectnotifier.c:183:2: warning: passing argument 4 of =
'g_hash_table_new_full' from incompatible pointer type
>> > =C2=A0 =C2=A0 /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expe=
cted 'GDestroyNotify' but argument is of type 'void (*)(struct GList *)'
>> > =C2=A0 =C2=A0 kobjectnotifier.c:184:2: warning: passing argument 4 of =
'g_hash_table_new_full' from incompatible pointer type
>> > =C2=A0 =C2=A0 /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expe=
cted 'GDestroyNotify' but argument is of type 'void (*)(struct GList *)'
>> > =C2=A0 =C2=A0 kobjectnotifier.c:188:52: warning: passing argument 2 of=
 'bind' from incompatible pointer type
>> > =C2=A0 =C2=A0 /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/include/sys/socket.h:115:12: note: expected 'co=
nst struct sockaddr *' but argument is of type 'struct sockaddr_nl *'
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 libinitexit=
.lo
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 logger.lo
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 netlinknoti=
fier.lo
>> > =C2=A0 =C2=A0 netlinknotifier.c: In function 'fso_framework_base_netli=
nk_notifier_construct':
>> > =C2=A0 =C2=A0 netlinknotifier.c:206:2: warning: passing argument 4 of =
'g_hash_table_new_full' from incompatible pointer type
>> > =C2=A0 =C2=A0 /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/ghash.h:62:13: note: expe=
cted 'GDestroyNotify' but argument is of type 'void (*)(struct GList *)'
>> > =C2=A0 =C2=A0 netlinknotifier.c: In function '_lambda0_':
>> > =C2=A0 =C2=A0 netlinknotifier.c:260:162: warning: assignment discards =
qualifiers from pointer target type
>> > =C2=A0 =C2=A0 netlinknotifier.c: In function 'fso_framework_base_netli=
nk_notifier_handleNetlinkMessage':
>> > =C2=A0 =C2=A0 netlinknotifier.c:296:15: warning: assignment makes poin=
ter from integer without a cast
>> > =C2=A0 =C2=A0 netlinknotifier.c: In function 'fso_framework_base_netli=
nk_notifier_handleMessage':
>> > =C2=A0 =C2=A0 netlinknotifier.c:344:56: warning: cast to pointer from =
integer of different size
>> > =C2=A0 =C2=A0 netlinknotifier.c: In function '_fso_framework_base_netl=
ink_notifier_addMatch':
>> > =C2=A0 =C2=A0 netlinknotifier.c:366:56: warning: cast to pointer from =
integer of different size
>> > =C2=A0 =C2=A0 netlinknotifier.c:372:41: warning: cast to pointer from =
integer of different size
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 netlinkutil=
s.lo
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 overlay.lo
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 process.lo
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 smartkeyfil=
e.lo
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 syncasync.l=
o
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 threading.l=
o
>> > =C2=A0 =C2=A0 threading.c: In function 'fso_framework_threading_callDe=
legateOnMainThread':
>> > =C2=A0 =C2=A0 threading.c:451:4: warning: passing argument 4 of 'g_idl=
e_add_full' from incompatible pointer type
>> > =C2=A0 =C2=A0 /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: exp=
ected 'GDestroyNotify' but argument is of type 'void (*)(struct Block3Data =
*)'
>> > =C2=A0 =C2=A0 threading.c:455:4: warning: passing argument 4 of 'g_idl=
e_add_full' from incompatible pointer type
>> > =C2=A0 =C2=A0 /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: exp=
ected 'GDestroyNotify' but argument is of type 'void (*)(struct Block3Data =
*)'
>> > =C2=A0 =C2=A0 threading.c:458:4: warning: passing argument 4 of 'g_idl=
e_add_full' from incompatible pointer type
>> > =C2=A0 =C2=A0 /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/arm=
v7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/gmain.h:291:10: note: exp=
ected 'GDestroyNotify' but argument is of type 'void (*)(struct Block3Data =
*)'
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 types.lo
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC =C2=A0 =C2=A0 utilities.l=
o
>> > =C2=A0 =C2=A0 utilities.c:35:22: fatal error: execinfo.h: No such file=
 or directory
>> > =C2=A0 =C2=A0 compilation terminated.
>> > =C2=A0 =C2=A0 make[3]: *** [utilities.lo] Error 1
>> > =C2=A0 =C2=A0 make[3]: Leaving directory `/oe/build-minimal-uclibc/min=
imal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0=
+b163e36f9c960c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
>> > =C2=A0 =C2=A0 make[2]: *** [all] Error 2
>> > =C2=A0 =C2=A0 make[2]: Leaving directory `/oe/build-minimal-uclibc/min=
imal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0=
+b163e36f9c960c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics/fsobasics'
>> > =C2=A0 =C2=A0 make[1]: *** [all-recursive] Error 1
>> > =C2=A0 =C2=A0 make[1]: Leaving directory `/oe/build-minimal-uclibc/min=
imal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_0.9.10+gitr0=
+b163e36f9c960c6fea92168e88201be98dcceaef-r2.0/git/libfsobasics'
>> > =C2=A0 =C2=A0 make: *** [all] Error 2
>> > =C2=A0 =C2=A0 FATAL: oe_runmake failed
>> > =C2=A0 =C2=A0 ERROR: Function do_compile failed
>> >
>> > Does anyone have a clue on how that can be fixed.
>>
>> `execinfo.h` is not available in uClibc and is a =E2=80=9CGNUism=E2=80=
=9D [2]. The
>> dependency in in `linux.vapi` [3] and got included in [4].
>>
>> Unfortunately I do not know how to exclude that. I guess Autotools
>> should check if `execinfo.h` is available and only use it if it is. But
>> I do not know how to do that. Michael, are those libraries intended to
>> be used with uClibc?
>>
>> If this is too much work, how can I exclude this recipe from
>> console-image for minimal-uclibc?
>>
>>
>> Thanks,
>>
>> Paul
>>
>>
>> > [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-Septe=
mber/024097.html
>> [2] https://bugs.gentoo.org/show_bug.cgi?id=3D146693#c2
>> [3] http://git.freesmartphone.org/?p=3Dcornucopia.git;a=3Dblob;f=3Dlibfs=
obasics/vapi/linux.vapi
>> [4] http://mail.gnome.org/archives/commits-list/2009-November/msg02423.h=
tml
> Hi,
>
> fso is quit untested with none GNU libcs and we partly depend on it. I
> wrote a short patch which add a --enable-no-gnuism switch for configure,
> but want to talk to Michael, before commiting it. Could you test it and
> report more gnuism in our code? And is possible to get a backtrace with
> uClibc which is not gnuism, but available in all none-GNU
> implementations?

instead you could use the defines like __UCLIBC__ which are there when
using uclibc.

>
> Regards Frederik
>
>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> --
> IRC: playya @ Freenode, Gimpnet
> xmpp: playya@draugr.de
> identi.ca: playya
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
>
> iEUEARECAAYFAkyYP/sACgkQvbwBzXsbjyqGHACgoWj4wP2twlAXMSfh4NWsH19C
> dQUAmJOg=E9=AC=A5=E7=8D=83=E2=9E=8A=ED=8F=B0=EB=BF=AA=E5=88=AE=ED=9E=8E=
=E8=BE=8D=3D
> =3DieUZ
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
-Khem


