Received: from [64.233.178.242] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JaDrz-0007kB-Tr
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Mar 2008 18:39:11 +0100
Received: by hs-out-0708.google.com with SMTP id 23so3323810hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2008 10:36:46 -0700 (PDT)
Received: by 10.100.248.9 with SMTP id v9mr23339788anh.64.1205516206762;
	Fri, 14 Mar 2008 10:36:46 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Fri, 14 Mar 2008 10:36:46 -0700 (PDT)
Message-ID: <c384c5ea0803141036w4f7254e6k28e0e7482487acb0@mail.gmail.com>
Date: Fri, 14 Mar 2008 18:36:46 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200803131417.52399.geoffrey@pager.net>
MIME-Version: 1.0
References: <200803121450.09688.geoffrey@pager.net>
	<200803131417.52399.geoffrey@pager.net>
X-SA-Exim-Connect-IP: 64.233.178.242
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
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
X-List-Received-Date: Fri, 14 Mar 2008 17:39:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Geoffrey,

On Thu, Mar 13, 2008 at 8:17 PM, Geoffrey Wossum <geoffrey@pager.net> wrote:
> On Wednesday 12 March 2008 02:50:09 pm Geoffrey Wossum wrote:
> ...
>  I just submitted all my patches for the AVR32 to OE's bugzilla.  They are
> ...
>  All of the patches are straight forward, except for patch to uclibc.inc
>  (attachment #8196).  Some one who knows more about why CPU_CFLAGS and
>  OPTIMIZATION were being overridden by uclibc.inc needs to comment about the
>  effect this change would have on other platforms.  This is really the
>  important patch, since without it you can't build a working ld-uClibc.so.
>
Good question. I had a similar question about something that wasn't
trivial in the (uclibc) bitbake recipe.

Obviously, we need to comment the non-trivial parts a bit better while
we review and/or commit to the more complex parts of the OE metadata,
such as the toolchain.

Thanks for the work on the AVR32,

Regards,
-- 
Leon


