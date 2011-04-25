Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QESDb-00068W-QY
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 22:17:19 +0200
Received: by gxk3 with SMTP id 3so840984gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 13:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=FhMZKUu9wQ5Rvz/4DseBDNONw/mtxb1+3mAKQ6mFshM=;
	b=q/jgugdm0vCmKggA5JvVzfK6OreiaMKRmHXvNqKtkqcyyrV3Hl++gdQsyfJWQHkrOT
	bRvush0nh8LR7ulY726gzif0GPZyVCZIQA9UHb5TcIHNAEkpTvLA+5LSvwrNzI62a8FU
	OG1HVrQ7fJxJoSJtrz7x1uh61yEMa0dmmqv3U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FjARBxDlfZwNhaU8NPavjpptdvz/2IrFMnaQU3ED89k1vZ3GKu0AW/nx3E2OVUO/LX
	OIIRRZIL8K5f5hvd9QJovCkmOQAnWEyBEecdSH73VMS4Zv5dGvkfXtN6A0tZZ0hRl6Qa
	rbHoGTePpxT0bUnmxEH/P2i2sw44Egz1g/wPc=
MIME-Version: 1.0
Received: by 10.91.15.5 with SMTP id s5mr5154agi.11.1303762486480; Mon, 25 Apr
	2011 13:14:46 -0700 (PDT)
Received: by 10.90.141.8 with HTTP; Mon, 25 Apr 2011 13:14:46 -0700 (PDT)
In-Reply-To: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
References: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
Date: Mon, 25 Apr 2011 22:14:46 +0200
Message-ID: <BANLkTikm-JOf-Y2E=gz8xhrbzst2SOMLOw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC, PATCH] Add minver/maxver to patch.bbclass, update bluez
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
X-List-Received-Date: Mon, 25 Apr 2011 20:17:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/4/25 Tom Rini <tom_rini@mentor.com>

> Hey all,
>
> In digging at some other bluez problems, I found that at least
> 4.91 no longer needs the sbc-thumb patch.  But without moving it to the
> N versions of bluez4 we have or starting a new inc file for later bluez4
> versions, there wasn't a clean way to exclude the patch.  Until now.
> Borrowing the minrev/maxrev logic I added minver/maxver patch params
> and tested them lightly (the patch is applied on 4.89 and not on
> 4.91).  I'm cc'ing Koen here because patch #3 adds 4.91 and make it
> default for Angstrom, but all I've done myself is build testing.
> It should be safe, based on upstream changelog tho.
>
> First question should probably be: do we need 9 versions of bluez4? This is
not too much in line with the version policy the TSC once stipulated and
seems also different from the road oe-core and meta-oe are taking.

Also personally I'm not too keen on minrev/maxrev. It only makes things
again a little bit more complicated.
My preference would be to remove the patch from the .inc file and move to
the individual bb files

My 2 cents.

Frans

PS: two more cents: it seems somewhat odd that some distro's have a DP = 1
for more than one version of a recipe. While technically not wrong this
looks a little bit odd.
Also we seem to have two mechanisms to select a version for a distro. One is
the DP_distro mechanism the other one is the PREFERRED_VERSION_recipe in the
conf file
It seems to me one should be sufficient

