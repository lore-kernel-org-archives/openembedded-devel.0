Received: from cassiel.sirena.org.uk ([80.68.93.111] ident=Debian-exim)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1NZPJS-0000tp-JU
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 14:49:10 +0100
Received: from broonie by cassiel.sirena.org.uk with local (Exim 4.69)
	(envelope-from <broonie@sirena.org.uk>) id 1NZPHE-0000Lq-9A
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 13:46:48 +0000
Date: Mon, 25 Jan 2010 13:46:48 +0000
From: Mark Brown <broonie@sirena.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100125134647.GA30102@sirena.org.uk>
References: <4B584F62.1050406@balister.org>
	<1264284382.3738.175.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
In-Reply-To: <1264284382.3738.175.camel@mattotaupa.wohnung.familie-menzel.net>
X-Cookie: fortune: No such file or directory
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 80.68.93.111
X-SA-Exim-Mail-From: broonie@sirena.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using `git send-email` (was: Number 1 tip for getting	your patch committed)
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
X-List-Received-Date: Mon, 25 Jan 2010 13:49:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 23, 2010 at 11:06:22PM +0100, Paul Menzel wrote:

> Secondly for a lot of people using `git send-email` is no option because
> setup is too difficult, their MUA does not integrate well with `git
> send-email` so the address book is not available, they do want to have
> sent messages archived in their Sent folder, they want to ask some
> questions regarding the patch and therefore need to write a message and
> attach it.

There's also other variants like git imap-send.  The send-email
suggestion could be rewritten as "do something which git am understands
out of the box", it's approximately equivalent.

> In my opinion we should therefore find a way to also work easily with
> attached patches having been created with `git format-patch`. Can some
> of the developers mention what the disadvantage of attached patches is.
> You can easily quote them to and saving and applying should be as easy
> as with messages sent using `git send-email`.

> The only disadvantage I can think of seems to be that it is not
> displayed in the mailing list archive.

Attaching patches also upsets most tools, they tend to assume that the
body of the mail is supposed to be part of the commit message (which it
would normally be) which tends not to look too pretty.  Replying can be
an issue with some MUAs too, especially if the attachment gets reencoded
due to not being seven bit clean.


