Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4JsE-0006Yk-Ao
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 22:49:03 +0200
Received: by iwn7 with SMTP id 7so131175iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0yTN1XinzhpjHJC4EmV1S5EJv9TcIOU+fNuOFTnzcl0=;
	b=RF1YEemWi+uVq86AtAEcYDxyfadcdOaExUdKv8SqcVqyD9Ww1OrwA+0IPVmtnOUdXJ
	q8Da74h0dNCeigv8wF024uQDXdleBOpgwpQIYEIfzOihDq9GbpmK3zkwuuI9RrPt9WYK
	jrzrmM8VV39fTFY6gddlN0AoiUABNy239bVu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Dj1uzwPa0gkkwcQ3wUSgj7YGgP8SDh/oSTS3UYb/wYOwM7p8gYHDymLKu9n1rIwEBQ
	BI0Ael4rT0yuvXQXds1GzdKlSvHH+KrsbBoKTPrbq5uEN295NT17i8zmYNJzQw9O0yLW
	PlOJG/71LcWa8ckV7O+LDfXFnULozF0Q1nljs=
MIME-Version: 1.0
Received: by 10.231.166.9 with SMTP id k9mr2697059iby.127.1286570919244; Fri,
	08 Oct 2010 13:48:39 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 8 Oct 2010 13:48:39 -0700 (PDT)
In-Reply-To: <AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
	<i8jufe$299$1@dough.gmane.org>
	<AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>
Date: Fri, 8 Oct 2010 22:48:39 +0200
Message-ID: <AANLkTi=_1X_2nbgdX26Et6jd0mRxNSAKbbjkcx-iJNjC@mail.gmail.com>
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
X-List-Received-Date: Fri, 08 Oct 2010 20:49:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/7 Khem Raj <raj.khem@gmail.com>:
> On Thu, Oct 7, 2010 at 12:56 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 07-10-10 03:46, Khem Raj wrote:
>>> Hi
>>>
>>> Following set of patches is v2 of the patches adding support for getting libtool 2.4 into
>>> openemebedded. I have so far built minimal-image for two machines successfully using old
>>> and new libtool.
>>>
>>> The libtool sysroot feature knob is added through LIBTOOL_HAS_SYSROOT variable. If this is
>>> set to "yes" then you ought to use libtool > 2.4 by default its set to "no" which means
>>> the current behavior remains.
>>>
>>> The big change that libtool 2.4 brings is sysroot support and I have added
>>> support to use this feature. It should make our life easier.
>>>
>>> This needs a lot of testing.
>>>
>>> Please cherry pick the patch bundle and give it a try in yout environment
>>
>> Can you apply these to a branch so we can add fixes there if needed?
>
> I can do that. However now that backward compatibility is left intact I think
> it would not be that bad to merge it into master and fix things on
> master. the libtool
> 2.4 would have DEFAULT_PREFERENCE = "-1" by default it wont be picked by anyone.
> with the number of developers we have it will get better testing before we
> accumulate too many changes on a branch. Secondly there might be changes like
> gnutls one where the patch is only valid for new libtool and should be tested
> in old and new way. If there is any breakage introduced in existing build will
> be caught quickly. Where as on branch resources might be divided and it may
> not progress so well. I am just weighing efforts Vs. risk here and
> risk seems low
>
> Thanks
> -Khem
>
>>

Personally I'm in favour of merging into head. That way it gets
accepted easier and faster.

Frans.


