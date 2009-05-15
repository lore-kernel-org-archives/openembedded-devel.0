Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M4zPZ-0004rn-Cb
	for openembedded-devel@openembedded.org; Fri, 15 May 2009 17:33:27 +0200
Received: (qmail 24048 invoked from network); 15 May 2009 15:26:27 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 15 May 2009 08:26:27 -0700
Date: Fri, 15 May 2009 08:26:26 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090515152626.GU7973@smtp.west.cox.net>
References: <1242390849-28989-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1242390849-28989-1-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 1/2] glibc-package: fix kernel version passed to	qemu
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
X-List-Received-Date: Fri, 15 May 2009 15:33:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2009 at 04:34:08PM +0400, Roman I Khimov wrote:
> Binary locale generation fails with
> 
> FATAL: kernel too old
> 
> if glibc is configured for kernels newer then 2.6.16.
> 
> Fix qemu "-r" parameter to match OLDEST_KERNEL.

Just to be sure, this is happy with 2.4.0 too, right?

-- 
Tom Rini


