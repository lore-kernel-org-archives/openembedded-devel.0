Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N4mOk-0001JN-1I
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 03:12:01 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id AD3631B10C05;
	Mon,  2 Nov 2009 02:20:47 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 2 Nov 2009 03:09:56 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
	<c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
	<d1b08f940911011459i7e8403ees7e509843a0854e2@mail.gmail.com>
In-Reply-To: <d1b08f940911011459i7e8403ees7e509843a0854e2@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200911020309.56350.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Mon, 02 Nov 2009 02:12:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 01 November 2009 23:59:18 Andrea Adami wrote:
> And what about having a checksum file in each dir of  /recipes ?
> If the checksum changes the PR should be changed too.


I think that is the best way in terms of scalability and BB collections. We 
have some weird cases where we might do require ../ but these are broken or 
need to duplicate the checksums...

z.


