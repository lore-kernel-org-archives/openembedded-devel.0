Received: from [209.85.221.175] (helo=mail-qy0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MpO10-00078k-1g
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Sep 2009 17:07:53 +0200
Received: by qyk5 with SMTP id 5so206002qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2009 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XmX8FbcLIViMhht1qpUUzaEklgRJn5jbB0rLlmfTIS4=;
	b=SHJSjt03UtRvRKeSTw+rMv47RoNUNLEcKqk5gkogjapN3HprmeQz5xwICnoxaOTFyB
	o5KnNmID1CPMI7xnpoQk47Lv+2gpaXf0olE/fk9IM4MUp6KTphI3wbHy7hsinfU0tz1R
	VBJVWy5rVtJPs3NxgwxA5cPPEKoKuEFnlUAzM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m+NbNbgFr7uw/TveMxT1qUqvV+801FpzqxC5HMYLV0GyvOk1NAMtd5x7UNoEQfRBla
	xWKcD1weBLzesIt5Qhay21YVC6tQYzM90L6BGSx4nplFQnKlmm5tv059PiUbUiE0wImV
	sp8SYYTE8QQgnYSssE+jw1WDZGYKcVOBfTIDM=
MIME-Version: 1.0
Received: by 10.229.129.133 with SMTP id o5mr870803qcs.45.1253459233977; Sun, 
	20 Sep 2009 08:07:13 -0700 (PDT)
In-Reply-To: <1253437328.4ab5ef902b12f@imp.free.fr>
References: <1253437328.4ab5ef902b12f@imp.free.fr>
Date: Sun, 20 Sep 2009 08:07:13 -0700
Message-ID: <19c1b8a90909200807u66d5d12bh345139ce4c4302ad@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: minimo not building
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
X-List-Received-Date: Sun, 20 Sep 2009 15:07:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2009 at 2:02 AM, Alain2210 <alain2210@free.fr> wrote:
> Hello,
>
> I'm using the shr/import branch, and Angstrom distribution, and I want to=
 build
> minimo for a h2200 ipaq.
>
> It fails on
> tmp/work/armv5te-angstrom-linux-gnueabi/minimo-1_0.02+cvs20070626-r1/mozi=
lla/xpcom/reflect/xptcall/src/md/unix/xptcinvoke_arm.cpp
> with the error message below, that is an assembler problem.
>
> But the stange thing, is that fennec is building in the same configuratio=
n
> and with the same assembler instructions. (the xptcinvoke_arm.cpp is quit=
e the
> same for minimo and fennec).
>
> It have tried google to find such error but without succes.
>
> Thanks,
>
> Alain
>
> below : builds of minimo and fennec for xptcinvoke_arm.cpp
>
> ----------------- building minimo ----------------
> =C2=A0arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te -mtune=3Dxscale -mt=
humb-interwork
> -mthumb -o xptcinvoke_arm.o -c -fvisibility=3Dhidden -DMOZILLA_INTERNAL_A=
PI
> -DOSTYPE=3D\"Linux\" -DOSARCH=3D\"Linux\" -DBUILD_ID=3D0000000000 -DEXPOR=
T_XPTC_API
> -I../../../../../../dist/include/xpcom -I../../../../../../dist/include
> -I../../../../../../dist/include/nspr =C2=A0 =C2=A0-I./../.. =C2=A0 =C2=
=A0-fPIC
> -isystem/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi=
/usr/include
> =C2=A0-fno-rtti -fno-exceptions -Wall -Wconversion -Wpointer-arith -Wcast=
-align
> -Woverloaded-virtual -Wsynth -Wno-ctor-dtor-privacy -Wno-non-virtual-dtor
> -Wno-long-long -pedantic
> -isystem/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi=
/usr/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
> -fpermissive -fvisibility-inlines-hidden -fshort-wchar -pthread -pipe =C2=
=A0-DNDEBUG
> -DTRIMMED -Os -O2
> -isystem/ext/oe/build-shr-0907/tmp/staging/armv5te-angstrom-linux-gnueabi=
/usr/include
> =C2=A0-DMOZILLA_CLIENT -include ../../../../../../mozilla-config.h
> -Wp,-MD,.deps/xptcinvoke_arm.pp xptcinvoke_arm.cpp
> | In file included from ../../../../../../dist/include/xpcom/xptcall.h:47=
,
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ./..=
/../xptcprivate.h:43,
> | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from xptc=
invoke_arm.cpp:40:
> | ../../../../../../dist/include/xpcom/xptinfo.h: In member function 'con=
st
> nsXPTCMiniVariant* nsXPTConstant::GetValue() const':
> | ../../../../../../dist/include/xpcom/xptinfo.h:258: warning: type-punni=
ng to
> incomplete type might break strict-aliasing rules
> | xptcinvoke_arm.cpp: In function 'void invoke_copy_to_stack(PRUint32*,
> PRUint32, nsXPTCVariant*)':
> | xptcinvoke_arm.cpp:112: warning: cast from 'PRUint32*' to 'PRInt64*' in=
creases
> required alignment of target type
> | xptcinvoke_arm.cpp:116: warning: cast from 'PRUint32*' to 'PRUint64*'
> increases required alignment of target type
> | xptcinvoke_arm.cpp:118: warning: cast from 'PRUint32*' to 'double*' inc=
reases
> required alignment of target type
> | {standard input}: Assembler messages:
> | {standard input}:28: Error: lo register required -- `ldr ip,[r5,#16]'
> | {standard input}:33: Error: lo register required -- `sub sp,sp,r4'
> | {standard input}:37: Error: lo register required -- `ldr ip,[r5,#20]'
> | {standard input}:44: Error: lo register required -- `ldr ip,[r1,r2]'
> | {standard input}:46: Error: Thumb does not support conditional executio=
n
> | {standard input}:47: Error: Thumb does not support conditional executio=
n
> | {standard input}:48: Error: Thumb does not support conditional executio=
n
> | {standard input}:49: Error: Thumb does not support conditional executio=
n
> | {standard input}:50: Error: Thumb does not support conditional executio=
n
> | make[8]: *** [xptcinvoke_arm.o] Error 1


The error messages are clear that there is mixed arm
and thumb code in a file but is not properly guarded with
.arm and .thumb (.code16 or .code32) directives.

It could be inline assembly.

Thanks

-Khem


