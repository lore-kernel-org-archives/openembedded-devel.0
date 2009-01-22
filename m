Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LQ50E-0001Up-R7
	for openembedded-devel@openembedded.org; Thu, 22 Jan 2009 20:14:11 +0100
Received: by rv-out-0708.google.com with SMTP id k29so5285139rvb.0
	for <openembedded-devel@openembedded.org>;
	Thu, 22 Jan 2009 11:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=JsISKsBHG1LXrIYamFTbNTgqO+rUfWjwtDWYCyp03sE=;
	b=nZIFi4RXJ0B9SpsPSUFzGil8iDfzcaezp4OyrGkAtqcnxm1nvfRXPMJjiqLJRaBjBb
	lwtD9o4/FUUWv/cA9k6D3BlatG4ly3gWCb1GUY4etIw4tp34bu/Q5cIzHNccLZktd1QZ
	Z+XyFfBLqFklOVgAOj5gEpKvbfsY/+WSWNDR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=K2LJPw5BPTWLKSuC0/rGfXcP8wmd1XEUMZHAdL5iAgROKKXtWPzeyH/4TRt2LDNc+J
	rr9xEPqGGAIMR/egWEXx6b/I/RK5tmI5XbdReBG4sxS9Dh7+h1D8nq9hM4R56/hCSfGu
	bOfb+nwPYQPbNegRD1e4nOiSsk5wUmAezApY0=
MIME-Version: 1.0
Received: by 10.141.115.6 with SMTP id s6mr1785448rvm.235.1232651219148; Thu, 
	22 Jan 2009 11:06:59 -0800 (PST)
In-Reply-To: <loom.20090121T171822-463@post.gmane.org>
References: <loom.20090121T171822-463@post.gmane.org>
Date: Thu, 22 Jan 2009 11:06:59 -0800
Message-ID: <19c1b8a90901221106p41e019aau486c9ed258ce069a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: cannot compute suffix of object files
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
X-List-Received-Date: Thu, 22 Jan 2009 19:14:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Jan 21, 2009 at 9:47 AM, Claudiu Mdc <claudiu_fw85@yahoo.it> wrote:
> Hi,
>
> I am building bootstrap-image with OpenEmbedded, but it fails on
> glibc-2.5 configure task with this error:
>
> | checking whether ln -s works... yes
> | checking for i686-angstrom-linux-gcc...
> i686-angstrom-linux-gcc-4.3.1 -mcpu=pentiumpro
> | checking for suffix of object files... configure: error:
>  cannot compute suffix of object files: cannot compile
> | See `config.log' for more details.
>
>
> config.log:
>
> configure:2776: checking for suffix of object files
> configure:2797: i686-angstrom-linux-gcc-4.3.1 -mcpu=pentiumpro -c
> -I/home/claudiu/oe/oetmp/staging/i686-angstrom-linux/include,
> -I/home/claudiu/oe/myToolchain/cross/include  -fexpensive-optimizations
> -fomit-frame-pointer -frename-registers -Os  conftest.c >&5
> /home/claudiu/oe/oetmp/work/i686-angstrom-linux/glibc-2.5-r10/
> glibc-2.5/configure:
> line 2798: i686-angstrom-linux-gcc-4.3.1: command not found
> configure:2800: $? = 127
> configure: failed program was:
> | /* confdefs.h.  */
> |
> | #define PACKAGE_NAME "GNU C Library"
> | #define PACKAGE_TARNAME "c-library"
> | #define PACKAGE_VERSION "(see version.h)"
> | #define PACKAGE_STRING "GNU C Library (see version.h)"
> | #define PACKAGE_BUGREPORT "glibc"
> | #define USE_REGPARMS 1
> | /* end confdefs.h.  */
> |
> | int
> | main ()
> | {
> |
> |   ;
> |   return 0;
> | }
> configure:2814: error:
> cannot compute suffix of object files: cannot compile
>
>
>
> I don't understand why in config.log it says:
> i686-angstrom-linux-gcc-4.3.1: command not found
>
>
> I've built a custom toolchain and it is in PATH:
> ~/oe$ i686-angstrom-linux<TAB><TAB> gives this output:
>
> i686-angstrom-linux-addr2line
> i686-angstrom-linux-gcc
> i686-angstrom-linux-objdump
> i686-angstrom-linux-ar
> i686-angstrom-linux-gcc-4.3.1
> i686-angstrom-linux-ranlib
> i686-angstrom-linux-as
> i686-angstrom-linux-gccbug
> i686-angstrom-linux-readelf
> i686-angstrom-linux-c++
> i686-angstrom-linux-gcov
> i686-angstrom-linux-size
> i686-angstrom-linux-c++filt
> i686-angstrom-linux-ld
> i686-angstrom-linux-strings
> i686-angstrom-linux-cpp
> i686-angstrom-linux-nm
> i686-angstrom-linux-strip
> i686-angstrom-linux-g++
> i686-angstrom-linux-objcopy
>

Are you certain that same path that you are using is available to bitbake ?


