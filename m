Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1ShSub-00086P-Bi
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2012 23:58:05 +0200
Received: by dalh21 with SMTP id h21so10020774dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2012 14:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=oZpsD1Ca8yEdNKOA4Hk/JrtRrVTff77TgMs2VaowUT8=;
	b=J3cCXbS0TUesXrOvKOf3KBbOxQedAUh8AECMauec8nnNVUn63HTflY1Zs6c10QFW1l
	V/cGrHPqQqdtc5W2iOjUyWLarQ5KtDomCBBklwKjV4Jnb0TlGjy3+qO0IZnjDktwcpq8
	qr/4U4FWj6lUPTQmeN429xeZRh7oldtBM/3/i0C/S5X5nrsQr8p4lQC74VJJ8CT/B6pT
	3+OBiEgiJEfERrLLUt4RxNAuknqHZWollpCd7YwauQTnvPYRlHtMWviE1jH/OYfWETVH
	z3MwNpKhORcOCayBoi/yNEq6paFMHJ0ZSMeHnRO4zvJ3gBFcW2gKx2cIwjf7tGx6Hunh
	gjpg==
MIME-Version: 1.0
Received: by 10.68.230.68 with SMTP id sw4mr316000pbc.142.1340228839464; Wed,
	20 Jun 2012 14:47:19 -0700 (PDT)
Received: by 10.142.188.4 with HTTP; Wed, 20 Jun 2012 14:47:19 -0700 (PDT)
In-Reply-To: <CAAQYJAsdR1_T5Kc7rsA81Nmk+JfS4=Sw0XgZ31r+ewdKB71v=w@mail.gmail.com>
References: <1340091036-26496-1-git-send-email-andrea.adami@gmail.com>
	<1340092029-30030-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAsdR1_T5Kc7rsA81Nmk+JfS4=Sw0XgZ31r+ewdKB71v=w@mail.gmail.com>
Date: Wed, 20 Jun 2012 23:47:19 +0200
Message-ID: <CAAQYJAsUJUPNa0xrafXYESonYr7P=bih0YdswG3wY5M4+LC5kw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-initramfs][PATCH v2] ubi-utils-klibc: catch up with struct renaming in mtd/ubi-user.h
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
X-List-Received-Date: Wed, 20 Jun 2012 21:58:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 1:02 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> On Tue, Jun 19, 2012 at 9:47 AM, Andrea Adami <andrea.adami@gmail.com> wr=
ote:
>> * v2 replaces malformed v1 patch
>> * fix build, broken by header upgrade
>> * bump PR
>>
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> ---
>> =A0.../mtd/ubi-utils-klibc/libubi.c.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
17 +++++++++++++++++
>> =A01 files changed, 17 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.=
c.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patc=
h
>> index db95904..048e39b 100644
>> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
>> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc/libubi.c.patch
>> @@ -9,3 +9,20 @@
>> =A0{
>> =A0 =A0 =A0 =A0int fd, ret;
>>
>> +@@ -1352,13 +1352,13 @@
>> +
>> + int ubi_set_property(int fd, uint8_t property, uint64_t value)
>> + {
>> +- =A0 =A0 =A0struct ubi_set_prop_req r;
>> ++ =A0 =A0 =A0struct ubi_set_vol_prop_req r;
>> +
>> +- =A0 =A0 =A0memset(&r, 0, sizeof(struct ubi_set_prop_req));
>> ++ =A0 =A0 =A0memset(&r, 0, sizeof(struct ubi_set_vol_prop_req));
>> + =A0 =A0 =A0 r.property =3D property;
>> + =A0 =A0 =A0 r.value =3D value;
>> +
>> +- =A0 =A0 =A0return ioctl(fd, UBI_IOCSETPROP, &r);
>> ++ =A0 =A0 =A0return ioctl(fd, UBI_IOCSETVOLPROP, &r);
>> + }
>> +
>> + int ubi_leb_unmap(int fd, int lnum)
>> --
>> 1.7.3.4
>>
>
> This strange renaming issue happened today, with stock linux-libc-headers=
.
> I'm trying to understand why right now I get still pre-3.0 headers...
> this is mtd/ubi-user.h
>
> Anyhow, this patch is superseded by the next one, committing ver. 1.5.0
>
> Andrea

I've found out oe-core's parent recipe  mtd-utils_1.5.0 is staging its
own headers in sysroot...
We happen to install mtd-utils in our images so the header update has
always been masked.

FWIW ubi-utils-klibc has own do_install and does not touch the sysroot :)

Thinking now about the best solution...

Andrea


