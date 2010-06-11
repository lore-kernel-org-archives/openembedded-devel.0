Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1ON6jm-0006Y0-Hh
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 18:05:42 +0200
Received: by wwb17 with SMTP id 17so920063wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=La6PG4vbe3Kh6NGal6AuFBxaHxYehWC1akgCPHL4au0=;
	b=BvBDU+MPdzk6lLgI+5cBYKzqdKZFa8LTBEx/z2vG8LAX/VaDflnqOPFJ9pylsZXY/V
	E85t5qbbkI/eiQ4/TEPU5HtRK9lkPfqTNBN6f3OQlsvIIn9Uy42Dr8yxu84wA6X8YlGI
	MwBwvFwWx45U/+gn1n9IYkw5NfNzCgmCHqeTk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YloS46llsTsOlm7kSJVDneR+/vwbZPvi7mm7CR/PpZ8XvlELM6BxNmfi606M0d3weC
	kwtu3vSknYROf0HlRH0LcfoweXQIUEJIKY/8/cMrwHx3ldMvl+dZ8FzBAl6UG79gjbGi
	bWOQNeBW5NtPgYyNA4w/PY6lqj3b+sNN4yAEU=
MIME-Version: 1.0
Received: by 10.216.160.19 with SMTP id t19mr434800wek.0.1276272037553; Fri, 
	11 Jun 2010 09:00:37 -0700 (PDT)
Received: by 10.216.21.134 with HTTP; Fri, 11 Jun 2010 09:00:36 -0700 (PDT)
In-Reply-To: <1276092484.31317.145.camel@mill.internal.reciva.com>
References: <1275578113-17291-1-git-send-email-chase.maupin@ti.com>
	<hu8ivf$250$1@dough.gmane.org> <20100603165055.GA4402@denix.org>
	<4C0F9D6B.6000105@gmail.com>
	<1276092484.31317.145.camel@mill.internal.reciva.com>
Date: Fri, 11 Jun 2010 18:00:36 +0200
Message-ID: <AANLkTil3uWNMRgML5HLtBQbduI8OyOKVy7f7W_mg3dAB@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4-embedded: rename qtdemo file
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
X-List-Received-Date: Fri, 11 Jun 2010 16:05:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jun 9, 2010 at 4:08 PM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2010-06-09 at 15:55 +0200, Marco Cavallini wrote:
>> #Append an E to the qtdemo file
>> if [${QT_LIBINFIX} =3D=3D "E"] ; then
>> =A0 =A0 =A0 =A0 =A0 mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIB=
INFIX}
>> fi
>
> I think you need some quotes around ${QT_LIBINFIX} in the argument to [,
> otherwise you are liable to get an error if the variable is empty. =A0It
> might also make more sense to test something like '-n "${QT_LIBINFIX"',
> rather than testing for it being 'E' specifically. =A0But yes, clearly th=
e
> current code is not satisfactory in the case of an empty infix.
>

while we're at it, isn't "-embedded" a much more friendly distinction
that using "E" ?

Regards,
--=20
Leon


