Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTXzf-0001kK-VQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 14:06:04 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so878442pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=+j0s3CjnQV7wi50oc9CrL3TND0FF+eAgynviz2VMEA8=;
	b=Przyn5bCT4QmFcKKbyGoRlEuQW6Wj01hFstnfNP0wYvZ9gdK6bzjuv6/ZnH1oSw+b1
	2WzoPvIA2Nj4CWzo0ITWPv0CS32tJ675b0PP6wFxxJZ3B/bE+QJ/aFltV4MAowOm7DKM
	ajf1ApVuLEQG22tOLLI3xhXc0uoucrQ5nWTsUbli6eaUkM3xTEKn3NBXay+FOR6Okobr
	79GsIlV+SRZsx1rYyUOLBr7MBQ1U1U7HjC4XP7t4dvPvdGxF4y/71MhvjvUfVtIy/lnB
	zWdPJ+zmVtDTWq6DhA7xfp9jrCOaF/6KWfLUAT+gs4G7k/I0Ltv/sd8UEdt3mNZ4j3/4
	NheQ==
MIME-Version: 1.0
Received: by 10.68.197.9 with SMTP id iq9mr110888296pbc.130.1351687946542;
	Wed, 31 Oct 2012 05:52:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 31 Oct 2012 05:52:26 -0700 (PDT)
In-Reply-To: <1351687555.13864.111.camel@phil-desktop>
References: <1351681706-12778-1-git-send-email-otavio@ossystems.com.br>
	<50910EFB.7010804@gmail.com>
	<1351685486.13864.97.camel@phil-desktop>
	<50911500.6010207@gmail.com>
	<1351685961.13864.101.camel@phil-desktop>
	<CAP9ODKq=8EwPNT3wqGAnVuweEj4wwYNGKLhhzHUaP0H-gRSnQg@mail.gmail.com>
	<1351687105.13864.110.camel@phil-desktop>
	<CAP9ODKohF_YouEkj9pSGGJ2ePLSYL30m6XRq270Hp-oD5LJn_Q@mail.gmail.com>
	<1351687555.13864.111.camel@phil-desktop>
Date: Wed, 31 Oct 2012 10:52:26 -0200
X-Google-Sender-Auth: OrtbPu1pB7zNy9a5p7AY_EjGQ5s
Message-ID: <CAP9ODKqJsaJKJGNHE7oZwnvuVV8ST-xT6+U-MnA8Qs6fs-uu3w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 1/3] meta-systemd: Move ntp recipes to 'meta-networking' sublayer
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
X-List-Received-Date: Wed, 31 Oct 2012 13:06:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 31, 2012 at 10:45 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-10-31 at 10:40 -0200, Otavio Salvador wrote:
>> On Wed, Oct 31, 2012 at 10:38 AM, Phil Blundell <philb@gnu.org> wrote:
>> > On Wed, 2012-10-31 at 10:29 -0200, Otavio Salvador wrote:
>> >> Well, I cannot ask for a pool zone for OE or Yocto; it'd be good but
>> >> it is not yet done and I prefer to have it merged and changed once it
>> >> happens.
>> >
>> > The obvious problem with that approach is that "it" may never happen
>> > (especially if you're relying on some as-yet-unidentified third party to
>> > do the work) and, even if it does, arbitrarily many people might ship
>> > the broken configuration in the meantime.  Merging a change that we know
>> > is wrong seems like a bad plan.
>>
>> It is better then a broken .service file IMO ;-)
>
> Well, I guess that's where we disagree.  Can you elaborate on why having
> no default NTP server in the metadata is such a crisis, and why none of
> the other options I mentioned before is a suitable way to deal with the
> problem?

It is not a problem to have no default NTP server but a broken .service file.

Your alternatives are all good just I used too much time for something
I am not using ... the proposed alternatives are good but someone
needs to work on them. Just it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


