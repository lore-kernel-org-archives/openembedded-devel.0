Received: from mail-bk0-f52.google.com ([209.85.214.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UNU4W-0005wB-HL
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 22:14:16 +0200
Received: by mail-bk0-f52.google.com with SMTP id it16so1045302bkc.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 12:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to:x-gm-message-state;
	bh=CmcdxutM6ghrHb+9uv2EKJ2cdxM0huVah9DbpshgExE=;
	b=BjEZKXYa6k0iTnyMUF7bzlMgNFii9Qfid3QFdM9gwysFXx3wKI6NQHla3umXa9oCiG
	GHJoF+Sd8BlnIaAgwup8rbwSpuAj70oPk9xgMHq6EpyD1trpR9j1Qsv76rmo9IzPoRlS
	3gyeByLKTtvUkWEVtUVQTAwV46K1BeO11i8oiV1ZM/jMHtpbU+cc38DDtn+oaN49AcqL
	PgOTRgc1qf/OJZ3A2j7ucUnPDlx6+L3MGatjrz7elSTa2NpJeho2pt+uT7+p2ZNe8a0U
	xAlQ9dnNwJlbKcp3XY5vPjYqoC2UbM3raj9A+FP2n3qcweQnZ50U/WJye1UVXue/gPXe
	bDJA==
X-Received: by 10.205.1.5 with SMTP id no5mr2307811bkb.64.1365019024505;
	Wed, 03 Apr 2013 12:57:04 -0700 (PDT)
Received: from [172.20.0.104] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id x10sm3905060bkv.13.2013.04.03.12.57.02
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 12:57:03 -0700 (PDT)
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
Mime-Version: 1.0 (1.0)
In-Reply-To: <515C8459.3080005@balister.org>
Message-Id: <FF0E3122-75E0-47DF-978E-CF9982B94B64@dominion.thruhere.net>
X-Mailer: iPad Mail (10B329)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 3 Apr 2013 21:57:00 +0200
To: Philip Balister <philip@balister.org>
X-Gm-Message-State: ALoCoQmjqUCeq3Yr6G5FRGkwWsBXD12M3MNWntJ9p9rAIl3Z3JPh4V9u3BjiBtFO2u8Pqe5UMQlt
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 20:14:16 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



Op 3 apr. 2013 om 21:34 heeft Philip Balister <philip@balister.org> het volg=
ende geschreven:

> On 04/03/2013 02:38 PM, Koen Kooi wrote:
>> Op 03-04-13 18:50, Carlos Rafael Giani schreef:
>>=20
>> Just like https://github.com/naguirre/meta-cubox you're mixing
>> DISTRO policy in the machine files by setting the tuning to
>> hardfloat. Don't do that. If you want hardfloat, set that in your
>> distro config, not in your machine config.
>=20
> This keeps coming up, but I do not see an answer that works for people
> creating BSP's that work with just oe-core and a BSP layer.
>=20
> How are we supposed to set TUNE parameters for this case? And yes,
> this case *must* produce useful output.

Local.conf



>=20
> Philip
>=20
>=20
>>=20
>>=20
>> _______________________________________________ Openembedded-devel
>> mailing list Openembedded-devel@lists.openembedded.org=20
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>=20
>>=20
>>=20


