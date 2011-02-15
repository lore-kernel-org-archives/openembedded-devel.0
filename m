Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpOh0-0003v1-Lj
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 18:28:02 +0100
Received: by bwz10 with SMTP id 10so644328bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 09:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=Qk/LSTaMTnFAYGSJOwHXU+PeWB6Vj72KTFuvR+Mg2Ts=;
	b=kNxPu7pSbV6d0uJB7hpkfh3YAo+iDdZkCIFd0JvWZNp9a6uknEMjafWnOk/15v1ZJO
	Jbl4oIQwIUqX/h0xIb/GYi85xlc4Y0qochemdiWp5YwcT6WtUSHFMFPCF1f9CYFxO/FZ
	ajoD2vmu3MdHfHP4As49ktqv6Nqr4blXIs0EY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	b=v+kJaSiVrL3NHn+yV3sNSrbQtXBDjOfLbLayoA4VLfNyjALiGs4co+c6DR15u4EwHc
	xatjKFYtBs3TddFE+RiaLsFUK3MTOxE3SjrS4UqkJhTh5xVOiWxIF3vS0LUxfDjt3KBb
	oKygyGev9N0nYZnibcRttL963LLQ6nDVqJMOk=
MIME-Version: 1.0
Received: by 10.204.77.18 with SMTP id e18mr4661785bkk.78.1297790812235; Tue,
	15 Feb 2011 09:26:52 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Tue, 15 Feb 2011 09:26:52 -0800 (PST)
Date: Tue, 15 Feb 2011 17:26:52 +0000
X-Google-Sender-Auth: cQEOkPVZ3m5RTc7areCX5dMItKA
Message-ID: <AANLkTinQ9DmVt+3G3fh=-0wKKsR6Vr89dSvJUwOB8SAG@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: gcc-cross-sdk: fail to build with 20110215 OE
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
X-List-Received-Date: Tue, 15 Feb 2011 17:28:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I got a build-failure of gcc-cross-sdk using current OE. It fails to
find libc library on linking.

/bin/sh /home/otavio/hacking/embedded-linux/tmp/work/x86_64-i586-sdk-oe-lin=
ux/gcc-cross-sdk-4.5-r31.2+svnr168622/gcc-4_5-branch/libgcc/../mkinstalldir=
s
.
/home/otavio/hacking/embedded-linux/tmp/work/x86_64-i586-sdk-oe-linux/gcc-c=
ross-sdk-4.5-r31.2+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-lin=
ux/./gcc/xgcc
-B/home/otavio/hacking/embedded-linux/tmp/work/x86_64-i586-sdk-oe-linux/gcc=
-cross-sdk-4.5-r31.2+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-l=
inux/./gcc/
--sysroot=3D/home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux
-B/opt/sdk/osnetboot-terminal/i586/i586-oe-linux/bin/
-B/opt/sdk/osnetboot-terminal/i586/i586-oe-linux/lib/ -isystem
/opt/sdk/osnetboot-terminal/i586/i586-oe-linux/include -isystem
/opt/sdk/osnetboot-terminal/i586/i586-oe-linux/sys-include
--sysroot=3D/home/otavio/hacking/embedded-linux/tmp/sysroots/i586-oe-linux
  -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
-Wold-style-definition  -isystem ./include  -fPIC -g
-DHAVE_GTHR_DEFAULT -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED
-fno-stack-protector  -shared -nodefaultlibs
-Wl,--soname=3Dlibgcc_s.so.1 -Wl,--version-script=3Dlibgcc.map -o
./libgcc_s.so.1.tmp -g -Os -B./ _muldi3_s.o _negdi2_s.o _lshrdi3_s.o
_ashldi3_s.o _ashrdi3_s.o _cmpdi2_s.o _ucmpdi2_s.o _clear_cache_s.o
_enable_execute_stack_s.o _trampoline_s.o __main_s.o _absvsi2_s.o
_absvdi2_s.o _addvsi3_s.o _addvdi3_s.o _subvsi3_s.o _subvdi3_s.o
_mulvsi3_s.o _mulvdi3_s.o _negvsi2_s.o _negvdi2_s.o _ctors_s.o
_ffssi2_s.o _ffsdi2_s.o _clz_s.o _clzsi2_s.o _clzdi2_s.o _ctzsi2_s.o
_ctzdi2_s.o _popcount_tab_s.o _popcountsi2_s.o _popcountdi2_s.o
_paritysi2_s.o _paritydi2_s.o _powisf2_s.o _powidf2_s.o _powixf2_s.o
_powitf2_s.o _mulsc3_s.o _muldc3_s.o _mulxc3_s.o _multc3_s.o
_divsc3_s.o _divdc3_s.o _divxc3_s.o _divtc3_s.o _bswapsi2_s.o
_bswapdi2_s.o _fixunssfsi_s.o _fixunsdfsi_s.o _fixunsxfsi_s.o
_fixsfdi_s.o _fixdfdi_s.o _fixxfdi_s.o _fixunssfdi_s.o _fixunsdfdi_s.o
_fixunsxfdi_s.o _floatdisf_s.o _floatdidf_s.o _floatdixf_s.o
_floatundisf_s.o _floatundidf_s.o _floatundixf_s.o _divdi3_s.o
_moddi3_s.o _udivdi3_s.o _umoddi3_s.o _udiv_w_sdiv_s.o _udivmoddi4_s.o
addtf3_s.o divtf3_s.o eqtf2_s.o getf2_s.o letf2_s.o multf3_s.o
negtf2_s.o subtf3_s.o unordtf2_s.o fixtfsi_s.o fixunstfsi_s.o
floatsitf_s.o floatunsitf_s.o fixtfdi_s.o fixunstfdi_s.o floatditf_s.o
floatunditf_s.o extendsftf2_s.o extenddftf2_s.o extendxftf2_s.o
trunctfsf2_s.o trunctfdf2_s.o trunctfxf2_s.o tf-signs_s.o
unwind-dw2_s.o unwind-dw2-fde-glibc_s.o unwind-sjlj_s.o gthr-gnat_s.o
unwind-c_s.o emutls_s.o -lc && rm -f ./libgcc_s.so && if [ -f
./libgcc_s.so.1 ]; then mv -f ./libgcc_s.so.1 ./libgcc_s.so.1.backup;
else true; fi && mv ./libgcc_s.so.1.tmp ./libgcc_s.so.1 && ln -s
libgcc_s.so.1 ./libgcc_s.so
/home/otavio/hacking/embedded-linux/tmp/sysroots/x86_64-linux/usr/i586/i586=
-oe-linux/bin/ld:
cannot find /lib/libc_nonshared.a
collect2: ld returned 1 exit status
make[2]: *** [libgcc_s.so] Error 1
make[2]: Leaving directory
`/home/otavio/hacking/embedded-linux/tmp/work/x86_64-i586-sdk-oe-linux/gcc-=
cross-sdk-4.5-r31.2+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-li=
nux/i586-oe-linux/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory
`/home/otavio/hacking/embedded-linux/tmp/work/x86_64-i586-sdk-oe-linux/gcc-=
cross-sdk-4.5-r31.2+svnr168622/gcc-4_5-branch/build.x86_64-linux.i586-oe-li=
nux'
make: *** [all] Error 2

Any idea why it fails?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


