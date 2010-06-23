Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORDcO-000758-FB
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 02:15:06 +0200
Received: by pwj10 with SMTP id 10so858085pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 17:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=tyWJmtgKN00Fofg7ZmNMkLxtZjav5/lHFngcVvNsrpQ=;
	b=w8bsV+87Iq8VSaTQLSjVNt4c/Hk1kMa/1ahMCqQM/Km7ttWh1ENz85c6SxcG+ybowV
	dVXfOlIc4jtxpjsNLFvr0rnHuEzYwSq0+TmwkFac1NAwiJFJYNU544OzvlMcVRDoFgCG
	cHytekjGKdGTNDGQsGX7CfU3b/EP4fDdK3zhk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Hq54rMyrSDzsfmSnfUTRQc+QrkZpOwSkndOq+xYiwgmxVB9nUN4f5rDr7EE81oXXlI
	kMAmR8l+/OzrAWc35UXxOurBxjd43pSbZH4Ll/RuChPQVtR96d9Lo0CfRbUTLnWZbgbc
	jWsOVRvlPl/KocdfGi5EEDwD71c0XF+XCP95s=
Received: by 10.115.38.31 with SMTP id q31mr6591436waj.113.1277251827764;
	Tue, 22 Jun 2010 17:10:27 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n29sm26851882wae.4.2010.06.22.17.10.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Jun 2010 17:10:26 -0700 (PDT)
Date: Tue, 22 Jun 2010 17:11:27 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100623001127.GA1512@gmail.com>
References: <1276814379-13161-1-git-send-email-raj.khem@gmail.com>
	<1276814379-13161-2-git-send-email-raj.khem@gmail.com>
	<AANLkTik6QLxTLQgYZaLpucQaU8etYax-invJna3D5kp_@mail.gmail.com>
	<AANLkTimOU6R6QDgQ2F2WtFRcYZy30T68TmhglN3OxIKZ@mail.gmail.com>
	<hvr0v1$j72$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hvr0v1$j72$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] busybox_1.15.3.bb: Work around the gcc 4.5 ICE on thumb
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
X-List-Received-Date: Wed, 23 Jun 2010 00:15:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/06/10 20:55), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 22-06-10 16:31, Khem Raj wrote:
> > On Mon, Jun 21, 2010 at 10:59 PM, Leon Woestenberg
> > <leon.woestenberg@gmail.com> wrote:
> >> Hello Khem,
> >>
> >> On Fri, Jun 18, 2010 at 12:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >>> +# gcc 4.5 has this bug on thumb
> >>> +# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44557
> >>> +# so add -fomit-frame-pointer
> >>> +# this will be removed once the above bug is fixed.
> >>> +
> >>> +
> >>> +CFLAGS_append = " -fomit-frame-pointer"
> >>> +
> >> Can we make this append conditional for ARM-only or even thumb-only?
> > 
> > Yes it should be better to restrict it to arm only I will do that.
> > I dont think we have instruction set (e.g. thumb) in standard overrides
> > may be it will help if we added such an override.
> 
> You do have a thumb override(s) if your machine includes tune-thumb.inc.

ah pretty cool thanks. At some point I remembered that :)

-Khem


