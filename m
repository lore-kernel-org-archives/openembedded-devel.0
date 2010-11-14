Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PHgGo-00042d-JF
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Nov 2010 18:21:39 +0100
Received: by iwn42 with SMTP id 42so5854211iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Nov 2010 09:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=d4vfuS3rGijAGP77ouGzLSEa1qCt/+EA0rq2Hl424mI=;
	b=g1kND8EGD0XMXVHeC4+mNP4BwWJhXekbXbNRAoEkqTyp38mAqcHMLfxffOWorvDYix
	0P3wzALfc555PekSF8Djtd72LA6vxlqxPRlCBYQvDogWLBG06rTjiMI9TtA4prd1FQkn
	fXoajzNunXj+Ce1rBw7QPH5xsyZRoHNfzLJ1Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=hK66pAKwedxIW2CupO53wyIoD4RI3Y/i6hCcV/VOolAqHJtXuFSw8eVOM3dBssgCpn
	kA2goz5zqAg/IH9O/cJL3lSiMWc10vnHZDPDZddytR7oQptb+funG5bBrENiinVzQq3x
	4JAApVT0HkizYCcRnuoZfwArDFtSPlgc8WPFA=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr3666533ibd.26.1289755236032; Sun,
	14 Nov 2010 09:20:36 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Sun, 14 Nov 2010 09:20:35 -0800 (PST)
In-Reply-To: <4CD70CC5.7030103@crhc.illinois.edu>
References: <AANLkTi=Kp6Ydc_HR0apO3abN7Zokd6SHazYQYY4vNkdo@mail.gmail.com>
	<4CD70CC5.7030103@crhc.illinois.edu>
Date: Sun, 14 Nov 2010 18:20:35 +0100
Message-ID: <AANLkTimrZy3ambe2OAtM+OxwS2qM=eZ9NqCaz1qYvkW6@mail.gmail.com>
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
Subject: Re: bitbake goes crazy when ...
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
X-List-Received-Date: Sun, 14 Nov 2010 17:21:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/7 Matt Johnson <johnso87@crhc.illinois.edu>:
> Also, if BBFILES is not set or set incorrectly.
>
> On 11/07/2010 02:26 PM, Yury Bushmelev wrote:
>>
>> Hello!
>>
>> Bitbake fails without any end-user readable diagnosting (just a lot of
>> strange errors and tracebacks) when:
>> 1) specifying non-existent DISTRO (I've mistyped and specified
>> 'angsrom-2008.1' instead of 'angstrom')
>> 2) specifying non-absolute path to TMPDIR (i.e. you can't use './tmp' as
>> TMPDIR)
>>
>> I've found this when playing with my testbuilder script.
>>
>> Can/should we catch that errors and produce user-readable messages about
>> this?
>>

Probably better report this to the bitbake ML too.

Frans


