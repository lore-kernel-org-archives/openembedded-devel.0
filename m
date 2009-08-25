Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MfuA0-0002UV-PU
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 13:25:59 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id B59EC1B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 11:12:26 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 13:07:58 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <91283b620908220300u6770aaebo7aa89b1b1b91e2fd@mail.gmail.com>
	<91283b620908240250i3e35959bn26a29d99047b455d@mail.gmail.com>
	<91283b620908240259s66c46b9bm3302978c59f7b3cd@mail.gmail.com>
In-Reply-To: <91283b620908240259s66c46b9bm3302978c59f7b3cd@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908251307.58166.holger+oe@freyther.de>
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
X-List-Received-Date: Tue, 25 Aug 2009 11:26:11 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 24 August 2009 11:59:31 Stuart Gray wrote:
> I've fixed it.
>
> I added oe_soinstall and pulled the so file in for compilation.

Yes, and it is a messy fix. I have pushed musicbrainz_3.0.2 to OE and use 
another -rpath-link to point it to the libstdc++.


One more detail... gcc 4.3/binutils are "leaking" c++ symbols and when 
building the C application, gcc is used for the linking and it is not able to 
find the c++ library. I'm manually pointing gcc to the path of this library 
now.

z.


