Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1IytP8-0007NH-Nt
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Dec 2007 19:18:58 +0100
Received: by ug-out-1314.google.com with SMTP id i24so1298051ugd
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2007 10:15:37 -0800 (PST)
Received: by 10.66.243.13 with SMTP id q13mr987680ugh.1196619336914;
	Sun, 02 Dec 2007 10:15:36 -0800 (PST)
Received: from ?10.0.0.6? ( [85.99.157.98])
	by mx.google.com with ESMTPS id t35sm6606095uge.2007.12.02.10.15.35
	(version=SSLv3 cipher=OTHER); Sun, 02 Dec 2007 10:15:36 -0800 (PST)
Date: Sun, 2 Dec 2007 20:17:43 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <704452397.20071202201743@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <475207FB.8020405@whitby.id.au>
References: <475207FB.8020405@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] RFC: Add ipkg to minimal image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Dec 2007 18:18:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Sunday, December 2, 2007, 3:18:51 AM, you wrote:

> I just realised that minimal-image.bb doesn't include ipkg, whereas the
> first image which does include ipkg (console-image) includes a whole lot
> of other stuff which could be installed using ipkg after first boot and
> network access, and which make the image too big for a machine with
> limited flash space (like an NSLU2).

> Is there a reason why minimal-image does not include ipkg?  What exactly
> is the definition of what should be in minimal-image which excludes the
> ability to install further packages?

  minimal-image is apparently something that 1) can boot, hence
task-boot, and 2) show signs of life (in no-nonsence and secure
manner), hence ${DISTRO_SSH_DAEMON}.

> Does anyone object to me adding ipkg support to minimal-image?

  While your work on getting useful small Angstrom images are of
course great, I think definition of minimal image as above as perfect
as it can get, so it would be better to create separate image. That
would lead to proliferation, as we already have
minimal-image-with-mtd-utils, but well, forking stuff for copies to
undergo evolution is apparently better than hacking axiom for each
occasion. Just my 2 cents.

> FYI, minimal-image.rootfs.jffs2 for ixp4xx is 3.8M whereas
> console-image.rootfs.jffs2 for ixp4xx is 7.1M

> -- Rod


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



