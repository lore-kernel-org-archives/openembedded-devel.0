Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1Jy63m-0004Tp-76
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 May 2008 16:09:54 +0200
X-ASG-Debug-ID: 1211206032-56d700180000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 83383AFBF1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 May 2008 09:07:13 -0500 (CDT)
Received: from [192.168.1.71] (LRS-CiscoRouter [192.168.1.1]) by
	barracuda.pager.net with ESMTP id 1FITQ2ajg5D84XCl for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 19 May 2008 09:07:13 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] AVR32 segfaults / Disablng virtual/libintl?
Date: Mon, 19 May 2008 09:07:50 -0500
User-Agent: KMail/1.9.7
References: <200805161611.50480.geoffrey@pager.net>
	<g0ku37$m4g$1@ger.gmane.org>
In-Reply-To: <g0ku37$m4g$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200805190907.50274.geoffrey@pager.net>
X-Barracuda-Connect: LRS-CiscoRouter[192.168.1.1]
X-Barracuda-Start-Time: 1211206033
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: AVR32 segfaults / Disablng virtual/libintl?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 19 May 2008 14:09:54 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 16 May 2008 04:24:54 pm Koen Kooi wrote:
> Geoffrey Wossum wrote:

> > I don't need any i18n any these types of applications.  As a workaround,
> > can I keep gettext from being built and use the libintl stubs provided by
> > uClibc? How do I do this?  PREFERRED_PROVIDER_virtual/libintl = ""?
> > PREFERRED_PROVIDER_virtual/libintl = "uclibc"?
>
> That should work as long as you have wchar and intl stubs in uclibc. I
> would *very* much like to use the uclibc ones instead of the gettext
> ones, if only to get cleaner builds :)

Adding PREFFERRED_PROVIDER_virtual/libintl = "" makes it continue to default 
to pick gettext.  Making the PREFERRED_PROVIDER uclibc makes it go haywire, 
because uClibc doesn't provide virtual/libintl, so it ends up trying to use 
external-toolchain and binutils-cross/gcc-cross/uClibc at the same time.  OK, 
add patch to make uclibc provide virtual/libintl.  Oops, 
uclibc-initial-0.9.29 fails on do_stage for the AVR32 if UCLIBC_HAS_LOCALE == 
y.

I can't look into this any further right, because I have to finish proving the 
sound out so we can spin a new board.  As soon as I'm done with that, I'll 
continue the crusade against gettext.

---
Geoffrey


