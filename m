Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MxAZV-0002VV-Ro
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Oct 2009 04:23:40 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 948C61B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2009 02:30:58 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Oct 2009 04:22:19 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3; KDE/4.3.2; i686; ; )
References: <fd72b8f50910110737u5cf0c64dv2e352feaa2c46e1@mail.gmail.com>
	<fd72b8f50910110853u46dc80dbr5ba7410e0a6a0840@mail.gmail.com>
	<fd72b8f50910110914u3b9ddbfcsaea33748a3a68345@mail.gmail.com>
In-Reply-To: <fd72b8f50910110914u3b9ddbfcsaea33748a3a68345@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200910120422.20135.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: imagemagick-native-6.3.5 compile problems
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
X-List-Received-Date: Mon, 12 Oct 2009 02:23:40 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Sunday 11 October 2009 18:14:07 mail mail wrote:
> Hi, Holger Hans Peter Freyther
> Thank you for your direction. I finished compile it and here is my patch:
> 
> --- delegate.c    2007-09-11 11:20:41.000000000 +0800
> +++ delegate.c    2009-10-12 00:04:45.000000000 +0800
> @@ -769,7 +769,7 @@
>    /*
>      Copy source file to destination.
>    */
> -  destination_file=open(destination,O_WRONLY | O_BINARY | O_CREAT);
> +  destination_file=open(destination,O_WRONLY | O_BINARY | O_CREAT, 0777);
>    if (destination_file == -1)
>      return;
>    source_file=open(source,O_RDONLY | O_BINARY);

great. Could you please do one more thing. Change the image-magick recipe to 
apply this patch (e.g. by adding SRC_URI += file://fix-native-
compile.patch;patch=1) and then use git add on the patch and create a git 
commit which adds the patch, patches image-magick and use git format-patch to 
send this to the mailinglist?

With patches coming from git format-patch we can use git am to apply them.

	z.


