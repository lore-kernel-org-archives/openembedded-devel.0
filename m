Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrCfA-0007VN-Qj
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jan 2012 19:06:08 +0100
Received: by lahc1 with SMTP id c1so1470874lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2012 09:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=TT0scWocYdTNVW8wArF5z6CBRSdrVWUEXOJfza/RWzA=;
	b=C1SdJ7lkws0WrqxTLdUczp3vjPmdapFh+Ftt0U7ZS8+K/C/YggWJq+FQY/17duxO4u
	HEaXCf9halVR6/d8MwF/Jq6uKYZvs4Bznq0feAhSdNpM6a/BirACqdPZ9Yn4gPs0Pdyg
	JH0dO/WSgRsxNGA2iXROcNEmczx+/ZBRkotJc=
Received: by 10.152.122.38 with SMTP id lp6mr5900039lab.13.1327773498257; Sat,
	28 Jan 2012 09:58:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sat, 28 Jan 2012 09:57:48 -0800 (PST)
In-Reply-To: <2691471.Q2jpB2kn8z@helios>
References: <CACW_hTaJXTrAP4YTTA2CwXFe7sYeY3yEFi8JfNbhiEzZbMttqg@mail.gmail.com>
	<2691471.Q2jpB2kn8z@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jan 2012 09:57:48 -0800
Message-ID: <CAMKF1spCUanTjHTFdBn8njeYbkSVM5Pk7BaqgvZUsWq2ML5YUg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: get OE git hash tag in executable
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
X-List-Received-Date: Sat, 28 Jan 2012 18:06:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 28, 2012 at 6:18 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Saturday 28 January 2012 13:42:32 Frans Meulenbroeks wrote:
>> In order to allow backtracking of the sources for a binary build with OE=
, I
>> would like to (automatically) add the hash of the top level commit (and
>> maybe also the branch) of the oe git tree my recipe lives in).
>> E.g. in main.c I would like to have a var say:
>> const char * const buildfrom =3D "oe branch 2011.03-maintence hash
>> 1234567890"; or something like that.
>>
>> What would be the best way to get that info into my program?
>> (my best guess at the moment is to use a macro and compile with
>> -DOE_IDENT=3D"....." or so and say =C2=A0char *buildfrom =3D OE_IDENT; b=
ut not
>> really sure what the best way is to fill OE_IDENT and pass it to the
>> recipe.)
>
> Interesting question! Putting the information in a define specified on th=
e
> compiler command line would be one way; another way would be to have the
> recipe write to/append to/subsitute into a header file that you can #incl=
ude in
> the source. You would also probably want to include ${DATE} in the recipe=
's PV
> or use some other mechanism to ensure it gets rebuilt every time you buil=
d an
> image.

use python-fu to grok it from metadata dump this into a .h file during
do_configure and movie that headerfile into the sources then
include it in your .c and use it.

>
> I guess you are still using OE-Classic, but in OE-Core we now have a func=
tion
> in base.bbclass called get_layers_branch_rev that will return the git
> branch/revision information for all enabled layers. It was split out from=
 the
> code in the same bbclass that displays this information when BitBake star=
ts,
> so I guess you could just make a copy of it into your recipe for OE-Class=
ic.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


