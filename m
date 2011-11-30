Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVt9C-0002rP-WC
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 00:01:03 +0100
Received: by lagj5 with SMTP id j5so480628lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8fkPLkalU5dUgwnlCW/20sTfGtZiLRTYWiohddXgWe8=;
	b=BvSBCiY6q/WHO9TxKzm5TyP9Pc4rKt1RQsj8J9av6hwHVBioTX4cE/oyS2y48CnID+
	mRS+/y0iyfMgbOZrC2RkcfhOnAjtb/d7lWsaoHFWSD0Jq1ucL/SKVmiIEkyTlG3s6BcN
	m8oUW1wGgZ6/sUvMPV+tud+NGHfb2fxAGmKqk=
Received: by 10.152.122.34 with SMTP id lp2mr2895814lab.20.1322693662428; Wed,
	30 Nov 2011 14:54:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 30 Nov 2011 14:53:51 -0800 (PST)
In-Reply-To: <CACu1E7EigJom5yDg+VYZ15o6HF2cJO3BThtCLgEO1Fo1=s-URg@mail.gmail.com>
References: <1321811782-7133-1-git-send-email-cwabbott0@gmail.com>
	<jad09l$c0g$1@dough.gmane.org>
	<CACu1E7EigJom5yDg+VYZ15o6HF2cJO3BThtCLgEO1Fo1=s-URg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2011 14:53:51 -0800
Message-ID: <CAMKF1sqNpuzg8xL0vQp981KCe4ryHMRn+qOYz245EbY8nXKR_g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH] libnotify: add 0.5.2 and make it the default
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
X-List-Received-Date: Wed, 30 Nov 2011 23:01:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 29, 2011 at 3:13 PM, Connor Abbott <cwabbott0@gmail.com> wrote:
> Sorry, I must have had the 0.7.0 headers installed and didn't realize it.
> Actually, that's a problem; if you build two different packages, one which
> requires libnotify and one which requires libnotify3, then the wrong
> headers can get installed in the sysroot because the packages have
> different names. Anyways, it appears that 0.5.2 is actually newer than
> 0.6.0 anyways; I'll update the commit message then.

if they are incompatible and needs to live together then they should
have different install locations
in sysroot for headers and libs e.g. /usr/include/libnotify2 and
/usr/include/libnotify3


