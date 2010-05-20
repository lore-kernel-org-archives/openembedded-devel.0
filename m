Received: from mail.reciva.com ([109.169.29.93] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1OF61u-0007JY-Om
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 15:43:19 +0200
Received: from [62.7.80.98] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1OF5xy-0001Pe-SX
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 14:39:14 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1OF5xy-0003pg-K0
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 14:39:14 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1274119962.25944.147.camel@trini-m4400>
References: <hsql3t$o5c$1@dough.gmane.org> <20100517055550.GA6686@gmail.com>
	<hsr2pr$4vp$1@dough.gmane.org>
	<AANLkTin6PIr6ZgeYS6rB9IGK83vQH9Tn9xreVOwOAt0M@mail.gmail.com>
	<hsrsq8$d0r$1@dough.gmane.org>
	<AANLkTimXPVpXkm-vJbKvsYim3zM_ckn6XEH_XtS_pDot@mail.gmail.com>
	<1274119962.25944.147.camel@trini-m4400>
Date: Thu, 20 May 2010 14:39:14 +0100
Message-ID: <1274362754.18597.125.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Broken-Reverse-DNS: no host name found for IP address 62.7.80.98
X-SA-Exim-Connect-IP: 109.169.29.93
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question: is 'gcc' supposed to replace the libstdc++.la installed by 'gcc-cross'?
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
X-List-Received-Date: Thu, 20 May 2010 13:43:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-05-17 at 11:12 -0700, Tom Rini wrote:
> On Mon, 2010-05-17 at 10:45 -0700, Khem Raj wrote: 
> > what is -g3 offering over -g at -O2 and how good the additional debug info is ?
> 
> -g3 offers lots of stuff, spelled out in some doc or another is macro
> expansion, for example.  I don't know if it offers enough stuff that you
> say don't need the sources themselves around still too tho.  Koen?

The gcc manual is not terribly illuminating on this subject:

http://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html#Debugging-Options

just says that it "... includes extra information, such as all the macro
definitions present in the program. Some debuggers support macro
expansion when you use -g3."

The definitions in flags.h suggest that, in fact, -g3 doesn't really add
much apart from macros:

enum debug_info_level
{
  DINFO_LEVEL_NONE,     /* Write no debugging info.  */
  DINFO_LEVEL_TERSE,    /* Write minimal info to support tracebacks only.  */
  DINFO_LEVEL_NORMAL,   /* Write info for all declarations (and line table).  */
  DINFO_LEVEL_VERBOSE   /* Write normal info plus #define/#undef info.  */
};

... and, from a quick inspection of dwarf2out.c, I didn't see anything
else very obvious that is added by DINFO_LEVEL_VERBOSE.

So, all in all, I can't find a great deal of evidence to suggest that
compiling at -g3 really does enhance the debugging experience all that
much.  I've certainly never used that option myself and haven't really
felt the poorer for it.  I'd be interested to hear what exactly the
feature is that the Angstrom folks feel the lack of renders the -dbg
packages unusable with -g2.

p.



