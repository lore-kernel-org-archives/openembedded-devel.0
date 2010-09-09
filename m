Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Otk7x-0001TT-Iy
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 18:37:34 +0200
Received: by iwn2 with SMTP id 2so1283728iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Sep 2010 09:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=T1h7bxug01rsPxTd6u/mq+rGSQjRNBHHa/z27MLzIKA=;
	b=DNkx5hqpZSfYV8LrmJZYaqZyac6DiDxJPD5Nvj1p1GeliyUXlSJyLEywOSn4AoHJLu
	0mH3Qy9e2naIVVX3y+aJKyM7SQM3lAqjroC3kM/xGYHXKmVDXKWTKrPaVOxnLPCadfKJ
	d1NabM5T7qHPd8jGpo7otxkIvnFACg+5xveIc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FGpxegiMUz3deyVyY1wiM9tqL9SMAuTxw8rIDYdy7z2okcl3S4MhF3TjeUVuu6lJWK
	K1yKlmQJXu8pIQEcciWutiJ1Qr4pSrAwolsaezLA3hKtZrG0PyGgP7Im90KFUymNM36W
	hM/EWOQCYyMUOHjfg7vjoagYuux/zQHOEspEE=
MIME-Version: 1.0
Received: by 10.231.155.212 with SMTP id t20mr11849407ibw.37.1284050206007;
	Thu, 09 Sep 2010 09:36:46 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Thu, 9 Sep 2010 09:36:45 -0700 (PDT)
In-Reply-To: <AANLkTikxykdyukc+Qak3q-LnfH08TBADVmPbsXX2XVJk@mail.gmail.com>
References: <AANLkTikamPAk9W64hf3HYX4effDwOovU=rvs=CiwccgS@mail.gmail.com>
	<AANLkTikxykdyukc+Qak3q-LnfH08TBADVmPbsXX2XVJk@mail.gmail.com>
Date: Thu, 9 Sep 2010 18:36:45 +0200
Message-ID: <AANLkTinguDmRS2mW74symOz59zThAqfdxUzmpxADeL-+@mail.gmail.com>
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
Subject: Re: slugos/nslu2le/binutils build: fail
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
X-List-Received-Date: Thu, 09 Sep 2010 16:37:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/9 Khem Raj <raj.khem@gmail.com>:
> On Thu, Sep 9, 2010 at 2:42 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> I was asked to give slugos as spin on the autobuilder, and as slugos
>> still occupies a sweet spot in me I gave it a spin.
>> Unfoprtunately things did not build:
>>
>> distro: slugos
>> machine: nslu2le
>> bitbake target: binutils
>> libc: glibc.
>
> as I can see slugos uses eglibc 2.11 is there any special reason you
> chose glibc 2.10 ?
> I would suggest to try the defaults and subject of this email is wrong.
>

Yes sorry the subject could have been better. binutils was the target
recipe that I build not the failing one.
Wrt glibc: the reason for using it is very simple. I didn't know how
to set LIBC, so I just asked the person who asked me to give slugos a
try, and he said slugos used glibc, not eglibc.
I didn't really verify this, but took it for granted.

I'll try with eglibc.

Frans


