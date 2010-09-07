Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1Ot4y9-0004JM-NT
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 22:40:42 +0200
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id C91372DD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 16:40:02 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Tue, 07 Sep 2010 16:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=NTapgbA29jUo4uZbOW2LM6C9vBQ=;
	b=rcPh1GPoszux+LrZLHa9xTTr7AD+b//H1fDv+qSGMYGr5fPiBuVTCdmLSI2A8+YlYKulatpwiDIbhcNfJXIlZxHFN4tT3/UTgXA2ot6xktTAx5MAVtuw5G3a5p8dNvw5sNo8qFZYkyN42ALP3gQ1+Y6Omh3pIkWXzAE/kAFBG1M=
X-Sasl-enc: ZemQngid8FU9DPztoHA2oH2oRi5O/S+ytTYdOQuVa2tT 1283892000
Received: from [192.168.1.34] (hnvr-4d078030.pool.mediaWays.net [77.7.128.48])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 599D7403BC4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 16:39:59 -0400 (EDT)
Date: Tue, 7 Sep 2010 22:41:36 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1277407750-16012-1-git-send-email-vjensen@gmx.de>
Message-ID: <alpine.LNX.2.00.1009072239260.22847@asterix.crazy-teaparty.dyndns.org>
References: <20100624151638.GC28292@gmail.com>
	<1277407750-16012-1-git-send-email-vjensen@gmx.de>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] libusb1_1.0.8: new recipe
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
X-List-Received-Date: Tue, 07 Sep 2010 20:40:42 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

I probably should have created a new thread for this patch...

If someone wants libusb1 on big-endian machines in stable/2009 he needs 
this patch.  .dev is already on 1.0.8, should we support libusb1 on 
stable?

Vitus


On Thu, 24 Jun 2010, Vitus Jensen wrote:

>
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
> recipes/libusb/libusb1_1.0.8.bb |   24 ++++++++++++++++++++++++
> 1 files changed, 24 insertions(+), 0 deletions(-)
> create mode 100644 recipes/libusb/libusb1_1.0.8.bb
>
> diff --git a/recipes/libusb/libusb1_1.0.8.bb b/recipes/libusb/libusb1_1.0.8.bb
> new file mode 100644
> index 0000000..f264321
> --- /dev/null
> +++ b/recipes/libusb/libusb1_1.0.8.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "library to provide userspace access to USB devices"
> +HOMEPAGE = "http://libusb.sf.net"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1"
> +
> +PR = "r0"
> +
> +SRC_URI = " \
> +	${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2;name=tar \
> +	"
> +S = "${WORKDIR}/libusb-${PV}"
> +
> +inherit autotools_stage pkgconfig binconfig lib_package
> +
> +EXTRA_OECONF = "--disable-build-docs"
> +
> +LIBTOOL = "${HOST_SYS}-libtool"
> +EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
> +
> +PACKAGES =+ "libusbpp"
> +FILES_libusbpp = "${libdir}/libusbpp*.so.*"
> +
> +SRC_URI[tar.md5sum] = "37d34e6eaa69a4b645a19ff4ca63ceef"
> +SRC_URI[tar.sha256sum] = "21d0d3a5710f7f4211c595102c6b9eccb42435a17a4f5bd2c3f4166ab1badba9"
>

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


