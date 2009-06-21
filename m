Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MISGi-0001ch-Of
	for openembedded-devel@openembedded.org; Sun, 21 Jun 2009 20:59:57 +0200
Received: (qmail 27464 invoked from network); 21 Jun 2009 18:49:03 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 21 Jun 2009 11:49:03 -0700
Date: Sun, 21 Jun 2009 11:49:02 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090621184902.GY15477@smtp.west.cox.net>
References: <065E68EB87448440A3E75B4DBB5E871C26C83A@CORPUSMX100C.corp.emc.com>
MIME-Version: 1.0
In-Reply-To: <065E68EB87448440A3E75B4DBB5E871C26C83A@CORPUSMX100C.corp.emc.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] update IMAGE_ROOTFS variable to fix inconsistent	IMAGE_ROOTFS variable content in apt-native package
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
X-List-Received-Date: Sun, 21 Jun 2009 18:59:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 21, 2009 at 06:32:32AM -0400, Lin_Lynn@emc.com wrote:

> From 5f5d0a311692a114360b7bd3037534a5ec839f33 Mon Sep 17 00:00:00 2001
> From: Lynn Lin <Lin_Lynn@emc.com>
> Date: Sun, 21 Jun 2009 18:15:06 +0800
> Subject: [PATCH] update IMAGE_ROOTFS variable to fix inconsistent IMAGE_ROOTFS variable content in apt-native package
> http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=2343808f7386cbd4c7b43f1b24e65e173f5ddf15
> This commit change IMAGE_ROOTFS from "${TMPDIR}/rootfs" to "${TMPDIR}/rootfs/${PN},so it cause
> that it expand IMAGE_ROOTFS to ${TMPDIR}/rootfs/apt-native in apt.conf.sample,however rootfs_deb.class use
> apt.conf.sample to generate apt-rootfs.conf ,here IMAGE_ROOTFS is different from that in apt-native package

Acked-by: Tom Rini <trini@embeddedalley.com>

Tangentally, have you checked the apt.conf that's used for any other
variables we should be setting or that are wrong?  Thanks!

-- 
Tom Rini


