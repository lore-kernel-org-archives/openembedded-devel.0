Received: from [209.85.198.188] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JgwHg-0003o2-5T
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Apr 2008 08:17:20 +0200
Received: by rv-out-0910.google.com with SMTP id c24so1696621rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2008 23:17:18 -0700 (PDT)
Received: by 10.141.22.1 with SMTP id z1mr4838440rvi.67.1207117038596;
	Tue, 01 Apr 2008 23:17:18 -0700 (PDT)
Received: by 10.140.125.10 with HTTP; Tue, 1 Apr 2008 23:17:18 -0700 (PDT)
Message-ID: <19c1b8a90804012317l201ddad6xd2f62c5f35c370f8@mail.gmail.com>
Date: Tue, 1 Apr 2008 23:17:18 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47F024DA.5020502@gmx.de>
MIME-Version: 1.0
References: <1206911981.4838.12.camel@dax.rpnet.com> <47F024DA.5020502@gmx.de>
Subject: Re: libgcc not being pulled into OABI images
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
X-List-Received-Date: Wed, 02 Apr 2008 06:17:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, Mar 30, 2008 at 4:40 PM, Thomas Kunze <thommycheck@gmx.de> wrote:
> Hi,
>
>  I tested on my host machine (AMD64) and libgcc is not it NEEDED but is
>  installed anyway. So it seems to be no problem that libgcc is not in
>  needed. So I investigated libpthread and found out that it tries to
>  dlopen libgcc and fails if it can't. Our shlibs code can't detect this
>  so libgcc does not get pulled into image. So I suggest something like:
>
>  --- packages/glibc/glibc.inc    e9a2a880277298ca08e7f53a4e5c69127415a5ed
>  +++ packages/glibc/glibc.inc    3aa1e1a80cf9f0f899b5a79b857bfa5427f5d54e
>  @@ -7,6 +7,8 @@ DEPENDS = "${@['virtual/${TARGET_PREFIX}
>   DEPENDS = "${@['virtual/${TARGET_PREFIX}gcc-initial',
>  'virtual/${TARGET_PREFIX}gcc']['nptl' in '${GLIBC_ADDONS}']}
>  linux-libc-headers"
>   #this leads to circular deps, so lets not add it yet
>   #RDEPENDS_ldd += " bash"
>  +# nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
>  +RDEPENDS += "${@['','libgcc']['ntpl' in '${GLIBC_ADDONS}']}"
>   PROVIDES = "virtual/libc ${@['virtual/${TARGET_PREFIX}libc-for-gcc',
>  '']['nptl' in '${GLIBC_ADDONS}']}"
>   PROVIDES += "virtual/libintl virtual/libiconv"
>
>
>  Is it ok if I comit this (and bump PRs of all packages that use this file?)

nptl glibc dlopens libgcc (e.g. code using exceptions) so this fix
creating an explicit dependency looks ok to me.
it does not have it in DT_NEEDED section may be because it links with
-static-libgcc when build

>
>  Regards,
>  Thomas
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


