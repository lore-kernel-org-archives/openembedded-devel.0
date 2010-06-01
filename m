Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1OJSoa-0005VR-9n
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 16:52:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 621A9A2C45C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jun 2010 16:47:24 +0200 (CEST)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id xS2aSQ0gCXpr
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jun 2010 16:47:23 +0200 (CEST)
Received: from tomboy.localnet (pD9E16B0A.dip.t-dialin.net [217.225.107.10])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTPSA id CF92FA2C44B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jun 2010 16:47:22 +0200 (CEST)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Jun 2010 16:47:23 +0200
User-Agent: KMail/1.13.3 (Linux/2.6.34-0.slh.5-sidux-amd64; KDE/4.4.3; x86_64; ;
	)
References: <4C04F6FD.4070804@mlbassoc.com>
	<alpine.DEB.2.00.1006011021440.32142@lynx>
In-Reply-To: <alpine.DEB.2.00.1006011021440.32142@lynx>
MIME-Version: 1.0
Message-Id: <201006011647.23770.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is Angstrom dead?
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
X-List-Received-Date: Tue, 01 Jun 2010 14:52:33 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Dienstag 01 Juni 2010, 16:24:33 schrieb Robert P. J. Day:
> On Tue, 1 Jun 2010, Gary Thomas wrote:
> > |   libcanberra-gtk gudev-1.0) were not met:
> > | No package 'gstreamer-plugins-base-0.10' found
> > | 
> > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > | installed software in a non-standard prefix.
> > | 
> > | Alternatively, you may set the environment variables CHEESE_CFLAGS
> > | and CHEESE_LIBS to avoid the need to call pkg-config.
> > | See the pkg-config man page for more details.
> > 
> > NOTE: package cheese-2.30.1-r0: task do_configure: Failed
> 
>   now i'm slightly confused since neither ubuntu or fedora appear to
> have any pkgconfig info for the cheese package, so why would there be
> a test for it that you would need to override?  or is this not
> pkgconfig-related?

It should never depend on the pkconfig files installed on your buildhost. Are 
you sure that the gstreamer package is build?

> rday



