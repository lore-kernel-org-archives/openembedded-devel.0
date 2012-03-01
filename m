Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1S31OC-0003in-H5
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2012 09:29:28 +0100
Received: by iaag37 with SMTP id g37so451854iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2012 00:20:58 -0800 (PST)
Received-SPF: pass (google.com: domain of giuseppe.condorelli@gmail.com
	designates 10.50.219.232 as permitted sender)
	client-ip=10.50.219.232; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	giuseppe.condorelli@gmail.com designates 10.50.219.232 as
	permitted sender) smtp.mail=giuseppe.condorelli@gmail.com;
	dkim=pass header.i=giuseppe.condorelli@gmail.com
Received: from mr.google.com ([10.50.219.232])
	by 10.50.219.232 with SMTP id pr8mr3511888igc.51.1330590058685
	(num_hops = 1); Thu, 01 Mar 2012 00:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=MttBZ0f5ph6BFfLZRWXVhvwxL95cK1gJ7PYIFxjdVtQ=;
	b=pjVLdaffT2GW2oEECeq0UzCCQaDKr/YnyrAfDWmnuMk0F8k2rTlTjbGsoyOdpKB+iK
	L0L0cliMbkQiUKHR7qRxleWOaQBO1pSJUVxyalOoFtBN13Lt8C71fF37MikWN6Yaqs6m
	S86L2raNVedn0SS6W2kjLh43P6T6Qt88B6Oo0=
MIME-Version: 1.0
Received: by 10.50.219.232 with SMTP id pr8mr2898407igc.51.1330590058580; Thu,
	01 Mar 2012 00:20:58 -0800 (PST)
Received: by 10.231.182.68 with HTTP; Thu, 1 Mar 2012 00:20:58 -0800 (PST)
In-Reply-To: <CAOHjBZsLDAhV7rFCiY6W+LdPGWtq1XeMr7K+UN-ogbFHEqYK_g@mail.gmail.com>
References: <CAOHjBZss6YRxsOedgF2v_A__XOgH0m=CZWj-OSGY+si+rOSsFQ@mail.gmail.com>
	<4F4F173B.6040706@gmail.com>
	<CAOHjBZsLDAhV7rFCiY6W+LdPGWtq1XeMr7K+UN-ogbFHEqYK_g@mail.gmail.com>
Date: Thu, 1 Mar 2012 09:20:58 +0100
Message-ID: <CAOHjBZvLXRzcev6hg_B7n9hKMMyM4S0uOkrTBX4rhMJ0f5YEbw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: New task issue on linux-libc-headers
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
X-List-Received-Date: Thu, 01 Mar 2012 08:29:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Il giorno gioved=EC 1 marzo 2012, Giuseppe Condorelli ha scritto:

>
>
> Il giorno gioved=EC 1 marzo 2012, Khem Raj ha scritto:
>
>> On 02/29/2012 03:00 AM, Giuseppe Condorelli wrote:
>> > Hi all,
>> >
>> > I added an own task into my bbclass source (inherited by my conf file)=
.
>> Let
>> > me to call the new task do_NTASK.
>> > Into the bbclass I added:
>> > addtask NTASK after do_compile before do_install
>> > Then I run the base-image build and I noticed that NTASK is regularly
>> > called but for linux-libc-headers, which do_install task doesn't
>> execute in
>> > this situation. If I remove NTASK from the task list the do_install is
>> run
>> > instead. This is causing a big trouble in my goal but I'm not
>> understanding
>> > why...
>> > Please do you have any suggestion?
>>
>> do_compile for linux-libc-headers is empty
>> what does your task do ?
>> are you using oe-core ?
>
> My task is intented to fix all the paths contained in the .pc file the
> packages provide. This to meet my goal. I know the do_compile for
> linux-libc-headers is empty, but I don't understand why my new task is no=
t
> invoked if I run the base-image build and instead it is if I build the
> linux-libc-headers (bitbake linux-libc-headers).
> I also tried setting nostamp=3D1 without success.
>
> I'm using the oe-classic, not yet oe-core. Sorry for having missed the
answer in my latest reply.

> Any glue?
> Thanks for all,
> Giuseppe
>
>>
>> > Cheers,
>> > Giuseppe
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>

