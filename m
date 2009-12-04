Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NGfEw-00085m-0V
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 21:59:01 +0100
Received: by iwn32 with SMTP id 32so1805689iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 12:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=uVI3sfoggsc4C23Nr832Cd/IVPOoixxyAjw/6eQ5U3k=;
	b=UC5AnhBykTrgWuDiGMaeju6l309I2fgcJj9WC+OQPAbE6KFtvfCi3RKQ5Ha18H7yhh
	KGiuFl7UIEvW0SDl3Eam/HYwO4C/gOppyARB3E5Jv8wbESf8bWGpwxXJFrow+87uwuzk
	WWWYuMnCsLCS+dCv41iHeHWMk/Di0KHNZpseA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ID+D2z/WIggwtf1aQMH6MQs45zNKG8f4KS/o7GhLeuXyA7c63EEZ5DR3Wcm59F/PNq
	1IC5thHaZcxJxOnw5pgjIM436kjyVzAd8S9mJ0Ua0RGIoWcuY0iCvJZYvlrU3WEFqI3Y
	rVK0bJe447kOM8dkEv6ZxrqmHcizpmuMqPO+w=
MIME-Version: 1.0
Received: by 10.231.120.90 with SMTP id c26mr1888614ibr.1.1259960239889; Fri, 
	04 Dec 2009 12:57:19 -0800 (PST)
In-Reply-To: <loom.20091204T213241-372@post.gmane.org>
References: <loom.20091204T213241-372@post.gmane.org>
Date: Fri, 4 Dec 2009 12:57:19 -0800
Message-ID: <19c1b8a90912041257g4324f59bq2d6d4db5176effbe@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Questions about gcc target packages
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
X-List-Received-Date: Fri, 04 Dec 2009 20:59:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 4, 2009 at 12:49 PM, Jeremy Williams <jerm7861@yahoo.com> wrote:
> I am seeing some QA errors when building the gcc target package. The two QA
> errors are .so symlink in non -dev package (for the gcc package) and GNU_HASH in
> objc libraries.
>
> Looking into the first issue reveals something puzzling to me. If you look at
> gcc-package-target.inc, the do_install operation creates a .so symlink to
> libgcc. Looking at the FILES definition for the gcc package (non -dev), it
> appears that this symlink is being sucked into the package by the entry
> "${gcclibdir}/${TARGET_SYS}/${BINV}/lib*". Am I confused here?

Seems plausible

>
> I'm not sure what is causing the GNU_HASH issue with the objc libraries...

LDFLAGS are not honored. May be you could try to force the --hash-style option
into builds of target parts of gcc

>
> I do have one other question. What is the thought behind the rule that first
> looks for the soft-float (nof) version of libgcc and copies that into
> base_libdir instead of the hard-float version? This version of libgcc ends up in
> the package libgcc1. When building an sdk with meta-toolchain, libgcc1 ends up
> getting installed in the target folder and overwrites the hard-float library
> that the gcc-cross-sdk package installs. This causes issues with libstdc++ which
> is built to expect the hard-float version of libgcc when linking qmul and
> friends (hard float is version GCC_4.1, soft float is version GCC_4.2).

Due to multilib and nof happens to be first. I think we should patch
gcc to not generate
nof version if not asked for.

>
> thanks!
>
> -jeremy
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


