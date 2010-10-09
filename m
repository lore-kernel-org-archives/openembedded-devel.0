Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4cYP-0005hY-IS
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 18:45:50 +0200
Received: by iwn7 with SMTP id 7so909008iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 09:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eEJ3caL90iN5H/emRktGAhqmppZfHJpL4NbWxxFXw7M=;
	b=Gr2BaUNO7B/zQWdJUpmXZwrnio/CrH3coNJ6NL5KugbABT4b5UJshewVUpU75tM4CE
	rAy5vA6spmtPe3suff3Y90CuICq2a+Y9TFGnjtn9CDcMzco5SHCnVijNiQL7T9Rtp/wx
	2nfrCg7AyPG9KRTJ6S/Shb5AGIWiFGjgqIxP4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RqhMA19QPvxp4O2yH6HNZ8VnbJ79fiL1V9eH4WWVIwr+kKV7ur/dGDua2jyUGyVnLT
	Bv9mHycUKGyrZ2GMvW+VVfw8+NtNIwBv2SmKKadChJ8km8D8Sm88P6TA1zglasGjbx1V
	84h4DHfXnJ8SZX5Aqo0XQSdx4v6mqnBKOwOk4=
MIME-Version: 1.0
Received: by 10.42.157.134 with SMTP id d6mr438315icx.76.1286642726571; Sat,
	09 Oct 2010 09:45:26 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 09:45:26 -0700 (PDT)
In-Reply-To: <AANLkTim_=Bg0mP+QjTWfvkdQ-+Xrp86fjg8sq8=bZ4=v@mail.gmail.com>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
	<i8jufe$299$1@dough.gmane.org>
	<AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>
	<AANLkTi=_1X_2nbgdX26Et6jd0mRxNSAKbbjkcx-iJNjC@mail.gmail.com>
	<AANLkTikLT9ZRLbnbGQ17AN5u0TiXdweP7HKH-QuLBH_E@mail.gmail.com>
	<20101009113707.GP3163@jama>
	<AANLkTim_=Bg0mP+QjTWfvkdQ-+Xrp86fjg8sq8=bZ4=v@mail.gmail.com>
Date: Sat, 9 Oct 2010 18:45:26 +0200
Message-ID: <AANLkTi=X0=nu+ZJXSDgAdHOi0Ju6FeOhGW8yZ=28LxkQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Sat, 09 Oct 2010 16:45:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/9 Khem Raj <raj.khem@gmail.com>:
> On Sat, Oct 9, 2010 at 4:37 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>> On Fri, Oct 08, 2010 at 03:21:03PM -0700, Chris Larson wrote:
>>> > Personally I'm in favour of merging into head. That way it gets
>>> > accepted easier and faster.
>>> >
>>>
>>> Agreed, I am as well. =A0As the new libtool is opt-in, I don't see the =
harm,
>>> and it'll ensure that any issues which crop up with the compatibility g=
et
>>> fixed asap.
>>
>> Khem: feel free to add
>> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>
> Thanks. Do I have other pseudo acks too in this thread. ?
> btw libtool folks are excited that OE is using the sysroot
> functionality my patch to libtool is being merged
>
As already stated on irc a few hrs ago

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Thanks for your work!


