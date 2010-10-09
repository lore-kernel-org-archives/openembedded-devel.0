Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P4XGk-00011i-IN
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 13:07:17 +0200
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 2F164EA57D
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Oct 2010 12:37:05 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvYQAPfhr0xT4zjzPGdsb2JhbAAHokYBAQEBNbgfhUcEiVJu
X-IronPort-AV: E=Sophos;i="4.57,307,1283724000"; d="scan'208";a="1679865145"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 09 Oct 2010 12:37:05 +0200
Message-ID: <4CB045D0.4060103@atmel.com>
Date: Sat, 09 Oct 2010 12:37:04 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=iNaP53YAKHeTpv9Wsp1VL4GZPhrJTkYdMfdGp@mail.gmail.com>
In-Reply-To: <AANLkTi=iNaP53YAKHeTpv9Wsp1VL4GZPhrJTkYdMfdGp@mail.gmail.com>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 195.54.99.197
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: inc file discussion
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
X-List-Received-Date: Sat, 09 Oct 2010 11:07:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks skrev:
> Dear all,
> 
> I see a lot of diversity in .inc files, and I was wondering whether we
> should not try to come up with some guidelines about their purpose,
> what should go in it, what not etc etc.
> 
> Some observations and questions:
> 
> Some of the inc files use INC_PR whereas others do not.
> 
> Some people seem to use .inc file as a way to save bytes in the
> archive and really put everything in it (including things like
> DESCRIPTION, LICENSE etc etc).
> While I agree that DESCRIPTION will probably not change between
> versions and LICENSE is also unlikely to change, it might be more user
> friendly to put them in the .bb file
> (so when you open the .bb file you immediate see the basic information
> of a package)
> It does not really make things more work when upgrading to a new
> version since I assume most people do like me and either do a git mv
> or a cp from an older version (which retains the info).
> 
> What I also noticed is .inc files saying things like:
> DEFAULT_PREFERENCE = "-1"
> Do we want this in an inc file? I'd say an inc file is shared between
> all versions; Personally I would prefer setting the -1 in the .bb
> file, not in the .inc
> 
> And then there is DEPENDS in .inc files. I think there is some
> potential cause of getting unneeded DEPENDS
> Picture the following scenario: a new version needs an additional
> package, it gets added to the DEPENDS of the .inc file and suddenly
> older versions also get this DEPENDS (maybe unneeded).
> 
> I hope you get the idea.
> And of course I know that .inc files are useful (e.g when it comes to
> sharing python scripts etc). Then again, I feel sometimes we do too
> much in them.
> 
> How do others feel about this?
> 
> Frans.
> 
> PS: did a quick grep on D_P in the inc files. See below (and yes, I
> understand the reasons behind some of the, but some other cases seem
> strange to me e.g what is the point of setting D_P for all versions of
> a recipe to -1, I feel this does not change things compared to the
> normal case (where D_P defaults to 0) (and overrides in a recipe will
> set it to a positive value anyway)
> 
> binutils/mingw-binutils.inc:DEFAULT_PREFERENCE = "-1"
> devio/devio-cvs.inc:DEFAULT_PREFERENCE = "-1"
> dtc/dtc_git.inc:DEFAULT_PREFERENCE = "-1"
> gcc/gcc-4.1.0.inc:DEFAULT_PREFERENCE = "-1"
> gcc/gcc-4.3.1.inc:DEFAULT_PREFERENCE = "-99"
> gcc/gcc-4.3.2.inc:DEFAULT_PREFERENCE = "-999"
> gcc/gcc-4.3.3.inc:DEFAULT_PREFERENCE = "-999"
> gcc/gcc-4.3.4.inc:DEFAULT_PREFERENCE = "-999"
> gcc/gcc-4.4.1.inc:DEFAULT_PREFERENCE = "-999"
> gcc/gcc-4.4.2.inc:DEFAULT_PREFERENCE = "-999"
> gcc/gcc-4.4.4.inc:DEFAULT_PREFERENCE = "-999"
> gcc/gcc-4.5.inc:DEFAULT_PREFERENCE = "-999"
> gcc/gcc-svn.inc:DEFAULT_PREFERENCE = "-999"
> gdb/gdb.inc:DEFAULT_PREFERENCE_avr32 = "-99"
> gdb/gdbserver.inc:DEFAULT_PREFERENCE_avr32 = "-99"
> gstreamer/gst-common.inc:DEFAULT_PREFERENCE = "-1"
> linux/ixp4xx-kernel.inc:# DEFAULT_PREFERENCE is set automagically in
> this file as
> linux/ixp4xx-kernel.inc:    bb.data.setVar("DEFAULT_PREFERENCE", pref-mmac, d)
> linux/ixp4xx-kernel.inc:    # bb.note("DEFAULT_PREFERENCE := %s" % (pref-mmac))
> mesa/mesa-7.8.2.inc:DEFAULT_PREFERENCE_shr = "2"
> mesa/mesa-dri.inc:DEFAULT_PREFERENCE = "-1"
> mingw/mingw-runtime.inc:DEFAULT_PREFERENCE = "-1"
> mingw/mingw-runtime.inc:DEFAULT_PREFERENCE_mingw32 = "1"
> mingw/mingw-w32api.inc:DEFAULT_PREFERENCE = "-1"
> mingw/mingw-w32api.inc:DEFAULT_PREFERENCE_mingw32 = "1"
> python/python.inc:DEFAULT_PREFERENCE = "-26"
> qt4/qt-4.6.0.inc:DEFAULT_PREFERENCE = "-1"
> qt4/qt-4.6.2.inc:DEFAULT_PREFERENCE = "-1"
> qt4/qt-4.6.3.inc:DEFAULT_PREFERENCE = "-1"
> qt4/qt-4.7.0.inc:DEFAULT_PREFERENCE = "-1"
> util-linux-ng/util-linux-ng.inc:DEFAULT_PREFERENCE = "-1"
> wpa-supplicant/wpa-supplicant-0.6.inc:DEFAULT_PREFERENCE = "-2"
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Looks good to me.
Why not start a Wiki page on guidelines and then we can update as we get
an agreement

Best Regards
Ulf Samuelsson



