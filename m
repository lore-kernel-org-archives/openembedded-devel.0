Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JYmGe-00045y-Ee
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Mar 2008 18:58:34 +0100
Received: by an-out-0708.google.com with SMTP id b33so460725ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Mar 2008 10:56:37 -0700 (PDT)
Received: by 10.100.33.19 with SMTP id g19mr11533205ang.48.1205171797224;
	Mon, 10 Mar 2008 10:56:37 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 10 Mar 2008 10:56:37 -0700 (PDT)
Message-ID: <c384c5ea0803101056y50cdbd18mf39818f746fa3152@mail.gmail.com>
Date: Mon, 10 Mar 2008 18:56:37 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fr3oom$clq$1@ger.gmane.org>
MIME-Version: 1.0
References: <c384c5ea0803091149g321e7086qec5b54499c7ecbc@mail.gmail.com>
	<fr3oom$clq$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 209.85.132.249
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Mon, 10 Mar 2008 17:58:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Koen,

On Mon, Mar 10, 2008 at 5:48 PM, Koen Kooi
<koen@dominion.kabel.utwente.nl> wrote:
>  | OE toolchain question: any reason why the list below includes arm*,
>  | mips* but nothing else?
>  |
>  | gcc-cross-initial.inc:
>  |
>  "${@['virtual/${TARGET_PREFIX}libc-initial',''][bb.data.getVar('TARGET_ARCH',
>  | d, 1) in ['arm', 'armeb', 'mips', 'mipsel']]}"
>
>  I think that's because we only supported nptl for arm and mips when the
>  earth was still young and glibc even nastier than today. I asked this
>  before and never got a conclusive answer :(
>
I suspected this to be NPTL related, and I vaguely remember you
explaining the initial-intermediate dependencies.

RP answered on #oe that my logic was inverse: gcc-cross-initial *does*
depend on libc-initial *only* when arm/mips is the target, not for
other architectures.

Indeed, when building powerpc/glibc no libc-initial is involved.
However, when I switch to ulibc, there is a libc-initial involved, but
it is not depended on, and a parallel build fails.

Argh, if only I understood the whole complete picture, I could fix it,

Thanks for the answers,

Regards,
-- 
Leon


