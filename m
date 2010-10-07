Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3vBV-00075m-9C
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 20:27:17 +0200
Received: by iwn37 with SMTP id 37so154751iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=pLVU6NiC6ulcC+o0rLTPR8IcluMqSKb/2i4yu7JLL2g=;
	b=IKrIlRFQxJMDAoiiLZ3LI6IWc8F3PBudxoza7JuvpAUD3Wew+yj2JZc2uHqMf+uczI
	V0swBh4PkxZFxxuuxpXtHwx+JcLyey3+PR4VMdHkicaubbVnW343GmJKTkyqFxbGt69f
	RbsLbMjQJLQrCbWooJelYzS2eBKkz4JejQOCo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=fpRC7TpHX0BK4iy2DivIFHqEduycbCE3EF/hfX3u4DRv0h3XhkXExM+pc8RFvk50a0
	D00Eha+MqCVJaD41xA4r/QPqEJhDPCpwCGGxhCptze4Kt8yyTv9sCrYAu9Q0e0+ZziII
	leMbhBSWV5H8gfTuxrFbUmaJYq3hQnE3Dnfu8=
Received: by 10.231.31.1 with SMTP id w1mr1232726ibc.162.1286476012464; Thu,
	07 Oct 2010 11:26:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Thu, 7 Oct 2010 11:26:31 -0700 (PDT)
In-Reply-To: <4CADE897.5070307@telus.net>
References: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
	<20101005123257.GD3517@excalibur.local> <4CAB3B4D.9000007@telus.net>
	<20101006103731.GG3517@excalibur.local> <4CADE897.5070307@telus.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Oct 2010 11:26:31 -0700
Message-ID: <AANLkTimOrM-DCsoP4yoo14g_wJ_h0ZVaY99R7UJ=TGmJ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-10-04
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
X-List-Received-Date: Thu, 07 Oct 2010 18:27:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2010 at 8:34 AM, dfoley <dfoley@telus.net> wrote:
> On 10-10-06 03:37 AM, Stefan Schmidt wrote:
>>
>> Hello.
>>
>> On Tue, 2010-10-05 at 07:50, dfoley wrote:
>>>
>>> May not be correct, but I ran into the same problem and patched.
>>>
>>> diff --git a/recipes/cacao/cacao.inc b/recipes/cacao/cacao.inc
>>> index c366b74..70bda75 100644
>>> --- a/recipes/cacao/cacao.inc
>>> +++ b/recipes/cacao/cacao.inc
>>> @@ -23,7 +23,7 @@ EXTRA_OECONF =3D "\
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0${@['','--enable-softfloat'][bb.data.getVar(=
'TARGET_FPU',d,1) =3D=3D
>>> 'soft']} \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-debug \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-vm-zip=3D${datadir}/cacao/vm.zip \
>>> - =C2=A0 =C2=A0 =C2=A0 --with-cacaoh=3D${STAGING_BINDIR_NATIVE}/cacaoh-=
${PV} \
>>> + =C2=A0 =C2=A0 =C2=A0 --with-cacaoh=3D${STAGING_BINDIR_NATIVE}/cacaoh-=
${PV}/cacaoh \
>>>
>>> =C2=A0--with-build-java-runtime-library-classes=3D${STAGING_DATADIR}/cl=
asspath/glibj.zip
>>> \
>>> =C2=A0 =C2=A0 =C2=A0--with-java-runtime-library-classes=3D${datadir}/cl=
asspath/glibj.zip \
>>> =C2=A0 =C2=A0 =C2=A0--with-java-runtime-library-libdir=3D${libdir_jni}:=
${libdir} \
>>
>> This does it fix for me as well. I wonder from which commit the =C2=A0di=
rectory
>> change was triggered in the last week.
>>
>> Care to send a git formatted patch with PR bump I could apply? As you di=
d
>> the
>> work you should get the credits for it. :)
>>
>> regards
>> Stefan Schmidt
>
> I don't mind if you commit it. You can put me in signed off by.
> Should the maintainer (MAINTAINERS file) verify it ?

what would be your sign off? your email does not reveal your full name :)

>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


