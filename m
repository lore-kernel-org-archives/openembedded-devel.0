Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JgtBH-0002NZ-KQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Apr 2008 04:58:31 +0200
Received: by wa-out-1112.google.com with SMTP id l24so4979370waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2008 19:58:22 -0700 (PDT)
Received: by 10.115.92.2 with SMTP id u2mr13782012wal.139.1207105102764;
	Tue, 01 Apr 2008 19:58:22 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Tue, 1 Apr 2008 19:58:22 -0700 (PDT)
Message-ID: <19c1b8a90804011958t469f7c3cxc0bb9ee109dd2a27@mail.gmail.com>
Date: Tue, 1 Apr 2008 19:58:22 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1207030242.29161.1245367579@webmail.messagingengine.com>
MIME-Version: 1.0
References: <1207030242.29161.1245367579@webmail.messagingengine.com>
Subject: Re: gcc disable-libunwind-exceptions, VFP, iWMMXt, crunch - nokia800, mx31ads, etc
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
X-List-Received-Date: Wed, 02 Apr 2008 02:58:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Mar 31, 2008 at 11:10 PM, Hasjim Williams
<openembedded-devel@lists.futaris.org> wrote:
> Hi All,
>
>  I was recently looking in gcc-cross-4.2.2.bb and 4.3.0.bb and noticed
>  that in our EXTRA_OECONF we have:
>
>  --disable-libunwind-exceptions
>
>  Won't this cause a problem for a VFP system (when an exception occurs),

AFAIK this option is used if you want gcc to use libunwind to handle exceptions.

>  i.e. mx31ads, nokia800?
>  e.g. libunwind.S in gcc/config/arm has some specific functions to
>  save/restore VFP and iWMMXt registers...
>

that should work on EABI. I am not so sure about OABI.

>  Also, I couldn't build glibc-intermediate (with system-wide iwmmxt) with
>  the tag enabled, when building with binutils-2.18, gcc-4.3.0 and
>  glibc-2.6.1 ...

what was the error ?

>
>  How does the TARGET_FPU_arm = "hard" overcome this on nokia800, mx31ads,

Its machine specific  e.g. look at ./machine/nokia800.conf
thats where it sets the fpu type which is then used by glibc
"get_glibc_fpu_setting" to determine if it use use hard or soft fp.


>  etc?  Are we only building with-float in certain packages, and using
>  softfp float-abi otherwise?
>
>  Does this mean for a MaverickCrunch system (with system-wide FPU
>  enabled), we should be setting TARGET_FPU_arm = "hard" too?
>
>  What about for a PXA27x system with a iWMMXt coprocessor (and
>  system-wide iwmmxt) ???  It should be using soft-float, but it should
>  have libunwind-exceptions enabled (I think) because of the code in
>  libunwind.S...
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


