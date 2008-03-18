Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JbkM9-0007w7-Fz
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 23:32:31 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JbkM8-0002C8-Nj
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 22:32:28 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 22:32:28 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 22:32:28 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 18 Mar 2008 23:32:18 +0100
Message-ID: <frpftj$p9s$1@ger.gmane.org>
References: <200803182311.01445.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <200803182311.01445.zecke@selfish.org>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-users@lists.openembedded.org
Subject: Re: The tzdata package and a bug with tzdata-dbg
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
X-List-Received-Date: Tue, 18 Mar 2008 22:32:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
| Hey,
|
| there are not many consumers of the tzdata package but there is one
issue you
| might have when updating:
| 	Both tzdata and tzdata-dbg are providing tzdata and at least my
version of
| 	ipkg preferred tzdata-dbg over tzdata. The result is that you don't
have the
| 	standard zoneinfo information for cities like New_York.

If the depchains aren't broken you also end up with $libc-dbg,
libgcc-dbg etc, if this were a library package. See
http://dominion.thruhere.net/koen/cms/the-testlab-strikes-again for
details on that.

| You want to get rid of tzdata-dbg and you want to get tzdata in this
case, I
| have no idea how to do this in ipk terms. An Replace in tzdata
| for "tzdata-dbg" is not enough.

Change RPROVIDES = "foo" to RPROVIDES_${PN} and bump PR. Every R*
variable works on _every_ package, while most people want it to work on
${PN}.

| I think tzdata-dbg should stop providing
| tzdata and at one point be removed. I have a fix in the OpenMoko OE
tree and
| will do one for OE.dev now.
|
|
| z.
|
| PS: Do we have a policy for such kind of bugs?

Yes: Change RPROVIDES = "foo" to RPROVIDES_<package> and bump PR.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH4ELyMkyGM64RGpERApMGAJ9f0bNStvl7fDODzrinVbd10p3VxACfUYl/
x75cApE+Vx9mzzmHQDSXJPI=
=XCkZ
-----END PGP SIGNATURE-----



