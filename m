Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pabigot@gmail.com>) id 1RNrwR-00054r-6E
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 21:06:43 +0100
Received: by wwf4 with SMTP id 4so1105784wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 12:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xJeComTFoUuYuJXSbMEk3HqOrYyneVXs3htvMim792A=;
	b=SOVBWS/P1wRHBOX9NiQvOXnfYmyvFwYuRtdIJ/ywrSSH/vmnw4aag7s2B+9Z//fxRY
	ql6kzYWYHUnwUyE8euz+XhS100H0/swAvnwpqe7Z4+e7ZnuIde5iZ8ZgdKcDKT6p7+q2
	uwpK83xgMRsZqVFlNjHd7SXf1hXY8pMP82VAA=
MIME-Version: 1.0
Received: by 10.216.14.93 with SMTP id c71mr4935548wec.40.1320782428563; Tue,
	08 Nov 2011 12:00:28 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.30.200 with HTTP; Tue, 8 Nov 2011 12:00:28 -0800 (PST)
In-Reply-To: <CA+M6bXkfk40ztOn+WFocLFGzLRU6PE4z5Qf_9=NAnhO_U4QFSg@mail.gmail.com>
References: <CAPOJ94PUaBtZkRHE_v_x4raOQZnBtHp9bt6mvoMjZGmPTQ=-jQ@mail.gmail.com>
	<CA+M6bXkfk40ztOn+WFocLFGzLRU6PE4z5Qf_9=NAnhO_U4QFSg@mail.gmail.com>
Date: Tue, 8 Nov 2011 14:00:28 -0600
X-Google-Sender-Auth: 1q9gL3SiF8a6VO7AmoDRpL1ilNY
Message-ID: <CAPOJ94NE2DBeyuW5zqusE-HL4dTxGVvf3U0n0dfnscC0UzF0Sw@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: forcing dependency on genext2fs-native
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
X-List-Received-Date: Tue, 08 Nov 2011 20:06:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2011 at 1:23 PM, Tom Rini <tom.rini@gmail.com> wrote:
> On Tue, Nov 8, 2011 at 11:25 AM, Peter Bigot <bigotp@acm.org> wrote:
>> I've added a DEPENDS +=3D "genext2fs-native" for a recipe in meta-ti,
>> but the corresponding package is not getting built. =A0bitbake -DDD
>> says:
>>
>> DEBUG: Added dependency genext2fs-native for
>> /prj/oe/angstrom/sources/meta-ti/recipes-misc/images/cloud9-gfx-image.bb
>> DEBUG: providers for genext2fs-native are: ['genext2fs-native']
>> DEBUG: sorted providers for genext2fs-native are:
>> ['virtual:native:/prj/oe/angstrom/sources/openembedded-core/meta/recipes=
-devtools/genext2fs/genext2fs_1.4.1.bb']
>> DEBUG: adding virtual:native:/prj/oe/angstrom/sources/openembedded-core/=
meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
>> to satisfy genext2fs-native
>>
>> I'm guessing the "virtual:native:" means somebody thinks genext2fs
>> should already be installed on the host. =A0It's not available on
>> Fedora, so this decision is wrong. =A0I haven't been able to figure out
>> what's causing this to happen.
>
> No, it means that the "virtual:native" (coming from BBCLASSEXTEND in
> the recipe file) is being selected to provide "genext2fs-native"
> (since in many cases we don't have a separate -native recipe, we just
> use BBCLASSEXTEND). =A0What's probably happening is that you need
> genext2fs to exist for a specific task and just "DEPENDS +=3D
> genext2fs-native" really means "make do_configure depend on
> genext2fs-native being in the sysroot". =A0Did you modify
> cloud9-gfx-image? =A0It should already get the DEPENDS right for
> populating the image.

The build had failed in meta-ti/classes/sdcard_image.bbclass which
used genext2fs to build an sdimg image.

I had added DEPENDS +=3D "genext2fs-native" to
meta-ti/recipes-misc/images/ti-hw-bringup-image.bb since it was what
inherited sdcard_image.

On further investigation cued by your response, it seems that the
correct change is instead to add:

IMAGE_DEPENDS_sdimg =3D "genext2fs-native"

analogously to what's done for the other image types.  With that the
bitbake of cloud9-gfx-image does the right thing.

Thanks.

Peter

>
> --
> Tom
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


