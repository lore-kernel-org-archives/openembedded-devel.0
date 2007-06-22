Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1I1jtL-0001Uz-CC
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2007 16:13:42 +0200
Received: by an-out-0708.google.com with SMTP id b33so162689ana
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2007 07:09:43 -0700 (PDT)
Received: by 10.100.13.12 with SMTP id 12mr1706493anm.1182521383454;
	Fri, 22 Jun 2007 07:09:43 -0700 (PDT)
Received: by 10.100.38.3 with HTTP; Fri, 22 Jun 2007 07:09:43 -0700 (PDT)
Message-ID: <ae36f8040706220709p455a92e3q7eed288a5a69efee@mail.gmail.com>
Date: Fri, 22 Jun 2007 11:09:43 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040706212233kcaf86b0k9498869fce6cddff@mail.gmail.com>
MIME-Version: 1.0
References: <ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
	<20070613123908.GA19284@twibble.org>
	<ae36f8040706130931r4e81a08bi8ca10417336df3b5@mail.gmail.com>
	<20070614013553.GA4558@twibble.org>
	<ae36f8040706131940x128ce3b5ic2422b3fc5f6c99d@mail.gmail.com>
	<20070614025356.GA6177@twibble.org>
	<ae36f8040706200948o54d0ec92qb94eb5c379bad1fd@mail.gmail.com>
	<20070622045718.GA8358@twibble.org>
	<ae36f8040706212233kcaf86b0k9498869fce6cddff@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: problems doing bitbake task-base
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
X-List-Received-Date: Fri, 22 Jun 2007 14:13:49 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

howto fix this issue:
NOTE: package cups-1.2.10-r0: task do_package: started
!!! Failed to move ./var/run/cups/certs to
/home/lvcargnini/puc/instramed/openembedded/tmp/work/armv5te-angstrom-linux=
-gnueabi/cups-
1.2.10-r0/install/cups/./var/run/cups/certs
!!! [Errno 13] Permission denied
NOTE: Task failed: File population failed
NOTE: package cups-1.2.10-r0: task do_package: failed
ERROR: TaskFailed event exception, aborting
NOTE: package cups-1.2.10: failed
ERROR: Build of
/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/c=
ups/cups_1.2.10.bb
do_package failed
ERROR: Task 769
(/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/=
cups/cups_1.2.10.bb,
do_package) failed
NOTE: Tasks Summary: Attempted 905 tasks of which 897 didn't need to be
rerun and 1 failed.
ERROR:
'/home/lvcargnini/puc/instramed/openembedded/org.openembedded.dev/packages/=
cups/cups_1.2.10.bb'
failed


On 6/22/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
>
> Yes I have teh latest version of linux-header of my gentoo, i applied the
> gentoo patch for page.h on my perl-native and it compiled.
> my gentoo linux -header installed is the following:
> sys-kernel/linux-headers
>       Latest version available: 2.6.21
>       Latest version installed: 2.6.21
>       Size of files: 4,286 kB
>       Homepage:      http://www.kernel.org/ http://www.gentoo.org/
>       Description:   Linux system headers
>       License:       GPL-2
>
> how my system is the latest not the stable I suppose that page.h still
> been cuted off.
> now what do you think ?
>
> On 6/22/07, Jamie Lenehan <lenehan@twibble.org> wrote:
> >
> > On Wed, Jun 20, 2007 at 01:48:00PM -0300, Lu=EDs Cargnini wrote:
> > > Please can add the Gentoo patch as suggested ?
> >
> > Not yet.
> >
> > The patch will break builds using older glibc's... the question is
> > how old? I think it'll be that old that it doesn't matter, but until
> > I've verified that I don't want to push this change.
> >
> > Did you try upgrading to the latest linux-headers? I thought this had
> > been re-added in the lastest version of the linux-headers (of
> > whatever gentoo calls it) and that gentoo had update the later
> > version?
> >
> > > I emailed the list some days ago, this will make perl compile in any
> > system
> > > without errors I suppose
> >
> > Any recent system.
> >
> > --
> > Jamie Lenehan < lenehan@twibble.org>
> >
>
>
>
> --
>
> -------------------------------------------------------------------------=
-----
> Thanks && Regards
> Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
> IEEE Member
> Electrical Engineer Faculty @ PUCRS
> Ipiranga Avenue, 6681 =96 Building 30
> P.O. Box: 90619-900 =96 Porto Alegre/RS
> Phone: +55 51 3320 3500  extension: 7696
> -------------------------------------------------------------------------=
--------
>
>



--=20
---------------------------------------------------------------------------=
---
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 =96 Building 30
P.O. Box: 90619-900 =96 Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
---------------------------------------------------------------------------=
------

