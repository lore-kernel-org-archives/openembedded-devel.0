Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PLP1M-0007aX-Ab
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 00:45:05 +0100
Received: by wyb40 with SMTP id 40so282400wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 15:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=h9a6k3OtNQCmsClcK0h75bPbnGTN+hcP7r5cij5VFx8=;
	b=k7EsHQKpkG5LxP9zgj7Mi8aHqV/cfvJSbfz9D+gQ+mFAXU3epQikc+8FWSVMh9wXTE
	hB1k1Y0cgUIt4JZzAoWswz9deZAj1Cxm4RXMNvr5bkQH+fBmFYcQR+ZU+RWP23byTzwX
	ipWcqfLO5+OboIStFKjLml6gT/ujfdzVaWoAo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NpIiCPndL2jMsRM7KTHsOgi4TXP4t4LxEgOCiyqqI/x8bGjQDHVruN+S5qOO1+kMs4
	EN8vieB9i822kdPgIjUL1rZDbkANexFBne2VsL88VwPeQ9E7PhtP7c2t0OM+GGCK0OW1
	PNdK8T7xyn3WwINBoUGfKfZ/vtrAT5s1v70uQ=
MIME-Version: 1.0
Received: by 10.216.52.11 with SMTP id d11mr33917wec.0.1290642229474; Wed, 24
	Nov 2010 15:43:49 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Wed, 24 Nov 2010 15:43:49 -0800 (PST)
In-Reply-To: <AANLkTikRdtg1U3gd6z3i0_UkifMgoRnSgSj9OW2dSL37@mail.gmail.com>
References: <AANLkTimt7_P96yJMtLVd5S8ZOgH-=6VgTny=CezhOJ7P@mail.gmail.com>
	<AANLkTikQLnSYpAF4YivEWQODjHpOdHowndLOkyh3LJAp@mail.gmail.com>
	<4CEB1349.6080602@mentor.com>
	<AANLkTikRdtg1U3gd6z3i0_UkifMgoRnSgSj9OW2dSL37@mail.gmail.com>
Date: Thu, 25 Nov 2010 00:43:49 +0100
Message-ID: <AANLkTikm-rGwOYQKp4NcwyOet44UpdtHNR0cOOvmbu+Z@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: automake-1.11 vs. host $perl_threads
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
X-List-Received-Date: Wed, 24 Nov 2010 23:45:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 24, 2010 at 11:59 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> It looks like Poky's handles the issue differently:
>
After a better inspection, nothing new there.


I suspect the perl issue was originated by me, starting a build in
Ubuntu env (with perl  threads) and having resumed a broken build
after rebooting in Gentoo (no perl threads). That would explain our
$perl_threads = 1; for automake-native.

A fresh build of one hour ago gave our $perl_threads = 0;

Sorry for the noise

Andrea


