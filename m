Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PLAP0-0004EK-Km
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 09:08:31 +0100
Received: by fxm7 with SMTP id 7so2134547fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 00:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=9/mgkdD9Jyfht2SGRB6sh9TQtmnuszJaTWU+IsHbjHs=;
	b=pp03cb2vvPnF9XKfUDB4Hnkc1MZn0VvcXTf5cCtAMgSZeQMM7SLIcIZNTIxCzy8n24
	0sfDEweT2wIRXa/GpmCEgXwv0U06iLZ5CSNNqzomA4VdX1vgHLFArrpt+V4I3bJZiq9c
	6r4G3S+nRTP/OjY6T0prZTDvpFchvUjptOsKY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XBZGYsDdvCrVxXIRZr9NplChM6g8Ig+sMMyJLCIZQ6hKw4uyAjuLnGlOPQMMXkJZGP
	lN2ztpS5VN3Ay7WpyY0NSDXCc0mxgBoI5lJ2meNHoMzXF1mP9dnB+b2894WgYiLfHdnK
	FMYP09pyVpECG7ZdM4GT7aezPUbl969O2ovRA=
Received: by 10.223.72.195 with SMTP id n3mr6828672faj.132.1290586037281;
	Wed, 24 Nov 2010 00:07:17 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 21sm465541fav.17.2010.11.24.00.07.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 24 Nov 2010 00:07:16 -0800 (PST)
Date: Wed, 24 Nov 2010 09:07:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101124080705.GF3274@jama>
References: <4CEC1E17.1030208@sensortherm.de>
	<AANLkTinhykFBHcgJR5suXU8Q7op+FOxofExY-d42XmYw@mail.gmail.com>
	<AANLkTimymQB4kxvp-ybAzpUMMxQNy43GZyxKNzmRH3Uw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimymQB4kxvp-ybAzpUMMxQNy43GZyxKNzmRH3Uw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: I've downloaded oe
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
X-List-Received-Date: Wed, 24 Nov 2010 08:08:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 24, 2010 at 08:52:41AM +0100, Frans Meulenbroeks wrote:
> What about moving all recipes that do not fetch and also did not fetch
> during Martins test from last march/april to a directory non-fetching
> or so?

But those recipes were only those where I wasn't able to find the source
at all (even with google help and couple of popular premirrors). Any
origin for source was fine for me, because I was only interested in
checksum check.

> Apparently these are non fetchable for a long time, with no one
> apparently building them or having an interest to fix them.

More likely those who were building those before are still building
OK, because they had it in theirs downloads dir. (but the second part is
right :/).

> My proposal would be to do that before the release is made, thereby
> improving the % of the recipes that build.

We can improve it also by putting those missing upstream files to
sources.openembedded.org and use it as premirror. But first we hav to
find someone who still have it in downloads dir :/ (I don't).

Removing recipes would need to remove those also from tasks/images and
in the end release images could miss some important functionaly in worst
case.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


