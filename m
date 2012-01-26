Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RqPPE-000570-7S
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 14:30:24 +0100
Received: by werc1 with SMTP id c1so395617wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2012 05:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kP3zfn9DUNbWjxtL2Qylcc/NXstiuVjmJ0ML+pH6QE4=;
	b=QG3yyWmSpAf2iHm32Sd15tTNWXfj9jEcKsbfZn9zRFqbtoxOJrS/6H1UTCaiw7zjBS
	52cNmffZCetOz56+IYELnhbqFB/194zxN6gowrGJ7g4Ndh/jRCeF4UGGy4KhmeRg4lDW
	bUiAuSywmBUZEixb6oS8yFqbamr9IfFKC4RfM=
MIME-Version: 1.0
Received: by 10.216.138.220 with SMTP id a70mr1290782wej.24.1327584156474;
	Thu, 26 Jan 2012 05:22:36 -0800 (PST)
Received: by 10.223.117.72 with HTTP; Thu, 26 Jan 2012 05:22:36 -0800 (PST)
In-Reply-To: <CAMKF1sqtVB6hsAeC3PQcp6qwDEHdi=f=pFJ0gQwL93Gqf+DiFA@mail.gmail.com>
References: <1327519488.54350.YahooMailNeo@web36906.mail.mud.yahoo.com>
	<CAMKF1sqtVB6hsAeC3PQcp6qwDEHdi=f=pFJ0gQwL93Gqf+DiFA@mail.gmail.com>
Date: Thu, 26 Jan 2012 14:22:36 +0100
Message-ID: <CAGiJk9dwbMe8wyyXahAKYE4T9zULAPC=KxTqntpr-mBdBMYc6Q@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: how to specify alternative library locations from recipes using cmake
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
X-List-Received-Date: Thu, 26 Jan 2012 13:30:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/1/26 Khem Raj <raj.khem@gmail.com>:
> On Wed, Jan 25, 2012 at 11:24 AM, Greg Kogut <gkogut@yahoo.com> wrote:
>> I hope this isn't too much of a n00b question.
>>
>> I've developed a dozen new recipes (which I'll submit once they're stabl=
e), most of which use cmake.
>>
>> Some of them install libraries to alternative library locations, e.g. '/=
opt/myprog/lib'. =C2=A0 This works correctly, and I've verified the librari=
es are installed to the correct locations in the filesystem image.
>>
>> However, while building binaries dependent on these new libraries, also =
using cmake, cmake tries to point the linker to these directories on the ho=
st machine, not the cross-compiler filesystem. =C2=A0With predictable resul=
ts.
>>
>> What is the correct practice for correctly guiding cmake to the right lo=
cation? =C2=A0I've searched the existing recipes which use cmake without fi=
nding anything.
>>
>
> Does adding something like
> set( CMAKE_LIBRARY_PATH ${libdir} /opt/myprog/lib)
> to classes/cmake.bbclass help
>
>> Regards,
>> Greg
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Since CMake 2.4 it is possible to append without overwriting:
LIST( APPEND CMAKE_LIBRARY_PATH path_to_libs )

However, the same thing Khem proposed can be done per recipe,
apply the following line to your recipe and change it to suit your needs:
EXTRA_OECMAKE =3D "-DCMAKE_LIBRARY_PATH=3D${libdir} ${path_to_libs}"


Maybe it is necessary to use escaped quoting marks like \"${libdir}
${path_to_libs}\" to group the values.

--=20
Regards
Samuel


