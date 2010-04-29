Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1O7Ybs-0003nH-Sp
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 20:37:17 +0200
Received: by wwg30 with SMTP id 30so967049wwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 11:33:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.157.82 with SMTP id n60mr2559591wek.100.1272566013816; 
	Thu, 29 Apr 2010 11:33:33 -0700 (PDT)
Received: by 10.216.178.75 with HTTP; Thu, 29 Apr 2010 11:33:33 -0700 (PDT)
Date: Thu, 29 Apr 2010 11:33:33 -0700
Message-ID: <g2y18e217241004291133x532abf49k8fb76e81564efbad@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org, denis@denix.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: building an SDK with an externally provided toolchain
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
X-List-Received-Date: Thu, 29 Apr 2010 18:37:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Denys,

in your comment in the thread:

Re: [oe] [RFC][PATCH] meta-toolchain: use MULTIMACH_TARGET_SYS instead of
TARGET_SYS

>
> Ok, you asked for a comment, I'll give you two :)
>
> 1. In Arago I have a way to overwrite SDKPATH from the command line when
> building a specific SDK/toolchain. So, I can do what you suggest, but...
>
> 2. My SDKs are currently not machine-specific, moreover, they don't have
> the
> cross-compile tools in them (i.e. no toolchain part), as Arago uses
> external
> CodeSourcery toolchain for that. The only cross-tools I have in my SDKs are
> those, which are missing from CS - i.e. libtool, pkgconfig, opkg,
> qt4e-tools
> etc. But I still build 2 versions of SDK - armv5te and armv7a.
>
> --
> Denys
>
>
> I am in a similar predicament where we have to use a tool-chain provided to
us prior to the adoption of OE. As a result, we've hacked up our own
external-toolchain recipe to copy the libs and headers into the staging dir,
but do not have a real cross-compile. we just add the path for the actual
tools. We also would like to provide an SDK of our libraries separately from
the toolchain that we deliver to our SDK customers.

my question is, how do you build your sdk. since our SDK_PATH is not where
our toolchain is the sdk.bbclass points ${prefix} to /usr/local (which does
not contain our toolchain) thus much of the makery reverts to looking in
/usr/include for headers which of course casuse the build to break..

do you keep your external toolchain from CS in your SDK_PATH or somewhere
else?

you seem to allude to the fact that you did some magic to overrite the
SDKPATH in certain circumstances.. I didn't see it in your code.

Thanks for your help.

Mike

