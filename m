Received: from [209.85.222.172] (helo=mail-pz0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MH0wx-0005Kh-6W
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Jun 2009 21:37:36 +0200
Received: by pzk2 with SMTP id 2so442759pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2009 12:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=xTCEe54ci+FXAudc1wNyGXEncTfVeQEJm0wOHSudqGU=;
	b=tePCccAaKQaA2Ct7KcsMX1DAVYGbqaGl20yq5lSXiSmPtDJg0Cxi8a+J2JiGJW+FF2
	t4AWfdH+ZuAeKNcgaGmm1bpsvEH5AI6BXRiLfUXUUYmB7tyzYbgQgfZ3Pb0VvDSdDMwS
	j2YNAu2Hqr3/b9sGMi1tlaUK4tdSbdCTn58/g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=a/YAnF6d+1KRgb5UqQa8xKPS+9zc+xEq7Za6V4/jFFqI4O7NxFJkZLNcj7IacFArxs
	MndX0emF/dpe12OQDzejZ4xtN3SZgZBjIybsFctQFcr0ZdWB/92QHttwaW8dsQSjru1L
	3U/sJ1wDz3QKeeim1TGavWMzOvHsdW8uhvLO4=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.225.11 with SMTP id x11mr509506wfg.210.1245266825371; Wed, 
	17 Jun 2009 12:27:05 -0700 (PDT)
In-Reply-To: <c384c5ea0906171207j416bd6a3ke98d39ec75f9d1a@mail.gmail.com>
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
	<c384c5ea0906171207j416bd6a3ke98d39ec75f9d1a@mail.gmail.com>
Date: Wed, 17 Jun 2009 12:27:05 -0700
X-Google-Sender-Auth: 4d594c33eb5146b4
Message-ID: <b6ebd0a50906171227y628fda7bvbe0ce18be2e913ca@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 19:37:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Jun 17, 2009 at 12:07 PM, Leon
Woestenberg<leon.woestenberg@gmail.com> wrote:
> Hello,
>
> On Wed, Jun 17, 2009 at 7:10 PM, Chris Larson<clarson@mvista.com> wrote:
>> Set IMAGE_KEEPROOTFS to something other than the empty string to keep
>>
> +1 for the idea, but "something other than the empty string" is a very
> bad user interface.
>
>
> If users see:
>
> IMAGE_KEEPROOTFS = "1"
>
> in most cases they'll do:
>
> IMAGE_KEEPROOTFS = "0"
>
> instead of
>
> #IMAGE_KEEPROOTFS = "1"
>
>
> Do we have more of these?? It never occured to me before.

Over the past day or so I've been thinking about putting together a
proof of concept variable type checking .inc.  Something like:

IMAGE_KEEPROOTFS ?= "0"
IMAGE_KEEPROOTFS[type] = "bool"

Then it would freak if it's not set to something valid for that type.
It wouldn't be hard to throw such a thing together.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


