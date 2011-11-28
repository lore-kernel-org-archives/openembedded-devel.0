Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RUxXC-0006hm-7e for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 10:29:59 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RUxQm-0007in-MF for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 10:23:20 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 10:23:20 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 10:23:20 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 28 Nov 2011 10:23:08 +0100
Message-ID: <javjts$6f8$1@dough.gmane.org>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<jatlso$idi$1@dough.gmane.org>
	<CA+M6bXnQN9Q62w22sjiVaqkdipaXPgujR_FTWPE8N24z=MAW4A@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <CA+M6bXnQN9Q62w22sjiVaqkdipaXPgujR_FTWPE8N24z=MAW4A@mail.gmail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: Documentation problems
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
X-List-Received-Date: Mon, 28 Nov 2011 09:30:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 28-11-11 06:11, Tom Rini schreef:
> On Sun, Nov 27, 2011 at 8:44 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 27-11-11 03:40, Tom Rini schreef:
>>> Hey all,
>>> 
>>> As things stand today, the wiki is out of date and a number of folks 
>>> refuse to work on it.
>> 
>> Does it actually need to be a wiki? Or rather: do web edits need to
>> show up immediately?
> 
> If spam is eliminated, does it still matter, today?

Ever since OE was founded the information in the wikis has been terrible.
The information in the docbook was accurate, but didn't cover everything.


>>> Paul Menzel has mentioned that ikiwiki has been mentioned before and
>>> that lets us have the website in a repository.  Do folks have other
>>> ideas?
>> 
>> I really like the idea of storing the content in git since it gives us
>> 2 things we need for documentation: backups and a pull model.
> 
> The number one thing we lack today is people willing to document.

I'd change that to "knowledgable people"

> Everyone, myself included, who has said we need X done to the public 
> documentation today, has generally found a point at which they stop 
> wanting to keep things up to date.  Why?  What would change that?

I stopped working on the OE wiki because I couldn't keep up with people
adding anecdotal, but misleading information into it.

> Does anyone reading this know people that _like_ editing wikis?  Can we
> ask them what keeps them engaged in the process?

People in general like editing wikis, yes. The problem with OE is that it is
such niche product and has a steep learning curve as well. It does not lend
itself to drive-by editing like e.g. wikipedia.

How about this:

Proposal a:

1) fork the poky/yocto docbook based manual
2) run a sed script to change it to an OE branded version
3) convert it to a wiki

proposal b:

1) fork the poky/yocto docbook based manual
2) run a sed script to change it to an OE branded version
3) put it in git, webpages get updated with a git-hook

If people want to use a webbrowser to edit it:
https://github.com/blog/844-forking-with-the-edit-button
If we have setup the github mirror correctly the pull request will arrive on
the mailinglist automatically.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7TUvoACgkQMkyGM64RGpGqZACgoputgxl8LxHT0bipoA0gdWpV
kzEAnA3mTcKxrfsH3a4M1jTnGHACa6VL
=PMji
-----END PGP SIGNATURE-----



