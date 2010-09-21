Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oy54d-0002zU-9L
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 17:48:05 +0200
Received: by gya6 with SMTP id 6so1863010gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=B7lJzILwjAP7jqcDSsUydJl1JGlfdng3hIO5DCGUgpU=;
	b=MvSoCWuhGNEnk/t5qq3gWYaDjeoCpaZ5EqLRoFdlihXZLtKe5sy3bmEQTIMrwk9xhR
	NsAHfxmn+hYvnqIhCgkN5GaBsdzEcX/zn7THozg4zH/hRG7N8YnxLuVyC9yYxMJ9bYrB
	sfzTMFMcuBstaD77v2WoZ64z4j3u7Ruy2L55o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=GI5J/8pnzbEel3Je+XITXsUxWb1q4Xhive2HA5Zyt1UgjmMdV20utZuu2Nu4ZnVceI
	/CTf8maw9pbXJ/ckuMXcf3R7UXu1nd50w4SgbKgs9bqHZGh6CtKvaVKiqe2stHdH/3fP
	rRMSE88t/TaydSRAzZ/Rfl16ak3G5uHlAGt9Q=
Received: by 10.90.103.12 with SMTP id a12mr6093331agc.62.1285084065407; Tue,
	21 Sep 2010 08:47:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Tue, 21 Sep 2010 08:47:25 -0700 (PDT)
In-Reply-To: <4C98B9F0.2010005@cbnco.com>
References: <4C97AC2B.1040205@cbnco.com>
	<AANLkTikd-8b1oMbyVus7372HT7u9KON0rx_nZM9fn-8A@mail.gmail.com>
	<4C98B9F0.2010005@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Sep 2010 08:47:25 -0700
Message-ID: <AANLkTi=iNNGRSbRnv-ZrL7BJXv6w115hqNugogHv-w7Y@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] base.bbclass: add make-native to default dependencies
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
X-List-Received-Date: Tue, 21 Sep 2010 15:48:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2010 at 6:58 AM, Michael Smith <msmith@cbnco.com> wrote:
> Khem Raj wrote:
>
>> although it does but make 3.82 is not usable out of box yet.
>> so people might find surprises. 3.81 would be ok.
>

I hit eglibc there may be more.

> I could add a DEFAULT_PREFERENCE =3D "-1" to the 3.82 recipe and mention =
the
> packages that don't build with it in a comment. Do you remember which
> packages fail to build with 3.82?
>
>>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>>> index b19eb32..5c6d41d 100644
>>> --- a/classes/base.bbclass
>>> +++ b/classes/base.bbclass
>>> @@ -71,7 +71,7 @@ def base_deps(d):
>>> =C2=A0 =C2=A0 =C2=A0 if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d):
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bb.data.getVar('HO=
ST_SYS', d, 1) !=3D
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.=
getVar('BUILD_SYS', d, 1)):
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 deps +=3D " virtual/${TARGET_PREFIX}gcc
>>> virtual/libc "
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 deps +=3D " make-native virtual/${TARGET_PREFIX}gcc
>>> virtual/libc "
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif bb.data.inherits_=
class('native', d) and \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.data.getVar('PN', d, True) not in \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ("linux-libc-headers-native",
>>> "quilt-native",
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


