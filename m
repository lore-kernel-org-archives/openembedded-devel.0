Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OaVYl-0005OX-I6
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 17:13:52 +0200
Received: by qyk7 with SMTP id 7so1858747qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 08:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=DQMMZ2cu9Cr1yJ+I4p7r/D1GMKs+qy3jVGqKlyf0kYE=;
	b=Vznh/KLZWkvdwR6PDijRF81Dr4i/Ya10ar/YtAKRvIZy9wDomY4IGi6Tldq9q2zJP9
	hUYTcSaQ6VybFDctdD7t6ps/MSvLuARWa8w0K99f7Uu7CMcEiE5Xt0nxNcrVaENJ1wSN
	VHhJtuO48yDIvPnUTsN89oSpixAUSgxrFdvE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=t3YCEUNtundIGku7TVQfhREY8Xl9t8krIMHlxArEhif7L5eOF4Y1/fYWP+RLmbPvQy
	m3jVFHsiClrRfj32ikbvzCNSj+ANPNyh3v/wlWpOA4n7uVRGDGU2Dmi/OU1gxorelFOj
	2N463ZMi6jQODCktoqe5JP4WEeFLJB2m9Wr9A=
Received: by 10.224.49.197 with SMTP id w5mr3212438qaf.172.1279466015230; Sun, 
	18 Jul 2010 08:13:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.212.11 with HTTP; Sun, 18 Jul 2010 08:13:15 -0700 (PDT)
In-Reply-To: <4C42D208.2000909@vollmann.ch>
References: <1279290319.10837.1747.camel@rex> <4C42D208.2000909@vollmann.ch>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 18 Jul 2010 08:13:15 -0700
X-Google-Sender-Auth: RFoE1dJCjrpSRlHor7PFLbuYbEA
Message-ID: <AANLkTimGdT8mVtOVYiPZfeGhRvt02DyUiiKEtITzuyQT@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Sun, 18 Jul 2010 15:13:56 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 18, 2010 at 3:06 AM, Detlef Vollmann <dv@vollmann.ch> wrote:

> On 07/16/10 16:25, Richard Purdie wrote:
>
>> For the specific case of paths, I have wondered if there would be a way
>> to leverage help from bitbake in creating a sane set of search paths but
>> I'm still thinking about that. This extension is good enough in its own
>> right in my opinion to be worthwhile.
>>
> This might be true, but solving the general path problem would be
> much more useful.
> If you want to add a new version of e.g. gcc in your ovlerlay,
> you have to pull over the whole gcc directory with all its .inc classes.
> This can't be solved by .bbapend, or am I missing something?


You can handle that today by adding to FILESPATHBASE.  All file:// files
from SRC_URI are located using FILESPATH, which is constructed from
FILESPATHBASE, FILESPATHPKG, and OVERRIDES.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

