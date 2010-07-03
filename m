Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUumN-0001ps-E3
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 06:56:40 +0200
Received: by pzk4 with SMTP id 4so646526pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jul 2010 21:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=H/XngJ3blAYjTululERE0HA4C4KhE/OFuIo30E67dlM=;
	b=hYDnT2afgxBS1zw8l3cVszb9mYgRWytcJaR1eM7fDrtUL40rIG6xsc+3m2mO280u0k
	IpvXTZJpqA4zEqASRNhqIxSddCD8/dQ8iFy7t8zwFHjj+6bV5y9iZo4zxzbRcCeE2PPK
	kGR5pPaDY+WVfN4wKRzGgr2hc9PNWMRBifIzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=LDiq33QzvRouqg9zCST5g3lL5DIl0pq/vxwslDJh+O4pRFqdAVB51M6fG11hRo+gK0
	MGPEekEHs4jYs3KBiWtY4jl/IIwKTrhj0usTGwkLNZIL3ONyrxRnKcVzjw+7ZrVUpkKH
	MsfklFP+cl9fA8NVktcW1DUF70+57hhxN4wvk=
Received: by 10.142.211.5 with SMTP id j5mr2275553wfg.87.1278132711926;
	Fri, 02 Jul 2010 21:51:51 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c23sm1618510rvf.0.2010.07.02.21.51.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 02 Jul 2010 21:51:51 -0700 (PDT)
Date: Fri, 2 Jul 2010 21:51:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100703045150.GA17627@gmail.com>
References: <1278082654-10070-1-git-send-email-khimov@altell.ru>
	<1278082654-10070-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1278082654-10070-2-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] tzdata-uclibc: add recipe for uclibc timezone database
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
X-List-Received-Date: Sat, 03 Jul 2010 04:56:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/07/10 18:57), Roman I Khimov wrote:
> Recent TZif2 file format contains TZ-like ASCII string at the end that is
> easily extractable and usable with uclibc setup, so this recipe does exactly
> that based on standard tzdata.
> 
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
>  recipes/tzdata/tzdata-uclibc_2010j.bb |   16 ++++++++++++++++
>  1 files changed, 16 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/tzdata/tzdata-uclibc_2010j.bb
> 
> diff --git a/recipes/tzdata/tzdata-uclibc_2010j.bb b/recipes/tzdata/tzdata-uclibc_2010j.bb
> new file mode 100644
> index 0000000..9d0de5d
> --- /dev/null
> +++ b/recipes/tzdata/tzdata-uclibc_2010j.bb
> @@ -0,0 +1,16 @@
> +require tzdata_${PV}.bb
> +
> +do_install_append () {
> +	rm -f ${D}${sysconfdir}/localtime
> +	rm -f ${D}${sysconfdir}/timezone
> +	for i in `find ${D}${datadir}/zoneinfo -type f`; do
> +		tail -n 1 $i > temp-zone
> +		# Avoid useless NULL files
> +		if [ "`cat temp-zone`" != "" ]; then
> +			mv temp-zone $i
> +		fi
> +	done
> +	cp -pPR ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/TZ
> +}
> +
> +CONFFILES_${PN} = "${sysconfdir}/TZ"
> \ No newline at end of file

you could have used overrides in the same recipe.
do_install_append_libc-uclibc () ...

Thx
-Khem


