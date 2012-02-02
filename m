Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1RsslN-0006Ol-BL
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 10:15:29 +0100
Received: by iaby12 with SMTP id y12so3198368iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2012 01:07:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.168.4 with SMTP id zs4mr11156107igb.25.1328173652929; Thu,
	02 Feb 2012 01:07:32 -0800 (PST)
Received: by 10.50.155.134 with HTTP; Thu, 2 Feb 2012 01:07:32 -0800 (PST)
In-Reply-To: <20120201125758.GA21529@mail.familie-heinold.de>
References: <CADZ6=asn5Tq6adpuysW229BYXDu3ExUVNDWEZtzpjyAUv9PHgQ@mail.gmail.com>
	<CADZ6=avk8ekCLnXv=wbYwhcYzHpyN9mR2mctUNW4hxFfGJZ5Ug@mail.gmail.com>
	<20120131170206.GA27750@mi.fu-berlin.de>
	<CADZ6=avTDaSvO4-aMwgJ4OyYtAKt_Ru2eVEbae_LtW6re6uyxQ@mail.gmail.com>
	<20120201125758.GA21529@mail.familie-heinold.de>
Date: Thu, 2 Feb 2012 10:07:32 +0100
Message-ID: <CADZ6=ataH4f+ekqX+6GU39mvXa_a25geUbLYkwXCdoFt65ah+Q@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] llvm-config: Work around shebang max length issue
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
X-List-Received-Date: Thu, 02 Feb 2012 09:15:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hallo Henning,

>> >> > This patch works around a max shebang length issue
>> >> > in llvm's llvm-config.
>> >>
>> >> Some feedback on the patch would be great.
>> >
>> > I am a bit short of time at the moment. So I can not test or apply you=
r patch.
>> > For the longer term llvm should go to core.
>>
>> Okay. We'll maintain this patch in our HidaV layer (which is
>> https://github.com/DFE/HidaV) for the time being.
>
> btw. you can make a pull request.
>

Wouldn't work - we use a .bbappend to meta-java's original llvm-config
recipe. It's not hard to re-integrate into the original recipe, but a
pull alone would not do.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


