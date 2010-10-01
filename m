Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1YSU-0000YL-C6
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 07:47:04 +0200
Received: by iwn2 with SMTP id 2so3427738iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 22:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=H4Gxn2gBd8tfYeSYXRDchKPtb+ZJ+TZjBjGGP46xUq0=;
	b=UEJIlhOzJHxgQMFf/fs0aCISUqivIkrIt8Dnod9D4qjF03zQmPP7KwbfNowCfZXVNP
	xbMKbVnxDHEZjKVApvJyM0edKcHbMK57dqFNeewrC9S2XfmVFYmgAA2w/7DEsjSo8Dnm
	9etRkf1qon6hGDtVkaoh57DhWDlbhGI5eEO6o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=E7H4XuUvt9t2slM/gEEYw2x+UuSzarY1sdxOcuJqvzz/rb1ihpyUZWjE2oGZonWV+a
	AHSMH7RHezXQWe8QFncI/tqij/PUNFE8i83JQIppiuDpezJoMU2OqP1eXYTvU89xvlbf
	9nK/4vY7OL0xF1YXImeXhRiGKu51nRmC7Ah/w=
MIME-Version: 1.0
Received: by 10.231.79.77 with SMTP id o13mr5098728ibk.36.1285912007502; Thu,
	30 Sep 2010 22:46:47 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 30 Sep 2010 22:46:47 -0700 (PDT)
In-Reply-To: <4CA501AC.2090804@mentor.com>
References: <AANLkTi=6KMYVWORbcf+BLZYGV6JrscxBEjq-KWXnhzU+@mail.gmail.com>
	<4CA501AC.2090804@mentor.com>
Date: Fri, 1 Oct 2010 07:46:47 +0200
Message-ID: <AANLkTinXuaZWbU9g75ab-HPNq7PTnt=OZ6tU7K_G=nuk@mail.gmail.com>
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
Subject: Re: [RFC] delete old monotone recipes
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
X-List-Received-Date: Fri, 01 Oct 2010 05:47:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/30 Tom Rini <tom_rini@mentor.com>:
> Frans Meulenbroeks wrote:
>>
>> Dear all,
>>
>> As it stands we have 6 monotone recipes:
>>
>> monotone-5_0.25.2.bb
>> monotone-6_0.27.bb
>> monotone-6_0.31.bb
>> monotone-6_0.33.bb
>> monotone-6_0.34.bb
>> monotone-6_0.37.bb
>>
>> There are all target-only recipes
>>
>> I can imagine it made sense to have a monotone recipe for the target
>> when our sources were still in monotone, but I feel that nowadays it
>> is less useful
>> (apart from the question whether it is useful to have an SCM on an
>> embedded system).
>>
>> Therefore I would like to bring up the following discussion topics:
>>
>> Is there any use to keep the old monotone-6 recipes? (all but 0.37).
>> Or should we remove?
>>
>> And what about the monotone-5 recipe. Is that still useful?
>>
>> And what about the latest monotone-6 recipe? Is that still useful to kee=
p?
>>
>> Your opinion is appreciated.
>
> As an aside, I can't find anything called monotone-5 or monotone-6, just
> monotone. =A0But I'd otherwise suggest the normal rules apply, delete the
> unpinned versions assuming they're all GPLv2.
>
> --
> Tom Rini
> Mentor Graphics Corporation

The dir is called monotone, both monotone-5 and monotone-6 are recipes
within the monotone dir.
(note the - between monotone and [56])

Frans


