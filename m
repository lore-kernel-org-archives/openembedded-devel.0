Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NWSgM-0003ar-WC
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 11:48:38 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 159831B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 10:44:41 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jan 2010 11:46:11 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <> <1263698541-9726-1-git-send-email-camelguo@gmail.com>
In-Reply-To: <1263698541-9726-1-git-send-email-camelguo@gmail.com>
MIME-Version: 1.0
Message-Id: <201001171146.11900.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Change the prefer binutils of micro.conf from 2.19.51 to 2.18
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
X-List-Received-Date: Sun, 17 Jan 2010 10:48:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 17 January 2010 04:22:21 Guo Hongruan wrote:
> * the previous default version of binutils (2.19.51) in micro.conf cause
>  the default version of glibc failed to build


In which way? Link error? missing symbols? bad relocations? Your commit 
message should indicate what the problem is, e.g. when someone else updates 
binutils he should be able to verify that your problem does not exist in 
2.19.52.


So a good message should include:
	- The configuration you are building for (not only micro but also the machine)
	- The actual error you have seen
	- A indication that it is caused by binutils.

z.


