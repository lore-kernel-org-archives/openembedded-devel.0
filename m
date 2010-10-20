Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P8hN4-0000U2-3B
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 00:42:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 43CBB31498EB;
	Thu, 21 Oct 2010 00:42:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id vWcjgkDvQP8v; Thu, 21 Oct 2010 00:42:15 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id AC7DE314931F;
	Thu, 21 Oct 2010 00:42:15 +0200 (CEST)
Message-ID: <4CBF7047.7040809@opendreambox.org>
Date: Thu, 21 Oct 2010 00:42:15 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
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
Cc: bitbake-dev@lists.berlios.de
Subject: Syntax of ASSUME_PROVIDED
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
X-List-Received-Date: Wed, 20 Oct 2010 22:42:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I observed some unexpected behavior with BitBake 1.10.1.

After having added ASSUME_PROVIDED += "gconf" to my distro conf, bitbake
pixman didn't succeed anymore (a clean build after removing tmp). It
couldn't find pkgconfig macros used by configure. When I tried bitbake
pkgconfig-native, BitBake looped forever, as Khem already reported in an
earlier mail to bitbake-dev [1].

I noticed that gconf is part of pk-gconf-ig, so I suspected that there
was something going wrong matching the strings.

BitBake uses re_match_strings, which contains the following code:

    for name in strings:
        if (name==target or
                re.search(name,target)!=None):
            return True
    return False

Looking at other occurences of ASSUME_PROVIDED, I noticed that everybody
seems to assume that the syntax for this variable is a space-separated
list of targets, and nobody uses regular expressions for it.

So, should I use something like "^gconf$" in my config? Or should
re_match_strings be modified instead?

Regards,
Andreas

[1] http://www.mail-archive.com/bitbake-dev@lists.berlios.de/msg00736.html


