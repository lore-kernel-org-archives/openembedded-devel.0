Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgjCj-0001m1-1X
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 21:00:42 +0200
Received: by yxi11 with SMTP id 11so2266600yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=VMb0KRITqc7mKQll5z2f5MGO4mM8A7DYHRuhI4BcUwI=;
	b=tpt1pHMlUTOtOYkppxoSnJGs5CW3ZbVuDIoD8zXJ8j6AqWLTL13B9rrQBUb8meD8jW
	6BbtXod29bzLYbOS8XOTvghzcmZ1BEiFxhxDi1tw+g//YGB/GOwq1hqwjIGcLjzm5Ij3
	sMsRy03YJEBgyhxEotnj3vrH663HsRJmsRcSo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Y14rJRcq8GQdS/nX4cqJSrsOOwnqru+XwBdilUF7wRRjAub2C/iOEpM4tPqfB8pOfG
	Uv++7GZMUQdQbpecX08+le+zX3Y4XVNoAZZLdf1sgpE9MxFqh7D7KR3o9I7yYDu95U/W
	bYNuzBuUZFJEKEdb+Ui8Tem5YUQVIrPpIugu0=
Received: by 10.151.46.12 with SMTP id y12mr1568567ybj.343.1280948435401; Wed, 
	04 Aug 2010 12:00:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.12.137 with HTTP; Wed, 4 Aug 2010 12:00:15 -0700 (PDT)
In-Reply-To: <i3c7nt$mpg$2@dough.gmane.org>
References: <1280892816-18835-1-git-send-email-raj.khem@gmail.com> 
	<i3bata$8c4$1@dough.gmane.org> <20100804151927.GB8728@gmail.com> 
	<i3c7nt$mpg$2@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Aug 2010 12:00:15 -0700
Message-ID: <AANLkTi=a4TfbGUjgF-V0HKhF2bby2zNTN+WKsR9qwpYV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] recipes: Dont inherit autotools_stage.
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
X-List-Received-Date: Wed, 04 Aug 2010 19:00:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 4, 2010 at 10:24 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 04-08-10 17:19, Khem Raj wrote:
>> On (04/08/10 11:12), Koen Kooi wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 04-08-10 05:33, Khem Raj wrote:
>>>> Some recipes had do_stage_append|prepend stuff. Fixed that too in this verison
>>>
>>> I see a lot of:
>>>
>>>> -inherit autotools_stage
>>>> +
>>>
>>
>> Do you mean empty line replacement? Not ideal but harmless should have used a different
>> regexpt. I will see if I can change
>
> No, I mean that you remove an inherit completely, I would expect:
>
> - -inherit autotools_stage
> +inherit autotools

yes. I was more radical. See the new v4 patch series


>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMWaI8MkyGM64RGpERAtmtAJ0ZJuTstws9Ey3l6p/ZUdRwSNW0wACfRMhV
> kdTSjttBNIALYvlhbMbtCS4=
> =O6HJ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


