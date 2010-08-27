Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Op0km-0007HS-Ig
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 17:22:05 +0200
Received: by eyb7 with SMTP id 7so2156783eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 08:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=ybTIO/qlSu4i8lLRQNJnhdmhSGkXnN4lpSAj/g+ksfg=;
	b=nqv4yTzcrPKezVHLQ3AfaskteNlckr9//6a48OTiZaG9h1YCi/0lTFqbRmQvEfStEc
	w2ozCGRvTydBKFFAzyWRdl7nwpKgOyIzvQfW9Qpd1kUOzJLLOReilTQKyNk4QZ+I6+9B
	PgX5DqFm32f/g6AZ9UmZ8u0631XbNOuL6dXwQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Q/fFDuNTmwqvc+j6qFdP98W61q3iNOE+DohbAE0x94B6wedImgR+HLxJ8gpqGoKAlw
	ZlpbN7DYg7pjd4aH5dFw7D0I83uI5EjnRnS3WWSeNxJFEz7CGtzmeJVRgAZ4hIz84Vi7
	lcnq6Mwi9AyrkryVo4avAUxMBzP7MQT0qzwqE=
Received: by 10.216.17.135 with SMTP id j7mr961321wej.97.1282922495246; Fri,
	27 Aug 2010 08:21:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Fri, 27 Aug 2010 08:21:14 -0700 (PDT)
In-Reply-To: <AANLkTi=39EL+2Vq9=1LGhdB87dhsmmYOHtd7Gw8+nQXs@mail.gmail.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
	<AANLkTikMx==1HnsZ12pGdWi4hdyzKmg4NJNO23EdACJS@mail.gmail.com>
	<AANLkTi=39EL+2Vq9=1LGhdB87dhsmmYOHtd7Gw8+nQXs@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 27 Aug 2010 08:21:14 -0700
X-Google-Sender-Auth: Rn2yn5tmjP-Rb4x7Cfwxo_8hQh4
Message-ID: <AANLkTinogoWcV+=4QhgMw5yF__OgG0tfAAZof5cg5Ztr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Fri, 27 Aug 2010 15:22:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 27, 2010 at 8:04 AM, Cliff Brake <cliff.brake@gmail.com> wrote:

> On Tue, Aug 24, 2010 at 10:58 AM, Chris Larson <clarson@kergoth.com>
> wrote:
>
> > I like the concept.  It seems not unlike the 'master' vs 'next' or linux
> vs
> > linux-test, or indeed, as you imply, unstable vs testing in debian.  I do
> > want to point out that you could, if you chose to, include the tested
> > baselines in the message attached to the tag (if annotated).  The only
> > downside to that being you couldn't add to it after the fact the way you
> > could with a wiki.  At a minimum, I'd link to the wiki page for that tag
> > from a tag message.
>
> Thanks for the ideas -- I have updated the process some, and I think
> we could apply the tag on the following Monday after the testing is
> complete -- this would allow us to add the annotations.
>
> I'm also thinking on the next cycle to use the name testing-next
> (instead of testing-testing) for branch we create every week for
> testing.


Another similar idea would be to use git-notes to mark up commits/tags with
the builds known to work at that point, and git log would show that
information.  Unfortunately git-notes fetching/pushing/merging isn't quite
up to par yet, but something to think about.  The advantage of that approach
is that the notes are supplementary information to the commits / tags, you
can manipulate them after the fact without changing the commit hash :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

