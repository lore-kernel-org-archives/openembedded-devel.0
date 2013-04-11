Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQErE-0005Fr-OL
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 12:35:58 +0200
Received: by mail-ee0-f44.google.com with SMTP id c41so691984eek.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ov8JbusDRxquLhpzDcm0x1nUbDTC6UGM++R1HVsg3rQ=;
	b=R6a9bYnH5771m5Huyil/sXqD3PCEkwpF8q7Ti7xz4fYZMn98Dr7FDYS4pTEuUfp4UP
	DiFLPe2pjdk6OCSjIS8GEZ7Ssv9XmvySySu5Kwghuktb+kwLpJdX+vZePG1Q6Bt6A1zx
	ndsz+n9WWRehzpL7IAgxaD5umL1lGMEEbJaGdgHj3pLekDDlwJQfYh5/QZaNV1mfHghg
	kX2JoqHoauem9TRg05uDM6tKYwvkCtz3zJMq+Q+zX+bscPMdfWF8S1CuKV66xvvp8Aux
	y1J3DQnwcvi2oc/hYWyPDYNa42vHkCU9Ulu7P8xGRAIm2lJDKjLvhSbfjonvZrwXxVc2
	9QXw==
X-Received: by 10.15.111.202 with SMTP id cj50mr15599209eeb.6.1365675513972;
	Thu, 11 Apr 2013 03:18:33 -0700 (PDT)
Received: from ?IPv6:2001:610:612::3489:27c8:de55:7ab2?
	([2001:610:612:0:3489:27c8:de55:7ab2])
	by mx.google.com with ESMTPS id v6sm4757761eel.10.2013.04.11.03.18.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 03:18:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130411092926.GB2477@jama>
Date: Thu, 11 Apr 2013 12:18:30 +0200
Message-Id: <93976714-521F-4482-98F0-B6E2E2F865CF@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
	<1365610462-29689-5-git-send-email-koen@dominion.thruhere.net>
	<20130411092926.GB2477@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmr/cxtRtymju+dN06QzY4Rblk75RhcMX7rGD7XZnZymra+lgygB0IlSzGEBoNgoDFyRwpR
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 5/8] nodejs4: reinstate installing all the files
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
X-List-Received-Date: Thu, 11 Apr 2013 10:35:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 apr. 2013, om 11:29 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Wed, Apr 10, 2013 at 06:14:19PM +0200, Koen Kooi wrote:
>> Cloud9 needs the headers to build the o3-xml binary, using 0.8.x =
headers makes it crash.
>>=20
>> This installs everything namespaced as 'node4' to avoid collisions.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb | 18 =
+++++++++++++++---
>> 1 file changed, 15 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb =
b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
>> index 522b539..58ca135 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
>> @@ -28,8 +28,20 @@ do_compile () {
>> }
>>=20
>> do_install () {
>> -  install -d ${D}${bindir}
>> -  install -m 0755 build/default/node ${D}${bindir}/node4
>> -}
>> +  DESTDIR=3D${D} oe_runmake install
>> +
>> +  # fix namespace conflicts with other nodejs recipes
>> +  mv ${D}${bindir}/node ${D}${bindir}/node4
>> +  mv ${D}${bindir}/node-waf ${D}${bindir}/node4-waf
>> +
>> +  mv ${D}${includedir}/node ${D}${includedir}/node4
>>=20
>> +  mv ${D}${libdir}/node ${D}${libdir}/node4
>> +  mv ${D}${libdir}/pkgconfig/nodejs.pc =
${D}${libdir}/pkgconfig/nodejs4.pc
>> +  sed -i -e s:include/node:include/node4: =
${D}${libdir}/pkgconfig/nodejs4.pc
>> +
>> +  mv ${D}${datadir}/man/man1/node.1 ${D}${datadir}/man/man1/node4.1
>> +}
>>=20
>> +FILES_${PN} +=3D "${libdir}/node4/wafadmin"
>> +BBCLASSEXTEND =3D "native"
>=20
> nodejs4-native fails here:
> | mv: cannot stat
> =
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/=
nodejs4-native/0.4.12-r0/image/home/jenkins/oe/shr-core-branches/shr-core/=
tmp-eglibc/sysroots/x86_64-linux/usr/bin/node':
> No such file or directory
> | ERROR: Function failed: do_install (see
> =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/n=
odejs4-native/0.4.12-r0/temp/log.do_install.6513
> for further information)

I'll have a look at that, thanks!=


