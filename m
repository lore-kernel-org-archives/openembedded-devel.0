Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SKVqV-0002pt-68
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 16:26:59 +0200
Received: by iaag37 with SMTP id g37so10726108iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=rUc/jCVC4ERDR6/cLa699NYM8UuklIgtMbxJbz0nxwU=;
	b=tTDOgIqp0fWIGy+1eB4xu/t9e/q9o7M69QI3ddQZjt8WUaofGpZ+SAIFh50UQRzsZK
	pY04zEsjyEq9CMJ0KszYnK2DsFoaPako1WV4wFj3/pOzfq4S1pEOlItqs18StA/ksD8V
	5qwQtoZZ92cB7JuBFo6JxExR6pIez/8A/yWLHPh4+UTCO5vbZqg93kkwOPSYjGnSaW4R
	TPGgRhRlJL8FwwYC6IomgsSuk/5GXDZ1JXIpQs7atQrFTzAG9lPONNAD0aUkfdv03hfI
	hMmJ9LPOxJDvCwdwBi423nvkhTYEwmc9A+iX9UrMyp95RljoYMXTalsi2mqcC3OuI7xi
	Ek1w==
MIME-Version: 1.0
Received: by 10.43.49.3 with SMTP id uy3mr1986974icb.2.1334758650798; Wed, 18
	Apr 2012 07:17:30 -0700 (PDT)
Received: by 10.231.67.134 with HTTP; Wed, 18 Apr 2012 07:17:30 -0700 (PDT)
In-Reply-To: <4F8ECB3D.7040200@mlbassoc.com>
References: <CAOHjBZu=T6TrSomYSOW+Sp5afFwHTu5f4zGKx-3T361gdrJdmg@mail.gmail.com>
	<4F8ECB3D.7040200@mlbassoc.com>
Date: Wed, 18 Apr 2012 16:17:30 +0200
Message-ID: <CAOHjBZudcfECWJA-7Ey3dTjEBNBFK3Zj5+tek5V3uQ_EH8P9Yw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] build for 32bit architecture
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
X-List-Received-Date: Wed, 18 Apr 2012 14:26:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/4/18 Gary Thomas <gary@mlbassoc.com>

> On 2012-04-18 07:48, Giuseppe Condorelli wrote:
>
>> Hi All,
>>
>> I need to build the native packages for a 32bit architecture, although I'm
>> working on a 64bit machine.
>> So I need to pass the -m32 option to the compiler and my question is about
>> the right place where to put it
>> to be inherited by all native packages.
>>
>
> Why would you need 32bit native packages when your build host is 64bit?
> The native packages are only used to provide functionality during the
> build and hence (it makes sense to me at least) they should match the
> build host native environment.
>
> I need to build cross tools at 32bit for my goal.

> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

