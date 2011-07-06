Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QeUKf-0005BU-TH
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 17:48:11 +0200
Received: by iym10 with SMTP id 10so55958iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=gjvj0RTuls4gsj8SEipPne2mSWJ4p5YkaDMN2zBFBMU=;
	b=iRTp9bqFm0WT0WbaGkHa/r51TRows9/3MICIpijVHdN9h754+C8EUmhH/c2RsNL8Pi
	w8h8XHlMYWwWUkRujXe9/jyOE1L3/F4NihCgGlGf2Z7BvSKDwJyXlbDeOxMrKOqwYEJT
	FI9gUPQhMPorBTWnON6v8BhUKaeSh3kQdaxdY=
MIME-Version: 1.0
Received: by 10.231.82.197 with SMTP id c5mr7826108ibl.131.1309967058254; Wed,
	06 Jul 2011 08:44:18 -0700 (PDT)
Received: by 10.231.174.73 with HTTP; Wed, 6 Jul 2011 08:44:18 -0700 (PDT)
In-Reply-To: <1309945216.4518.8.camel@mattotaupa>
References: <1309915643-16401-1-git-send-email-agnel.joel@gmail.com>
	<1309945216.4518.8.camel@mattotaupa>
Date: Wed, 6 Jul 2011 10:44:18 -0500
Message-ID: <CAD=GYpYaf5qeGMypdADi-2yUXqgtNbJDbJYao0MijakNoxuaGA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: joelagnel@ti.com, k-kooi@ti.com, openembedded-devel@lists.openembedded.org,
	jdk@ti.com
Subject: Re: [PATCH] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND.
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
X-List-Received-Date: Wed, 06 Jul 2011 15:48:11 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for your suggestions. I will make the requested changes,

>> =A0do_install() {
>> @@ -28,4 +28,7 @@ do_install() {
>> =A0 =A0for i in ${TEST_FILES}; do
>> =A0 =A0 =A0install -m 0755 ${S}/${i} ${D}/${bindir}
>> =A0 =A0done
>> + =A0# Add =A0script to flash the NAND if it exists and if there is a va=
lid image to flash on bootup.
>
> =95 After =BBAdd a space can be removed.
> =95 =BBon bootup=AB is not clear to me. Does the BB have to be rebooted a=
nd
> then the image is flashed?

In boards with a NAND device, an image is written to the NAND if the
SD Card has an image. This is during startup.

Regards,
Joel


