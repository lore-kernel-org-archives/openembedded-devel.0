Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qepxe-0008Jv-LT
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 16:53:50 +0200
Received: by iwn4 with SMTP id 4so955109iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Xw1D4Le35ezeKpcZFe/4osM7mY6Uq+fQDInx4wuQWAg=;
	b=AipxYQANMotV0QR/4wzNFDVs4EvDhHMNTHfR4TE4xt+CVr7PghhLvrMDiQg4grGAVX
	XZvaiLQUonfSZZDdFOwyPtbERAd1mvRLpszif4wW8q/kD8wn2w3r4avi7XWiQ2BmOVS8
	WQzEpUhclE5fAWOMHoGp6xxONAEJlxHG8hNFE=
MIME-Version: 1.0
Received: by 10.42.189.199 with SMTP id df7mr130487icb.274.1310050198431; Thu,
	07 Jul 2011 07:49:58 -0700 (PDT)
Received: by 10.231.174.73 with HTTP; Thu, 7 Jul 2011 07:49:58 -0700 (PDT)
In-Reply-To: <CA+T6QPmwg7mbU-+YRM1=DuXUUJqJR+zqkyz=wcRFQAxff4mmYA@mail.gmail.com>
References: <1309968919-23810-1-git-send-email-agnel.joel@gmail.com>
	<CA+T6QPmwg7mbU-+YRM1=DuXUUJqJR+zqkyz=wcRFQAxff4mmYA@mail.gmail.com>
Date: Thu, 7 Jul 2011 09:49:58 -0500
Message-ID: <CAD=GYpZojdN_nkugcA7PNMNah32aYwEevsZAk7deFpAsTyR3cw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Jason Kridner <jkridner@beagleboard.org>
Cc: jdk@ti.com, joelagnel@ti.com, beagleboard@googlegroups.com,
	openembedded-devel@lists.openembedded.org, k-kooi@ti.com
Subject: Re: [PATCH v2] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND
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
X-List-Received-Date: Thu, 07 Jul 2011 14:53:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2011 at 9:35 AM, Jason Kridner <jkridner@beagleboard.org> wr=
ote:
> On Wed, Jul 6, 2011 at 12:15 PM, Joel A Fernandes <agnel.joel@gmail.com> =
wrote:
>> This script flashes the NAND of a BeagleBoard if it exists, and if there=
 is a valid image to flash
>>
>> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
>
> Acked-by: Jason Kridner <jkridner@beagleboard.org>
>
> I will eventually merge your changes into the mainline, but I believe
> it is helpful to get these updates in OE for BeagleBoard users who
> want to reproduce the shipping images.
>

> Can you update the process to only flash the boards if the USER button
> is held or some other similar strategy? =A0It seems that enabling this
> script would make the SD card image useless for non-flashing

Since we cannot access user-button as its used as an input event, can
I put in a message like "Press any key to flash", timeout if no key is
hit and then normally boot?

Regards
Joel


