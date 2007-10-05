Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hvontres@gmail.com>) id 1Idu3l-0001Lx-4L
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2007 22:46:13 +0200
Received: by an-out-0708.google.com with SMTP id b33so89095ana
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2007 13:40:43 -0700 (PDT)
Received: by 10.142.178.13 with SMTP id a13mr1798460wff.1191616842012;
	Fri, 05 Oct 2007 13:40:42 -0700 (PDT)
Received: by 10.143.11.12 with HTTP; Fri, 5 Oct 2007 13:40:41 -0700 (PDT)
Message-ID: <a7f8874a0710051340s968058exfac7aa14b2b32b5d@mail.gmail.com>
Date: Fri, 5 Oct 2007 13:40:41 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0710051256k6d224986o6644f2e44918ed2e@mail.gmail.com>
MIME-Version: 1.0
References: <F38DEABE0E171746B133C1ABBD142D97071112B2@radmail.Radstone.Local>
	<1191601344.17230.22.camel@localhost.localdomain>
	<a7f8874a0710051002y3a6a4d83t9a9a008fff91532b@mail.gmail.com>
	<c384c5ea0710051256k6d224986o6644f2e44918ed2e@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: SVN fetcher behaviour
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
X-List-Received-Date: Fri, 05 Oct 2007 20:46:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/5/07, Leon Woestenberg <leon.woestenberg@gmail.com> wrote:
>
> Hello,
>
> On 10/5/07, Hans Henry von Tresckow <hvontres@gmail.com> wrote:
> > The default of "1" is set in conf/bitbake.conf. The reason for this is
> that
> > any svn recipe without an explicit SRCREV set will cause parsing to fail
> if
> > the build machine or the svn server is off line. If you can live with
> this
> > limitation, then you could comment that line out to get the default
> > behavior.
> >
> But I think what was asked if a default can be set that (a) does not
> break parsing when servers are unreachable; and (b) does fetch HEAD
> instead of revision 1.
>
> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

I did see an Entry called "AUTOREV" in bitbake.conf but I am not sure if
that does what you want either, since using that in a recepie might still
break parsing when off-line..


-- 
Henry von Tresckow (hvontres)

