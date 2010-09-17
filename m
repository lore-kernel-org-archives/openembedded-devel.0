Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OwUJh-0002zk-4A
	for openembedded-devel@openembedded.org; Fri, 17 Sep 2010 08:21:02 +0200
Received: by iwn2 with SMTP id 2so1725598iwn.6
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Sep 2010 23:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=8vuyfg+Qok2V1XXMHpFwIq/sPglNEG91x05fsFQDIDw=;
	b=W1786yRtHNIWHzMkzBtNhJAVUhGDjOkVNPAczLK9xSgyM5hlcBOzxIAmXNKN3DPMTT
	2tPt9ahsgan1EgZB8YR9Xk71jbXjPROCiookYByvUl1Wu25POpd66ipkqLp+G8EFH2Bu
	rOGqtpCVkvISHhMP8yHvzHY08/NZDp0OZebRA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=dNBoWFH6gFW8iDrAmlkENT66BVJ++i/732z0c8ifFabLtF7GplycmaV2L+ndr6v7lz
	0u0hN8kM3Wq4GQ/o/aCo5+DMaF2RQeor25HwamPyCHk9K0XWeqy/lkClR2WP171hq27L
	Dpr4WbHyI6v4X8dbJ1k7Rf+InKKwXsKhdXIm8=
MIME-Version: 1.0
Received: by 10.231.191.74 with SMTP id dl10mr4669869ibb.157.1284704411160;
	Thu, 16 Sep 2010 23:20:11 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Thu, 16 Sep 2010 23:20:11 -0700 (PDT)
Date: Fri, 17 Sep 2010 08:20:11 +0200
Message-ID: <AANLkTimF0DyLTfajYY0zWdnLDRuE8_00iufG4V5dRY12@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	dp@xora.org.uk
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: removal of alsa-scenario_git.bb ?
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
X-List-Received-Date: Fri, 17 Sep 2010 06:21:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

Yesterday I bumped upon alsa-scenario_git.bb.
This one had a DP of -1 and does not fetch.

At first I thought a bad SRCREV but when trying to clone the git I
also got a failure:

frans@frans-desktop:/tmp$ git clone git://slimlogic.co.uk/alsa-scenario
Initialized empty Git repository in /tmp/alsa-scenario/.git/
fatal: The remote end hung up unexpectedly

If this persists should we remove the recipe?
I also could not identify any user.

I'm especially interested in the views of Graeme on this as he added the recipe.

Frans


