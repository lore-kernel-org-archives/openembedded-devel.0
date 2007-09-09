Received: from [209.85.128.190] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IUIXf-0005S9-Kg
	for openembedded-devel@openembedded.org; Sun, 09 Sep 2007 10:53:19 +0200
Received: by fk-out-0910.google.com with SMTP id 18so1113414fks
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Sep 2007 01:50:29 -0700 (PDT)
Received: by 10.82.154.12 with SMTP id b12mr3775841bue.1189327829464;
	Sun, 09 Sep 2007 01:50:29 -0700 (PDT)
Received: by 10.82.119.6 with HTTP; Sun, 9 Sep 2007 01:50:29 -0700 (PDT)
Message-ID: <74d0deb30709090150g161e6059q99f23e2ce1336e1c@mail.gmail.com>
Date: Sun, 9 Sep 2007 10:50:29 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46E3264C.39BD31A5@vollmann.ch>
MIME-Version: 1.0
References: <46E3264C.39BD31A5@vollmann.ch>
Cc: openembedded-devel@openembedded.org
Subject: Re: What is glibc-intermediate for?
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
X-List-Received-Date: Sun, 09 Sep 2007 08:53:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/9/07, Detlef Vollmann <dv@vollmann.ch> wrote:
> Hello,
>
> building a (cross-)toolchain isn't easy and I'm currently trying
> to get my mind around it.
>
> My understanding was always that we have the following order:
>  linux-libc-headers
>  glibc-initial
>  gcc-cross-initial
>  glibc-intermediate
>  gcc-cross
>  glibc
>
> But looking at my current build, it turns out that the actual order
> is different:
>  linux-libc-headers
>  glibc-initial
>  gcc-cross-initial
>  glibc-intermediate
>  glibc
>  gcc-cross
>
> So, what is glibc-intermediate for (except wasting quite a lot of time)?

glibc-initial is needed to build gcc-cross-initial, which is needed to
build glibc-intermediate, which is needed to build gcc-cross, which is
needed to build glibc. Look at the package recipes, including
glibc.inc to see what's going on.
The seemingly different build order you noticed is probably due to
bitbake's fine-grained task dependencies. Maybe glibc was unpacked
before gcc-cross, but it most certainly wasn't compiled before
gcc-cross was staged.

cheers
Philipp


