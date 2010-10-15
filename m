Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6qD4-00021C-0f
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 21:44:59 +0200
Received: by wyb40 with SMTP id 40so1101415wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 12:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=UrGL0/ARTy1E87lf/Ktq5TG04K3cUGwe/15kJ+voAcE=;
	b=R7Nid5mhf0IohggmjC55UvRneQmsBTo2zvylYoyK2XABv/kAPpjp3P8ZeK1NFYZJqD
	p1M3lpVaO9tZhSyhgmha/6l2Hcb4U7XykDJvFqyWXJf4mc+rbZqE9s7E3sjC5xO8VkBS
	kbb3cGenDexEXZIthECLTqFPhUi7bZm9wiTlI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=OZw6MKxg0+L4H00ou+BfXdHfrYJPhGgjrnExc8Ot4vXRDBvRzGzYKv0yHMtI715oC8
	UJFsxlJYT+CJinuS1SWmcEcS0Q4Bk3u7rQtVPecP3vC7ybU7Iroa8cU5atInVmqhb8O0
	LFOYotIq2c1qJvr3aB4ZkZSYfSfvgRnOVvcDg=
Received: by 10.216.2.75 with SMTP id 53mr1331206wee.48.1287171862073; Fri, 15
	Oct 2010 12:44:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Fri, 15 Oct 2010 12:44:01 -0700 (PDT)
In-Reply-To: <i9aai3$tmj$1@dough.gmane.org>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<1287157281-31597-1-git-send-email-kergoth@gmail.com>
	<i9aai3$tmj$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 15 Oct 2010 12:44:01 -0700
X-Google-Sender-Auth: OYJvEmiqIiNkJs2vGIqZh2XLaak
Message-ID: <AANLkTimuTVEWPsZT=hx+fuLLHKtVVrVzud0xq5R_TSEO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH (v2)] Reverse the order of OVERRIDES
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
X-List-Received-Date: Fri, 15 Oct 2010 19:44:59 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 15, 2010 at 12:37 PM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 15-10-10 17:41, Chris Larson wrote:
> > From: Chris Larson <chris_larson@mentor.com>
> >
> > Given the current implementation of OVERRIDES in bitbake, the variable is
> > expected to contain elements in the order least specific to most
> specific,
> > however, our current usage of it does not match that.  As one example,
> "local"
> > is supposed to always be the most specific override, yet currently it's
> the
> > least specific.  As another example, currently the target architecture is
> seen
> > as more specific than the machine, which is also clearly wrong.
> >
> > Big thanks to Chase Maupin for investigating and identifying this long
> > standing issue.
> >
> > It becomes clear that a reversal of the current value will bring us to a
> more
> > sane behavior, and avoids the need for the dual overrides hack mentioned
> in
> > the comments, so this implements this reversal, and drops the unnecessary
> and
> > confusing comments.
> >
> > This also introduces a MACHINE_OVERRIDES variable as a generic mechanism
> to
> > inject overrides elements which are more specific than the distro but
> less
> > specific than the machine, which is where things like MACHINE_CLASS or
> > SOC_FAMILY or the like would go.  This variable is *space* separated, to
> make
> > it easier and more convenient to assemble the variable incrementally.
> >
> > Reported-by: Chase Maupin <chase.maupin@ti.com>
> > Signed-off-by: Chris Larson <chris_larson@mentor.com>
>
> Acked-by: Koen Kooi <k-kooi@ti.com>
>

This is now in master -- thanks to all for the acks, review, comments -- let
me know if any problems result from this.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

