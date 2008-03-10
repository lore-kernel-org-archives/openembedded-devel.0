Received: from [64.233.178.245] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JYr1P-00088O-IE
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 00:03:10 +0100
Received: by hs-out-0708.google.com with SMTP id 23so1729100hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2008 16:01:13 -0700 (PDT)
Received: by 10.100.211.8 with SMTP id j8mr12004806ang.35.1205190072793;
	Mon, 10 Mar 2008 16:01:12 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 10 Mar 2008 16:01:12 -0700 (PDT)
Message-ID: <c384c5ea0803101601o6e76d53eo469e218766241aa@mail.gmail.com>
Date: Tue, 11 Mar 2008 00:01:12 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1205188025.4529.27.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <c384c5ea0803091149g321e7086qec5b54499c7ecbc@mail.gmail.com>
	<fr3oom$clq$1@ger.gmane.org>
	<c384c5ea0803101056y50cdbd18mf39818f746fa3152@mail.gmail.com>
	<1205188025.4529.27.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 64.233.178.245
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-cross-initial.inc DEPENDS on libc-initial, but why conditionally on TARGET_ARCH?
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
X-List-Received-Date: Mon, 10 Mar 2008 23:03:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Richard,

On Mon, Mar 10, 2008 at 11:27 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2008-03-10 at 18:56 +0100, Leon Woestenberg wrote:
>  > On Mon, Mar 10, 2008 at 5:48 PM, Koen Kooi
>  > <koen@dominion.kabel.utwente.nl> wrote:
>  > Indeed, when building powerpc/glibc no libc-initial is involved.
>  > However, when I switch to ulibc, there is a libc-initial involved, but
>  > it is not depended on, and a parallel build fails.
>  >
>  > Argh, if only I understood the whole complete picture, I could fix it,
>
>  I tried asking Phil who is/was one of our glibc gurus and he said "those
>  two architectures are more classically 'embedded'" than, say, i386 or
>  powerpc and they might well have more self-hosting runtimes." but he
>  wasn't sure what the exact reason was.
>
>  I've become fuzzy about how the different toolchain bits fit together so
>  I mapped out the chains below. I've missed out references to
>
>  <excellent summary>
>
>  So its all a bit complex...
>
>  What was the problem you were seeing with glibc-initial?
>
LOL, now to add further variables, it was with uclibc :-)

Apparently, uclibc for powerpc does need libc-initial (provided by
uclibc-initial?) as well.

I have to rebuild from scratch to see what exactly went wrong and to
capture the error. I will do so later.

Regards,
-- 
Leon


