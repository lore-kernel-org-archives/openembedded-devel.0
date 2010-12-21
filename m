Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1PV9lD-0003wt-BL
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 22:28:43 +0100
Received: by qyk36 with SMTP id 36so4332879qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 13:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=p4UhSX0TCjsuiyPYdreq5Q2YGylRhT4kXo7NTiG8uWo=;
	b=XCGS9nOe3lrKaYhNJhZz9iS5umqZS5RDF35DLb9aD1WKi3Q/MD5Jtqw0cp+1YmSFES
	BmzWIpRUaE1L6TP0ns8UbRFKYLA93GIj5rn6kqic+Xk+ueqLKVLsv7f+XBRzKeOC41+H
	DW6sBv9DN/IRd4C5uOuufuFN2PgaNMRKOoS4o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ocuir2UJq9i0F4GaVyPKzOjF0400QKtafvJFj8xICnp24t6egLX+5dJMtaRBzN6Yi1
	qpZ5DWHie0tkY0UNHrvmSMnq09i+4LZoGKTEjk+oHsAf9P8W19l2gq7JA/tHl4KfmjLF
	vY7JxN0CT+bA9CwYmUSgh8vBiwDXSNQN6TBc8=
MIME-Version: 1.0
Received: by 10.224.64.75 with SMTP id d11mr5577715qai.214.1292966911653; Tue,
	21 Dec 2010 13:28:31 -0800 (PST)
Received: by 10.220.195.71 with HTTP; Tue, 21 Dec 2010 13:28:31 -0800 (PST)
In-Reply-To: <1287488066.4030.39.camel@mattotaupa>
References: <1287405781.3928.22.camel@mattotaupa>
	<AANLkTinTuHWBgzbTcZdnrsSGuGmiqgs2fgPc3koE1fCJ@mail.gmail.com>
	<1287433398.3927.1.camel@mattotaupa>
	<1287443220.3927.61.camel@mattotaupa>
	<1287488066.4030.39.camel@mattotaupa>
Date: Tue, 21 Dec 2010 13:28:31 -0800
Message-ID: <AANLkTin1vqVcKi6aU5v_fHss=Jgp3skygwKNhv_4Xgu0@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: opensp_1.5: `do_compile` fails with for example `RastEventHandler.cxx:(.text+0x7f0): undefined reference to `OpenSP::Sd::execToInternal(char const*) const'`
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
X-List-Received-Date: Tue, 21 Dec 2010 21:28:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2010 at 4:34 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Dienstag, den 19.10.2010, 01:07 +0200 schrieb Paul Menzel:
>> Am Montag, den 18.10.2010, 22:23 +0200 schrieb Paul Menzel:
>> > Am Montag, den 18.10.2010, 11:39 -0700 schrieb Khem Raj:
>> > > On Mon, Oct 18, 2010 at 5:43 AM, Paul Menzel wrote:
>> >
>> > > > trying to build openjade to test ab83ea [1], task `do_compile` of
>> > > > `opensp_1.5.bb` [2] fails with the following error with `minimal`
>> > > > (eglibc) for `MACHINE =3D "beagleboard"`.
>> > >
>> > > is it a regression ? did it built ok without this patch ?
>> >
>> > Well, `opensp_1.5.bb` was not changed as far as I can see. So I do not
>> > think it is a regression. I will try it anyway.
>>
>> Reverting the patch did not have any effect.
>>
>> I build tested OpenSP with other distributions. It worked with `minimal`
>> (libc).
>>
>> It failed for `minimal-uclibc` with the same error.
>>
>> It failed for `angstrom-2008.1` with a different error.
>>
>> =A0 =A0 =A0 [=85]
>> =A0 =A0 =A0 /bin/sh ../arm-angstrom-linux-gnueabi-libtool --tag=3DCXX =
=A0 --mode=3Dlink arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3D=
cortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb =
=A0-isystem/oe/build/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/us=
r/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer=
 -O2 -ggdb2 -fpermissive -fvisibility-inlines-hidden =A0-L/oe/build/angstro=
m-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/oe/bu=
ild/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl=
,--hash-style=3Dgnu -o osx sx.o XmlOutputEventHandler.o sx_inst.o ../lib/li=
bosp.la -lpthread
>> =A0 =A0 =A0 arm-angstrom-linux-gnueabi-libtool: link: arm-angstrom-linux=
-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=
=3Dsoftfp -mthumb-interwork -mno-thumb -isystem/oe/build/angstrom-dev/sysro=
ots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -fr=
ename-registers -fomit-frame-pointer -O2 -ggdb2 -fpermissive -fvisibility-i=
nlines-hidden -Wl,-rpath-link -Wl,/oe/build/angstrom-dev/sysroots/armv7a-an=
gstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -o .libs/osx sx=
.o XmlOutputEventHandler.o sx_inst.o =A0-L/oe/build/angstrom-dev/sysroots/a=
rmv7a-angstrom-linux-gnueabi/usr/lib ../lib/.libs/libosp.so /oe/build/angst=
rom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/libstdc++.so -lpthre=
ad -Wl,-rpath -Wl,/usr/lib
>> =A0 =A0 =A0 /oe/build/angstrom-dev/sysroots/i686-linux/usr/armv7a/lib/gc=
c/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/b=
in/ld: warning: libc.so, needed by /oe/build/angstrom-dev/sysroots/i686-lin=
ux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angs=
trom-linux-gnueabi/lib/libgcc_s.so, not found (try using -rpath or -rpath-l=
ink)
>> =A0 =A0 =A0 XmlOutputEventHandler.o: In function `OpenSP::XmlOutputEvent=
Handler::fsiToUrl(OpenSP::String<unsigned int> const&, OpenSP::Location con=
st&, OpenSP::String<unsigned int>&)':
>> =A0 =A0 =A0 /oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/op=
ensp-1.5-r2/OpenSP-1.5/sx/XmlOutputEventHandler.cxx:789: undefined referenc=
e to `OpenSP::InputSource::get(OpenSP::Messenger&)'
>> =A0 =A0 =A0 collect2: ld returned 1 exit status
>> =A0 =A0 =A0 make[3]: *** [osx] Error 1
>> =A0 =A0 =A0 make[3]: Leaving directory `/oe/build/angstrom-dev/work/armv=
7a-angstrom-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5/sx'
>> =A0 =A0 =A0 make[2]: *** [all] Error 2
>> =A0 =A0 =A0 make[2]: Leaving directory `/oe/build/angstrom-dev/work/armv=
7a-angstrom-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5/sx'
>> =A0 =A0 =A0 make[1]: *** [all-recursive] Error 1
>> =A0 =A0 =A0 make[1]: Leaving directory `/oe/build/angstrom-dev/work/armv=
7a-angstrom-linux-gnueabi/opensp-1.5-r2/OpenSP-1.5'
>> =A0 =A0 =A0 make: *** [all] Error 2
>> =A0 =A0 =A0 FATAL: oe_runmake failed
>> =A0 =A0 =A0 ERROR: Function do_compile failed
>>
>> The BitBake run was interrupted. I will try a clean build to confirm the
>> issue for sure.
>
> The issues are still there after a clean build. Only `minimal-libc`
> works fine.

Several Gumstix customers are seeing this issue too.  Did you ever
discover the root cause or even a workaround?

Is your build machine a 32 bit or 64 bit distro?  There seems to be
some anecdotal evidence that it may be 64 bit related.

Steve


