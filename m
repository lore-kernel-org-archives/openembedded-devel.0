Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzX5Q-0001e7-3U
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 17:27:08 +0100
Received: by mail-fx0-f47.google.com with SMTP id 19so720970fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=QK+Ee2g6ZAd0ObjKEL6O+yXCzZmlJ7KhkDNLXbuGyuI=;
	b=b3HfEV5r4BrWBBE7Vm687nHnXQLo3W/SIHUa7WV7Oph9eGg35MS9KSzS9p7I8+aRiM
	G+0mawQWV4UOTNI+MeSgY66R3nq5B0K1fT7Svvb4mMXDvimDizw18MwwwftOON3Y6TqC
	lLa9qt+j04NfHPAtNoaAD6pIJ+Ek0RkNtaXYY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=OJ9G6cQ9EZBcU+P8fy98Jn2xI3Ro5ZsORxwc8LiO0FiB2sfgV697LjxluHfdc0Wxhy
	1O19JeZYfjbgIAkxjWyrsBi+Ph8qhFcKgSjXrMLypogq2Oiiiq6kWP/pLAkMgS2Nb4AU
	fxHJZfbCbEZH03zHdlT57Up5JMIFQpPZf3sVM=
Received: by 10.223.110.4 with SMTP id l4mr567154fap.125.1300206322639; Tue,
	15 Mar 2011 09:25:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.41.89 with HTTP; Tue, 15 Mar 2011 09:24:48 -0700 (PDT)
In-Reply-To: <1300205205.4123.6.camel@mattotaupa>
References: <1299591298.3785.126.camel@mattotaupa>
	<1300205205.4123.6.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Mar 2011 09:24:48 -0700
Message-ID: <AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: xfce4-session: task configure fails with `checking for iceauth... no`
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
X-List-Received-Date: Tue, 15 Mar 2011 16:27:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2011 at 9:06 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear OE folks,
>
>
> Am Dienstag, den 08.03.2011, 14:34 +0100 schrieb Paul Menzel:
>
>> task configure of `xfce4-session_4.6.2.bb` fails with the following
>> error message using any distribution (`minimal`, `angstrom-2008.1`).
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking if the linker (arm-oe-linux-gnueabi=
-ld --sysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-li=
nux-gnueabi) is GNU ld... (cached) yes
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking whether to build with profiling sup=
port... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking whether to compile with coverage pr=
ofiling instrumentation... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking whether to disable assertions... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking whether to build final version... y=
es
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking whether arm-oe-linux-gnueabi-ld --s=
ysroot=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnu=
eabi accepts -O1... yes
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 checking for iceauth... no
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 configure: error: iceauth missing, please ch=
eck your X11 installation
>>
>> In my build directory I get the following hits for =C2=BB*iceauth*=C2=AB=
.
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ find . -iname *iceauth*
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/sources/MIT-X/iceauth
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/sources/MIT-X/iceauth/i=
ceauth-1.0.4.tar.bz2
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/ipk/armv5te/iceauth-dbg=
_1.0.4-r5.0_armv5te.ipk
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/ipk/armv5te/iceauth-dev=
_1.0.4-r5.0_armv5te.ipk
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/ipk/armv5te/iceauth-doc=
_1.0.4-r5.0_armv5te.ipk
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/deploy/ipk/armv5te/iceauth_1.0=
.4-r5.0_armv5te.ipk
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_patch
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_package_stage
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_configure
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_unpack
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_setscene
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_compile
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_rm_work
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_package_stage_all
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_fetch
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_package_write
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_qa_configure
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_build
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_install
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_qa_staging
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_package
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_distribute_sources
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_package_write_ipk
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/stamps/armv5te-oe-linux-gnueab=
i/iceauth-1_1.0.4-r5.0.do_populate_sysroot
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pstage/minimaleglibc/staging-i=
ceauth-armv5te-oe-linux-gnueabi_1.0.4-r5.0_armv5te-linux-gnueabi.ipk
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/iceauth
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/runtime/iceauth.packaged
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/runtime/iceauth-doc
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/runtime/iceauth-dbg.packaged
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/runtime/iceauth-dev
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/runtime/iceauth
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/runtime/iceauth-dbg
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/runtime/iceauth-doc.packaged
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/runtime/iceauth-locale
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/runtime/iceauth-dev.packaged
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/pkgdata/armv5te-oe-linux-gnuea=
bi/runtime/iceauth-static
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/sysroots/armv5te-oe-linux-gnue=
abi/usr/share/man/man1/iceauth.1
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/work/armv5te-oe-linux-gnueabi/=
iceauth-1_1.0.4-r5.0
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/usr/lib/opkg/info/staging-icea=
uth-armv5te-oe-linux-gnueabi.control
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./minimal-dev/usr/lib/opkg/info/staging-icea=
uth-armv5te-oe-linux-gnueabi.list
>>
>> So nothing is in the `sysroot`. Building without `INHERIT +=3D "rm_work"=
`
>> I find the following.
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 $ ls -l minimal-dev/work/armv5te-oe-linux-gn=
ueabi/iceauth-1_1.0.4-r5.0/package/usr/bin/iceauth
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 -rwxr-xr-x 1 x x 16264 Mar =C2=A07 11:55 min=
imal-dev/work/armv5te-oe-linux-gnueabi/iceauth-1_1.0.4-r5.0/package/usr/bin=
/iceauth
>>
>> Does anyone have an idea how this can be solved. `git grep iceauth`
>> indicates that only `xfce4-session_4.*` depends on `iceauth`.
>
> Any ideas?
>

look at the config.log of this package and see what is it looking for
in iceauth and make sure that its staged
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


