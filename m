Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PJScj-0000ZJ-Vt
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 16:11:38 +0100
Received: by iwn34 with SMTP id 34so138799iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 07:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=5FwMqbSbVyRsw4PCDla9/pMt78UWzzmTyX9TEk5osgE=;
	b=i+E+C10+ppfCp63odw0f0V4Rph2aC13MH1pFMd0MaOwy9oGOqzkoGpv6r4hqzrEqwV
	NFX7eXNkcRw3WmB+6nT9F2Pa7k78+Nsf8rUx3DNNHNZ6QJ3iRXOX2XiaEojOBUIHUl/r
	d5jExoobvDZlnoZfYibB/sSZMpqw8jx3lSr3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RYGKnOBmp0KxYc7/WwGCTm5D4mH4rWdBO9yR0U1QBxGFgYbOycyqRURGmco5FbxsEq
	VBGXo3o68eTwHxVWhIs8Mv47sYsA8Pb3wpptdphUAkZ4Psc2L3xU7mrNL1nn963kvVFq
	R2dVVd1pRaNJK2ri4KbvlrMJ171XcjsZrwNm4=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr2173768ibd.26.1290179429990; Fri,
	19 Nov 2010 07:10:29 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Fri, 19 Nov 2010 07:10:29 -0800 (PST)
In-Reply-To: <20101118184402.GL21346@mx.loc>
References: <1289988503-14693-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTi=YqETnOXFgSfbGvaR8AbW0HAtnm2=ZJVNCboUM@mail.gmail.com>
	<AANLkTimq5JgxA+T3U9WhBMxgr+Of_H27RF3SemZc69fY@mail.gmail.com>
	<20101118184402.GL21346@mx.loc>
Date: Fri, 19 Nov 2010 16:10:29 +0100
Message-ID: <AANLkTin0RXUMxpn_NBCv3MQd4_Qs2Dqt_pSX7057janj@mail.gmail.com>
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
Subject: Re: [PATCH] uclibc++: moved to 0.2.2
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
X-List-Received-Date: Fri, 19 Nov 2010 15:11:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm withdrawing this patch.
In a few moments I'll be submitting a new patch for the git head version.
The last official version (0.2.2 is > 2 yrs old). There are several
patches since, and it does not look like there will be a new release
in the near future so git head seems a better option.

I've also addressed the License issue (Rules.mak says LGPL v2 or
later) and removed the do_stage.
The cstring patch is still needed. The comment section of the patch
contains the error messages).

Frans.


