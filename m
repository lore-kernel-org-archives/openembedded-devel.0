Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LevFg-0008J4-V3
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 18:51:29 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090304174714.XETH16134.fed1rmmtao104.cox.net@fed1rmimpo03.cox.net>;
	Wed, 4 Mar 2009 12:47:14 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id P5nD1b00D4dMFYL045nDlL; Wed, 04 Mar 2009 12:47:13 -0500
X-Authority-Analysis: v=1.0 c=1 a=AYkYuw04ExYA:10 a=YCkBchfvqYgA:10
	a=XTVfQXm8AtLGiV2ag2oA:9 a=7gCLF8_C8OH0HzFIR64A:7
	a=_iSRgc1VKqHBIssnfuK5S_lf1fcA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 4 Mar 2009 10:47:13 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090304174713.GU26343@smtp.west.cox.net>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-34-git-send-email-openembedded@haerwu.biz>
MIME-Version: 1.0
In-Reply-To: <1236182004-4523-34-git-send-email-openembedded@haerwu.biz>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Richard Purdie <richard@openedhand.com>
Subject: Re: [PATCH 33/70] Add rootfs_rpm.bbclass, a start at image	generation from rpms. Its not expected to be entirely functional	yet. (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 17:51:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 04:52:48PM +0100, Marcin Juszkiewicz wrote:

[snip]
> +	#mkdir -p ${IMAGE_ROOTFS}/var/lib/rpm
> +	#rpm --root ${IMAGE_ROOTFS} --initdb
> +	#rpm --root ${IMAGE_ROOTFS} --dbpath ${IMAGE_ROOTFS}/var/lib/rpm -ihv --nodeps --ignoreos  
> +	#rpm -ihv --root ${IMAGE_ROOTFS} ${PACKAGE_INSTALL}
> +
> +	#package_update_index_rpm
> +	#package_generate_ipkg_conf
[snip]
> +	#export D=${IMAGE_ROOTFS}
> +	#export OFFLINE_ROOT=${IMAGE_ROOTFS}
> +	#export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
> +	#export OPKG_OFFLINE_ROOT=${IPKG_OFFLINE_ROOT}
> +
> +	#mkdir -p ${IMAGE_ROOTFS}/etc/opkg/
> +	#grep "^arch" ${IPKGCONF_TARGET} >${IMAGE_ROOTFS}/etc/opkg/arch.conf

These commented out items are never deleted, but seem like they should
be.

-- 
Tom Rini


