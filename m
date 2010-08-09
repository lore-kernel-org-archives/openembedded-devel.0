Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OiYI9-0003Aq-BY
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 21:45:50 +0200
Received: by ywe9 with SMTP id 9so3786735ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 12:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=4hk7cdEtsGN0SzbHkURmVFqCu5PmY/0jWNKGQYDVzKo=;
	b=TtbTvuWKESqZ/fRCjrOQXQ107I27OqFOEQb6ebXE6o/rkdkIdhBqc4bx/pBT0H5lzE
	o1vhniHwqR7vX84lhri/ccOF7+kpGYDa8HUxSAzL/OyIIIpF82taHTmEscWz+1l0zPM6
	dQ0D9lCD1eDHLwLfPZqKDfqfhWvvNw8j9RWc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=S692g0a6/d0gYpHgE4YAdXO+t8c38/gZY/tLrG/aPmMpIJFu/NE2JHycxNvhV9oDZQ
	Ws80NXMW72ilRpyWIRzYofMJLc5kGvTPmF6AuJILFlhkuPXoIQ/EOb7MJ5HMjiTBP5qF
	vsDwPdqXRZFuCHoBUHprdPfIruuSFGEkpW6xs=
MIME-Version: 1.0
Received: by 10.90.80.4 with SMTP id d4mr11473000agb.11.1281383135132; Mon, 09 
	Aug 2010 12:45:35 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 9 Aug 2010 12:45:35 -0700 (PDT)
Date: Mon, 9 Aug 2010 21:45:35 +0200
Message-ID: <AANLkTi=nDHL13_Yw7g-2B9XMedBevoemY+wyU4a=i1Y+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: oe-stylize
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
X-List-Received-Date: Mon, 09 Aug 2010 19:45:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Some questions wrt oe-stylize:

Do we still want to promote this?

If so, it seems useful to add the new keywords that have been
introduced last year or so.

Also a few issues:
oe-stylize moves the checksums immediately after the SRC_URI.
Is this desired? Most of the recipes have them near the end.

And I noticed that the script moves require lines.
I'm not too sure if that is ok. By moving them it is possible that
overriding variables (like depends) are moved from after the requires
to before the requires.
Is this a problem?

Best regards, Frans


