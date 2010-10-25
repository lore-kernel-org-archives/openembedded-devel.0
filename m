Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1PAH9c-0000N9-QQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 09:08:02 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 8736A1B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 07:08:28 +0000 (UTC)
Message-ID: <4CC52C90.4080707@freyther.de>
Date: Mon, 25 Oct 2010 09:06:56 +0200
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC49A20.5080001@eukrea.com>
In-Reply-To: <4CC49A20.5080001@eukrea.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4.7.0 : QA problem : Architecture did not match
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
X-List-Received-Date: Mon, 25 Oct 2010 07:08:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 10/24/2010 10:42 PM, Eric B=E9nard wrote:
> Hi,
>=20
> building qt4.7.0 using angstrom 2010.x for and armv5te leads to :
> ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40=
 to 3)

>=20
> The patch below (not cleaned if OK, I'll clean and push it) fix this pr=
oblem,
> but why these installs were added to the 4.7.0.inc file (they are not p=
resent
> in 4.6.* and the recipe builds fine without)?

I can only speculate right now. Maybe Qt insisted to builds its own versi=
on or
didn't find the tools. You will need to rebuild qt4-embedded to see if it
builds properly.

I can also take a look at this step later today.


