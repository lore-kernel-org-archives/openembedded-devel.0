Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OoqJ9-0002OQ-MK
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 06:12:52 +0200
Received: by gxk2 with SMTP id 2so1006825gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 21:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=76SZ4y6MARbDr9lgbdOnnc+4M3tlljzSHBRtCVEU8gE=;
	b=FUlUZQEPJrZuEMUMk8vCHTmQfxaDTav6sn6jkMI64LQAA5QvmKK3asozufR+W3nk/n
	EZ5KD/F/ljTpnV9FoXxZ7hAqCX+WP9dqoivJRKwLFm1IuPoWO9+VmBasyDpl00m5Uyeh
	MW1/r9aAFsdrY8IjjpRWfW9DOlMioNRLnveho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=I1J19vkWJ8PVFSW/4JMQHyFc+i4leWZUZ8CdmlFeNWoWd0IvMRuBxM8Ak9vicf7C04
	M6ig22bGpPTlxm8JZj1WEJ9qsZRzh/bLUE68XfnADwhXoqWYdYeeB5y7BYPTvTV9jrSi
	BhgFI/JVSp3pAl+vg4PDOl6D2zOg0TcLjS3qM=
MIME-Version: 1.0
Received: by 10.150.148.16 with SMTP id v16mr1203588ybd.268.1282882342944;
	Thu, 26 Aug 2010 21:12:22 -0700 (PDT)
Received: by 10.231.167.79 with HTTP; Thu, 26 Aug 2010 21:12:22 -0700 (PDT)
In-Reply-To: <AANLkTi=cBDtFg9=GvPu0t01hVOhO=4uS5kwSAqLT+cax@mail.gmail.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
	<4C76C597.9050302@mlbassoc.com>
	<AANLkTinnnfOCw3m_q6_d27o9Luyw4dWS-uVhJzYUTTbZ@mail.gmail.com>
	<4C76CD2C.2090102@mlbassoc.com>
	<AANLkTi=WnKFoiutD+vZHEQLDQzmFnhdrUMjYrvc_MNam@mail.gmail.com>
	<AANLkTi=cBDtFg9=GvPu0t01hVOhO=4uS5kwSAqLT+cax@mail.gmail.com>
Date: Fri, 27 Aug 2010 13:42:22 +0930
Message-ID: <AANLkTi=HYU2iy923icHth=5zo1cvJOUTQxk+EK2kPVWQ@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Fri, 27 Aug 2010 04:12:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 27 August 2010 13:15, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Aug 26, 2010 at 4:20 PM, Graham Gower <graham.gower@gmail.com> wrote:
>> """if a build fails, then issues are reported, and the testing-testing
>> branch is moved ahead to capture fixes made in the dev branch. Once
>> the issue is fixed, all combinations are retested."""
>>
>> Can I suggest that the testing-testing branch not be moved ahead?
>
>
> I think yes the fixes should be committed to master and then pulled
> into the testing-testing branch
> IOW testing-testing moved ahead to new head on each monday and I think
> if you have successful build
> on prior monday and dont want to test it the tag should still be
> there. I think continuous build is the only
> way we can make sure that what we are committing is not breaking
> stuff. ideally testing branch should move
> every time a fix is committed upstream which was reported in
> testing-testing branch but Monday to Monday is
> ok too.

I think maybe I was just confused about how it will work in practise.
I'll just wait and watch it for a couple of weeks :)

-Graham


