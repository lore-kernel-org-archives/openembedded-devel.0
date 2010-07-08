Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OX9gA-0006Of-9W
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 11:15:32 +0200
Received: by iwn34 with SMTP id 34so1966618iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 02:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=gvcYew/YQ/alkviFu15QJupAB6sPaHmM3xR9Dhy2aMU=;
	b=LG4nPYha2X6KCTphXw1ABrCslPCEFvJ4A2frI4k0xQeT7LrNZbsyMNjC1/lcHUOtc2
	raYcEDxADghrDTJojIkLr0FQUMuwukcBwFBeFM488jbuHOSLFSv7LVmbuE3QMfJADh2d
	2zeLPQ1ZyI5IXuaI8Uc4Elb0ivBno9zhv/Vck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=kQ43CgE3kqZ7vrapA5UE/YbbkOcJudEfy8XhntMveghiw/WyQM/180Re5mMmCV2aQf
	FwtXQc6BlAN2qnuZoi/JHLZCOTcOfz0In8q3QLrOemXoJsA1GoX8l2vyE5G4P0J8izCY
	MU6eOummzAFaK2yh+zYKmmA27FR3RHJL8oehA=
Received: by 10.231.183.19 with SMTP id ce19mr8708555ibb.35.1278625544206; 
	Thu, 08 Jul 2010 14:45:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 14:45:24 -0700 (PDT)
In-Reply-To: <AANLkTil7o0fTTOKgeENfJ54exQUXvpnDzIicIWfbDG2-@mail.gmail.com>
References: <AANLkTil7o0fTTOKgeENfJ54exQUXvpnDzIicIWfbDG2-@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 14:45:24 -0700
Message-ID: <AANLkTilB16RBCmlt-mnOLlk2A5no0jrmm_LWlaywDW-X@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: Strangeness with mkdosfs on OMAP3 board
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
X-List-Received-Date: Fri, 09 Jul 2010 09:15:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 8, 2010 at 6:54 AM, Sergey Lapin <slapinid@gmail.com> wrote:
> -D_FILE_OFFSET_BITS=64, where it has gone?

CFLAGS are overwritten, and the makefile is a bit non cross compilation friendly
you can add this

CFLAGS += "-D_FILE_OFFSET_BITS=64

to dosfstools_2.11.bb and then rebuild just this recipe.

Does that help ?

-Khem


