Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mg84A-00061g-OD
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 04:16:50 +0200
Received: by wa-out-1112.google.com with SMTP id m34so611171wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 18:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=sJ9uMQyvy0mZ9ScpFy8te2Y8VBhR3gbv817UJIT9bi8=;
	b=Iu/+HpVWsv43NfS/JpmFm3GU7gWTQDdEWDG8zT92uP1MfvsItes3VO2IHBIrrO9HtU
	G39CC+jif1wEEMIqTyOU+/pPlDnEYLvZkzeYjwWx2v3FC8udbvyiE8+36tHsiImBC6Fy
	+S6mVq5XImBoQtFQS6SZdDjXPGdzDRrt2wu24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=jh4llXSN3vE9PscQDtPDYBmYX4Q5ZJu7PWx/l19AyYWb2wlxMPXZXOWGFG3bPdLvRX
	Tw27N6PUvdWW4naX5+vKo5fqIlnW87hvZc1pCDjChHTY0FQkOXIqx46V/ujeZcx1/a8e
	dhoPk0jGhFSCgeS3OAbBnvieWnUZmmrmz/GDY=
Received: by 10.115.113.9 with SMTP id q9mr4650813wam.224.1251251936438;
	Tue, 25 Aug 2009 18:58:56 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id n9sm932788wag.58.2009.08.25.18.58.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Aug 2009 18:58:55 -0700 (PDT)
Date: Tue, 25 Aug 2009 18:58:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090826015850.GA5705@gmail.com>
References: <1251229783-6077-1-git-send-email-edoiron@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1251229783-6077-1-git-send-email-edoiron@cbnco.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] net-snmp: add v5.4.2.1
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
X-List-Received-Date: Wed, 26 Aug 2009 02:16:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (25/08/09 15:49), Evan Doiron wrote:
> Signed-off-by: Evan Doiron <edoiron@cbnco.com>
> ---
>  conf/checksums.ini                                 |    4 +++
>  .../configure-tail.patch                           |    0
>  recipes/net-snmp/net-snmp_5.4.2.1.bb               |   26 ++++++++++++++++++++
>  3 files changed, 30 insertions(+), 0 deletions(-)
>  copy recipes/net-snmp/{net-snmp-5.4.1 => net-snmp-5.4.2.1}/configure-tail.patch (100%)
>  create mode 100644 recipes/net-snmp/net-snmp_5.4.2.1.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index ba06d5d..290fd7a 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -17898,6 +17898,10 @@ sha256=0ea976722c993c87dede8eb6348e6feb059e3851bbef2de824bf18ac97cdb565
>  md5=6c974df7a5a5b1579f72115e6b045bda
>  sha256=0ea976722c993c87dede8eb6348e6feb059e3851bbef2de824bf18ac97cdb565
>  
> +[http://downloads.sourceforge.net/net-snmp/net-snmp-5.4.2.1.tar.gz]
> +md5=984932520143f0c8bf7b7ce1fc9e1da1
> +sha256=11a8baf167f7bfff60d2590e050991400a3a082923dbcdbf85e0e0ce46eb247c
> +
>  [http://download.berlios.de/net-tools/net-tools-1.60.tar.bz2]
>  md5=888774accab40217dde927e21979c165
>  sha256=7ae4dd6d44d6715f18e10559ffd270511b6e55a8900ca54fbebafe0ae6cf7d7b
> diff --git a/recipes/net-snmp/net-snmp-5.4.1/configure-tail.patch b/recipes/net-snmp/net-snmp-5.4.2.1/configure-tail.patch
> similarity index 100%
> copy from recipes/net-snmp/net-snmp-5.4.1/configure-tail.patch
> copy to recipes/net-snmp/net-snmp-5.4.2.1/configure-tail.patch
> diff --git a/recipes/net-snmp/net-snmp_5.4.2.1.bb b/recipes/net-snmp/net-snmp_5.4.2.1.bb
> new file mode 100644
> index 0000000..3c51a5f
> --- /dev/null
> +++ b/recipes/net-snmp/net-snmp_5.4.2.1.bb
> @@ -0,0 +1,26 @@
> +require net-snmp.inc
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
> +        file://configure-tail.patch;patch=1 \
> +        file://init \
> +        file://snmpd.conf \
> +        file://snmptrapd.conf"
> +
> +EXTRA_OECONF = "--enable-shared --disable-manuals --with-defaults \
> +                --disable-embedded-perl --with-perl-modules=no"
> +EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
> +
> +do_configure_prepend() {
> +        gnu-configize -f
> +        # We better change sources and re-autoconf here, but
> +        # required autoconf is too new for us.
> +        sed -e '/echo.*\".*\\\\.*\"/s/echo/echo -e/g' \
> +            -e 's/tail -1/tail -n 1/g'                \
> +            -i configure
> +
> +        #The tarball for v5.4.2.1 is missing config.sub
> +        cp ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
> +}
> +
> +PARALLEL_MAKE = ""
> +CCACHE = ""

just curious on why CCACHE is disabled.

> -- 
> 1.6.0.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


