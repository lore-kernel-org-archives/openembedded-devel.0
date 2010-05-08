Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OApqO-0006x4-Pl
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 21:37:49 +0200
Received: by qyk33 with SMTP id 33so3847913qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 12:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=qahGwiIFINj6GW3Sn+J+fU+J5G9BaZMqs24XKD6PT+Q=;
	b=m/Hpb/1pwweHTVyReMKpif2eibdi16TXz/qVtFs85tvP5HQFZBnrxuO19EXbmllmNN
	Pvpkq2pWeoLEUblwHsgZWPbtiRh+xIrWuHXnkzPQ5qYv3gFiOs+og9igjeID7m/8zVFw
	KvXUV9hEaqTpNpaCR5jIMdo/9aYNosV59GiYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=me+woY4C58dTz49+1XeNFrVyZLgvEP7RTdQ3HMUzB2XJ4kiQeG+OU8v9OWdFTN58Kw
	Sn1vftlNjriMT4Zfnf6q+NSKOmy7urNV2oQipYvt9IUUPpyS8pT3W1h206EMXUlrRWFD
	84AjXA3fPEPIU1NR6HrARnK4arLjkFfu1oFU8=
Received: by 10.224.27.142 with SMTP id i14mr804488qac.272.1273347237493; Sat, 
	08 May 2010 12:33:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.222.77 with HTTP; Sat, 8 May 2010 12:33:37 -0700 (PDT)
In-Reply-To: <AANLkTilbQeH5oSXPNqdZAOuVL2PTYYd-dypNI6pbP_KY@mail.gmail.com>
References: <f96d234e1002250719v2c996ba4kd631051f29cba633@mail.gmail.com> 
	<AANLkTin_ibS2jkoYBHmAkt4loIh2LCTSJsdsEaXKJdqZ@mail.gmail.com> 
	<AANLkTilbQeH5oSXPNqdZAOuVL2PTYYd-dypNI6pbP_KY@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 8 May 2010 12:33:37 -0700
X-Google-Sender-Auth: c23b058fb73307ce
Message-ID: <n2sb6ebd0a51005081233q3885ec13y27e92826b85a8e30@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: make explosion while building attr
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
X-List-Received-Date: Sat, 08 May 2010 19:37:49 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 8, 2010 at 11:45 AM, Cliff Brake <cliff.brake@gmail.com> wrote:

> On Sat, May 8, 2010 at 2:28 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> > It would be really nice to be able to rename TOPDIR in bitbake to
> > something like BB_TOPDIR, so we don't run into this problem.  Perhaps
> > it is not necessary to whitelist TOPDIR to get BB to use it -- guess I
> > need to try that as well.
>
> It looks like the TOPDIR env variable does not need to be white-listed
> in order for BB to use it, so that is the correct solution.


The issue is, all whitelisted variables get re-exported (flagged as 'export'
in the metadata).  So a variable which already exists in the metadata and is
*not* exported gets forcibly exported if you whitelist it.  I've gotten bit
by this in the past, and I suspect we'll want to revert the bitbake change
to re-export whitelisted variables.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

