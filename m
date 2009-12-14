Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NK9e5-000644-1z
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 13:03:24 +0100
Received: by yxe5 with SMTP id 5so2619977yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 04:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=e28ug+UB3JY4S97COfr37T3ss6tHB/E2UZQxTU2/xk0=;
	b=h/aHCq0ai6+wlUYosth+VDYFRjqrVLMIX0g3iaetlJGCDayz7DpMKwVX74u8mSLRCu
	HPO1Wj1fZ1FMd+wvvtbFRt1OSp627LH92r2xTYltmHCcm6TTiLZ88djWw94s3srLl9Se
	UIBgRp8uJk5KRRnPgtGP7xKTxerFz5mIPwSN4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Z2cBC7kOCD44QRNMksZVA/px0mcta70MASR2rwc9G+g81pYy8iF2UY7KiV+8LZ/51m
	fAtvnyJ+Ph6Qp0ruouVq/EFdep0eqFRYOiN/rz6FZsDqnBQiZxIvYxB5mub/xaB4wgU5
	4rmwvycoDEjGCDFF7SaJsLMrFn4/4A4hbdvco=
MIME-Version: 1.0
Received: by 10.101.174.28 with SMTP id b28mr6733854anp.160.1260792095322; 
	Mon, 14 Dec 2009 04:01:35 -0800 (PST)
Date: Mon, 14 Dec 2009 13:01:35 +0100
Message-ID: <ac9c93b10912140401o52fa183k90819ba5fdec4b34@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: bitbake -c menuconfig virtual/kernel and ncurses
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
X-List-Received-Date: Mon, 14 Dec 2009 12:03:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Not sure how to fix this, but I just bumped into the following:

I did a bitbake -c menuconfig virtual/kernel.
This launched an xterm which exited without me giving an opportunity
to change settings.
Still bitbake reported success.

Cause was that this system didn't have ncurses-dev installed yet.

No idea on how to fix this in a proper way.

Frans


