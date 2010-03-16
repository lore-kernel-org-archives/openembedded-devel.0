Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NrKpO-0005wC-13
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 01:40:13 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A5C5E1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 00:40:12 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 01:36:25 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <hndr0p$old$1@dough.gmane.org>
	<1268672644-29043-1-git-send-email-valentin.longchamp@epfl.ch>
In-Reply-To: <1268672644-29043-1-git-send-email-valentin.longchamp@epfl.ch>
MIME-Version: 1.0
Message-Id: <201003160136.25555.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Do not generate NEON code for qt-4.6.2 embedded on armv6
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
X-List-Received-Date: Tue, 16 Mar 2010 00:40:13 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 March 2010 18:04:04 Valentin Longchamp wrote:
> http://bugreports.qt.nokia.com/browse/QTBUG-8749
> Neon code is generated for armv6 processor, where it should be armv7 only.
> This results in illegal instructions with some of the qt4 libraries.
> 
> The current solution is not optimal, I just needed a quick fix for my arch
> and I don't have the needed knowledge in OE to fix it cleanly, but I wanted
> to point this issue out. But at least other arch (armv5 and armv4) should
> have the same problem and receive the same fix.

Well... then maybe this should be fixed differently then?



