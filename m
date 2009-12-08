Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NI6TX-0002XZ-Ia
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 21:16:02 +0100
Received: by iwn32 with SMTP id 32so3945508iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 12:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3RkJNPA5lR01304s5FUdb+pTBgApY8rK4QlFLecvH+w=;
	b=KYUooN6KJfXKdzTVHtzXnOq1CREBFZDFxPL43rOA4PVf9XenF59AnoR7Wnjxi8WNz+
	ekn3/oCCFFgjIqlikQ1pHsSKeBBo5iRjd4nWRpF9fk8HNwjEtlBJzi7tzd2RFpIC6tFv
	MEkDhijvTu1qHyH29J/U9zZhu5puUq58M0v+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KhUqB06VrikKYEaTdrWAdNN8T4CJWlWsZxPzh2wzUBDOvlDnuqDvfNMOzZ7PNU8zp4
	rgfzkwfjSjFU4qDUf2ns66pHbzgk2L6YpDpYlYPctURWsd7l1DpHVZ45hAl4AQSDd64i
	1f1DF+D2Radm60O18yIsfrX9sNXAjSN8Ppe3s=
MIME-Version: 1.0
Received: by 10.231.122.139 with SMTP id l11mr169153ibr.53.1260303258045; Tue, 
	08 Dec 2009 12:14:18 -0800 (PST)
In-Reply-To: <ec1f3d400912072024u2ab3a98bg96665cd8457efcd9@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90911301042t6ed432b2m1189c619772edf9c@mail.gmail.com>
	<ec1f3d400912072024u2ab3a98bg96665cd8457efcd9@mail.gmail.com>
Date: Tue, 8 Dec 2009 12:14:18 -0800
Message-ID: <19c1b8a90912081214u9abe04fm774bd7f54e7bf70a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Tue, 08 Dec 2009 20:16:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 7, 2009 at 8:24 PM, RK Raggit <rk.raggit@gmail.com> wrote:
>>
>> This is gcc ICE. You could preprocess the file and provide commandline
>> options and the preprocessed file.
>> Secondly I also noticed that you are using gcc 4.2. It would be
>> interesting to know if the same ICE happens
>> with gcc 4.4. Btw. you would be better of using gcc 4.4 for new arm
>> processors like cortex a9
>>
> Thanks Khem. I moved to gcc4.4 - it chugged past glibc without problem. B=
ut
> further down i have a new error with util-linux-ng package. Something lik=
e
> this -
>
> ***************
> make[2]: Entering directory
> `/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/util=
-linux-ng-2.16-r8.3/util-linux-ng-2.16/login-utils'
> ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a9
> -mfpu=3Dneon -mfloat-abi=3Dsoftfp -DHAVE_CONFIG_H -I. -I.. =C2=A0-include=
 ../config.h
> -I../include -DLOCALEDIR=3D\"/usr/share/locale\"
> -isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gn=
ueabi/usr/include
> -fsigned-char
> -isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gn=
ueabi/usr/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -gg=
db3
> -MT login.o -MD -MP -MF .deps/login.Tpo -c -o login.o login.c
> mv -f .deps/login.Tpo .deps/login.Po
> ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a9
> -mfpu=3Dneon -mfloat-abi=3Dsoftfp -DHAVE_CONFIG_H -I. -I.. =C2=A0-include=
 ../config.h
> -I../include -DLOCALEDIR=3D\"/usr/share/locale\"
> -isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gn=
ueabi/usr/include
> -fsigned-char
> -isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gn=
ueabi/usr/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -gg=
db3
> -MT setproctitle.o -MD -MP -MF .deps/setproctitle.Tpo -c -o setproctitle.=
o
> `test -f '../lib/setproctitle.c' || echo './'`../lib/setproctitle.c
> mv -f .deps/setproctitle.Tpo .deps/setproctitle.Po
> ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a9
> -mfpu=3Dneon -mfloat-abi=3Dsoftfp -DHAVE_CONFIG_H -I. -I.. =C2=A0-include=
 ../config.h
> -I../include -DLOCALEDIR=3D\"/usr/share/locale\"
> -isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gn=
ueabi/usr/include
> -fsigned-char
> -isystem/home/raghu/opendistro/build/tmp/staging/armv7a-angstrom-linux-gn=
ueabi/usr/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -gg=
db3
> -MT checktty.o -MD -MP -MF .deps/checktty.Tpo -c -o checktty.o checktty.c
> /tmp/ccQfmzYl.s: Assembler messages:
> /tmp/ccQfmzYl.s:9352: Error: offset out of range
> /tmp/ccQfmzYl.s:9361: Error: offset out of range
> /tmp/ccQfmzYl.s:9700: Error: offset out of range
> /tmp/ccQfmzYl.s:9702: Error: offset out of range
> make[2]: *** [checktty.o] Error 1
> make[2]: Leaving directory
> `/home/raghu/opendistro/build/tmp/work/armv7a-angstrom-linux-gnueabi/util=
-linux-ng-2.16-r8.3/util-linux-ng-2.16/login-utils'
> ******************
>
> Anyone seen something like this ? Is it still due to an improperly
> built toolchain ?

Could you provide preprocessed output of
checktty.c file ?


>
> --RK
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


