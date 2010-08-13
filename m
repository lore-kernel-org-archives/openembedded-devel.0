Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OjtKX-00046U-J6
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 14:25:51 +0200
Received: by gyd8 with SMTP id 8so933165gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 05:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GyDKC9JZ29OIHNe+RbGQUi0fDVsbvCmmMo/vNaTa98Y=;
	b=OZGmrsTLBKOOhvEXWffriDGrHrPmGWQzIdO9F3srL03IIV5nMe759/OeLhc/nnb9oD
	L5bn/YOYN+OmD8bOmOY8KKSDuoJH4CUtQJkFN6d5Jcf9g1BZlmekvJl5Yh/uefxb2fGl
	MXT0CBLj074Jw2TLccnIoCS9ZF5PMEEWkRY4A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IZhXmaK8hHtLKs+1/n1erhXVyrlwPLHum6aTo7t+AZQ7wQtGzfPMJe27jXVXDnN3bJ
	qZFP5w9z8ZPnJZOJ+vDWnW2R5/2g8SJ6TiNus/lg9yTw9Bs0EQyxUvdCveitJ2XcSO0T
	JKAVkU52Yl7a32TQiLQrPrzGZXOGb9ZfKLXPg=
MIME-Version: 1.0
Received: by 10.151.63.30 with SMTP id q30mr1920430ybk.154.1281702330852; Fri,
	13 Aug 2010 05:25:30 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Fri, 13 Aug 2010 05:25:30 -0700 (PDT)
In-Reply-To: <1281701005.3858.129.camel@mattotaupa>
References: <1281698231-26231-1-git-send-email-noor_ahsan@mentor.com>
	<1281701005.3858.129.camel@mattotaupa>
Date: Fri, 13 Aug 2010 14:25:30 +0200
Message-ID: <AANLkTinLVmyz+QJQKXRcmf-1375uTPC84RYM8Xr59V3-@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 12:25:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/8/13 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Freitag, den 13.08.2010, 17:17 +0600 schrieb noor_ahsan@mentor.com:
>> genboot-native: Removing legacy staging
>
> You used `git-send-email`, but it looks strange since this line should
> have been the subject line and not in the commit message.
>
> Please also mark iteration of your patches. For example this with =BBPATC=
H
> v2=AB. (See `--subject-prefix` in `git help format-patch`.) For clarity
> also add a small comment, what changed after the S-o-b line like below
> when you use `git commit`.

agree

>
>> * Replaced do_stage function with do_install and replaced ${STAGING_BIND=
IR} with ${D}${bindir}
>>
>> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> v2: Increase `PR`.
> ---
>
>> diff --git a/recipes/simpad-utilities/genboot-native.bb b/recipes/simpad=
-utilities/genboot-native.bb
>> index 47b9b34..f398a55 100644
>> --- a/recipes/simpad-utilities/genboot-native.bb
>> +++ b/recipes/simpad-utilities/genboot-native.bb
>> @@ -1,5 +1,5 @@
>> =A0SECTION =3D "console/utils"
>> -PR =3D "r1"
>> +PR =3D "r2"
>> =A0DESCRIPTION =3D "Console utility for generating a SIMpad boot image f=
or the proprietary SIEMENS Switzerland bootloader"
>> =A0FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/genboot=
"
>> =A0SRC_URI =3D "file://gen_boot.c file://arnold_boot.h file://simpad-mak=
e-flashimg"
>> @@ -9,12 +9,15 @@ DEPENDS =3D "pad-native"
>>
>> =A0inherit native
>>
>> +NATIVE_INSTALL_WORKS =3D "1"
>
> I am really a noob, but is not that for =93normal=94, i.e. no *-native,
> recipes indicating no explicit native recipe is needed?

Afaik this is not needed.

>
>> =A0do_compile() {
>> - =A0 =A0 cp ${WORKDIR}/*.h ${WORKDIR}/*.c .
>> - =A0 =A0 ${CC} -I. -o genboot gen_boot.c
>> + =A0 =A0 =A0 =A0cp ${WORKDIR}/*.h ${WORKDIR}/*.c .
>> + =A0 =A0 =A0 =A0${CC} -I. -o genboot gen_boot.c
>> =A0}
>
> You changed the whitespace. I do not know if there are any
> rules/recommendations in OE, but it bloats up the patch.

It indeed bloats. What happens is that tabs have been converted to
spaces (probably using oe-stylize.py). This is the preferred way in
oe.
We discussed this on irc and advised Noor to use spaces and/or oe-stylize.

Frans
>
>> -do_stage() {
>> - =A0 =A0 install -m 0755 genboot ${STAGING_BINDIR}/
>> - =A0 =A0 install -m 0755 ${WORKDIR}/simpad-make-flashimg ${STAGING_BIND=
IR}/
>> +do_install() {
>> + =A0 =A0 =A0 =A0install -d ${D}${bindir}/
>> + =A0 =A0 =A0 =A0install -m 0755 genboot ${D}${bindir}/
>> + =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/simpad-make-flashimg ${D}${b=
indir}/
>> =A0}
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


