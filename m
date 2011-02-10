Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PnWtz-00040o-2A
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 14:49:43 +0100
Received: by wwi17 with SMTP id 17so1294987wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 05:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=JwoP6gfyEfH4M6lr5UOEfbHSPcDdjexgSiIG3Vx7bCg=;
	b=uRLc/gRUdHQ675hKoG8Xss1ds8lVgMdw4rnoUaiR5rmMevjNCx/A7VCdzQK9ZvGTVk
	DbIXMpgn6y79WCBdwb7I0PRBGXmBAHhhqgR4JeIRByrIv48PTTEBmmUQdO3Sm8aT6BaN
	xN8yY1ueEqscEpR7xL5KNE62UfzTFpPNMMnDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ikXazed/HJng73UgXm6heY0tPL8yGgNuy5lBoqDrn1sDEEhF7Pw+NZrGuB+tKpsrVB
	5jVXVzemL0FAJfWxUBWKO2Raj+2BdxQjJME6zvALR2iZe5Qj3bYeMAXpFcyMBxoCgkFm
	6B+0bbNDQaXnlZbtDirQAqZW85WXQ2GD3t3fM=
Received: by 10.216.19.207 with SMTP id n57mr20950132wen.30.1297345710995;
	Thu, 10 Feb 2011 05:48:30 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.17.11 with HTTP; Thu, 10 Feb 2011 05:48:10 -0800 (PST)
In-Reply-To: <4D53E971.5090109@dresearch.de>
References: <4D53E971.5090109@dresearch.de>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Feb 2011 06:48:10 -0700
X-Google-Sender-Auth: tIqQYDXkOqPELBFpss2Z80P67wI
Message-ID: <AANLkTimEYm1sDsLob7rwkZy8GshO2KxihZAQBm4azB5e@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: different access rights for oe branches?
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
X-List-Received-Date: Thu, 10 Feb 2011 13:49:43 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 10, 2011 at 6:34 AM, Steffen Sledz <sledz@dresearch.de> wrote:
> We like to create a branch specific for our hipox machine.
>
> Is it possible to define access rights different to the dev-branch here?
>
> We would like to give write access to some of our developers which do not have/need write access do dev. In opposite it would be nice to limit the write access to these maintainers.

We use gitolite now, which can indeed exert control over branch access
for the users, afaik.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


