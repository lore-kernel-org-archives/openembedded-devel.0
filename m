Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1RQ6iJ-0006fi-0o for openembedded-devel@lists.openembedded.org;
	Tue, 15 Nov 2011 01:17:23 +0100
Received: by ywt2 with SMTP id 2so3934992ywt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 16:11:00 -0800 (PST)
Received: by 10.100.230.2 with SMTP id c2mr868409anh.35.1321315860565;
	Mon, 14 Nov 2011 16:11:00 -0800 (PST)
Received: from [192.168.0.225] ([24.214.175.85])
	by mx.google.com with ESMTPS id 36sm66421516anz.2.2011.11.14.16.10.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 16:10:59 -0800 (PST)
From: David Thomas <david.thomas@microbee-systems.com>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 14 Nov 2011 18:11:00 -0600
In-Reply-To: <20111114232852.GB3600@jama.jama.net>
To: openembedded-devel@lists.openembedded.org
References: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
	<CAEsOVNf_5HnBQHuJpuOrAXJQDhhoM7kAF5L56bCF=fBFeOjxyA@mail.gmail.com>
	<CALJpqJy6gZG2w6PmptOV0tzV9wzQr5zdPZKeJbzn02PrAb__Uw@mail.gmail.com>
	<20111114232852.GB3600@jama.jama.net>
Message-Id: <6523650A-975B-4F60-A56D-59FC87F3F24E@microbee-systems.com>
X-Mailer: Apple Mail (2.1251.1)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: GCC Error
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
X-List-Received-Date: Tue, 15 Nov 2011 00:17:23 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Well not everyone works this day in and day out now do they? Show me =
where it states you have to use gcc.4.6 and for that matter, I =
specifically choose a LTS platform to avoid having to play latest and =
greatest.

So I ask, what is gained by forcing the user to have to use the absolute =
latest version?

In addition, it is not necessarily clear to a OE newby how all this is =
pieced together? It is a hackers paradise, I am not a hacker, I have a =
schedule to meet.
Perhaps=20

In any event, it is moot, were dumping the cm-t35 and using a =
beagleboard for product demonstration as it is a dead end.=20

"The toolchain problems wouldn't have been there if people had used an =
existing, working distro like angstrom, the kernel issues mentioned =
above are all handled automagically by linux.inc."

Really?

On Nov 14, 2011, at 5:28 PM, Martin Jansa wrote:

> On Mon, Nov 14, 2011 at 04:23:30PM -0600, David Thomas wrote:
>> OK, so I fight a install of gcc-4.6 onto ubuntu lts and same error. I
>> first tried for weeks to get Compulab CM-T35 stuff to work per their
>> instructions. Then I get the scripts and all seems well, now this. I
>> have spent a month on trying to build a cm-t35 so I can then add in
>> additional functionality. At ever turn it fails.  4 weeks and =
nothing.
>>=20
>> I mean, how hard can this be?
>=20
> How hard is to find out that
> meta-smartphone/meta-palm/recipes-kernel/linux/linux-hpveer_git.bb
> probably is not best kernel for CM-T35 as the hpveer in name suggests?
>=20
> And how hard is to open that recipe and read:
> # Workaround default -Werror setting and some warnings in kernel =
compilation
> TARGET_CC_KERNEL_ARCH +=3D " -Wno-error=3Dunused-but-set-variable =
-Wno-error=3Darray-bounds"
>=20
> which is needed for newer gcc to not fail with -Wall -Werror.
>=20
> Regards,
>=20
>>=20
>>=20
>> On Mon, Nov 14, 2011 at 12:59 PM, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>> On Mon, Nov 14, 2011 at 12:55 PM, David Thomas
>>> <david.thomas@microbee-systems.com> wrote:
>>>> I am getting a gcc error
>>>>=20
>>>> cc1: error: -Werror=3Dunused-but-set-variable: No option =
-Wunused-but-set-variable
>>>>=20
>>>> Using the Angstrom scripts I can run machine=3Dbeagleboard and =
complete.
>>>> However, machine=3Dcm-t35 with a cm-t35.conf file throws this =
error.
>>>>=20
>>>> I am having to guess that the machine file is all that was =
required,
>>>> it seems to pich all the right arch, etc.
>>>>=20
>>>> I had asked on Angstrom for any CM-T35 related info to no avail...
>>>=20
>>> This error is on by default for the compiler for OE now. You can get
>>> around it by
>>>=20
>>> 1) Fixing the (potential) errors in the source code
>>> 2) Turning off the error in the build (EXTRA_CFLAGS =3D
>>> "-Wno-error=3Dunused-but-set-variable" or something similiar)
>>>=20
>>> -M
>>>=20
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>=20
>>=20
>>=20
>>=20
>> --=20
>> Dave Thomas
>> MicroBee Systems, Inc
>> 1429 Weatherly Road, Suite G
>> Huntsville, AL 35803-1187
>> 256-489-6671 (Voice)
>> 256-426-2431 (Mobile)
>> 256-489-6673 (FAX)
>> www.microbee-systems.com
>> "Innovative Solutions for an Embedded World"
>>=20
>> This message is intended for the sole use of the addressee, and may
>> contain information that is privileged, confidential and exempt from
>> disclosure under applicable law. If you are not the addressee you are
>> hereby notified that you may not use, copy, disclose, or distribute =
to
>> anyone the message or any information contained in the message. If =
you
>> have received this message in error, please immediately advise the
>> sender by reply email and delete this message.
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


