Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M3bvA-0007Uo-MJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 22:16:20 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1839192ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=roM0MzqXhst6Zlkuyz8Ro84PM18Z46HgFpLvXj7UxT8=;
	b=EjaCYkA1iEokzsbon4UlZLNAA0B0p+DAg7Mpbl7sRok6NgAXSQlZpmMlOA63FaxWR1
	lboxf7YhshDRZtjqm3r+c1QJ1qirZacoz7Vnb4iLy5+ok7Pp8t66mUzvZyua8IGcnxrx
	gYQVDmJF5QMmhjA1IaFxuLZoY5P7jCi/11qEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Sejd/XBTexR/CNR5qtbVnxRCsPXrQpy5KCdEYE+tcsA73AQvkD6i64/dHquvk4RO2v
	pi8lTj31hdY9fH7Xn0uvz1b7BldFQkXGvY1/AmiDsLY4559hgobnze2sDrN1XgqjUhXD
	Si9VnO0om+292gtMP8FZ69nBla1RTowTEwdqQ=
MIME-Version: 1.0
Received: by 10.150.156.5 with SMTP id d5mr13882870ybe.119.1242072587358; Mon, 
	11 May 2009 13:09:47 -0700 (PDT)
In-Reply-To: <200905112052.53485.g.eismann@gmx.net>
References: <200905111744.00650.g.eismann@gmx.net>
	<200905112052.53485.g.eismann@gmx.net>
Date: Mon, 11 May 2009 16:09:47 -0400
Message-ID: <f96d234e0905111309u1ae4805bnaeb9adc1bf1ceca3@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: image generation
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
X-List-Received-Date: Mon, 11 May 2009 20:16:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2009 at 2:52 PM, G. Eismann <g.eismann@gmx.net> wrote:
> On Lunes 11 Mayo 2009 17:44:00 G. Eismann escribi=F3:
>> Hi,
>>
>> I am generating a image based in the micro-image.
>> I have added a new package to the image and worked OK.
>> Now, I have added several files to that package, but they are not in the
>> final image.
>>
>> I can see the files in the install directory of the package, so I guess
>> they are into the package.
>>
>> I have cleaned the package and the image, and built again the image. In =
the
>> process, the package is being built again, but the new files are lost.
>
> Well, I have found the problem, but I dont know why it's happening nor ho=
w to
> solve it.
>
> When building the image, the release 5 (the last one) of the package is b=
uilt,
> but in the "do_package_write_ipk" step there is an error because is looki=
ng
> for the install directory for the release 1.

Can you post your recipe, and we'll take a look?

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


