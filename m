Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OqRu4-0004c0-S7
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 16:33:38 +0200
Received: by ewy7 with SMTP id 7so3749372ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=7RT1BPCaTO0XiA0awsvO0BNX1Ect2PU5ZK1p9HnRlwM=;
	b=nbg+Tj5LNHd/o/Q/nIRsCgLq+2RE0yLrOdNCudjlVwWgf9Qbqmc7MWcwjvTLk5hr8n
	1XGrZJ6hC+y4lU5a98MI9a85FDIlKDs5s+RogwCcyGdVFf6EMfT8yPko+68sXw7YewVD
	loJRcUapR9ffSYIoyUKCMe1GNu/2QYsL1ZyAI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=H4IsP+bzdQdvKUNztvUTcT57lz4I4V26NzyL+PgU93h/V/MwVanA3a+ewGzJcr0wtn
	4NSoY3iHRLeTiGNp7z/pR/S4pgykcX5dRFNYRn3YJu9+dJrOm3jU9dnnSL7NHosH9sMb
	s5m3dQod59cY9DbE517u0w/C6LqaqBT2ev2kI=
Received: by 10.216.87.209 with SMTP id y59mr6339344wee.91.1283265183179; Tue,
	31 Aug 2010 07:33:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Tue, 31 Aug 2010 07:32:43 -0700 (PDT)
In-Reply-To: <i5ihne$6pq$1@dough.gmane.org>
References: <4C7CB4F0.4070306@freyther.de> <i5ihne$6pq$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 31 Aug 2010 07:32:43 -0700
X-Google-Sender-Auth: o8aCZKDE49maj8KZ_uIWRdzQ6s0
Message-ID: <AANLkTi=rWZyoq4R3rktWwGoivU4ryMfwcbHW8N+1rhhH@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Latest base.bbclass commit breaks meta-toolchain build
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
X-List-Received-Date: Tue, 31 Aug 2010 14:33:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 31, 2010 at 2:23 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 31-08-10 09:53, Holger Freyther wrote:
> > Hi,
> >
> > with the latest change the task-host-sdk.bb tries to copy it on itself
> and cp
> > breaks. Reverting the commit has fixed the issue for me.
>
> The tinderbox as work is turning red as well for tasks and images ('cp:
> foo.bb and foo.bb are the same file') and reverting this change seems to
> make it work again.
>

This makes no sense -- something must be making some really foolish
assumptions somewhere.  Reverted for now, we're back to having broken
absolute file:// uris again.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

