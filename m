Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2qCI-0000bn-2o
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 19:18:50 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1248000yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 May 2009 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2/7eWFIcS+bgK1lETICWmOPkKTaJjZeryctEjuGfs9s=;
	b=PgVHqMOhq2DPBVr662pA/hXFTJGxmC4LFslkJD76U9Q/Ey1LZ8BWbuAV2cGYSTgCAz
	s/S3QhlLOp2+W9l24NnpFEHmHKyV07GuBbij4WylHWJGwIY4sIbT3PP42l+BfFuc3Oi1
	CHE8TTHXNae2kgnhNtwa+o7XosAGp58jJw1gs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=aDitIeissRdfIUF6TQmOIoDfVSedTHTDvhu9ZSQL3uUmYf04jclYWrX8LOWLT7x75/
	2XhKWezQs33UlacUBsHNp58D87TVmLCYP9xmpw6ZUJJTwnab8WeKbXJmHOUNiV+4Qyn5
	Y1Cmev7vbgN88/+g0RzI/vxCf9U7Bwk8R8HIE=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.134.16 with SMTP id h16mr12021229and.0.1241889150092; Sat, 
	09 May 2009 10:12:30 -0700 (PDT)
In-Reply-To: <f96d234e0905090916r6274adc9i25dec70503bacc7a@mail.gmail.com>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
	<f96d234e0905090916r6274adc9i25dec70503bacc7a@mail.gmail.com>
Date: Sat, 9 May 2009 14:12:30 -0300
X-Google-Sender-Auth: 189c562054becff4
Message-ID: <be7a9f3d0905091012h5e13bf56l9e9b66bd881a0ce1@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 11/23] cups: split backends and models
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
X-List-Received-Date: Sat, 09 May 2009 17:18:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, May 9, 2009 at 1:16 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Fri, May 8, 2009 at 8:50 PM, Otavio Salvador <otavio@ossystems.com.br>=
 wrote:
>> -DEPENDS =3D "gnutls jpeg dbus dbus-glib libpng zlib fakeroot-native"
>> -PR =3D "r1"
>> +DEPENDS =3D "gnutls jpeg dbus dbus-glib libpng zlib install-native fake=
root-native"
>> +PR =3D "r2"
>
> Patches looks good, and I like splitting cups up. =A0I don't see a cups
> maintainer in MAINTAINERS, so I'd say do what seems best.

Right; my major worry is about current cups users. The cups package
itself will not provide a full working cups, as it used to.

And I'm looking for ideas how to solve that before pushing it.

> Does install-native still exist in dev? =A0It seems we are now using
> coreutils-native for install (ref below).

We use stable at work and this has been done in our branch. I'll
update it in the tree. Thanks by catch it.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


