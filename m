Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <listjiason@gmail.com>) id 1Nu0cf-0002FC-O0
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 10:42:11 +0100
Received: by iwn4 with SMTP id 4so2142325iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 02:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=HBSAgiNLXx96lU5vrVqOAis2xs4KvZW+6/x+R2Qwnt8=;
	b=r9NYhoH5ucmhNaxTVQ4cSbPMcpnClE52JwAuFtD8WKVt7kxOA9uQ8ni6m90wLVul6B
	BeBi7hlEVjs7iHM7HRLc1mHj3xcH/hblCJXXTYhqG2Ga4juR3fytu+w4lb8iryH6/0Gh
	5fPTiLgyjEjlCa4vCpXD6xFnejJdVl5XlFYM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=PzH9mYSc1qrWLvDRK0JdtiS3e9riuvM79sCNSr8AD7zXhSnMLh1DZLVK70TecNqZKd
	lJVZpc94Y/YGgbIaQXe7K2GdRkyCj5hR5xo6rFS+LInBTXiAi85nxm3H5qf8p6eIsJtq
	DMi1nYccE7ZQE7RJGYrW6oeYd5PdAD+oO/Gjc=
MIME-Version: 1.0
Received: by 10.231.173.130 with SMTP id p2mr995362ibz.48.1269337136479; Tue, 
	23 Mar 2010 02:38:56 -0700 (PDT)
Date: Tue, 23 Mar 2010 17:38:56 +0800
Message-ID: <f275a9df1003230238ye20d27fm32a88ad21e6518ab@mail.gmail.com>
From: Jiason Li <listjiason@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: listjiason@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: How to rebuild images with updated PREFERRED_PROVIDER_xxx in machine conf?
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
X-List-Received-Date: Tue, 23 Mar 2010 09:42:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm trying to rebuild images with updated PREFERRED_PROVIDER_xxx in
machine conf,
and I don't want to clean the whole oe/overlay/tmp directory each time
I bitbake an image.

I've setup an overlay with my own machine conf.

My steps:
1. bitbake some-image, oe/openembedded/recipes/some-pkg.bb was bitbaked.
2. bitbake -c clean some-pkg
3. bitbake some-pkg, according to the log,
oe/overlay/recipes/some-pkg-mine/some-pkg-mine.bb was bitbaked
correctly.
4. update machine conf with PREFERRED_PROVIDER_some-pkg = "some-pkg-mine"
5. bitbake some-image, but some-pkg was still bitbaked and was in
some-image, not some-pkg-mine!
6. rm -rf oe/overlay/tmp
7. bitbake some-image, this time some-pkg-mine is in some-image, finally.

So,
how do I rebuild an image with updated PREFERRED_PROVIDER_xxx in machine conf,
while not having to clean the whole oe/overlay/tmp directory each time?

Any info are very appreciated. :)

Thank you!
jiason
20100323


