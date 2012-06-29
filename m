Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SkP7o-0002ed-B8
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jun 2012 02:31:52 +0200
Received: by lbol5 with SMTP id l5so3727037lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 17:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=DDzDQ2QRsO2xJZCK7favf7KiZ1s98T1NUC2d64QOPXY=;
	b=oQ+MYlpcRgr+Zk6+Nasl5YOEsm10dcLLgxzMMavYis0jVRBDUS5Xs5CFJqTZHqr5so
	kZ+WPPl0O6n2+Wwf+iDotnz5KqCZu/HN2LsCYotKkrFO81guKjLNNrcxWTeg9JFMgC5F
	oZ2nvJSzNav3h7Ax4gBhqKK9rnVrQ54+CvQrg+JTbOA9Ccn9HfdZLpGcDVLnIHZzDIFp
	ahftDacYBeqvS5KTrvf+Na35Tirg+vNaL/C9b3FKU5EB8IvL2A1FzRbS6YDPdTnQOCqz
	Lg4XYEBDwnqXLyOzJNQNA+W3y9i8zK7dOjG7F/0F7aJwRXj9b9uPaQDYE2fmDFmNJCSR
	kjDQ==
Received: by 10.152.46.6 with SMTP id r6mr4347461lam.7.1340929257108; Thu, 28
	Jun 2012 17:20:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Thu, 28 Jun 2012 17:20:36 -0700 (PDT)
In-Reply-To: <CAMKF1sq-XoYkSVU6KNd+nF-B4AYNVqmA+sDkBiwd_MGrLNzT1A@mail.gmail.com>
References: <1340907500-14243-1-git-send-email-kergoth@gmail.com>
	<1340907500-14243-2-git-send-email-kergoth@gmail.com>
	<CAMKF1sq-XoYkSVU6KNd+nF-B4AYNVqmA+sDkBiwd_MGrLNzT1A@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 28 Jun 2012 17:20:36 -0700
X-Google-Sender-Auth: OPbo6jmPykyp7XJTjtyT8v9g46I
Message-ID: <CABcZANk1_T8Wo3O-B0NvSX+b0=U1GRyU3jRdn0eRbQANxt6Bgw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH 2/2] nano: rreplaces/rconflicts nano-tiny
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
X-List-Received-Date: Fri, 29 Jun 2012 00:31:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 5:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jun 28, 2012 at 11:18 AM, Christopher Larson <kergoth@gmail.com> =
wrote:
>> Signed-off-by: Christopher Larson <kergoth@gmail.com>
>> ---
>> =C2=A0meta-oe/recipes-support/nano/nano.inc | 4 +++-
>> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-sup=
port/nano/nano.inc
>> index 2d52cab..9e9cc62 100644
>> --- a/meta-oe/recipes-support/nano/nano.inc
>> +++ b/meta-oe/recipes-support/nano/nano.inc
>> @@ -7,8 +7,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c=
2e1ecd4e0c9be8967949"
>> =C2=A0SECTION =3D "console/utils"
>> =C2=A0DEPENDS =3D "ncurses"
>> =C2=A0RDEPENDS_${PN} =3D "ncurses-terminfo"
>> +RREPLACES_${PN} +=3D "nano-tiny"
>> +RCONFLICTS_${PN} +=3D "nano-tiny"
>>
>> -INC_PR =3D "r2"
>> +INC_PR =3D "r3"
>
> I was wondering if tinyness of nano can be turned into a PACKAGECONFIG ?

Good point, could do it that way too. Hmm.
--=20
Christopher Larson


