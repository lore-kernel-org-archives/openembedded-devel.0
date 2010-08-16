Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ol5rk-0008WU-H9
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 22:01:05 +0200
Received: by yws5 with SMTP id 5so1041838yws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 13:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Hey76jOncYC0dPq/C4dUdL076mD2xNFLGiFbkFxN0+g=;
	b=QDwgzNUkD/EUxAxlTY3nHT+QyBMkl0aKizL9XnrmPynn7fxP9iMl5wosoHNBmcQ5kw
	gtVsogBKGoBDH2uIy69acCNz5T9ur8/77WpD10nxFvWhjqexBme37TU8j+dMJtR/Zb2y
	wHFbGGYb/guUYNg+JnvkmPuIece2lFS60sQW8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Doh0pctbedMQH1La65wpWcEGuKiEuhCd1aJxzaQhpvXQNvJKl3SMMBHA4t7ahMmEYS
	+u+8kkuyf9gANC3S3Ea6sM6rIlF485Z31WlAEQB25Lo7XN+8vF/irYmJ/v5sD2XqaEAW
	dABeEI5rF4OC3Tv0J1Qlk7HIR2g6M21FXKBfA=
MIME-Version: 1.0
Received: by 10.151.138.13 with SMTP id q13mr6078392ybn.189.1281988842228;
	Mon, 16 Aug 2010 13:00:42 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 13:00:42 -0700 (PDT)
Date: Mon, 16 Aug 2010 22:00:42 +0200
Message-ID: <AANLkTi=XK3Le8ERWqmMt2DEVX3K4n=ua0Zdyu6qEOUcw@mail.gmail.com>
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
Subject: rename files dirs
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
X-List-Received-Date: Mon, 16 Aug 2010 20:01:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Currently lots of our patches reside in a directory called files.
Somewhere in the past koen explained me that that is not really proper
(and I agree with them).
files should only be used in case a dir has multiple recipes (say X.bb
and Y.bb) which both use the same patch
If there is only a single recipe with multiple versions (e.g.X_0.bb
and X_1.bb) then common patches should go into a dir X.
And if the patches are for a specific version they should go in X-0, X-1 etc.

When I'm bored again on a rainy sunday afternoon or so, I can spent
some time on moving things.
Are people comfortable with that?
Also what would be the preferred way to store the patches for a recipe
with only one version (Z_3.bb)
Should this preferably be in Z or in Z-3 ?

Your opinion is apprecated

Frans

(ps: in my enthousiasm I already listed this as a task in
http://wiki.openembedded.org/index.php/OpenEmbeddedJanitors
If people are unhappy with the idea, I'll remove it from it again).


