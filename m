Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ouo9N-000627-Tt
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 17:07:27 +0200
Received: by wye20 with SMTP id 20so5219556wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 08:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=QiN4F3Cv96gyv8TyFG9gAWEqv3S9vCnHdK37O1m1xcI=;
	b=V+kJusrH51qZu+uHOEJrqIKVra4e1DEJaIDD9yGqMFIoTsaKtzPRq6mRNutBN1DS/s
	V3Wgqpzn6HKTdOkp8ypzDURaJn7QI4j1tay2/M589ZGQS0qGGGdIZiDV4NiAoI3JhnIy
	jeFf9y7WNeYT1gDOVh3RJcD9VG2ipGOcpMXyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=LhM/RBde864OyshzRHaG38PQZPQLX8jX5Srt+sKNqB8UJiKjglQ7itJU1qZGsuY8XR
	OtKPlGlc+z0k7dciov/ArPnOtITHhyf3q7JKMfbAewKb/PSOlzYKD0U7IHiaAeaPk5LL
	mCU5ElnmFiZ5uNpqlRTCTh4Vgxp9U4r7QQ94o=
Received: by 10.216.67.6 with SMTP id i6mr1561165wed.44.1284303996149; Sun, 12
	Sep 2010 08:06:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.168 with HTTP; Sun, 12 Sep 2010 08:06:16 -0700 (PDT)
In-Reply-To: <4C8CEB0D.1070206@freyther.de>
References: <4C8CA2DC.40707@freyther.de>
	<AANLkTi=EALsQWTorEsz19dyJFX-AnStXdaHYJUy4iZXn@mail.gmail.com>
	<4C8CEB0D.1070206@freyther.de>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 12 Sep 2010 08:06:16 -0700
X-Google-Sender-Auth: 33aVrj3YaRT7VKIl1hCycGTTnck
Message-ID: <AANLkTi=7P_2nYWD5LSohKBF0ZHA7hR=Y5ekSmOgTqkng@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] insane.bbclass: Enable the insane.bbclass for everyone in a warning mode
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
X-List-Received-Date: Sun, 12 Sep 2010 15:07:28 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 12, 2010 at 8:00 AM, Holger Freyther
<holger+oe@freyther.de<holger%2Boe@freyther.de>
> wrote:

> On 09/12/2010 08:32 PM, Frans Meulenbroeks wrote:
> > 2010/9/12 Holger Freyther <holger+oe@freyther.de<holger%2Boe@freyther.de>
> >:
>
> >> Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>
> >
> > I am not really in favour of this.
>
> This is an outstanding item from the TSC, I am not sure how to proceed from
> here, as we will go in circles.
>
> I am happy as long as Angstrom is using this option, as this way I will not
> have a unzip package with the wrong binaries ever again.
> <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

I think we should reorganize insane.bbclass and split up its functionality,
either into multiple classes or configurable via variables, as others have
suggested in this thread.  If that's done, we can enable the core by
default, but leave the bits that require additional dependencies as
optional.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

