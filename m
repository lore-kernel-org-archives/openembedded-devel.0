Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OJD8u-00039A-St
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 00:07:34 +0200
Received: by gwj15 with SMTP id 15so2976100gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 15:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=fnDdHJe2OYtY4FJk1pf+zDIWyjd9PF+Zf6JXZ9JocQY=;
	b=T48v9bjxN3fh+gZERJNKi/O53UNFHUnYGc0Wz8SsfJ3dvfFBhwrgZIyNUrFbWxGZp8
	2B06VVVIvCB6lD3KVWzSD6jQpYFY2IqCnVAEpdh/KFi/mqEPcnUoXDtsIp6ED//tn6Bd
	vRWxxECHpXDUFs0bTza1hP58z8w6lJVlUomDQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vjFkD73/6TkuhBylyoQ2YhYtXZBBWELIv1qpKNxKZFiOeN2DD5fsuDi664hK+wtsyW
	G+u1jE7c7sVp+ZuFis1HWtZoJ2jNVW2wwOOkeqbe5TL93Twt8LPjLR0r9uo9vgIhOwVv
	WcdJ5mvts11pPmuCrdvZlPZ/+kZjd5FWwi0g8=
MIME-Version: 1.0
Received: by 10.151.5.14 with SMTP id h14mr5647117ybi.19.1275343398910; Mon, 
	31 May 2010 15:03:18 -0700 (PDT)
Received: by 10.150.12.14 with HTTP; Mon, 31 May 2010 15:03:18 -0700 (PDT)
In-Reply-To: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
References: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
Date: Tue, 1 Jun 2010 00:03:18 +0200
Message-ID: <AANLkTikpyyrJwRGwBLEz2Rc7AURqZZkCxOuk88P0GE6B@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gitver problems
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
X-List-Received-Date: Mon, 31 May 2010 22:07:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Mon, May 31, 2010 at 11:12 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
>
> I'm trying to put together some examples of using srctree/gitver, and
> running into a few issues.
>
> cbrake@happy:/scratch/oe/oe-build/oe$ bitbake autotools-demo
> NOTE: Handling BitBake files: / (4602/8385) [54 %]ERROR: 'NoneType'
> object has no attribute 'startswith' while parsing
> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb
> NOTE: <type 'exceptions.AttributeError'>:'NoneType' object has no
> attribute 'startswith' while evaluating:

Would like to add a "me too".  I recently hit this problem with
overlays only, I wasn't even playing with srctree nor gitver.

Apart from a non-conclusive IRC discussion, I didn't investigate
further, expecting a misconfiguration on my side somewhere.

Regards,
-- 
Leon


