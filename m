Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Po1eZ-0006yA-Jo
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 23:39:51 +0100
Received: by qyk8 with SMTP id 8so29687qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 14:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=KRnqc5DtmvH5SCBxMiiLatsBgb9JO9VJoOKN31ZIJFk=;
	b=JH9tVaK0PumhyqZkxKFnOP6v96UQRQrpE5zR4GrZvzl2NlLu+zWBXjqhCT3r1zWWcH
	+Z9DIUO7Cqc9iRJrZbarRF8uUd+6HgsCCDx22IixZI+petVnrsEam3u08jvWEZSKBCbM
	slffHV2HvkJa2efA3l6veFEhpMQtgzFGhXgbU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PxCXFiZ64miIRLM+A/i54C/R5XlmmyPSZTg6QrmVLQJvPiH7Etk0j10vmEAY3a6L6a
	04K+uyV8xYQtQ7tbv4MAGL3b2jwBRWiGX9zlic2EyOBW8Wm6nBbtO7+8Ut538+bq4x+2
	oMwY8pzWXItpzBOn2A3Z96pYcV3TH34QFM2Ys=
MIME-Version: 1.0
Received: by 10.229.230.17 with SMTP id jk17mr1082512qcb.184.1297463924948;
	Fri, 11 Feb 2011 14:38:44 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Fri, 11 Feb 2011 14:38:44 -0800 (PST)
In-Reply-To: <4D55B139.4020503@mwester.net>
References: <AANLkTik+8d-hWG+ndtvSP7cKbbHhfyXq3tLxw1Fyi-=6@mail.gmail.com>
	<1297447579-5311-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D557DED.5070606@mentor.com>
	<AANLkTinpBmx9F9ftYrkC2t6GUEKN8_MVXM2aa=Mn=3eo@mail.gmail.com>
	<4D55B139.4020503@mwester.net>
Date: Fri, 11 Feb 2011 23:38:44 +0100
Message-ID: <AANLkTikCZMbMLmgqhK5UXh+AzQxO6H5Ed-Mrv1-tWG=r@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] initscripts: handle busybox version of makedevs properly.
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
X-List-Received-Date: Fri, 11 Feb 2011 22:39:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/11/11, Mike Westerhof <mike@mwester.net> wrote:

> Hmmm... perhaps this means that the more correct fix would be to create
> a patch for busybox that would bring it into line with the syntax of the
> real application?

Or the other way around - it could be simpler for us as makedevs.c is
in the OE tree.
I didn't want to stir up things too much, so I chose the 'safer' way.

I did it similarly to the way it's done in
recipes/slugos-init/files/turnup.

bye,
Filip Zyzniewski


