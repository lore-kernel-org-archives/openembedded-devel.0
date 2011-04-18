Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QBekF-00023N-J3
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 05:03:24 +0200
Received: by qwh5 with SMTP id 5so2395627qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Apr 2011 20:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=aBYQu/WgrFU7SjslFMS674yCXjB5fF/d4s5E2uJIFUY=;
	b=PyRz5mDfWfa+rkifixWZaphmhncjsCt0wigTEYlFYEnzOg7dqyA01xCTnljGrdWu0q
	4e8U7MmtwFQPqTeVNnLEAhsgwH3gScWBpAlMErjF6nrx1ja1olpw1pXkGNlhbDvI0sqO
	uJzXcyVnwtMoPfxhM0y6NkuxkmwPdc3zINq2E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PD6T4rqhqJqGnWMvomKPmgo5eZ/NjCDqCPb7beherR5EQ+sr1N32yi5CMnnltkNMem
	m+M+plWKxbQWrHZXiQJsveTP0lzC5SPwznbFF+VQe5RTl+wmRPQRUURdKsBdvpr6ry4e
	899JGDr/Z5RX9dgZrAtwv3noGVUKMxHum+JBI=
MIME-Version: 1.0
Received: by 10.224.211.194 with SMTP id gp2mr2369528qab.179.1303095662584;
	Sun, 17 Apr 2011 20:01:02 -0700 (PDT)
Received: by 10.224.89.78 with HTTP; Sun, 17 Apr 2011 20:01:02 -0700 (PDT)
In-Reply-To: <20110417182730.GC4068@denix.org>
References: <1302319620-18223-1-git-send-email-heroor@gmail.com>
	<1302319620-18223-4-git-send-email-heroor@gmail.com>
	<20110417182730.GC4068@denix.org>
Date: Mon, 18 Apr 2011 08:31:02 +0530
Message-ID: <BANLkTi=FJ2bF31UUSS_4By691ccs0dXnrQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Apr 2011 03:03:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 17, 2011 at 11:57 PM, Denys Dmytriyenko <denis@denix.org> wrote=
:
> On Sat, Apr 09, 2011 at 08:56:59AM +0530, Siddharth Heroor wrote:
>> From: Siddharth Heroor <heroor@ti.com>
>>
>>
>> Signed-off-by: Siddharth Heroor <heroor@ti.com>
>> ---
>> =A0...-syslink-module_02.00.00.67+02.00.00.68beta1.bb | =A0 11 +++++++++=
++
>> =A01 files changed, 11 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.=
68beta1.bb
>
> Sid,
>
> Renaming the file with the proper versioning doesn't do any good, when yo=
u set
> the actual PV inside the recipe to the wrong value anyway - bitbake and o=
pkg
> will sort by PV and not the recipe name! Hence, you are setting the versi=
on to
> 02_00_00_68 and what happens when the real 02_00_00_68 gets released?
>
Hi Denys,

Thank you for correcting my understanding.

The next version of syslink is expected to be 02_00_00_69 Beta2. I
don't think there will be
a 02_00_00_68_beta2. The version numbering followed by syslink appends beta=
1 to
02_00_00_68. In such a case, should the next version recipe be
02_00_00_68+02_00_00_69_beta2?

> I did some quick editing and will send the updated patches for #4 and #5 =
-
> please review and provide feedback. Thanks.
>
> --
> Denys
>
>> diff --git a/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.b=
b b/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb
>> new file mode 100644
>> index 0000000..f7bcb35
>> --- /dev/null
>> +++ b/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb
>> @@ -0,0 +1,11 @@
>> +require ti-syslink-module.inc
>> +
>> +PV =3D "02_00_00_68"
>> +PVExtra =3D "_beta1"
>> +
>> +S =3D "${WORKDIR}/syslink_${PV}${PVExtra}/ti/syslink/utils/hlos/knl/Lin=
ux"
>> +SYSLINK_ROOT =3D "${WORKDIR}/syslink_${PV}${PVExtra}"
>> +
>> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV=
}${PVExtra}/exports/syslink_${PV}${PVExtra}.tar.gz;name=3Dsyslinktarball"
>> +SRC_URI[syslinktarball.md5sum] =3D "468034372124f70f82b60cfb5f11c8e8"
>> +SRC_URI[syslinktarball.sha256sum] =3D "ed574dcb3a5477cfbc69a1c9e768d519=
7291cb057d19fd791e16e1c89af3e8e1"
>> --
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Sid


