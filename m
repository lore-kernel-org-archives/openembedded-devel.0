Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JixsJ-0004lI-Id
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Apr 2008 22:23:31 +0200
Received: by an-out-0708.google.com with SMTP id b33so405402ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2008 13:23:29 -0700 (PDT)
Received: by 10.100.241.17 with SMTP id o17mr921073anh.152.1207599809570;
	Mon, 07 Apr 2008 13:23:29 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 7 Apr 2008 13:23:29 -0700 (PDT)
Message-ID: <c384c5ea0804071323w32061b6dp460a44021ab17603@mail.gmail.com>
Date: Mon, 7 Apr 2008 22:23:29 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200804071354.23859.geoffrey@pager.net>
MIME-Version: 1.0
References: <200804071759.m37HxD8J010059@aiolos.otenet.gr>
	<200804071354.23859.geoffrey@pager.net>
Subject: Re: Building multiple gdb-cross targets
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
X-List-Received-Date: Mon, 07 Apr 2008 20:23:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Mon, Apr 7, 2008 at 8:54 PM, Geoffrey Wossum <geoffrey@pager.net> wrote:
> On Monday 07 April 2008 12:58:42 pm Stelios Koroneos wrote:
>  > I think you are missing the point
>  >
>  > "bare-metal" gdb does not have any bindings with
>  > glibc/uclibc/eglibc/whatever-libc because its (usually) used to build a
>  > system with no OS (standalone apps).
>  > You also need a "bare-metal" toolchain i.e toolchain that generates code
>  > that can run on the board without any OS (this was the case in most
>  > embedded designs before linux become "embedded")
>
>  Yeah, needing a baremetal gdb to debug makes perfect sense when you stop and

I think we should try to achieve the other-way-around-approach, which is:

Add system register support to the Linux GDB for AVR32.

This way, we are done and don't need the bare-metal stuff. I'll look
into that some more once I start on AVR32 myself.

Regards,
-- 
Leon


