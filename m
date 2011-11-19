Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RRkGC-0007yA-RR
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Nov 2011 13:43:08 +0100
Received: by wwp14 with SMTP id 14so5711317wwp.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2011 04:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VDzvEV2c6T9oN4WWyIIRrHffOFGLiQbkewEzC3cnRz4=;
	b=TPLGE70V1u3aPtjI3G4VNxz3gAUBDT7wxhSaAqvG9YrVElbGazp6ZIQfVKXgec/3HQ
	MRnPtFASG8wuWLlzuK15MRyPX+YThwQ0Mldo4Hdc+UxIlg+QgSXJjzJHwdaQzeHVWKwN
	hAB+0PPm6kS2FC9QplXox/l/0erQmkIfRLMqY=
MIME-Version: 1.0
Received: by 10.216.221.160 with SMTP id r32mr994875wep.54.1321706200185; Sat,
	19 Nov 2011 04:36:40 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.37.6 with HTTP; Sat, 19 Nov 2011 04:36:39 -0800 (PST)
In-Reply-To: <4EC76361.9070604@eukrea.com>
References: <CAFU7RzMFc2jtHKRAHQYBykpBTAVhpEKh+01yKUZFXr6Et+LDFA@mail.gmail.com>
	<4EC76361.9070604@eukrea.com>
Date: Sat, 19 Nov 2011 06:36:39 -0600
X-Google-Sender-Auth: XI9oLWaTK67jWltYDzYjU4hvSWg
Message-ID: <CAPOJ94M00kuN24yqsqBByzxmykM55Pb6F2d8=ixtmF97GHKbOw@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: dm3730 question
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
X-List-Received-Date: Sat, 19 Nov 2011 12:43:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2011 at 2:05 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Raffaele,
>
> Le 19/11/2011 08:28, Raffaele Recalcati a =E9crit :
>>
>> At the moment I have a arago image running am37xx (without dsp) on my
>> desk with 2.6.37.
>> Can anybody point me the right branch for OE in order to move also
>> with dm3730 to 2.6.37 kernel?
>> The MACHINE can be either beagle-xm or dm3730-evm.
>> The confusion is created by the MACHINE=3Dbeagleboard that I don't know
>> if support dm3730 cpu.
>
> current oe-core builds a 3.0.x kernel which runs fine on beagleboard.
> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrumen=
ts/tree/recipes-kernel/linux/linux_3.0.bb
>
> Yo can get it easily with
> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/

To my knowledge, until
https://lists.yoctoproject.org/pipermail/meta-ti/2011-November/000124.html
is addressed anybody starting a new oe-core based effort (one that
doesn't have the old TI tools zip file already downloaded) will have
problems getting the DSP stuff to work.

Peter

>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


