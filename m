Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1ME9Kp-0001hx-Di
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 23:58:23 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n59LmVUD027249 for <openembedded-devel@openembedded.org>;
	Tue, 9 Jun 2009 22:48:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VlE0k+zaZJ8O for <openembedded-devel@openembedded.org>;
	Tue,  9 Jun 2009 22:48:31 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n59LmQ1e027225
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Tue, 9 Jun 2009 22:48:27 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fce2a370906090342xee12c47k4d6a2cccb6e3abb2@mail.gmail.com>
References: <fce2a370906090342xee12c47k4d6a2cccb6e3abb2@mail.gmail.com>
Date: Tue, 09 Jun 2009 22:47:32 +0100
Message-Id: <1244584052.5998.46.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: bitbake -c clean doesn't clean all stuff
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
X-List-Received-Date: Tue, 09 Jun 2009 21:58:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-06-09 at 13:42 +0300, Ihar Hrachyshka wrote:
> Hello!
> 'Bitbake -c clean' cleans all staging, work... files but not ipks.
> What's the reason for such behaviour?
> 1) If I clean my recipe I want to be pretty sure build system won't
> use any files from the old build process. But it's not. F.e. if I
> built '1.1.2' recipe, then removed it and built '1.1.1' I want to be
> sure my rootfs uses '1.1.1'. But old-new ipks are in deploy dir, and I
> get 1.1.2 in my rootfs.
> 2) If I built recipe with 'PACKAGES = ${PN}', then cleaned it, edited
> my recipe to have "PACKAGES += ${PN}-xxx", and my ${PN} is empty and
> OE doesn't generate ipk for it, but old ipk is still there, ready to
> be installed to my rootfs through obsolete deps of other recipes! I
> don't see the problem until I rebuild my rootfs from scratch.
> So my question is: why doesn't OE clean ipks when cleaning?

If you enable packaged staging, it will.

Regards,

Richard



