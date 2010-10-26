Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAlVK-0006ne-HF
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 17:32:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A482E314A3D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 17:31:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2T1ySu0etpjw
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 17:31:14 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 48302314A3B9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 17:31:14 +0200 (CEST)
Message-ID: <4CC6F440.10509@opendreambox.org>
Date: Tue, 26 Oct 2010 17:31:12 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.14) Gecko/20101006 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Use of == in shell scripts
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
X-List-Received-Date: Tue, 26 Oct 2010 15:32:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Dear all,

I noticed a common mistake in various OE recipes, classes and contrib
scripts: Instead of =, == is used as equality operator, in at least 91
places in 64 files (without recipes/obsolete: 83 in 60 files). This
isn't a problem with bash, but it isn't the standard syntax and at least
dash does not support it.

I used the following command line to find the occurences:

git grep 'if\s*\[.*==.*\]'

This command fixes all occurences:

for i in `git grep -l 'if\s*\[.*==.*\]'`; do
	sed -i $i -e 's,\(if\s*\[.*\)==\(.*\]\),\1=\2,';
done

One of the matches is a false positive:
recipes/uclibc/uclibc-0.9.29/uClibc-0.9.29-nonposix_bashisms.patch

How do I submit such a patch? 60 patches may be too much for such a
relatively simple change, but, on the other hand, everything in a single
patch may be unhandy as well.

How about splitting it into 5 patches?

- classes (7 files)
- contrib (4 files)
- recipes/*/*.bb (24 files)
- recipes/*/*.inc (14 files)
- other files in recipes except recipes/obsolete (11 files)

Any opinions?

Regards,
Andreas


