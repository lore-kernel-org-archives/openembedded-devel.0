Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OxgFJ-0000dT-84
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 15:17:26 +0200
Received: by qwb8 with SMTP id 8so4932qwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Wz0h8ap0OyzNoxZMyUXnk3aNNM5pWJLJcEBzrfni5Os=;
	b=cz7fQfMsprD6rguWgYQcoKG0h0eiD4NYQhpMYRRPg4k/NLpQ0pG9dMHifXCYEF4cvB
	doHEpoo39c7s1SLRGYaDyPRU6VccbeAis6C8bVqR5b3tLXwROkWcqsy5rF1+VZSPGwpu
	pgTDeXuwZ8pYSsejyXS7HE35sa1wRG2gSYocc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rWBiAIAiUEyoF2P+nmQjORjwu5U3qS3ydp6Vc4nCBeXj+eND9eVtjeJImMl46VG0vD
	jkqVj0B3NagzsC6qBaD0u96saFxl7afAAbuOGDpVu6tW8bSfNNcMyVsGFzWC5xWrzNk5
	5UHirvP8mz872esuSqrDFaF6E/8ER6YeMNNxY=
MIME-Version: 1.0
Received: by 10.224.82.203 with SMTP id c11mr5734761qal.299.1284988218472;
	Mon, 20 Sep 2010 06:10:18 -0700 (PDT)
Received: by 10.229.36.65 with HTTP; Mon, 20 Sep 2010 06:10:18 -0700 (PDT)
In-Reply-To: <EC89DF03-EE97-4A6D-8E4D-6E9ED9372176@mac.com>
References: <EC89DF03-EE97-4A6D-8E4D-6E9ED9372176@mac.com>
Date: Mon, 20 Sep 2010 15:10:18 +0200
Message-ID: <AANLkTinWOr6+U6DgWZSErrBKj1=Y-DsOJXrdyA=PA-oA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to specify a specific linux kernel recipe or provider
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
X-List-Received-Date: Mon, 20 Sep 2010 13:17:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2010 at 1:41 PM, Elvis Dowson <elvis.dowson@mac.com> wrote:
> Hi,
> =A0 =A0 =A0 I'm using the overo-oe repo, and when I build omap3-console-i=
mage, it builds the linux-omap3-2.6.32.bb recipe, located in my user.collec=
tion folder.
>
> Now suppose I want to experiment with a new kernel recipe, and create a n=
ew one called linux-android-rowboat-eclair-2.6.32.bb.
>
> What should I do to make the omap3-console-image recipe build using the l=
inux-android-rowboat-eclair-2.6.32.bb recipe, instead of the linux-omap3-2.=
6.32.bb?
>

No idea about the specifics of overo-oe-repo but in general kernel
'provider'  is chosen by

PREFERRED_PROVIDER_virtual/kernel =3D "linux-xyz"

while the version can be pinned in some machine.conf  like

PREFERRED_VERSION_linux-xyz =3D "2.6.28.4"

If not pinned, bitbake will evaluate the DEFAULT_PREFERENCE in the
linux-xyz recipes.

Regards

Andrea

> Best regards,
>
> Elvis Dowson
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


