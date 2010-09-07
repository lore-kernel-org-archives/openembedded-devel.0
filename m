Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oss0X-0005rq-1m
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 08:50:18 +0200
Received: by iwn2 with SMTP id 2so4941806iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 23:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hO8DNFOfO0/Xyve2Xv25x4eAuEuCCKVvqA5R9tMpqlg=;
	b=fbdf1kniqJPr14lsjmuJDCpS/H0Dp3I3Ki1mPAN7PCQvP4qcfujHi9K1XqjnyK/Euz
	VPamlLsDGMZUXWPYoFOQhvFvKDC/1nKdNm8lOplfTfBEMvwmfppQDhlVFZZla5LLB9Wj
	Mmv86gcdI2rvDnsCYOuvQ5AseIJutKKrlWszk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MB+9w/F8ns4HbraoIIcjIvVy6YwGTaChaDulE/JmnHOaBXM7PeSgEE2geIxTXYRpk4
	gAlxN2FoKqsVEct/ngO4iNVQx/hW8bo8ujfvR9M8M5P5ykcM2aY2SMrzEqaUev6BIUZR
	qFL3+IbAqaowccgApGUMPb9lphQAdb+Nfye2U=
MIME-Version: 1.0
Received: by 10.231.162.2 with SMTP id t2mr1692345ibx.57.1283842178342; Mon,
	06 Sep 2010 23:49:38 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 23:49:38 -0700 (PDT)
In-Reply-To: <AANLkTimt2g=o04TocN=w9t6z2sHk3vopELdgCqYTKQ4h@mail.gmail.com>
References: <1283777330-31590-1-git-send-email-fahad_usman@mentor.com>
	<AANLkTimt2g=o04TocN=w9t6z2sHk3vopELdgCqYTKQ4h@mail.gmail.com>
Date: Tue, 7 Sep 2010 08:49:38 +0200
Message-ID: <AANLkTikZ63T3=3fpb1iMNKmjJpEX9JQ1W80Xh_vOS1NU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] uicmoc-native_2.3.10.bb: converted to new style staging
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
X-List-Received-Date: Tue, 07 Sep 2010 06:50:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/7 Khem Raj <raj.khem@gmail.com>:
> On Mon, Sep 6, 2010 at 5:48 AM, Fahad Usman <fahad_usman@mentor.com> wrot=
e:
>> * Converted do_stage to do_install.
>> * Bumped PR
>> * Added NATIVE_INSTALL_WORKS =3D "1"
>>
>> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
>
> looks ok

looks ok to me too, not sure whether I tested it and not sure if that
uicmoc stuff is still relelvant
See also: http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D0=
ba9d6f94caea026c282d9d87704e4ada62babf0
I've asked about whether it was relevant, but (obviously) did not get a rep=
ly.

Frans
>> ---
>> =A0recipes/uicmoc/uicmoc-native_2.3.10.bb | =A0 13 ++++++++-----
>> =A01 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/recipes/uicmoc/uicmoc-native_2.3.10.bb b/recipes/uicmoc/uic=
moc-native_2.3.10.bb
>> index c161571..8c69bef 100644
>> --- a/recipes/uicmoc/uicmoc-native_2.3.10.bb
>> +++ b/recipes/uicmoc/uicmoc-native_2.3.10.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.trolltech.com"
>> =A0SECTION =3D "devel"
>> =A0PRIORITY =3D "optional"
>> =A0LICENSE =3D "GPL QPL"
>> -PR =3D "r4"
>> +PR =3D "r5"
>>
>> =A0SRC_URI =3D "ftp://ftp.trolltech.com/pub/qt/source/qt-embedded-${PV}-=
free.tar.gz \
>> =A0 =A0 =A0 =A0 =A0 =A0file://fix-makefile.patch \
>> @@ -43,11 +43,14 @@ do_compile() {
>> =A0 =A0 oe_runmake -C tools/makeqpf =A0 =A0 =A0 || die "Building makeqpf=
 failed"
>> =A0}
>>
>> -do_stage() {
>> - =A0 =A0install -m 0755 bin/moc ${STAGING_BINDIR}
>> - =A0 =A0install -m 0755 bin/uic ${STAGING_BINDIR}
>> - =A0 =A0install -m 0755 tools/makeqpf/makeqpf ${STAGING_BINDIR}
>> +do_install() {
>> + =A0 =A0install -d ${D}${bindir}
>> + =A0 =A0install -m 0755 bin/moc ${D}${bindir}
>> + =A0 =A0install -m 0755 bin/uic ${D}${bindir}
>> + =A0 =A0install -m 0755 tools/makeqpf/makeqpf ${D}${bindir}
>> =A0}
>>
>> =A0SRC_URI[md5sum] =3D "1f7ad30113afc500cab7f5b2f4dec0d7"
>> =A0SRC_URI[sha256sum] =3D "883363eb0c94de3d1e36f3ab9e09a8f127418d497213c=
c1a0ed1a1588ecd66b8"
>> +
>> +NATIVE_INSTALL_WORKS =3D "1"
>> --
>> 1.6.3.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


