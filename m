Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1I0H6v-0003eC-Cs
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jun 2007 15:17:37 +0200
Received: by an-out-0708.google.com with SMTP id b33so309722ana
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2007 06:14:05 -0700 (PDT)
Received: by 10.100.106.5 with SMTP id e5mr955671anc.1182172445614;
	Mon, 18 Jun 2007 06:14:05 -0700 (PDT)
Received: by 10.100.14.5 with HTTP; Mon, 18 Jun 2007 06:14:05 -0700 (PDT)
Message-ID: <ae36f8040706180614j3a67f74ar88edeed91737ea75@mail.gmail.com>
Date: Mon, 18 Jun 2007 10:14:05 -0300
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: "Jamie Lenehan" <lenehan@twibble.org>
In-Reply-To: <20070614025356.GA6177@twibble.org>
MIME-Version: 1.0
References: <4666520C.8060000@dominion.kabel.utwente.nl>
	<ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>
	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
	<20070613123908.GA19284@twibble.org>
	<ae36f8040706130931r4e81a08bi8ca10417336df3b5@mail.gmail.com>
	<20070614013553.GA4558@twibble.org>
	<ae36f8040706131940x128ce3b5ic2422b3fc5f6c99d@mail.gmail.com>
	<20070614025356.GA6177@twibble.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 18 Jun 2007 13:17:37 -0000
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

 you can remove it from perl, tke alook on gentoo patchs for gentoo please,
follow the perl patch list of gentoo and the content of page.h patch from
gentoo:
BD06DC30 ~ # cd /usr/portage/dev-lang/perl/
BD06DC30 perl # ls
ChangeLog  Manifest  files  metadata.xml  perl-5.8.8-r2.ebuild
BD06DC30 perl # ls files/
perl-5.8.7-MakeMaker-RUNPATH.patch
perl-5.8.8-dragonfly-clean.patch
perl-5.8.8-reorder-INC.patch
perl-picdl.patch
perl-5.8.8-CAN-2005-0448-rmtree.patch
perl-5.8.8-fbsdhints.patch
perl-h2ph-ansi-header.patch
perl-prelink-lpthread.patch
perl-5.8.8-USE_MM_LD_RUN_PATH.patch
perl-5.8.8-gcc42-command-line.patch
perl-hppa-pa7200-configure.patch
perl-regexp-nossp.patch
perl-5.8.8-asm-page-h-compile-failure.patch
perl-5.8.8-lib64.patch
perl-noksh.patch
perl-5.8.8-cplusplus.patch
perl-5.8.8-links.patch
perl-perldoc-emptydirs.patch

BD06DC30 perl # cat files/perl-5.8.8-asm-page-h-compile-failure.patch
--- perl-5.8.8/ext/IPC/SysV/SysV.xs.no_asm_page_h       2001-06-30 14:46:
07.000000000 -0400
+++ perl-5.8.8/ext/IPC/SysV/SysV.xs     2006-06-02 17:37:22.000000000 -0400
@@ -3,9 +3,6 @@
 #include "XSUB.h"

 #include <sys/types.h>
-#ifdef __linux__
-#   include <asm/page.h>
-#endif
 #if defined(HAS_MSG) || defined(HAS_SEM) || defined(HAS_SHM)
 #ifndef HAS_SEM
 #   include <sys/ipc.h>
BD06DC30 perl #


On 6/13/07, Jamie Lenehan <lenehan@twibble.org> wrote:
>
> On Wed, Jun 13, 2007 at 11:40:51PM -0300, Lu=EDs Cargnini wrote:
> > thanks for your answers
> > So why OE perl-native isn't compiling for me ???
>
> Because perl-native is compiled with your hosts's compiler, and you have =
a
> version of linux-headers (I think that's what gentoo calls them) that has
> removed /usr/include/asm/page.h
>
> I *think* this was removed and then re-added back later on (since so much
> stuff includes this header). In which case updating linux-headers on your
> system to a later version should fix it.
>
> If I'm wrong on this I can remove the need for it from perl, but I need t=
o
> make sure I don't break perl-native on other systems if I do that.
>
> > and perl-native use my host kernel ? probably not, because in this case
> we
> > won't have problem with page.h ? I'm right ?
>
> It doesn't use your kernel headers, but the linux-headers, which are
> generated from the kernel headers. So the version of linux-headers is not
> usually related to the version of the kernel that you are using.
>
> > And how to fix this ???
>
> Try the latest gentoo linux-headers package (or an older version). If tha=
t
> doesn't work then wait for me to test and remove it from the perl-native
> in
> OE.
>
> --
> Jamie Lenehan <lenehan@twibble.org>
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

