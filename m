Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtOha-0000jW-Ip
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 19:44:56 +0200
Received: by ywa8 with SMTP id 8so179909ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 10:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5LyfROLvfDrPEkJeUVLocOgDnbsj1wA/iY8vbGqL+zA=;
	b=nM4upXem2JAvLSr9C4IcsmTSuHKjJm4OXZX79ctYgg8YMWTpDg1zjbgyG/EksQ0fcZ
	u3GttlN0l5KJASceU5T5Ch/UpzE22rm5LGPwJpFMRi4RBdrnFRdjQdsQ0cwbzFhGntVi
	l4qt3IYkkatG9GMaS5pmainU/Yj3zD9dXrR8U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=leHMtRwM4Ftugk3OR3GZEo34QYmS1oSKhBtUbHk1PqhVUcvKteXAu7+Vo9WZvbL+mY
	l3N5ETIldqH0U9H6mtwjxx1Qd00gGhgkkyhiS9nP3/UUS8bH4SmWbh+ZBrnqlnRaA68C
	VzAJFFKNkvpG+XOBh9PvrWSnqZ8vxhKt18+DQ=
MIME-Version: 1.0
Received: by 10.100.138.20 with SMTP id l20mr424914and.10.1283967852076; Wed,
	08 Sep 2010 10:44:12 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 10:44:11 -0700 (PDT)
In-Reply-To: <AANLkTin8rLFWXNpNHsxELiWCrh40iXbnib1V7DLh7sDu@mail.gmail.com>
References: <1283954503-25418-1-git-send-email-eric@eukrea.com>
	<AANLkTin8rLFWXNpNHsxELiWCrh40iXbnib1V7DLh7sDu@mail.gmail.com>
Date: Wed, 8 Sep 2010 19:44:11 +0200
Message-ID: <AANLkTikDfw1BEM3ss8Mp3xKrDf48-b9gRcdygAdHetqc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] rlpr 2.05: unbreak recipe
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
X-List-Received-Date: Wed, 08 Sep 2010 17:44:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/8 Khem Raj <raj.khem@gmail.com>:
> On Wed, Sep 8, 2010 at 7:01 AM, Eric B=E9nard <eric@eukrea.com> wrote:
>> * source URL is no more working so use debian mirrors
>> * fix GNU_HASH issue
>> * tested on armv5
>>
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
>> ---
>> =A0recipes/rlpr/rlpr_2.05.bb | =A0 18 ++++++++++--------
>> =A01 files changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/recipes/rlpr/rlpr_2.05.bb b/recipes/rlpr/rlpr_2.05.bb
>> index 47ac9c3..2751b9f 100644
>> --- a/recipes/rlpr/rlpr_2.05.bb
>> +++ b/recipes/rlpr/rlpr_2.05.bb
>> @@ -1,18 +1,20 @@
>> -SECTION =3D "console/network"
>> =A0DESCRIPTION =3D "rlpr makes it possible to print files on remote site=
s to your networked printers"
>> -HOMEPAGE =3D "http://truffula.com/rlpr/"
>> +HOMEPAGE =3D "http://freshmeat.net/projects/rlpr/"
>> +SECTION =3D "console/network"
>> =A0LICENSE =3D "GPL"
>> -SRC_URI =3D "ftp://www.truffula.com/pub/rlpr-2.05.tar.gz"
>> +PR =3D "r1"
>> +
>> +SRC_URI =3D "${DEBIAN_MIRROR}/main/r/rlpr/rlpr_2.05.orig.tar.gz"
>> +SRC_URI[md5sum] =3D "64ee8ccd94aabc90b9f40d0b2ad79e79"
>> +SRC_URI[sha256sum] =3D "6b1261c8a23a58c8e174d8ee1ad53c138ed0b9211f7ea3f=
3efe22d16af14ba9a"
>>
>> =A0inherit autotools
>>
>> =A0do_configure() {
>> - =A0 =A0 =A0 oe_runconf
>> + =A0 =A0 =A0 =A0oe_runconf
>> =A0}
>> -
>> =A0do_install() {
>> - =A0 =A0 =A0 make install DESTDIR=3D${D}
>> + =A0 =A0 =A0 =A0make install DESTDIR=3D${D}
>> =A0}
>>
>> -SRC_URI[md5sum] =3D "64ee8ccd94aabc90b9f40d0b2ad79e79"
>> -SRC_URI[sha256sum] =3D "6b1261c8a23a58c8e174d8ee1ad53c138ed0b9211f7ea3f=
3efe22d16af14ba9a"
>> +TARGET_CC_ARCH +=3D " ${LDFLAGS}"
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


