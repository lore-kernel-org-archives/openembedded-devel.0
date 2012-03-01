Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1S31JN-0003a2-JF
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2012 09:24:29 +0100
Received: by iaag37 with SMTP id g37so448268iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2012 00:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of giuseppe.condorelli@gmail.com
	designates 10.50.153.201 as permitted sender)
	client-ip=10.50.153.201; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	giuseppe.condorelli@gmail.com designates 10.50.153.201 as
	permitted sender) smtp.mail=giuseppe.condorelli@gmail.com;
	dkim=pass header.i=giuseppe.condorelli@gmail.com
Received: from mr.google.com ([10.50.153.201])
	by 10.50.153.201 with SMTP id vi9mr3459510igb.59.1330589759488
	(num_hops = 1); Thu, 01 Mar 2012 00:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QhU9KeAtAeUTavWrAFc2IWDNFpkzL9KTam90+9qGTHA=;
	b=ajbzSTPvuW4MrolXtUzx8bmqT/YcXBsuoov0EmPUiW8TtVZnwG/4xvvKOObeLgH6nv
	Za8pftRqRRZ+oQ6XsfZBGBh5EHrYlzxrlTqcaKJUROU7A+WsJUYx68gz18Z50C+vlFtC
	RG70VNVxEKmDcYFbU43KFV5CLwb9c5Jj/OX0I=
MIME-Version: 1.0
Received: by 10.50.153.201 with SMTP id vi9mr2848254igb.59.1330589759441; Thu,
	01 Mar 2012 00:15:59 -0800 (PST)
Received: by 10.231.182.68 with HTTP; Thu, 1 Mar 2012 00:15:59 -0800 (PST)
In-Reply-To: <4F4F173B.6040706@gmail.com>
References: <CAOHjBZss6YRxsOedgF2v_A__XOgH0m=CZWj-OSGY+si+rOSsFQ@mail.gmail.com>
	<4F4F173B.6040706@gmail.com>
Date: Thu, 1 Mar 2012 09:15:59 +0100
Message-ID: <CAOHjBZsLDAhV7rFCiY6W+LdPGWtq1XeMr7K+UN-ogbFHEqYK_g@mail.gmail.com>
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
X-List-Received-Date: Thu, 01 Mar 2012 08:24:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Il giorno gioved=EC 1 marzo 2012, Khem Raj ha scritto:

> On 02/29/2012 03:00 AM, Giuseppe Condorelli wrote:
> > Hi all,
> >
> > I added an own task into my bbclass source (inherited by my conf file).
> Let
> > me to call the new task do_NTASK.
> > Into the bbclass I added:
> > addtask NTASK after do_compile before do_install
> > Then I run the base-image build and I noticed that NTASK is regularly
> > called but for linux-libc-headers, which do_install task doesn't execut=
e
> in
> > this situation. If I remove NTASK from the task list the do_install is
> run
> > instead. This is causing a big trouble in my goal but I'm not
> understanding
> > why...
> > Please do you have any suggestion?
>
> do_compile for linux-libc-headers is empty
> what does your task do ?
> are you using oe-core ?

My task is intented to fix all the paths contained in the .pc file the
packages provide. This to meet my goal. I know the do_compile for
linux-libc-headers is empty, but I don't understand why my new task is not
invoked if I run the base-image build and instead it is if I build the
linux-libc-headers (bitbake linux-libc-headers).
I also tried setting nostamp=3D1 without success.

Any glue?
Thanks for all,
Giuseppe

>
> > Cheers,
> > Giuseppe
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org <javascript:;>
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

