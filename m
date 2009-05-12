Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M3iMZ-0004EX-GH
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 05:09:03 +0200
Received: (qmail 1442 invoked from network); 12 May 2009 03:02:27 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 11 May 2009 20:02:27 -0700
Date: Mon, 11 May 2009 20:02:27 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090512030227.GF7973@smtp.west.cox.net>
References: <c384c5ea0905071305s1b180deal8c5fd09b5d646308@mail.gmail.com>
	<1242096804-27041-1-git-send-email-msmith@cbnco.com>
	<1242096804-27041-2-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1242096804-27041-2-git-send-email-msmith@cbnco.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] grub: Split the grub-install script and friends	into a separate package.
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
X-List-Received-Date: Tue, 12 May 2009 03:09:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2009 at 10:53:24PM -0400, Michael Smith wrote:

> In the main grub package, menu.lst and stage1/2 files will now be
> installed in /boot/grub.
> 
> stage2_eltorito is split into its own package for bootable ISOs.
[snip]
>  SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz \

Please switch to ${GNU_MIRROR}/grub/...

-- 
Tom Rini


