Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1PE4XN-0006Pg-HT
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 19:27:50 +0100
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 0C1D61B10C0B;
	Thu,  4 Nov 2010 18:29:19 +0000 (UTC)
Message-ID: <4CD2FAF0.4080905@freyther.de>
Date: Thu, 04 Nov 2010 19:26:56 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288864342-20973-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1288864342-20973-1-git-send-email-eric@eukrea.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH/RFC] qt4-embedded: tune QT_ARCH for armv6
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
X-List-Received-Date: Thu, 04 Nov 2010 18:27:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/04/2010 10:52 AM, Eric B=C3=A9nard wrote:
> this is a RFC, I think it can also be used on qt 4.6.x and on armv7.
> Setting QT_ARCH to armv6 enable some asm optimized functions in QT.

Do you know the consequences of this change? E.g. in the painting
engine unaligned memory access will be allowed. I am not sure that Nokia =
has
ever benchmarked what is faster (aligned/unaligned) access. So it would b=
e
very interesting to know the perf difference. E.g. use qttracereply to me=
asure it.

Phil do you happen to know why unaligned access got allowed starting from
armv6? How fast will it be?


