Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1PEJQh-0004eh-0M
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 11:21:55 +0100
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 7BD501B10C0B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Nov 2010 10:23:28 +0000 (UTC)
Message-ID: <4CD3DA8D.5020300@freyther.de>
Date: Fri, 05 Nov 2010 11:21:01 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1288864342-20973-1-git-send-email-eric@eukrea.com>	<4CD2FAF0.4080905@freyther.de>	<4CD305FC.7070305@eukrea.com>	<4CD3CF1E.4040804@freyther.de>
	<4CD3D16C.70901@eukrea.com>
In-Reply-To: <4CD3D16C.70901@eukrea.com>
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
X-List-Received-Date: Fri, 05 Nov 2010 10:21:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/05/2010 10:42 AM, Eric B=C3=A9nard wrote:
> Hi,

>>
> OK where is the code you are talking about in qt ?

tool/qttracereply.

1.) record a trace (e.g. the qtdemo) you will need Qt/X11 for that (deskt=
op,
device). But make sure that the qtdemo width/height fits on the screen.

$ qttdemo -graphicssystem trace (exit the app normally)

2.) Use qttracereply to replay the trace, it will print nice FPS data.




>=20
> One thing : what I see here is that qtdemo was crashing after a random =
time
> and now (with armv6) it runs stable for hours.

well, not very scientific. :)


