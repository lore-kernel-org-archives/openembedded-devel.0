Received: from [64.233.184.237] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JZcLf-00064u-RE
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 02:35:13 +0100
Received: by wr-out-0506.google.com with SMTP id 57so2774809wri.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 18:33:04 -0700 (PDT)
Received: by 10.115.58.1 with SMTP id l1mr8287898wak.110.1205371981168;
	Wed, 12 Mar 2008 18:33:01 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Wed, 12 Mar 2008 18:33:01 -0700 (PDT)
Message-ID: <19c1b8a90803121833o48bf80dfhe27516bd2cba4d04@mail.gmail.com>
Date: Wed, 12 Mar 2008 18:33:01 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47D83769.5020405@linuxdevelopment.de>
MIME-Version: 1.0
References: <200803121450.09688.geoffrey@pager.net>
	<47D83769.5020405@linuxdevelopment.de>
X-SA-Exim-Connect-IP: 64.233.184.237
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Eureka! AVR32 ld-uClibc.so segfault solved
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
X-List-Received-Date: Thu, 13 Mar 2008 01:35:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Geoffrey,

Try to build uclibc with V=3D1 on commandline and check what extra flags
are passed due to this option. I think these flags might be incorrect
for AVR32

Thanks

-Khem


On Wed, Mar 12, 2008 at 1:04 PM, Robert W=F6rle
<robert@linuxdevelopment.de> wrote:
>
>
>
>  > So I now have a working OE based AVR32 build system, using binutils
>  > 2.17.atmel.0.0.99 20060623, gcc 4.2.1-atmel.1.0.3, and uClibc 0.9.29-a=
tmel.1.
>  > This is essentially the same as Atmel's buildroot-avr32-v2.1.0.  As so=
on as I
>  > clean stuff up a little, I'll submit patches for this via bugzilla.  M=
inus
>  > this uclibc.inc diff.  I need more expert opinion on this.
>  >
>  > Thanks to all those who helped!
>  > ---
>
>
>  excellent job, can you supply any patches you have already, i would be
>  more then happy to bring this up ( again !)
>
>  rob_w
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


