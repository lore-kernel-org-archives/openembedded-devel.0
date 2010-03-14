Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqkIz-000824-1w
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 10:40:21 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 73172C088
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Mar 2010 10:37:16 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuwSAAo9nEtT4zvyPGdsb2JhbAAHmnMBAQEBN7ZZhHsE
X-IronPort-AV: E=Sophos;i="4.49,638,1262559600"; d="scan'208";a="49925086"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.224]) ([83.227.59.242])
	by ipb1.telenor.se with ESMTP; 14 Mar 2010 10:37:16 +0100
Message-ID: <4B9CAE4A.6030709@atmel.com>
Date: Sun, 14 Mar 2010 10:37:14 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268506748-18802-1-git-send-email-ulf.samuelsson@atmel.com>
In-Reply-To: <1268506748-18802-1-git-send-email-ulf.samuelsson@atmel.com>
X-SA-Exim-Connect-IP: 195.54.99.196
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3 1/2] multimedia: Add media contents to rootfs
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
X-List-Received-Date: Sun, 14 Mar 2010 09:40:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ulf Samuelsson skrev:
> This package will copy the contents of "multimedia.tar.bz2."
> (Note the dot at the end) to the "/usr/share/multimedia" directory
> in the target. By replacing the empty default file, you
> can add your own multimedia files for testing.
> 
> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Seems like this fails in do_populate_staging if a filename in
the tarball contains a space.


> ---
>  recipes/multimedia/multimedia_0.1.bb |   23 +++++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/multimedia/multimedia_0.1.bb
> 
> diff --git a/recipes/multimedia/multimedia_0.1.bb b/recipes/multimedia/multimedia_0.1.bb
> new file mode 100644
> index 0000000..986fd1c
> --- /dev/null
> +++ b/recipes/multimedia/multimedia_0.1.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "MultiMedia files"
> +PR = "r1"
> +
> +# This package allows you to add multimedia contents to the file system
> +# To add this, you create the file "multimedia.tar.bz2." and replace
> +# the default file included in the openembedded repository. 
> +# Note '.' at end of the filename to avoid decompress by bitbake
> +
> +SRC_URI = "\
> +	file://multimedia.tar.bz2. \
> +	"
> +
> +do_install() {
> +	install -d ${D}/usr/share/multimedia
> +	tar jxvf ${WORKDIR}/multimedia.tar.bz2.	-C ${D}/usr/share/multimedia
> +	rm -f ${D}/usr/share/multimedia/.empty
> +}
> +
> +FILES_${PN} = "\
> +	/usr/share/multimedia/* \
> +	"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"


-- 
Best Regards
Ulf Samuelsson



