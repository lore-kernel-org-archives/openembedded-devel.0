Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IHOtg-00024O-D6
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2007 21:02:44 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1481690waf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2007 12:00:28 -0700 (PDT)
Received: by 10.114.159.1 with SMTP id h1mr4124905wae.1186254027744;
	Sat, 04 Aug 2007 12:00:27 -0700 (PDT)
Received: by 10.114.208.14 with HTTP; Sat, 4 Aug 2007 12:00:27 -0700 (PDT)
Message-ID: <19c1b8a90708041200s3eab597fgc26b4653b29b9286@mail.gmail.com>
Date: Sat, 4 Aug 2007 12:00:27 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B469C1.5060706@balister.org>
MIME-Version: 1.0
References: <19c1b8a90708031735x59bf4341u736aeb19977c34a0@mail.gmail.com>
	<46B469C1.5060706@balister.org>
Subject: Re: PATCH: Use uImage make target for linux-omap1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Aug 2007 19:02:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Agreed. I would be happy if anyone else who is using some omap board
try out this patch and check if this works for them or not.

Thanks

-Khem

On 8/4/07, Philip Balister <philip@balister.org> wrote:
> I'm running an OSK build atm (with current code). Tomorrow, I want to
> compare how the kernel creates the uImage with the commands in the bbfile.
>
> I tend to agree we should use the kernel build system wherever possible.
>
> I'm concerned that we are having trouble booting various combinations of
> uboot/kernel/file system and would like to have some understanding of
> what is causing the problems. I do not want to fix one persons build at
> the expense of other's.
>
> Of course, the "thesis" is priority number atm, so I will be doind this
> during procrastination time.
> http://www.phdcomics.com/comics/archive.php?comicid=315
>
>
> Philip
>
> Khem Raj wrote:
> > Hello,
> >
> > Current uImage generated for omap1 target did not boot on my target.
> > We are using manual method to create uImage.
> > This patch uses uImage KERNEL_IMAGETYPE for omap1 targets. I have
> > tested this on omap5912osk and the resulting uImage booted just fine.
> >
> > If it is OK please consider this patch for applying.
> >
> > Thanks
> >
> > -Khem
> >
> >
> > ------------------------------------------------------------------------
>
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>


