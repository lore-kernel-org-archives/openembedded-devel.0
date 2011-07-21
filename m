Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qjw73-0001Zx-2A
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 18:28:37 +0200
Received: by ewy5 with SMTP id 5so1406893ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 09:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=c0HnTwye16deaCUqf5/FdPdGwJvYJL6FWwwa7AnrsI4=;
	b=aN0g7fyNr4T8NbgXEA0Yq/J7A94xZKD5W3TcPM9szHEWMC1vy6BtohadWp0ve9VZQ3
	eLR0hvOfODRq2YkWKg3myTiCTS8MwzrwGuYffG06mk7EcWbr5e/THb9c3MFbUGAmOFQJ
	aRa98+GDHE1mMEKFkiDG181U6e7BmCe2IJifI=
MIME-Version: 1.0
Received: by 10.213.13.220 with SMTP id d28mr417367eba.60.1311265467839; Thu,
	21 Jul 2011 09:24:27 -0700 (PDT)
Received: by 10.213.105.210 with HTTP; Thu, 21 Jul 2011 09:24:27 -0700 (PDT)
In-Reply-To: <j08h0v$tdv$3@dough.gmane.org>
References: <1311199325-7532-1-git-send-email-agnel.joel@gmail.com>
	<j08h0v$tdv$3@dough.gmane.org>
Date: Thu, 21 Jul 2011 11:24:27 -0500
Message-ID: <CAD=GYpZX0NqBTDO8Y9UG6kD4frg-s_uoa2r8LW5C0GOxK3h9LA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] linux-omap-psp, linux-omap: Added patch to fix MMC timeout errors
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
X-List-Received-Date: Thu, 21 Jul 2011 16:28:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 1:29 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 21-07-11 00:02, Joel A Fernandes schreef:
>> This fixes MMC errors due to timeouts on certain SD Cards following sugg=
estions to set dto to 14 by Jason Kridner and Steven Kipisz
>>
>> Details of the issue: http://talk.maemo.org/showthread.php?p=3D1000707#p=
ost1000707 --- Changes since v1: * Made patch to apply to org.openembedded.=
dev branch * Bumped PR of respective recipes
>>
>> ...mc-Adjust-dto-to-eliminate-timeout-errors.patch | =A0 27 ++++++++++++=
++ ...mc-Adjust-dto-to-eliminate-timeout-errors.patch | =A0 39 +++++++++++-=
-------- recipes/linux/linux-omap-psp_2.6.32.bb =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +- recipes/linux/linux-omap_2.6.39.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A03 +-
>
> Could you please split that in 2? And for the .39 kernel, the master reci=
pe is in meta-ti, not in .dev: http://git.angstrom-distribution.org/cgi-bin=
/cgit.cgi/meta-texasinstruments/tree/recipes-kernel/linux/linux-omap_2.6.39=
.bb?id=3D7018fe0a81fa33c6d73d6296d25517b5d427d0a7
>

Did you move it recently? If you don't mind, can you point me to some
information on why this has changed?

Thanks
Joel


