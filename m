Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IOHNS-0004Gf-3f
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 20:25:54 +0200
Received: by wa-out-1112.google.com with SMTP id l24so672223waf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 11:24:41 -0700 (PDT)
Received: by 10.115.61.1 with SMTP id o1mr103371wak.1187893480478;
	Thu, 23 Aug 2007 11:24:40 -0700 (PDT)
Received: by 10.115.73.16 with HTTP; Thu, 23 Aug 2007 11:24:40 -0700 (PDT)
Message-ID: <19c1b8a90708231124g4235f95fjdead991e8b2739fc@mail.gmail.com>
Date: Thu, 23 Aug 2007 11:24:40 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46CD583D.7020402@balister.org>
MIME-Version: 1.0
References: <19c1b8a90708220852p5ed75070wa0a78dd002fe112c@mail.gmail.com>
	<46CC697F.8040306@balister.org>
	<19c1b8a90708221012m446c3157ya692e916c5270da2@mail.gmail.com>
	<46CD583D.7020402@balister.org>
Subject: Re: RFC: Fix for bug 1744 and some restructuring of omap kernel bb files.
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
X-List-Received-Date: Thu, 23 Aug 2007 18:25:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/23/07, Philip Balister <philip@balister.org> wrote:
> Is there any reason why you marked the linux-omap1_2.6.22 with
> DEFAULT_PREFERENCE = "-1" and removed the git kernels

must be removed an oversight on my part.

> DEFAULT_PREFERENCE="-1"? I am guessing these are testing artifacts and
> am setting the git kernel to -1 and removing the DEFAULT_PREFERENCE from
> 2.6.22.
>
> Other than that, the patch looks good.
>
> Philip
>
> Khem Raj wrote:
> > Hi Philip
> >
> > Thanks for looking at it.
> >
> > On 8/22/07, Philip Balister <philip@balister.org> wrote:
> >> I have given it a quick look, and it looks reasonable. It appears to
> >> drop OABI support, which I think is OK, except for the celinux distro
> >> (not sure).
> >
> > Infact it does not. Default config file has EABI disabled in
> > defconfig. The logic in linux-omap.inc enables it if it detects an
> > EABI capable toolchain.
> >
> >> The only real concern I have is that we would like to move to the
> >> linux.inc/linux_2.6.x.bb style of kernel bb files. Should we push this,
> >> or wait until we can convert the omap/davinci kernels to linux.inc? I
> >> shouldn't even look at this until September ...
> >
> > I would say one step at a time. This patch is big enough so we should
> > go towards it incrementally
> >
> >> Philip
> >>
> >> Khem Raj wrote:
> >>> Hi Koen et al.
> >>>
> >>> I have been looking into omap structure of late and found that it was
> >>> hard to add a new machine to same kernel build without some
> >>> duplication. So I went ahead and tried to fix it. Attached patch also
> >>> fixes bug 1744.
> >>>
> >>> I have moved the defconf files to kernel-<version>/$MACHINE folder and
> >>> I expect that we add machine specific patches if needed here too.
> >>>
> >>> I have built omap5912osk and omap2430sdp machine kernels with this
> >>> change and they built and worked ok.
> >>>
> >>> However I have also made changes to other omap related files which I
> >>> believe I correct but it would be helpful if someone could test them.
> >>>
> >>> I havent changed the old kernel bb files. If this looks ok and
> >>> applicable I can do that too.
> >>>
> >>> Is it ok?
> >>>
> >>> Thanks
> >>>
> >>> -Khem
> >>>
> >>>
> >>> ------------------------------------------------------------------------
> >>>
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >>
> >>
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>


