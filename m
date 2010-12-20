Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PUXUD-00054z-Su
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 05:36:37 +0100
Received: by wwi17 with SMTP id 17so2501558wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 20:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=5wKV1osXGU09qWDg6GJycsCSYfKNZu0BXPBpsp5olxc=;
	b=RA+nw2OHs43Fe9aqIXoZGwqTn8TIhN6LWsEZ2VRROIO+ScIoc6tsPKI6jB3vKf5vMO
	WNXG6daa6vuNgUL9ufIA4hAODcWUXGPWznRdr5TTMXXsLbare9X4aesjGMpE1zjv4lUF
	YR+8bUe8vTYSj4Y3bpezwI49P2oEDfTpG90PE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=OKql3aqZ1mVdCjDWQ43ceKvpoWrL8eYfU8WZsXXixj/gOK7BW5T7UC7pC/FgoFupd9
	fnTt7sJxz53syT5jv5B3uqJLEHY6uOn8rBF7SJHy9DzI/iLUt8zVkE/5enwJIo658zYr
	+HryUBCmOBz3cTOaJJk96ZZiJh96fSu6AHx8c=
Received: by 10.216.150.134 with SMTP id z6mr4257273wej.27.1292819792862; Sun,
	19 Dec 2010 20:36:32 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Sun, 19 Dec 2010 20:36:11 -0800 (PST)
In-Reply-To: <AANLkTik=T2vcvcpbM2_nxdycS=1EvOJj=mwzp3HHfTZC@mail.gmail.com>
References: <AANLkTikotnoR4+_vA7_O1xAyRj5FBosconGFkWjSfzr4@mail.gmail.com>
	<AANLkTi=GGyxNfDzV==iO+nNPKqoShRbUXLY-QDAUMzrN@mail.gmail.com>
	<AANLkTik=T2vcvcpbM2_nxdycS=1EvOJj=mwzp3HHfTZC@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 19 Dec 2010 21:36:11 -0700
X-Google-Sender-Auth: EnNZe9HV3lBs75EnmwBPDFpf9FU
Message-ID: <AANLkTim+tDLOaSn2wwZTw6WoUhgAXCdchve1rBRWKp-s@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Building Image with all dbg packages?
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
X-List-Received-Date: Mon, 20 Dec 2010 04:36:38 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 19, 2010 at 9:16 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> Is there someway that I can tell it to ignore the several packages that
> don't have dbg packages?
>
> ERROR: Required build target coolaj86-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['coolaj86-image',
> 'upstart-sysvcompat-dbg']

Not currently.  bitbake should really do a better job of handling
RRECOMMENDS.  The better bet would be to change those recipes to use
more standard packaging, make them emit a -dbg, the way the default
PACKAGES does.  As an alternative, you can test with INHERIT +=
'package_dbg', which enables per-binary-package -dbg packages, but you
need to do that from the beginning of the build if you use it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


