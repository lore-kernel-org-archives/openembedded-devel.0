Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk1n9-0003n8-A7
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 23:00:11 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id 6D2F7E979B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 22:58:21 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8ZAL++Rk1T4zjzPGdsb2JhbAAMiFKNeo4sAQEBATW9dYVOBIwh
X-IronPort-AV: E=Sophos;i="4.60,406,1291590000"; d="scan'208";a="170559901"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 31 Jan 2011 22:58:21 +0100
Message-ID: <4D47307B.4040504@atmel.com>
Date: Mon, 31 Jan 2011 22:58:19 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
Subject: Sorry about the recent mess
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
X-List-Received-Date: Mon, 31 Jan 2011 22:00:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Realized that the sign-off was missing in first rev
The I tried to generate the V2 with signoff,
I had 16 patches committed in the tree,
which I wanted to divide up into patchsets.

1:	1-8
2:	9
3:	10
4:	11-12
5:	13
6:	14
7:	15
8:	16

patch "1" beeing the first to be committed, and 16 the latest.

Since all files are committed, I have to do
git format-patch -16
move the first 8 files to a subdirectory
remove the rest
"sed" the PATCH line in all patches to replace n/16 with n/2
"sed" the PATCH line in all patches to replace PATCH with PATCH v2

git format patch -8
move the first file to a subdirectory
remove the rest
"sed" ...

until I created 8 subdirectories.


Anyone knows of a better way to let me extract patch 1-8 and
have them numbered 1/8 .. 8/8 instead of n/16 ?

I guess I could revert/rebase and reapply the patches.
Then I have to feed in the comments again.
Would be nice to do have a switch to say I want 8 patches starting with
patch 16 from the top.

git format-patch -8 --start-at=16

but I do not see such a possibility.
Any better idea?

BR
Ulf Samuelsson
Best Regards
Ulf Samuelsson


