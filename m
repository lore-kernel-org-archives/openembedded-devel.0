Received: from mail-yw0-f183.google.com ([209.85.211.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nr8Yn-0000lR-0m
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 12:34:17 +0100
Received: by ywh13 with SMTP id 13so461984ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 04:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=rl8xbjLpyMOJfuzD6D7vTL6DEPZ7CDbs1wv3IS4y58c=;
	b=p8OlP8pgedO/nYVLOBGFdZXAq0gqCPll5a8daEM0D0uTZ9j0JgPiuXYmfIk/WXzCV5
	fKNWDSuioWVApvFVzXRoWrhzBvsEIaTmhc8gcWC+X44PpZ6NndVyOOf0pY3N33Rwfzal
	jOTaRLVncE8abfR4UwIqZhOCuw8NjVJ+SI13I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QthJk9aTzTBLK5pdfja5HujZkzDnGuIe2obfDPFiPavTkNu0hnoKT1dz/y+hA1+1TE
	VYzEKZnIt/LkhbXO9B2LbdlQRipEfeSo6M0IP4Bh1tStCNReQf3R+hbCfXxEa2Elt+6c
	sz3ZObx+H7R1TGMl8kGmSA9C4PW5lAjVEymRk=
MIME-Version: 1.0
Received: by 10.101.175.38 with SMTP id c38mr1547736anp.40.1268652670682; Mon, 
	15 Mar 2010 04:31:10 -0700 (PDT)
In-Reply-To: <hnl05u$1r0$1@dough.gmane.org>
References: <ac9c93b11003141453n7df620c7gca609efe00e0e6f@mail.gmail.com>
	<hnl05u$1r0$1@dough.gmane.org>
Date: Mon, 15 Mar 2010 12:31:10 +0100
Message-ID: <ac9c93b11003150431k384114e6i11cab70a9d377da9@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.183
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Re; [PATCH 7/8] autoconf: add 2.65
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
X-List-Received-Date: Mon, 15 Mar 2010 11:34:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/15 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 14-03-10 22:53, Frans Meulenbroeks wrote:
>> Bumped upon this patch of Bernhard.
>> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg03649.html
>> As I already deleted it from my inbox I cannot reply on it directly.
>>
>> I've been playing with autoconf 2.65 myself. There are some issues left:
>
> You forgot:
>
> * some packages don't build with older autoconf, so this mornings
> commits break every distro in OE.
>
> I fixed up tiff so I can build gtk+ again, but I suspect there are more.

Ehm, I moved the tiff from 4.0.0beta2 to 4.0.0.beta5. Content wise I
did not change the recipe.

That build nicely for me (although it could well be that I tested with
a different autoconf, as I've also been working on autoconf).
Btw I used the minimal distro to test against. It might be that
different distro's pin different versions of recipes. I don't think
dev's can be expected to test every change against every distro).

Btw: the only other recipes that I committed earlier today are an
upgrade to schroedinger and a new recipe (for orc, needed by
schroedinger 0.9).

And any help related to getting autoconf up to 2.65 is appreciated.
I'm not that much an autoconf wiz.

Frans.


