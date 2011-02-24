Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PsQB6-0005Er-Kf
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 02:39:36 +0100
Received: by wwe15 with SMTP id 15so40497wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 17:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=KS93RV+1+piGofxM9GqjnP8uebv88Z0lSg5ZTY8pI0w=;
	b=xcn1fevYGR0pMBhUKazrPel1wrRdScUuhNcCTMvqMxMFu8t/obZXMEwesCqJEJEm2y
	JaNYBByC2AAzfybbZh3nXmNUGL505Dr7T/jAMo/RMSjHZdL2UC7GKrANRLauzC/hBAb4
	Qd86Ltr6DmPKEmMX/ixcuhcns0hNIlzW1yVVs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EbEJxVGYgrcOdlwrW2Gf7nydy5r6gWv/X1Kpilztq9RNprXjmXvd7CoiDRliSTkHXa
	DqCjlUB2IcPPAJgaGgSYSb3Wnu6IeWk5cdAj4+joiOdOFqkwnobS6ANt1lWaw65G+hK0
	Guw6QzozOMkser87Tqdh9EimWVdXowmSTH2UM=
MIME-Version: 1.0
Received: by 10.227.165.6 with SMTP id g6mr150376wby.181.1298511494727; Wed,
	23 Feb 2011 17:38:14 -0800 (PST)
Received: by 10.227.142.149 with HTTP; Wed, 23 Feb 2011 17:38:14 -0800 (PST)
In-Reply-To: <1298506369-3417-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1298506369-3417-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Thu, 24 Feb 2011 12:08:14 +1030
Message-ID: <AANLkTikNyU2y6XAnyAQ1h5BwjidKackphAWg_BuN4Q-r@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: convert mtime to int before comparing it
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
X-List-Received-Date: Thu, 24 Feb 2011 01:39:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 February 2011 10:42, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> The st_mtime attribute (which is a float) is compared against a value
> from the timestamp database, which was stored as an integer there.
>
> When working on a filesystem with precise timestamps the comparision
> will fail nearly everytime hence.
>
> Although it might be possible to enhance the database to store the
> fractional part too, this will complicate things more than we would
> gain by this change.
>
> This patch was applied as 49e11b32906fc1becd9218bb3125f6fc8fa03fa4 to
> old ipkg-utils already.

Have any of the other patches to ipkg-utils been missed?
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/ipkg-utils/ipkg-utils?h=5bd4e2057db8d67139d49dcec1cb705329ac9041

>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Acked-By: Graham Gower <graham.gower@gmail.com>


