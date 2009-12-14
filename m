Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NK7Jh-00085M-FG
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 10:34:12 +0100
Received: from tamarin.localnet (123-192-180-176.dynamic.kbronet.com.tw
	[123.192.180.176])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 093151B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 09:27:56 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2009 10:32:19 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <op.u4w4tyyrmn1qzu@guohr-laptop-ubuntu>
	<200912140947.10207.holger+oe@freyther.de>
	<op.u4w8hfz5mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u4w8hfz5mn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <200912141032.19529.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How generate dependence file without native packages
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
X-List-Received-Date: Mon, 14 Dec 2009 09:34:12 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Monday 14 December 2009 10:25:53 Guo Hongruan wrote:
> Hi,
>      Yes, it works. The following is the command line I used to generate
> dot file
> 
> bitbake -g helloworld-image -I quilt-native -I opkg-native -I
> shasum-native -I ipkg-utils-native
> 
>      Unfortunately,  It does not support wild characters, so I must append
> lots of -I options for every native packages.


patches for wildcards are welcome. I don't remember the source file but I would 
start in bin/bitbake and search for the -I option and follow its users until 
you hit the string comparison.

z.



