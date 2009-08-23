Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mf3Tr-0004Lz-En
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Aug 2009 05:10:55 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 57FAB1B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2009 02:57:29 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Aug 2009 04:53:13 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <91283b620908220300u6770aaebo7aa89b1b1b91e2fd@mail.gmail.com>
In-Reply-To: <91283b620908220300u6770aaebo7aa89b1b1b91e2fd@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908230453.13119.holger+oe@freyther.de>
Subject: Re: Musicbrainz
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
X-List-Received-Date: Sun, 23 Aug 2009 03:10:55 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 22 August 2009 12:00:54 Stuart Gray wrote:
> hi,
>
> Has any one successfully compiled libmusicbrainz_3.0.2.
>
> I have this compiling but it fails at the linking stage as it cannot find
> the library libstdc++.so.6.
>
> I have tried various EXTRA_OEMAKE, OECONF, OECMAKE, but none will add the
> option to the linking stage. Can anyone give me some pointers.

Hey Stuart,

please stop cross-posting. My emails bounce from the gumstix mailinglist and 
this is not fun...

With the limited information I have I would propose to:
	- Link with g++ instead of gcc
	- Or link to -lsupc++ (e.g. you change ammend the TARGET_LDFLAGS)

z.


