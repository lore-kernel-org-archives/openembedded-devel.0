Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nr543-0002Bz-Lu
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 08:50:21 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 7A0E91B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 07:50:15 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Mar 2010 08:46:33 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <201003081300.19058.holger+oe@freyther.de>
	<201003150446.26284.holger+oe@freyther.de>
	<ac9c93b11003150030i69015e69t78a3b16e6c11d2e5@mail.gmail.com>
In-Reply-To: <ac9c93b11003150030i69015e69t78a3b16e6c11d2e5@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003150846.33517.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 07:50:21 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 March 2010 08:30:09 Frans Meulenbroeks wrote:

> Do we feel we have that responsibility?
> 
> I didn't feel that sentiment when it came to removing other legacy
> recipes (some of which definitely also will have security issues).
> E.g. for openssl we have
> openssl_0.9.7e.bb
> openssl_0.9.7g.bb
> openssl_0.9.7m.bb
> openssl_0.9.8g.bb
> openssl_0.9.8m.bb
> I'm pretty certain the last one will fix some vulnerabilities present
> in the first one.

Well you are comparing two different things here. One is having the _default_ 
of a recipe with known security issues, and one is keeping old non default 
recipes with security issues.

If a distro maker decides to use an ancient version of OpenSSL it was his 
choice, if he just typed bitbake foo-image and he has a vulnerable daemon 
waiting to be owned in his default image... the story is a bit different.

I think we have at least three options on how to deal with it:

1.) Put a big fat warning on Openembedded.org saying it should not be used for 
users that have network connectivity or might put a SDcard/Storage with 
content on a device as we don't care about fixing vulnerable software.

2.) Adopt a policy of addressing vulnerabilities in our defaults right away..

3.) Remove recipes for vulnerable software when no one is updating them in 
time... This can be combined with option 2...


z.








