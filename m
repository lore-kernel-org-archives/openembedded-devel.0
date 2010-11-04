Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PE0YW-0002fh-N7
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 15:12:54 +0100
Received: by gyf3 with SMTP id 3so1487594gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 07:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=om0G5+LW+XNmqKv9s2WEWPCumyQPJlSw3bvDoAeURkM=;
	b=TMe8De+qQFsHrneawknWwXqyHSSeB30IC9Zh2K7lAhP5cW53ZMGoL9R+CwBFiWMda4
	zZlx7aMr8ahQu+fXpbC9/KGHSuuKxRDf6nzHc1itFSqF8llOH+G/HmRKOkAdh2cjVtuN
	9hg1Pcn5TwpDCkUsZMnFUWgd/ids68gse+19k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=lfeCEb+vBSvRUwuuiuzvkfd802C6j1Bdusy2/tdikPqbJE0CqQjKL1j5mdSW5/Ec88
	XDwvfHwPLvDc3FHiherbm5Y1Jf+lTP4FY3k7wB96zvRsycmu7hVyaPffNYdASIXIyV36
	itCMLsJ6q49thJD7jL36Yvhd0Zi1DMdsaNQmM=
Received: by 10.216.26.138 with SMTP id c10mr1999472wea.23.1288879908488; Thu,
	04 Nov 2010 07:11:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Thu, 4 Nov 2010 07:11:28 -0700 (PDT)
In-Reply-To: <AANLkTinrRCXZfpE-GTOZtNGmNMned0y+nJsckL8XiP4U@mail.gmail.com>
References: <AANLkTim-_z6a6jX3X9Zh_s-ihE-19SFFmus3U7MXVPfY@mail.gmail.com>
	<20101026093926.GC3514@jama> <20101026112551.GD3514@jama>
	<AANLkTinrRCXZfpE-GTOZtNGmNMned0y+nJsckL8XiP4U@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 4 Nov 2010 07:11:28 -0700
X-Google-Sender-Auth: M85OMt2ftrTdRx6v7g0sK_sRDho
Message-ID: <AANLkTi=nGUne=nMnshyiL2eFiEMLso6-z9G3eaesMBK9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: DEPENDS broken for native(sdk).bbclass Was: libgee introspection problem
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
X-List-Received-Date: Thu, 04 Nov 2010 14:12:54 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 4, 2010 at 1:05 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> After your ping:
> I'm definitely no expert in this area. Your proposal looks ok but I'm
> a little bit worried about the breaking of DEPENDS_virtclass-native.
> This seems to involve some 44 recipes (list at end).
> Guess we should repair those first.
> Did we already have that _target suffix?
>

Adding a target override has proved to be rather painful due to when
OVERRIDES is used during the parsing process, unfortunately.  Khem's patch
ran into some problems, which I'm investigating.  Will reply to this thread
or his patch thread with details as I gather them.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

