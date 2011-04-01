Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q5aPg-0002Q8-KT
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 11:13:05 +0200
Received: by iwn10 with SMTP id 10so3639859iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 02:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=3WYLq1iYEmVgKBsytBEnYeDDnyNeJ9smU65/rI4zw+o=;
	b=xC49DFKENFd96HLy8RZbu0kpiN7Vomp+p1YQWZwoYYaLdN0fK1yOJwbu472/tgmclg
	iugVqQYEFA1QheC92Sf8G7gRWQfnN3Nm49CvJfbvkK2cblMNX5Gy1Cx7Kpj1AMQPhJQH
	dsGFxpFqdqTyEYtu5attOlfkoUBvubSfEVR2s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VcumBrd97s7J0dFkgDIFclcnSNYM8fVQMceV+M5ZKoGZVN+yltoObqVcgLr9sQSS1m
	itrOoWRgUlrsvsy3ybWa+dxwipTPy82dxNiwp617zhusrStHINcteLjzxSgyhxRdw7es
	riPy+nW4xA2iKWzIjm206babKXxnxysVtgM1w=
MIME-Version: 1.0
Received: by 10.231.177.193 with SMTP id bj1mr3647803ibb.145.1301649059888;
	Fri, 01 Apr 2011 02:10:59 -0700 (PDT)
Received: by 10.231.43.6 with HTTP; Fri, 1 Apr 2011 02:10:59 -0700 (PDT)
In-Reply-To: <in41ee$a8h$2@dough.gmane.org>
References: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
	<1301637327-26825-3-git-send-email-raj.khem@gmail.com>
	<AANLkTinRZxiXDGxDO02uSb0T1Et4CCnKVNh9RZ+q1jmp@mail.gmail.com>
	<in41ee$a8h$2@dough.gmane.org>
Date: Fri, 1 Apr 2011 11:10:59 +0200
Message-ID: <AANLkTinx2MWXqduYraDNRvwrUEvUL0bPeTc82cfmU5eZ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/7] openssl-0.9.8m, binutils-2.20.1: Use linux-uclibceabi instead of uclibcgnueabi
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
X-List-Received-Date: Fri, 01 Apr 2011 09:13:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/4/1 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-04-11 09:27, Frans Meulenbroeks wrote:
>> 2011/4/1 Khem Raj <raj.khem@gmail.com>:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> =A0.../openssl/openssl-0.9.8m/configure-targets.patch | =A0 =A04 ++--
>>> =A0.../binutils-2.20.1/110-arm-eabi-conf.patch =A0 =A0 =A0 =A0| =A0 =A0=
4 ++--
>>> =A02 files changed, 4 insertions(+), 4 deletions(-)
>>
>> maybe partly offtopic but:
>> openssl 0.9 =A0is at 0.9.8r; 8m has known security vulnerabilities
>> probably better upgrade to 8r.
>
> So make a patch and do a pull request.

No thanks.
Last time I touched openssl I got so much flames from you because I
made a mistake that I decided not to touch this recipe again.
I'll happily leave it to someone else to burn his/her fingers on this.

Frans


