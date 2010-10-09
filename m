Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4Vsg-0006jZ-PX
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 11:38:29 +0200
Received: by iwn7 with SMTP id 7so604189iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 02:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=JL2FCilVlSFxjIkt+K+45t3re4ojpB7j3jQ6FfBQMUg=;
	b=kZe4Pic1c5hEqjZ+CmUgrf6O2tX5Ckrqo0UHk6PLivudLwJC8DHaV99pxN5JJ7zVFi
	+PHuPRwV7ZRGkK0hzLWa86HkOGRPvFm3lS6b4ZKfsShz5811XBVVCDwcLdW8EXkBWcp8
	5ZBnFvIOjFtzCXb8y3vexKbZT23SDGxMrw+Eg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=DX59GqNJfqtJkQuqs6EuqTUzda7XLlS7fG0WXVWTMeKCQ0JS2ff2HEgsClPrF7KcF5
	5qFrr3OqPkE5nCKDu0xw3g+/NRj7TKOTkXwIg9HFS7JAdfNaUSiPCHWXeqYM7RDzG3gL
	02h4D12rNqwl64DSvmQJHgtTv94w8jkOyY0EY=
MIME-Version: 1.0
Received: by 10.231.16.75 with SMTP id n11mr2789814iba.49.1286617069711; Sat,
	09 Oct 2010 02:37:49 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 02:37:49 -0700 (PDT)
Date: Sat, 9 Oct 2010 11:37:49 +0200
Message-ID: <AANLkTi=iNaP53YAKHeTpv9Wsp1VL4GZPhrJTkYdMfdGp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: inc file discussion
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
X-List-Received-Date: Sat, 09 Oct 2010 09:38:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I see a lot of diversity in .inc files, and I was wondering whether we
should not try to come up with some guidelines about their purpose,
what should go in it, what not etc etc.

Some observations and questions:

Some of the inc files use INC_PR whereas others do not.

Some people seem to use .inc file as a way to save bytes in the
archive and really put everything in it (including things like
DESCRIPTION, LICENSE etc etc).
While I agree that DESCRIPTION will probably not change between
versions and LICENSE is also unlikely to change, it might be more user
friendly to put them in the .bb file
(so when you open the .bb file you immediate see the basic information
of a package)
It does not really make things more work when upgrading to a new
version since I assume most people do like me and either do a git mv
or a cp from an older version (which retains the info).

What I also noticed is .inc files saying things like:
DEFAULT_PREFERENCE = "-1"
Do we want this in an inc file? I'd say an inc file is shared between
all versions; Personally I would prefer setting the -1 in the .bb
file, not in the .inc

And then there is DEPENDS in .inc files. I think there is some
potential cause of getting unneeded DEPENDS
Picture the following scenario: a new version needs an additional
package, it gets added to the DEPENDS of the .inc file and suddenly
older versions also get this DEPENDS (maybe unneeded).

I hope you get the idea.
And of course I know that .inc files are useful (e.g when it comes to
sharing python scripts etc). Then again, I feel sometimes we do too
much in them.

How do others feel about this?

Frans.

PS: did a quick grep on D_P in the inc files. See below (and yes, I
understand the reasons behind some of the, but some other cases seem
strange to me e.g what is the point of setting D_P for all versions of
a recipe to -1, I feel this does not change things compared to the
normal case (where D_P defaults to 0) (and overrides in a recipe will
set it to a positive value anyway)

binutils/mingw-binutils.inc:DEFAULT_PREFERENCE = "-1"
devio/devio-cvs.inc:DEFAULT_PREFERENCE = "-1"
dtc/dtc_git.inc:DEFAULT_PREFERENCE = "-1"
gcc/gcc-4.1.0.inc:DEFAULT_PREFERENCE = "-1"
gcc/gcc-4.3.1.inc:DEFAULT_PREFERENCE = "-99"
gcc/gcc-4.3.2.inc:DEFAULT_PREFERENCE = "-999"
gcc/gcc-4.3.3.inc:DEFAULT_PREFERENCE = "-999"
gcc/gcc-4.3.4.inc:DEFAULT_PREFERENCE = "-999"
gcc/gcc-4.4.1.inc:DEFAULT_PREFERENCE = "-999"
gcc/gcc-4.4.2.inc:DEFAULT_PREFERENCE = "-999"
gcc/gcc-4.4.4.inc:DEFAULT_PREFERENCE = "-999"
gcc/gcc-4.5.inc:DEFAULT_PREFERENCE = "-999"
gcc/gcc-svn.inc:DEFAULT_PREFERENCE = "-999"
gdb/gdb.inc:DEFAULT_PREFERENCE_avr32 = "-99"
gdb/gdbserver.inc:DEFAULT_PREFERENCE_avr32 = "-99"
gstreamer/gst-common.inc:DEFAULT_PREFERENCE = "-1"
linux/ixp4xx-kernel.inc:# DEFAULT_PREFERENCE is set automagically in
this file as
linux/ixp4xx-kernel.inc:    bb.data.setVar("DEFAULT_PREFERENCE", pref-mmac, d)
linux/ixp4xx-kernel.inc:    # bb.note("DEFAULT_PREFERENCE := %s" % (pref-mmac))
mesa/mesa-7.8.2.inc:DEFAULT_PREFERENCE_shr = "2"
mesa/mesa-dri.inc:DEFAULT_PREFERENCE = "-1"
mingw/mingw-runtime.inc:DEFAULT_PREFERENCE = "-1"
mingw/mingw-runtime.inc:DEFAULT_PREFERENCE_mingw32 = "1"
mingw/mingw-w32api.inc:DEFAULT_PREFERENCE = "-1"
mingw/mingw-w32api.inc:DEFAULT_PREFERENCE_mingw32 = "1"
python/python.inc:DEFAULT_PREFERENCE = "-26"
qt4/qt-4.6.0.inc:DEFAULT_PREFERENCE = "-1"
qt4/qt-4.6.2.inc:DEFAULT_PREFERENCE = "-1"
qt4/qt-4.6.3.inc:DEFAULT_PREFERENCE = "-1"
qt4/qt-4.7.0.inc:DEFAULT_PREFERENCE = "-1"
util-linux-ng/util-linux-ng.inc:DEFAULT_PREFERENCE = "-1"
wpa-supplicant/wpa-supplicant-0.6.inc:DEFAULT_PREFERENCE = "-2"


