Received: from [209.85.198.187] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hvontres@gmail.com>) id 1Iaxd4-0000zC-QM
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Sep 2007 19:58:31 +0200
Received: by rv-out-0910.google.com with SMTP id c24so2317271rvf
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2007 10:53:45 -0700 (PDT)
Received: by 10.140.169.4 with SMTP id r4mr1041196rve.1190915625692;
	Thu, 27 Sep 2007 10:53:45 -0700 (PDT)
Received: by 10.143.11.12 with HTTP; Thu, 27 Sep 2007 10:53:45 -0700 (PDT)
Message-ID: <a7f8874a0709271053i67a12b81y7b3383b2f9e1407c@mail.gmail.com>
Date: Thu, 27 Sep 2007 10:53:45 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <00a501c80129$17b0aa80$6e01a8c0@twilight>
MIME-Version: 1.0
References: <20070927162040.GA25054@guralp.com>
	<00a501c80129$17b0aa80$6e01a8c0@twilight>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: arm kexec commandline support
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
X-List-Received-Date: Thu, 27 Sep 2007 17:59:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/27/07, Mike (mwester) <mwester@dls.net> wrote:
>
> Bob Dunlop, on September 27, 2007, wrote:
> > Hans Henry von Tresckow wrote:
> > >On 6/7/07, Thomas Kunze <thommycheck at gmx.de> wrote:
> > ...
> > >> I have written a quick hack to support custom commandlines for arm
> with
> > >> kexec. You need:
> > >>
> > >>
> > >>
>
> http://www2.informatik.hu-berlin.de/~tkunze/zaurus/patches/kexec_commandline-3.patch
> > >>
> > >> and:
> > >>
> > >>
> > >>
>
> http://www2.informatik.hu-berlin.de/~tkunze/zaurus/patches/atag_support.patch
> > >>
> > >> (from lak)
> > ...
> > >
> > >I  tested this  with linux-rp-2.6.20 on poodle. The kernel will boot
> and
> I
> > >can kexec other kernels with built in cmdlines. If I try to set a new
> > >cmdline however, it segfaults. Here is the crash dump:
> > >
> > ><0>Starting new kernel
> > ><1>Unable to handle kernel paging request at virtual address e0000100
> >
> > I to am searching for a kexec solution (for a Compulab CM-X270)
> >
> > I can progress this code a little further and eliminate the segfault
> with
> > the following patch, but still nothing after the final Bye! message :(
> >
> [patch snipped]
>
> Permit me to pop into this thread.   At the risk of covering old ground, I
> believe that the discussion on L-A-K ended with the general conscensus
> that
> the preferred approach was to use the "preserve-original-atags" patch [1],
> and write something new that would permit the user-space "kexec" command
> to
> edit/replace/remove the preserved atags.
>
> The first half of this is done -- it's been submitted upstream (since it
> is
> a useful patch in and of itself even without the ability to change
> command-lines, permitting kexec to actually work on machines that require
> bootloader atags, such as the OpenMoko distro on the Neo).
>
> The second half has not been started, but probably should begin with Uli's
> work with the kexec command, I would expect.
>
> The advantage of this approach is that the first patch takes care of all
> the
> ugly stuff that result in seg faults, and other horrors.  All that is
> required for the second half is to use the pointer to the buffer
> containing
> the atags, and replace, or edit, or remove the contents at will.
>
> It's on my list of things to do, but for the moment the sysfs approach,
> while ugly, has worked on all the ARM machines I use.  It would be great
> if
> someone with a bit more spare time could take a hack at the second part of
> this problem.
>
> Regards,
> Mike
>
> [1] http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=4579/1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


Thanks for the update mike :)

I am going to play with uli's patch a little bit to see how that will work.
I am glad to see that your main patch made it upstream :)

Thanks,

Henry von Tresckow (hvontres)

