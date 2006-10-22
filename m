Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gbi3J-0004ML-2r
	for openembedded-devel@openembedded.org; Sun, 22 Oct 2006 20:28:05 +0200
Received: from [130.89.6.158] (vpn006158.vpn.utwente.nl [130.89.6.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9MIKd8a010374 for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Oct 2006 20:20:40 +0200
Message-ID: <453BB676.1020100@dominion.kabel.utwente.nl>
Date: Sun, 22 Oct 2006 20:20:38 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <453AA01B.5040300@dominion.kabel.utwente.nl>	<453AA142.4070002@dominion.kabel.utwente.nl>
	<1161538687.5545.5.camel@localhost.localdomain>
In-Reply-To: <1161538687.5545.5.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [Fwd: [oe-commits] org.oe.dev package.bbclass:	Fix	split_locales to	remove spurious references to -dbg packages.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Oct 2006 18:28:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Sun, 2006-10-22 at 00:37 +0200, Koen Kooi wrote:
>>> Should we bump PR on affected packages if this fix works?
>> That would be these:
>>
>> koen@bitbake:~/OE/monotone/org.openembedded.dev/packages$ grep do_split_pac . -rn | awk
>> '{print $1}' | awk -F_ '{print $1}' |  awk -F: '{print $1}' | uniq
> [snip]
> 
> Its worse than that. Anything using do_split_locales was affected so
> that's anything with locales :-(. I don't think bumping PR is therefore
> realistic.
> 
> On a kind of related topic, I did a build from scratch in poky and I'm
> quite disappointed with the number of .debug or other packaging errors
> present and OE .dev probably has the same issues. 

It would be quite easy to write a script that looks for .debug/ entries in packages, and
file bugs against the offending packages.

> I also seem to have a
> load of .debug directories in images but that is perhaps as poky isn't
> quite as much in sync with OE as I'd like.

I noticed that today when trying to merge some csets. E.g. perl.inc had fixed packaging,
but doesn't use gcc for linking in Poky, so picking out fixes requires a fair deal of
knowledge and time.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFO7Z2MkyGM64RGpERAnxEAJ9VUtU4fK91ZuBwdAuAsgQhrHGlVQCgmKnb
+iLQlZssr8uHbudiRNrGEVc=
=VZQV
-----END PGP SIGNATURE-----


