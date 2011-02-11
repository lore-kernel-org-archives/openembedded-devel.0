Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Po2rY-0008OX-FR
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 00:57:20 +0100
Received: by gwaa12 with SMTP id a12so1287754gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=gN4Ws+UkyUQwZYOGxkTOzIGgXIYIXX/HC4u3uQ969Sw=;
	b=ClDi05ggB4sf5xMNzCs8F2qZIgdimmhR8JfbZZCpIUsLmJ7n6t9kvcu5ip0eiuntOy
	NA0/w/twlmNZAKFmZ6t10oOPxzmbSc0LB4LxJPqm5wqi4+7yWpR1o7+tpBoS4qeudqOd
	Vvm1QGfSQdHhD88lKPGAJmoGTfnJEOqNY4Vtg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=o6A/iOtbRRjZoZ6QGRI33dSP2Gj4scDKkeuH7BnQiZhFIFm+S1s42xg/Fc9AtK7ivQ
	FevxiZSnM1ioiW1FrLkv5U14Mkj4uay6/L26Ie1bKPE4yFdd1qkIpiCgpJf0hfgwBRf5
	kZbTOHk+0YBAQE8QGjoBHEVNcNFTC1JuHyZSs=
Received: by 10.236.110.173 with SMTP id u33mr2107871yhg.46.1297468573576;
	Fri, 11 Feb 2011 15:56:13 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id i45sm874748yha.16.2011.02.11.15.56.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 15:56:12 -0800 (PST)
Date: Fri, 11 Feb 2011 15:56:04 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110211235604.GC1010@gmail.com>
References: <1296505958-4465-1-git-send-email-ulf.samuelsson@atmel.com>
MIME-Version: 1.0
In-Reply-To: <1296505958-4465-1-git-send-email-ulf.samuelsson@atmel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: Re: [PATCH] Add support for user-defined multimedia in rootfs
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
X-List-Received-Date: Fri, 11 Feb 2011 23:57:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/01/11 21:32), Ulf Samuelsson wrote:
> ---
>  recipes/multimedia/multimedia_1.0.bb |   23 +++++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/multimedia/multimedia_1.0.bb
> 
> diff --git a/recipes/multimedia/multimedia_1.0.bb b/recipes/multimedia/multimedia_1.0.bb
> new file mode 100644
> index 0000000..2abfefa
> --- /dev/null
> +++ b/recipes/multimedia/multimedia_1.0.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "MultiMedia files"
> +LICENSE = "GPL"

be specific which version of GPL

> +PR = "r5"

PR should be r0
> +
> +# This package allows you to add multimedia contents to the file system
> +# To add this, you define 
> +# MULTIMEDIA_FILES=<path><filename>.tar.bz2 in local.conf
> +# and include "multimedia" in your image
> +
> +do_install() {
> +	install -d ${D}/usr/share/multimedia

you could use meta variables e.g. target_datadir  for denoting usr/share etc.
there are some distros which use flattened out root file system
this will not work for them

> +	if [ "x${MULTIMEDIA_FILES}" != "x" ] ; then
> +		if [ -f ${MULTIMEDIA_FILES} ] ; then
> +			tar jxvf ${MULTIMEDIA_FILES}	-C ${D}/usr/share/multimedia
> +		fi
> +	fi

I would suggest to untar this in say do_compile and use install program to copy it into installation area

> +}
> +
> +FILES_${PN} = "\
> +	/usr/share/multimedia/* \
> +	/usr/share/multimedia \
> +	"
> +
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


