Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pu6l7-0005fw-Al
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:19:45 +0100
Received: by bwz10 with SMTP id 10so3850406bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 09:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=36bzTuAFBM+o31mpUM9U3kRHuwp5qhoWtUD04UOsSWk=;
	b=v6vsQEZqU8h+gmZpYaPDVYRrh/nQV8TOSRdJlen+b1Yeh8wNCGF22KAbbH+2XlLjTH
	88ew3QwnH58kqwF+x0VrNHdRA6Oqag0KgL/1m6obQgi+GzabAjmI4CdD/loNFiLAdwHd
	nEIGRerMPGPNU/9e6leLJVHxYxX4TyfdGBFzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=cHmfOB6aPhNS86yAXufXt2GqNm9TMMLLeRe2h+daLhHTN/edrZRQAJmas1fuiUiRkp
	Qe+2Lm8FxJG5UsSWAIeHMWSpkp7PJh+EzWH2Wiwnj9l/BCByyhRYYGr3cdnQZL5EnPt5
	VCt+2vA9Wx5QLbuQQ8XQHqgg3+fx8yrQXDdsQ=
MIME-Version: 1.0
Received: by 10.204.48.93 with SMTP id q29mr1346095bkf.124.1298913500348; Mon,
	28 Feb 2011 09:18:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Mon, 28 Feb 2011 09:18:20 -0800 (PST)
In-Reply-To: <1298913513.23547.22.camel@phil-desktop>
References: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
	<1298912130.23547.8.camel@phil-desktop>
	<AANLkTikgZ7sTSN2N_a4RaGnJm9G-iyDwSmUQcZfwMnSs@mail.gmail.com>
	<1298913513.23547.22.camel@phil-desktop>
Date: Mon, 28 Feb 2011 17:18:20 +0000
X-Google-Sender-Auth: kPH4YuqdVptjdfc4NuXMUL3uTCs
Message-ID: <AANLkTim3uRSJMCskYcUzpg2aGCwzmoxLBxJeMTztzLzb@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] freerdp: rdpepends on xprop
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
X-List-Received-Date: Mon, 28 Feb 2011 17:19:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2011 at 17:18, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-02-28 at 17:06 +0000, Otavio Salvador wrote:
>> On Mon, Feb 28, 2011 at 16:55, Phil Blundell <philb@gnu.org> wrote:
>> > On Mon, 2011-02-28 at 13:26 +0000, Otavio Salvador wrote:
>> >> +RDEPENDS +=3D "xprop"
>> >
>> > I'm surprised that recipe_sanity didn't object to that. =A0Is this rea=
lly
>> > what you want?
>>
>> Why? I failed to see why it is wrong. Mind to clarify?
>
> Bare vars like that will apply to all the PACKAGES. =A0That's seldom
> useful, which is why there is a QA check to detect this sort of thing
> and print a warning.

Indeed. Got it now. Will fix it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


