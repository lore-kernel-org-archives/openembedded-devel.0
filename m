Received: from [66.226.21.253] (helo=mx253i.mysite4now.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mhumphreys@logiclinkdesign.com>) id 1M0Npr-0007Zs-9P
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 May 2009 00:37:31 +0200
Received: from pool-71-184-112-56.bstnma.fios.verizon.net [71.184.112.56] by
	mx253i.mysite4now.com with SMTP; Sat, 2 May 2009 15:31:07 -0700
From: "Marc Humphreys" <mhumphreys@logiclinkdesign.com>
To: <openembedded-devel@lists.openembedded.org>
References: <20090430140436.GA7335@pcimg12.dei.unipd.it>	<49F9B426.5020602@xora.org.uk>	<20090430155320.GA7550@pcimg12.dei.unipd.it>
	<49FA1799.7010100@xora.org.uk>
In-Reply-To: <49FA1799.7010100@xora.org.uk>
Date: Sat, 2 May 2009 18:31:06 -0400
Message-ID: <00ab01c9cb75$afa99af0$0efcd0d0$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcnJ28SWaH2kQA7LQe++PSHY8/OnsgBmeNFA
Subject: Re: receipe for libmicrohttpd
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
X-List-Received-Date: Sat, 02 May 2009 22:37:31 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Sicortex, Inc.

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Graeme Gregory
> Sent: Thursday, April 30, 2009 5:27 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] receipe for libmicrohttpd
> 
> Ottavio Campana wrote:
> > On Thu, Apr 30, 2009 at 03:22:30PM +0100, Graeme Gregory wrote:
> >
> >> Ottavio Campana wrote:
> >>
> >>> I wrote the receipe for libmicrohttpd, a LPGL library used to
> embedded a
> >>> web server in programs.
> >>>
> >>> It works for me, but I'd like to have some feedback from you, if it
> is
> >>> good or not and if you'd like to add it to OE.
> >>>
> >>> Ottavio
> >>>
> >>> PR = "r1"
> >>> PN = "libmicrohttpd"
> >>> DESCRIPTION = "GNU libmicrohttpd is a small C library that is
> supposed to make it easy to run an HTTP server as part of another
> application"
> >>> HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
> >>> SECTION = "libs"
> >>> LICENSE = "LGPL"
> >>>
> >>> SRC_URI = "ftp://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-
> 0.4.1.tar.gz"
> >>>
> >>> inherit autotools pkgconfig
> >>>
> >>> do_stage() {
> >>>         oe_runmake DESTDIR="${D}" install
> >>>         autotools_stage_all
> >>> }
> >>>
> >>> do_qa_staging () {
> >>> }
> >>>
> >>>
> >>>
> >> You need to run the recipe through oe-stylize (found in contrib
> directory).
> >>
> >> Why did you override do_qa_staging() ?
> >>
> >> Apart from this recipe looks good, cleanup and submit as a git-diff.
> >>
> >
> > here it is. I hope it's good.
> >
> >
> I missed it first time, but you dont need to set PN =
> 
> PN is derived from the .bb file name and is already set for you.
> 
> Graeme
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




