Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6OO0-0006UO-VZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 16:02:34 +0200
Received: by wyb40 with SMTP id 40so2546984wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=DJTk5i8sDEpZVysknHO6HfbjluCuDK8hmb8gPD1J/5c=;
	b=mr6rSR6RbeZ96/rzZ4P7CS4rR36dtN8w5Jx2xEKLkxYDc5h7y8HB9WOrmjVCAXanLE
	4umj1ajTGRJg3weAD3LDa6CgPY51wV4i6KIWPI3oTnrtPhaLgYwslKx9gZecKE4ULkC9
	g/vk6gJwV9860iHiD21pv2DS0nR7C5NMWyC5U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=OsEthqXsF1zl8zhqr9CW6WxYBghtaTGzC+tK2ZQd8x23jXe/KUxHdvHxQCHYEQMJV8
	mdqVLyNnPqXsem8BVx0n2AeM0Os2wjVgfXC7KSHPDD50WsVZu91PY5E6xYipW81cj5tI
	RWHkN6e3EVl/zT70m9MhG6hYbMNdsMnjimz6s=
Received: by 10.216.187.143 with SMTP id y15mr10006938wem.74.1287064913049;
	Thu, 14 Oct 2010 07:01:53 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Thu, 14 Oct 2010 07:01:32 -0700 (PDT)
In-Reply-To: <26434292.80091287048749327.JavaMail.defaultUser@defaultHost>
References: <26434292.80091287048749327.JavaMail.defaultUser@defaultHost>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 14 Oct 2010 07:01:32 -0700
X-Google-Sender-Auth: W_0haM-Urnu7rFGGkQfbQZDfgBw
Message-ID: <AANLkTi=hDDtueQerTUy9FTcpoCbJ9AYozok=-XBkWe7R@mail.gmail.com>
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
Subject: Re: S98configure role
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
X-List-Received-Date: Thu, 14 Oct 2010 14:02:34 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 14, 2010 at 2:32 AM, l.bolognini@tiscali.it <
l.bolognini@tiscali.it> wrote:

> I'm wondering what is the role of this script, placed in /etc/rcS.d.
>
> What I guess is that, for some reasons, some packages get installed but
> not configured (then unpacked) since their postinstall script returns
> non zero value.
>

Yes, this is correct.  Some postinsts do things which can be done at image
creation time on the build machine, but not all.  Those which must *run* the
binaries in the filesystem, for example, cannot be run at build time, so
must be run at first boot time on the target.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

