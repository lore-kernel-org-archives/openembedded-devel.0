Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PVASg-0005SX-IZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 23:13:38 +0100
Received: by wyb40 with SMTP id 40so4508355wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 14:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=pvKP3VBtubaLeUmp1w/iQ30f5i3sthrZxoFaiSYa5D0=;
	b=MFOdRmgvn6GhWgsEm0qKBbnpm6CS+Fn8fYljF6ykyEhwdhkqFzjHSIt6SMZQOaqIbt
	d0whS02LntK9Hg7/fEifQmXe3AaFZo6ewZnnIfV1f3lkUkPXi2Hl9aqLKTjXOxlThXHL
	Hd+5gulefLkST7RjZKNssYI3sBlYONmNAF0HU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ds/b4Ocg7d3qbZcCgATs8UrR+PJ/yNrIdB/xH2cHuTYWSuyYUZAbD5beJbLoNr6QHV
	iH2gGrDJxTPgyL59zsU+1InM0oVOdxLCvTcBJMTFc8ryFqUuc83atP+BFYSO9JZJ5Y9R
	SFOFA5UhW+tusQ7eRFahKnnWtVE38Dg2+vc/Q=
Received: by 10.216.59.193 with SMTP id s43mr470600wec.42.1292969611779; Tue,
	21 Dec 2010 14:13:31 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 21 Dec 2010 14:13:11 -0800 (PST)
In-Reply-To: <20101221220041.GD19986@denix.org>
References: <20101221220041.GD19986@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 21 Dec 2010 15:13:11 -0700
X-Google-Sender-Auth: YGw3CSgwEB0Iq_NnxgsPZSK3-XM
Message-ID: <AANLkTik+tyTqhUoJKx3zqMDUq=iioQn3ebmVhOhFaC8e@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: base.bbclass changes broke BitBake 1.8.19
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
X-List-Received-Date: Tue, 21 Dec 2010 22:13:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 21, 2010 at 3:00 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> The c67b95955d023c1f198531b4f06100a40b05efa7 has introduced the following
> problem with BitBake 1.8.19 and even af81d52e48cb6d4f91fff0c70e09dfd421e0057d
> didn't fix it. Any thoughts? Thanks.
>

Current 1.8 branch fixes this bitbake bug.  Will get a new bugfix
release of 1.8 out soon, as well as the next 1.10 bugfix release, and
hopefully the next major release shortly after those.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


