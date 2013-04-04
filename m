Received: from mail-bk0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UNdVr-0003Hm-FT
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 08:19:08 +0200
Received: by mail-bk0-f51.google.com with SMTP id y8so1247648bkt.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 23:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=iPVHV5khLGILmG+QlVgebDzMIziIGijgtyCeYhJ9W60=;
	b=VoN7zV0eEn64X/qQLKXHKlqNmtGdRFTi2txKwEgsH481MGh89oD8GjsmEYloDq5CGe
	C/YqeIe5/4gZ0dcG46SipgX1dCF1z+ITBPb/KR/wnEC06Jdz1XL06puE6wjP8x48LRM5
	J0p/LdiD7L0U1xXeo3KRHLFg9Bpc8ibJRP8QbyPo8loszOXCmp6gD6Wi5l8+YP+DEK/O
	RsIZweeJFGK5mcQMwsqEQ9aRy1W5f0upnPirQGze5pZg9g+bDGPwXXASGlysDm1jmqpt
	ZY8n9Tzm1DhP5dWOSy4kasuNJ4BUGqJ4ERor7t4T2sdxK7j6HTg5BuorXpEjpAYJoWTg
	IzSQ==
X-Received: by 10.205.104.8 with SMTP id dk8mr3266350bkc.34.1365055315191;
	Wed, 03 Apr 2013 23:01:55 -0700 (PDT)
Received: from ?IPv6:2001:610:612::5c87:177:991a:e764?
	([2001:610:612:0:5c87:177:991a:e764])
	by mx.google.com with ESMTPS id u4sm4836981bkz.20.2013.04.03.23.01.53
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 23:01:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <515CB2A3.3080100@balister.org>
Date: Thu, 4 Apr 2013 08:01:52 +0200
Message-Id: <3240B39F-A3CC-4723-8598-5A36A187A5EB@dominion.thruhere.net>
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
	<CAP9ODKpRFNN6EP74C+YN2=uN_hRa1BTwz4CHUcUazCQQWKV9dg@mail.gmail.com>
	<515CB2A3.3080100@balister.org>
To: Philip Balister <philip@balister.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlm3sIDGxd9ALAioESje6q/frHaO/EulhR4IamuQy/xG/+YWQPfsn+QSaDBW++jIXDeem4w
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 04 Apr 2013 06:19:09 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 4 apr. 2013, om 00:52 heeft Philip Balister <philip@balister.org> het =
volgende geschreven:

> On 04/03/2013 05:43 PM, Otavio Salvador wrote:
>> On Wed, Apr 3, 2013 at 4:34 PM, Philip Balister <philip@balister.org> =
wrote:
>>> On 04/03/2013 02:38 PM, Koen Kooi wrote:
>>>> Op 03-04-13 18:50, Carlos Rafael Giani schreef:
>>>>=20
>>>> Just like https://github.com/naguirre/meta-cubox you're mixing
>>>> DISTRO policy in the machine files by setting the tuning to
>>>> hardfloat. Don't do that. If you want hardfloat, set that in your
>>>> distro config, not in your machine config.
>>>>=20
>>>=20
>>> This keeps coming up, but I do not see an answer that works for =
people
>>> creating BSP's that work with just oe-core and a BSP layer.
>>>=20
>>> How are we supposed to set TUNE parameters for this case? And yes,
>>> this case *must* produce useful output.
>>=20
>> I don't think TUNE is a distro thing. It is indeed a board setting =
and
>> I expect every board to have a good know TUNE setting.
>=20
> The problem is if you are building for several machines, you may want =
to
> force the same tune settings for several machines that are different
> from what the BSP owner "declared" the default to be. Otherwise all
> packages become per machine.

Let's not call it 'tune' settings, let's call it what it is: =
floatingpoint ABI.

Let's look at this sitation: I have 2 marvell armada 510 based boards, a =
cubox and a spherebox. I build bash for both machines, but the bash ipk =
from the one doesn't run on the other. That's a great first experience =
when using the BSP, existing software for that SoC doesn't work anymore.

>=20
> Philip
>=20
>>=20
>> --
>> Otavio Salvador                             O.S. Systems
>> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
>> Mobile: +55 53 9981-7854              =
http://projetos.ossystems.com.br
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>=20
>>=20



