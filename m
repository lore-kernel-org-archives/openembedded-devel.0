Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZ1Cx-0001YM-Tz
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 10:55:47 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZ1B1-0004uR-L3
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 09:53:43 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 09:53:43 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 09:53:43 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 11 Mar 2008 10:53:32 +0100
Message-ID: <fr5kqu$bli$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org> <47D64717.3050804@gmail.com>
	<20080311113256.461ad5d1@widy.localdomain>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <20080311113256.461ad5d1@widy.localdomain>
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
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 09:55:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
| Esben Haabendal <EsbenHaabendal@gmail.com> wrote:

|> For OE to really reach it's potential we have to be able add even more
|> features while at the same time delivering stable releases/branches
|> for distro and product developers to work from.
|>
|> When Joe-average-embedded-product-developer comes along, shopping for
|> which embedded Linux tool to use for his embedded product, he really
|> should be able to checkout a stable version of OE and be able to
|> build a toolchain and a simple image for all supported targets. And
|> this is certainly not the situation right now.
|
| Typical mistake. There's stable branch in OE, and based on the
| experience with the previous branches, best-practices change control
| procedure was applied to it. Now, based on 2.5 month existence of that
| branch, I have following observations:
|
| 1. People don't know about that branch.
| 2. Once made known, people still pretend that there's none, and
| continue to complain about stability.
| 3. Most of the rest of people don't put slightest effort into
| maintenance of that branch.
| 4. Those who try, complain that the change control procedure is ...
| complex! But it is only a separate branch + pre-review of changes + "all
| changes are merged from main branch" rule of thumb.

| Having more branches is not going to help with this at all.

There's a false assumption in the above: not all branches will be stable
branches. They will be more like the avr32 branch stelios and I used, so
people will work on implementing a feature in a branch (e.g. sysroot
support), merge it back (with history!) and forget about that branch.

But I still don't think switching scm will improve our 'branch
situation', I think we'll end up with the same old complaints, but this
time about git/hg instead of mtn. I've seen a flat-out refusal to read
mtn docs from several OE developers, who also are the most vocal about
mtn sucking[1]. If we don't fix that attitude we'll keep switching scms
ad infinitum.

And we really should start using something like
http://www.review-board.org/ to review big changes that are too small
for a branch.

regards,

Koen

[1] incidentally most of those people come from a long period of cvs usage
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1lacMkyGM64RGpERAhGpAJ48J9TijGjyxxxRwH+lQ1elS4LnMQCfWZxI
Cpdq5wxA0DfSeOp3VqfpTdE=
=foWZ
-----END PGP SIGNATURE-----



