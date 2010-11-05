Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1PEIfT-0006ND-HO
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 10:33:07 +0100
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id E24351B10C0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Nov 2010 09:34:40 +0000 (UTC)
Message-ID: <4CD3CF1E.4040804@freyther.de>
Date: Fri, 05 Nov 2010 10:32:14 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288864342-20973-1-git-send-email-eric@eukrea.com>	<4CD2FAF0.4080905@freyther.de>
	<4CD305FC.7070305@eukrea.com>
In-Reply-To: <4CD305FC.7070305@eukrea.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
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
X-List-Received-Date: Fri, 05 Nov 2010 09:33:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/04/2010 08:14 PM, Eric B=C3=A9nard wrote:
> Hi,
ill it be?
>>
> in the painting engine, from what I saw in the .h, the asm optimisation=
s are
> only enabled when using ARM RCVT compiler and not when using gcc but I =
have
> not checked everywhere in the code so I'm not sure of this.

that is something else, I also have a partially applied C implementation =
that
appears to be faster than the brute force armv6 code.

One benefit of using armv6 is that the atomic code will use a different
implementation (ldrex,strex IIRC instead of swp). In any case please use
something like qttracereply to see if passing armv6 is giving any benefit=
 at all.


