Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1Qe0Fn-0001de-LX
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jul 2011 09:41:07 +0200
Received: by vxa37 with SMTP id 37so4520004vxa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jul 2011 00:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=eNnjO1+zPXNzIB/u5cQ+CK11K8FNs/2wEfluEDC9Onk=;
	b=Swop0ZwUWvIj4f457Mro8D9XF0x6rFMqjYWikzH6bkC9Af+wx6Wi00B9hCqEwfkl9B
	PFc82oRvjtWvgS3d4QhbYBu8weBGplhpNtaB7Vz7Adm9AsHtEuDD/jkTPAZ+x5PrtBck
	t5mD49DYIGKU8LoVoXmNm1wKUtGXy1YqFLggg=
MIME-Version: 1.0
Received: by 10.220.6.135 with SMTP id 7mr2423058vcz.201.1309851436499; Tue,
	05 Jul 2011 00:37:16 -0700 (PDT)
Received: by 10.220.176.194 with HTTP; Tue, 5 Jul 2011 00:37:16 -0700 (PDT)
In-Reply-To: <1309850758.24550.19.camel@BTW1>
References: <1309803629.20865.8.camel@BTW1>
	<CA+2YH7uyJUNWuvcNEC5jnsqkZs9Hnri7sxq0aZXWf1r88tU_qw@mail.gmail.com>
	<1309850758.24550.19.camel@BTW1>
Date: Tue, 5 Jul 2011 00:37:16 -0700
Message-ID: <CAG4_upTf2tNbusXcBs91dwf9TE+C9yxSmDM-nXc7wHsSHYDhyQ@mail.gmail.com>
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Cannot compile helloworld-image
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
X-List-Received-Date: Tue, 05 Jul 2011 07:41:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Alessandro,

This may be a silly question, but do you have all of the required
dependencies installed for your OS?  Looks like libtool isn't being
found.

http://wiki.openembedded.net/index.php/OEandYourDistro

Chris

On Tue, Jul 5, 2011 at 12:25 AM, Alessandro Sappia
<a.sappia@biotechware.com> wrote:
>
> --
>
> Alessandro Sappia
> CEO
>
> ________________________________________________________________________
>
> Biotechware srl
> C.so Castelfidardo, 30/A c/o I3P
> 10129 Torino (TO) Italy
> Tel: +39 011 0903260
> Fax: +39 011 0905126
> http://www.biotechware.com/
>
> Il giorno lun, 04/07/2011 alle 22.05 +0200, Enrico ha scritto:
>
>> On Mon, Jul 4, 2011 at 8:20 PM, Alessandro Sappia
>> <a.sappia@biotechware.com> wrote:
>> > Hi all,
>> > I just configured OE on my box and I tried to compile helloworld-image
>> > to check if everything is fine.
>> > I'm actually unable to complete with success this build because of thi=
s
>> > error:
>> > -----------------------------
>>
>> Try with:
>>
>> BB_NUMBER_THREADS =3D "1"
>>
>> and have a look at the thread "[oe] gettext-native fails to build" of
>> some days ago to know where i copied this hint from! (and maybe try
>> oe-core branch too).
>>
>
> [outout cut]
> m4
> -I /home/alessandro/oe/build/tmp/work/x86_64-linux/gettext-native-0.18-r6=
/gettext-0.18/gettext-tools/m4 -I /home/alessandro/oe/build/tmp/sysroots/x8=
6_64-linux/usr/share/aclocal-1.11 -I /home/alessandro/oe/build/tmp/sysroots=
/x86_64-linux/usr/share/aclocal -I /home/alessandro/oe/build/tmp/work/x86_6=
4-linux/gettext-native-0.18-r6/gettext-0.18/gnulib-local/m4/ -I /home/aless=
andro/oe/build/tmp/work/x86_64-linux/gettext-native-0.18-r6/gettext-0.18/ge=
ttext-runtime/m4 -I /home/alessandro/oe/build/tmp/work/x86_64-linux/gettext=
-native-0.18-r6/gettext-0.18/gettext-tools/m4 -I /home/alessandro/oe/build/=
tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11 -I /home/alessandro/oe/bui=
ld/tmp/sysroots/x86_64-linux/usr/share/aclocal --force -I ../../m4 -I ../m4=
 -I gnulib-m4
> | autoreconf: running: libtoolize --copy --force
> | autoreconf: failed to run libtoolize: No such file or directory
> | autoreconf: libtoolize is needed because this package uses Libtool
> | + oefatal 'autoreconf execution failed.'
> | + echo FATAL: 'autoreconf execution failed.'
> | FATAL: autoreconf execution failed.
> | + exit 1
> NOTE: package gettext-native-0.18-r6: task do_configure: Failed
> ERROR: Task 435
> (virtual:native:/home/alessandro/oe/openembedded/recipes/gettext/gettext_=
0.18.bb, do_configure) failed with exit code '1'
> ERROR:
> 'virtual:native:/home/alessandro/oe/openembedded/recipes/gettext/gettext_=
0.18.bb' failed
>
>
> It didn't work, but thanks.
>
> Ciao,
>
> Alessandro
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


