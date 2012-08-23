Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>)
	id 1T4dPf-0003Ov-Tu; Thu, 23 Aug 2012 21:49:56 +0200
Received: from mail10-va3-R.bigfish.com (10.7.14.236) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.23; Thu, 23 Aug 2012 18:52:34 +0000
Received: from mail10-va3 (localhost [127.0.0.1])	by mail10-va3-R.bigfish.com
	(Postfix) with ESMTP id AF9352A03EA;
	Thu, 23 Aug 2012 18:52:34 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -7
X-BigFish: VS-7(zz98dI9371I1432Ic1dMzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i)
Received: from mail10-va3 (localhost.localdomain [127.0.0.1]) by mail10-va3
	(MessageSwitch) id 1345747946876195_29704;
	Thu, 23 Aug 2012 18:52:26 +0000 (UTC)
Received: from VA3EHSMHS003.bigfish.com (unknown [10.7.14.240])	by
	mail10-va3.bigfish.com (Postfix) with ESMTP id C377C4E027F;
	Thu, 23 Aug 2012 18:52:26 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS003.bigfish.com
	(10.7.99.13) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 23 Aug 2012 18:52:25 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.3]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0309.003; Thu, 23 Aug 2012 13:52:25 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [oe-commits] Matthew McClintock : distutils.bblass:
	change order of args to install step
Thread-Index: AQHNgTmHDtzKWgJUpUiINrW9vcypJpdoEhyA
Date: Thu, 23 Aug 2012 18:52:25 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A611BC3@039-SN1MPN1-001.039d.mgd.msft.net>
References: <20120822132435.26657103C9@opal>
	<20120823140952.GN3029@jama.jama.net>
In-Reply-To: <20120823140952.GN3029@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Matthew McClintock : distutils.bblass: change order of args to install step
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
X-List-Received-Date: Thu, 23 Aug 2012 19:49:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0832C326359E304690CE6F472C97E16D@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2012 at 9:09 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Aug 22, 2012 at 01:24:34PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 3b23feca31480cc56f55301fd0274e622c40b522
>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommi=
t;h=3D3b23feca31480cc56f55301fd0274e622c40b522
>>
>> Author: Matthew McClintock <msm@freescale.com>
>> Date:   Tue Aug 21 13:44:21 2012 -0500
>>
>> distutils.bblass: change order of args to install step
>>
>> This let's the user override install-lib argument again if it needs
>> to be something else, otherwise things like python-setuptools
>> won't be able to modify the install-lib dir
>>
>> This fixes a new issue exposed by my previous distutils patch
>> that fixed the python modules default install location. Also,
>> it removes running the install step twice which was inadvertant
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>  meta/classes/distutils.bbclass |    3 +--
>>  1 files changed, 1 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbc=
lass
>> index 7588b81..52a1aa8 100644
>> --- a/meta/classes/distutils.bbclass
>> +++ b/meta/classes/distutils.bbclass
>> @@ -38,8 +38,7 @@ distutils_do_install() {
>>          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>>          PYTHONPATH=3D${D}/${PYTHON_SITEPACKAGES_DIR} \
>>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
>> -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install =
${DISTUTILS_INSTALL_ARGS} || \
>> -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install =
${DISTUTILS_INSTALL_ARGS} --install-lib=3D${D}${libdir}/${PYTHON_DIR} || \
>> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install =
--install-lib=3D${D}${libdir}/${PYTHON_DIR} ${DISTUTILS_INSTALL_ARGS} || \
>>          bbfatal "python setup.py install execution failed."
>>
>>          for i in `find ${D} -name "*.py"` ; do \
>
> This seems to break recipes which inherit distutils only, now libs are in=
stalled in

There is a bug to track this:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2993

And a candiate fix:

http://patches.openembedded.org/patch/35239/

-M

> /usr/lib/python2.7 directly instead of /usr/lib/python2.7/site-packages a=
nd packaging fails with fatal QA
> NOTE: Executing RunQueue Tasks
> ERROR: QA Issue: non debug package contains .debug directory: python-pyrt=
c path /work/armv7a-vfp-neon-oe-linux-gnueabi/python-pyrtc-1_1.0.0+gitr1+63=
b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/packages-split/python-pyrtc/usr/=
lib/python2.7/.debug/pyrtc.so
> ERROR: QA run found fatal errors. Please consider fixing them.
>
> OE @ ~/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi $ find p=
ython-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.old/=
packages-split/
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc.shlibdeps
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc/usr
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc/usr/lib
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc/usr/lib/python2.7
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc/usr/lib/python2.7/.debug
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc/usr/lib/python2.7/.debug/pyrtc.so
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc/usr/lib/python2.7/PyRTC-1.0.0-py2.7.egg-info
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc/usr/lib/python2.7/site-packages
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc/usr/lib/python2.7/pyrtc.so
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-doc
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-dbg
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-dbg/usr
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-dbg/usr/src
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-dbg/usr/src/debug
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1=
+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1=
+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1=
+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1=
+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc/pyrtc.c
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1=
+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc/rtc.c
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2.o=
ld/packages-split/python-pyrtc-dev
> OE @ ~/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi $ find p=
ython-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/pack=
ages-split/
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc.shlibdeps
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc/usr
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc/usr/lib
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc/usr/lib/python2.7
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc/usr/lib/python2.7/site-packages
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc/usr/lib/python2.7/site-packages/PyRTC-1.0.0-py2.=
7.egg-info
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc/usr/lib/python2.7/site-packages/pyrtc.so
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-doc
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/src
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/src/debug
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+63b=
1dff1bc8ac22efabcee8a90e957c3b2423317-ml2
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+63b=
1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+63b=
1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+63b=
1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc/pyrtc.c
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/src/debug/python-pyrtc-1_1.0.0+gitr1+63b=
1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/git/pyrtc/rtc.c
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/lib
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/lib/python2.7
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/lib/python2.7/site-packages
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/lib/python2.7/site-packages/.debug
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dbg/usr/lib/python2.7/site-packages/.debug/pyrtc=
.so
> python-pyrtc-1_1.0.0+gitr1+63b1dff1bc8ac22efabcee8a90e957c3b2423317-ml2/p=
ackages-split/python-pyrtc-dev
>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=



