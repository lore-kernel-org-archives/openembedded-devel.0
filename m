Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDOyl-00081t-7l
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 23:05:19 +0100
Received: by ywo32 with SMTP id 32so4694873ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 15:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=6g1c4/vLvwlvZvFsB+YmWHaUO3SBQvetVZEEn858tMc=;
	b=P/vUOyDgpcQwDECiTHpTB4ywR1uyTHTjlvVoTvKlft/C7zP+TCzl7Y++I64fdqtaL/
	mJzW37nvuNaDeTC5Ri9Dqsa+ec6vkZJBu8LISnQHhYHficvbHi0guIZ6GhpX01j8rOyj
	EuHZo0T8rGW9KmheauCgVwQTTb1bf1/WG5Fko=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=X6jicaUTdpTmWcjSatQ2Ixvr74usJ3OeWYqG4xHsAIJS0NorSnnl9s2JBj7GfrHXmS
	dgP6RsJ1VaH4HKwMFN2fZ9kYL9/DKy1dY8kbM+7UfdYtQOhn4s4ZBduqk+FwwcOFwyOa
	bXd4YXMcVW7AXI4ZKKLToMFowpVtoihz2EsUg=
Received: by 10.90.15.31 with SMTP id 31mr2073775ago.10.1288735465360; Tue, 02
	Nov 2010 15:04:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Tue, 2 Nov 2010 15:04:05 -0700 (PDT)
In-Reply-To: <201011030002.19429.anarsoul@gmail.com>
References: <1288732510-30545-1-git-send-email-anarsoul@gmail.com>
	<AANLkTin2CR7+C8zz1NtBmV0d2H=gEgNZrXCh5oATzqvz@mail.gmail.com>
	<201011030002.19429.anarsoul@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2010 15:04:05 -0700
Message-ID: <AANLkTi=g0B8Tnpo3kDqcWKRaYowhUStw0VNPWKJuN8j0@mail.gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eglibc: fix build with make-3.82
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
X-List-Received-Date: Tue, 02 Nov 2010 22:05:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 2, 2010 at 3:02 PM, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> On Tuesday 02 November 2010 23:49:33 Khem Raj wrote:
>> On Tue, Nov 2, 2010 at 2:15 PM, Vasily Khoruzhick <anarsoul@gmail.com>
> wrote:
>> > Add patch to fix this error when building eglibc-2.12
>>
>> > with make-3.82:
>> thanks for the patch. while you are at it can you also patch other
>> versions of eglibc
>> that would be nice.
>
> Would be 2.11 and 2.12 enough? Not sure that I can test other versions (even
> compile-test)
>

as much as you can is welcome.

> Regards
> Vasily
>


