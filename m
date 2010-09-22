Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OyQgl-0007bU-Fa
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 16:52:55 +0200
Received: by iwn2 with SMTP id 2so599272iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=H1nsAWdCl+AeFDJB7qU08iKwRgxI5+/ibz4VQ9GE1wc=;
	b=kp6TZ+4WeSyKCW8aad09H9RYln2dG7d7N9r6wZvBwNVDCG0lW0T4IH55eq7gMFMt3U
	uR+WRhE/sn2V4GOjFwXYakyYZPmc917/p66vzeCzLGjaSrX7Z4Zr/TFWh8Jc28ZhzU9w
	faNScbebZkQKgzhxjITTctt6HhGPYYc9y5pz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=khiV8G69LlS/kgqoiSdv7E49rsfGJe/M1bHFVKbuO6yd3IP5O4plABM9uI1B37c5B8
	8AzK/loMwUGtItkgN0Plsd/w5a1/hYMs1y8O2io4i1QQ5cJ51PG9yu80+ohL08KKVWU2
	FcWxnTtUSQyceOhYscCmElntYD0Z/ykd2J3iA=
Received: by 10.231.31.129 with SMTP id y1mr289933ibc.45.1285167165671; Wed,
	22 Sep 2010 07:52:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Wed, 22 Sep 2010 07:52:25 -0700 (PDT)
In-Reply-To: <1285146702.4175.20.camel@mattotaupa>
References: <1284228112.14396.159.camel@mattotaupa>
	<1285021068.2453.80.camel@mattotaupa>
	<20100921051747.GA3989@thinky> <1285146702.4175.20.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Sep 2010 07:52:25 -0700
Message-ID: <AANLkTim=AW3H5hCwwE7-ZT9yHquF4NEnc_Ko=xhPqjWm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-uclibc: freesmartphone/libfsobasics_git.bb: do_compile() failed: utilities.c:35:25: error: sys/eventfd.h: No such file or directory (was: utilities.c:35:22: fatal error: execinfo.h: No such file or directory)
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
X-List-Received-Date: Wed, 22 Sep 2010 14:52:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2010 at 2:11 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Frederik,
>
>
> Am Dienstag, den 21.09.2010, 07:17 +0200 schrieb Frederik Sdun:
>
> [=E2=80=A6]
>
>> fso is quit untested with none GNU libcs and we partly depend on it. I
>> wrote a short patch which add a --enable-no-gnuism switch for configure,
>> but want to talk to Michael, before commiting it. Could you test it and
>> report more gnuism in our code?
>
> thank you for your patch. It partly reduced the problem. It now chokes
> on `eventfd.h`. Unfortunately I do not know anything about if there are
> any non glibc equivalents.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[=E2=80=A6]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| kobjectnotifier.c:188: warning: passing argu=
ment 2 of 'bind' from incompatible pointer type
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| /oe/build-minimal-uclibc/minimal-uclibc-dev/=
sysroots/armv7a-oe-linux-uclibceabi/usr/include/sys/socket.h:115: note: exp=
ected 'const struct sockaddr *' but argument is of type 'struct sockaddr_nl=
 *'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 libinitexit.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 logger.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 netlinknotifier.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c: In function 'fso_framewor=
k_base_netlink_notifier_construct':
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c:206: warning: passing argu=
ment 4 of 'g_hash_table_new_full' from incompatible pointer type
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| /oe/build-minimal-uclibc/minimal-uclibc-dev/=
sysroots/armv7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/ghash.h:62: n=
ote: expected 'GDestroyNotify' but argument is of type 'void (*)(struct GLi=
st *)'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c: In function '_lambda0_':
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c:260: warning: assignment d=
iscards qualifiers from pointer target type
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c: In function 'fso_framewor=
k_base_netlink_notifier_handleNetlinkMessage':
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c:296: warning: assignment m=
akes pointer from integer without a cast
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c: In function 'fso_framewor=
k_base_netlink_notifier_handleMessage':
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c:344: warning: cast to poin=
ter from integer of different size
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c: In function '_fso_framewo=
rk_base_netlink_notifier_addMatch':
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c:366: warning: cast to poin=
ter from integer of different size
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| netlinknotifier.c:372: warning: cast to poin=
ter from integer of different size
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 netlinkutils.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 overlay.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 process.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 smartkeyfile.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 syncasync.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 threading.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| threading.c: In function 'fso_framework_thre=
ading_callDelegateOnMainThread':
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| threading.c:451: warning: passing argument 4=
 of 'g_idle_add_full' from incompatible pointer type
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| /oe/build-minimal-uclibc/minimal-uclibc-dev/=
sysroots/armv7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/gmain.h:291: =
note: expected 'GDestroyNotify' but argument is of type 'void (*)(struct Bl=
ock3Data *)'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| threading.c:455: warning: passing argument 4=
 of 'g_idle_add_full' from incompatible pointer type
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| /oe/build-minimal-uclibc/minimal-uclibc-dev/=
sysroots/armv7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/gmain.h:291: =
note: expected 'GDestroyNotify' but argument is of type 'void (*)(struct Bl=
ock3Data *)'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| threading.c:458: warning: passing argument 4=
 of 'g_idle_add_full' from incompatible pointer type
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| /oe/build-minimal-uclibc/minimal-uclibc-dev/=
sysroots/armv7a-oe-linux-uclibceabi/usr/include/glib-2.0/glib/gmain.h:291: =
note: expected 'GDestroyNotify' but argument is of type 'void (*)(struct Bl=
ock3Data *)'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 types.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 CC =C2=A0 =C2=A0 utilities.lo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| utilities.c:35:25: error: sys/eventfd.h: No =
such file or directory


eventfd is unimplemented in uclibc.


> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[3]: *** [utilities.lo] Error 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[3]: Leaving directory `/oe/build-minima=
l-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_=
0.9.10+gitr0+2f8221fea7c667d2ee46ff6b8dace2d53b8860cc-r2.0/git/libfsobasics=
/fsobasics'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[2]: *** [all] Error 2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[2]: Leaving directory `/oe/build-minima=
l-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_=
0.9.10+gitr0+2f8221fea7c667d2ee46ff6b8dace2d53b8860cc-r2.0/git/libfsobasics=
/fsobasics'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[1]: *** [all-recursive] Error 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make[1]: Leaving directory `/oe/build-minima=
l-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/libfsobasics-1_=
0.9.10+gitr0+2f8221fea7c667d2ee46ff6b8dace2d53b8860cc-r2.0/git/libfsobasics=
'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| make: *** [all] Error 2
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| FATAL: oe_runmake failed
> =C2=A0 =C2=A0 =C2=A0 =C2=A0| ERROR: Function do_compile failed
>
> I am attaching the patch file to include your patch into OE easily for te=
sting.
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
-Khem


