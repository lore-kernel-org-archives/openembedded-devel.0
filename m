Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NVVqU-0005Ou-Dw
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 20:59:11 +0100
Received: by bwz9 with SMTP id 9so22485bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 11:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gsUIM92kg70+6eH0lAOtEQQRpqR8kD7Wr8XJ7hE5fJ0=;
	b=kT61sK1oc/y2TuYZtXiwrSE/zKWxxWKJCzBJ12G6UM9k33UYBNN4DsE9GpPKrLySMa
	XQSOC8R47eIF9LarC4mzHDtYi5mi+FRWeXvu7/sm8QvfUF3/7ZBY0PZqYnYFP6Yd8OWS
	ao+gRv7QbBpXE0H12qqIEu08YPoZOVQaJTDuQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ZHNPstEV929kuY2qBfC++jSmYIjMw0MGPokc1SkLDOVmvLKI+DuzMpVRmYipVJqH4y
	OtCCIQ93ziI4eWQW4gwCGCgzkXqYO+RxoMBBnfQSOnWboT/uS6BhIyGRTnorwIo42KSP
	hRX2ZL6gaz9gxsfR67N/pxrWsMIFu1aIoiU6Y=
Received: by 10.204.148.77 with SMTP id o13mr718602bkv.107.1263499013538;
	Thu, 14 Jan 2010 11:56:53 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 16sm521443bwz.11.2010.01.14.11.56.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Jan 2010 11:56:52 -0800 (PST)
Date: Thu, 14 Jan 2010 11:56:48 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100114195648.GB3529@gmail.com>
References: <1261629237-15118-1-git-send-email-raj.khem@gmail.com>
	<hgvcnd$9gv$1@ger.gmane.org>
	<19c1b8a90912240928p40d3c391ybb4289c6a987a5a4@mail.gmail.com>
	<4B33FFC4.2060803@balister.org>
	<f96d234e1001130700h10b931i479ebd1dd216ca77@mail.gmail.com>
	<4B4F1DB0.4010807@balister.org>
	<f96d234e1001140849n13a5e5bflfd6306a0bf2ebf72@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <f96d234e1001140849n13a5e5bflfd6306a0bf2ebf72@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] u-boot_git.bb: Change SRC_URI to a valid location for beagleboard.
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
X-List-Received-Date: Thu, 14 Jan 2010 19:59:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/01/10 11:49), Cliff Brake wrote:
> On Thu, Jan 14, 2010 at 8:35 AM, Philip Balister <philip@balister.org> wrote:
> > On 01/13/2010 10:00 AM, Cliff Brake wrote:
> >> So what is the path forward on this issue?
> >
> > Try the top of the official u-boot repo, not the TI one. I keep meaning to
> > try this, but am not getting to it.
> 
> Not much better -- guess I'm simply build from the head of the repo
> and go with that.  I'm still not understanding why everyone else is
> able to fetch the snapshot from the angstrom mirror, and I'm not.
> Before I dive into bitbake fetcher code, is anyone else having this
> problem?

yes I have the same issue. I guess if you not using angstrom distro this
could happen I even added INHERIT += "angstrom-mirrors" to my local.conf
still it failed. That said I was not using angstrom distro. May be it
works ok on angstrom.

-Khem


