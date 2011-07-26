Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qla0G-00010M-Pr
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 07:16:25 +0200
Received: by pzk1 with SMTP id 1so191285pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 22:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=it+5rBjVE288uhzBCUJI9d6GHnfJtzAcbDAsQURK8KI=;
	b=Nbw19AXio7LTzsHj/xK3tIj0d9mW2YSqLT79GEeHBlwa8/JJGsk+jP+znynXp2h2h1
	OBusA3lFgZQm2HSNKHwUKwbW9/u7niyaPQ6HxgV8fAzRTF/y6CXvZj9+45gtQ7eoG9a/
	TykBMB7YNZ0a0j+KKN7fEjb85/kCK9+Sxf0OQ=
Received: by 10.68.35.105 with SMTP id g9mr7988101pbj.479.1311657131152; Mon,
	25 Jul 2011 22:12:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Mon, 25 Jul 2011 22:11:41 -0700 (PDT)
In-Reply-To: <j0lhfk$s8o$1@dough.gmane.org>
References: <1311653193-29753-1-git-send-email-raj.khem@gmail.com>
	<j0lhfk$s8o$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Jul 2011 22:11:41 -0700
Message-ID: <CAMKF1so1OpOm+QVNxGKoj4-MToutnXOUvWhtVegnBw4Ct-G2XQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] espeak: Use SITEINFO_ENDIANESS instead of SITEINFO_ENDIANNESS
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
X-List-Received-Date: Tue, 26 Jul 2011 05:16:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2011 at 9:57 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 26-07-11 06:06, Khem Raj schreef:
>> This spelling difference existed when siteinfo was in two places
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- meta-oe/recipes-support=
/espeak/espeak_1.37.bb | =C2=A0 =C2=A06 ++++-- 1 files changed, 4 insertion=
s(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/espeak/espeak_1.37.bb b/meta-oe/rec=
ipes-support/espeak/espeak_1.37.bb index 6cc4cd4..5f9fcc1 100644 --- a/meta=
-oe/recipes-support/espeak/espeak_1.37.bb +++ b/meta-oe/recipes-support/esp=
eak/espeak_1.37.bb @@ -1,12 +1,14 @@ require espeak.inc inherit siteinfo
>>
>> -EXTRA_PHONEMES =3D '${@base_contains("SITEINFO_ENDIANNESS", "be", =C2=
=A0"espeak-data (=3D ${PV})", "", d)}' +EXTRA_PHONEMES =3D '${@base_contain=
s("SITEINFO_ENDIANESS", "be", =C2=A0"espeak-data (=3D ${PV})", "", d)}'
>
> The double N is the right spelling, so the oe-core class should be fixed =
instead

I have sent patch for oe-core. I guess it will be less work to fix
oe-core than to chase
each and every layer to change the spelling.


