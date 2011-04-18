Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QBftM-0003EX-2q
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 06:16:52 +0200
Received: by qwh5 with SMTP id 5so2411271qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 21:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=OM5PBdMPQX7fszur9+WvcN30+L0axuXQl7z+VxhsWbo=;
	b=h/jPTHYB3dTt4FnV7Vdss68eAMUgouQEg4VFeN84FhXTTuj1QHOAmBrlYETny9wQLL
	x9RmYqJXL542lb3t0MCiNZgztK2lvUhlEx1PW3Wte+i4dEPMfJ9iQ89IYNQn0vV1f8gQ
	OUBcxl4uQ5ZH/cXhYtkUmPUpT4s4Hoe4pqw8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=apr98eynzES7BzNlNlMQPqsPcBkr0I1TyyuReapumyJg+YoNSW7XuvFF/JgW/sf+dW
	/OKzTvDJFYlGrDTcHdHByfN4ezSIMP4UNdwToXkxIm99JCSilXiDnw5bzMu4YxwkKbD+
	gAf8KeShVkM9ia56gi6Y34zVChXhmiYW2Nq/o=
MIME-Version: 1.0
Received: by 10.224.207.10 with SMTP id fw10mr2453576qab.79.1303100070610;
	Sun, 17 Apr 2011 21:14:30 -0700 (PDT)
Received: by 10.224.89.78 with HTTP; Sun, 17 Apr 2011 21:14:30 -0700 (PDT)
In-Reply-To: <20110418031524.GA19200@denix.org>
References: <1302319620-18223-1-git-send-email-heroor@gmail.com>
	<1302319620-18223-4-git-send-email-heroor@gmail.com>
	<20110417182730.GC4068@denix.org>
	<BANLkTi=FJ2bF31UUSS_4By691ccs0dXnrQ@mail.gmail.com>
	<20110418031524.GA19200@denix.org>
Date: Mon, 18 Apr 2011 09:44:30 +0530
Message-ID: <BANLkTi=QiV6c0HbpaQ0wM+uT5ug3GM3iKg@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv3 4/5] ti-syslink-module: Add Syslink version 02.00.00.68 Beta1
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
X-List-Received-Date: Mon, 18 Apr 2011 04:16:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2011 at 8:45 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Mon, Apr 18, 2011 at 08:31:02AM +0530, Siddharth Heroor wrote:
>> On Sun, Apr 17, 2011 at 11:57 PM, Denys Dmytriyenko <denis@denix.org> wr=
ote:
>> > On Sat, Apr 09, 2011 at 08:56:59AM +0530, Siddharth Heroor wrote:
>> >> From: Siddharth Heroor <heroor@ti.com>
>> >>
>> >>
>> >> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> >> ---
>> >> =A0...-syslink-module_02.00.00.67+02.00.00.68beta1.bb | =A0 11 ++++++=
+++++
>> >> =A01 files changed, 11 insertions(+), 0 deletions(-)
>> >> =A0create mode 100644 recipes/ti/ti-syslink-module_02.00.00.67+02.00.=
00.68beta1.bb
>> >
>> > Sid,
>> >
>> > Renaming the file with the proper versioning doesn't do any good, when=
 you set
>> > the actual PV inside the recipe to the wrong value anyway - bitbake an=
d opkg
>> > will sort by PV and not the recipe name! Hence, you are setting the ve=
rsion to
>> > 02_00_00_68 and what happens when the real 02_00_00_68 gets released?
>> >
>> Hi Denys,
>>
>> Thank you for correcting my understanding.
>>
>> The next version of syslink is expected to be 02_00_00_69 Beta2. I
>> don't think there will be
>> a 02_00_00_68_beta2. The version numbering followed by syslink appends b=
eta1 to
>> 02_00_00_68. In such a case, should the next version recipe be
>> 02_00_00_68+02_00_00_69_beta2?
>
> Sid,
>
> Are you saying the versioning schema for this component is like this:
>
> 02_00_00_68_beta1
> 02_00_00_69_beta2
> etc?
>
> It's quite weird... Anyway, for proper sorting and ordering of versions, =
it's
> still recommended to use OE's versioning policy...
Hi Denys,

Yes, the versioning for this component is exactly how you point out. I will
follow OE's versioning for any new versions I submit going forward.

>
> --
> Denys
>
>> > I did some quick editing and will send the updated patches for #4 and =
#5 -
>> > please review and provide feedback. Thanks.
>> >
>> > --
>> > Denys
>> >
>> >> diff --git a/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta=
1.bb b/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb
>> >> new file mode 100644
>> >> index 0000000..f7bcb35
>> >> --- /dev/null
>> >> +++ b/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb
>> >> @@ -0,0 +1,11 @@
>> >> +require ti-syslink-module.inc
>> >> +
>> >> +PV =3D "02_00_00_68"
>> >> +PVExtra =3D "_beta1"
>> >> +
>> >> +S =3D "${WORKDIR}/syslink_${PV}${PVExtra}/ti/syslink/utils/hlos/knl/=
Linux"
>> >> +SYSLINK_ROOT =3D "${WORKDIR}/syslink_${PV}${PVExtra}"
>> >> +
>> >> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/$=
{PV}${PVExtra}/exports/syslink_${PV}${PVExtra}.tar.gz;name=3Dsyslinktarball=
"
>> >> +SRC_URI[syslinktarball.md5sum] =3D "468034372124f70f82b60cfb5f11c8e8=
"
>> >> +SRC_URI[syslinktarball.sha256sum] =3D "ed574dcb3a5477cfbc69a1c9e768d=
5197291cb057d19fd791e16e1c89af3e8e1"
>> >> --
>> >> 1.7.0.4
>> >>
>> >>
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>>
>>
>> --
>> Sid
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Sid


