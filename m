Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ogjxv-0005d7-V7
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 21:49:58 +0200
Received: by gyd8 with SMTP id 8so2285190gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=KLMoHnvSANQWwvTFl0lZhl+TtkUu3I7dBL7peMSbizc=;
	b=EOls5OGG1D+6YwE8MpkzodUtAOE5bFwsrexLzQuGupvUGoqgrzPt8Wd7D/WXHlhYdo
	JNFZCGoQLxwRzXCuuaGxqOgErri9rt8KVV7tgwdJ1e4+UCXQCspYjGwlDHTM1UEvXKxB
	uj5cAn28y7ibpK9SYDe/vOU4ZeVjDgy/7Tp2I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=AHNNzVf0AVbiXwCzp1E3tYmHQXcIvvJXFVjtbLmPn3u+zhNencQGeYUfEaTotegqZQ
	8nrFUgt6NXQHySUN5FbSegddXulg9mNiEh4ttkzjzPvL2GZkg9DbqG7eXwK/eTjtpDnM
	vJTermn952lEPZh//HzxZ4J8DTyEpS31nFpPA=
Received: by 10.150.239.8 with SMTP id m8mr9491050ybh.401.1280951362428; Wed, 
	04 Aug 2010 12:49:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.12.137 with HTTP; Wed, 4 Aug 2010 12:49:02 -0700 (PDT)
In-Reply-To: <1280915670.2692.350.camel@mill.internal.reciva.com>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com> 
	<1280915670.2692.350.camel@mill.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Aug 2010 12:49:02 -0700
Message-ID: <AANLkTinBPTAF2UH0weQ7FKpHqFUBeLkzoO8kuQg41e+0@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 19:50:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 4, 2010 at 2:54 AM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2010-08-03 at 16:47 -0500, Chase Maupin wrote:
>> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
>> =A0 setting for a recipe.
>> * This will allow recipes to work for entire families of
>> =A0 devices without having to maintain/update the compatible
>> =A0 devices as new devices are added into a family
>
> I don't suppose you'd consider refactoring your MACHINE names in order
> to allow a simple regex in COMPATIBLE_MACHINE?

that would be a good approach too. Has it been
considered.

I don't have a strong
> objection to this patch but, conceptually, it seems a bit ugly.



>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


