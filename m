Received: from [209.85.222.171] (helo=mail-pz0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MgMBb-00017d-NJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 19:21:27 +0200
Received: by pzk1 with SMTP id 1so382656pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 10:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=T1/FnXCVu141xNe56dkAVIODlLQlqsmOcnyHLMZmWoY=;
	b=CjzdpOqn6F6MyHRGH3/v02+VNEdQhWpRtX9ztXwhhgHLS8TpKHSEXAWgIQizswtMOH
	IEaarOCXcIxRjl908j0038ILnBa29mqJ4KXYa9tEm/Mq60FQYbDRVWwuor3sxhIfCra2
	xhJubhM5rSG7YaSoR+ikrRtzQWRFM04KR2Ntw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=bs1fzx5P/LqhJjhfWeGtTa9nZ33KlzVDdswYpfcK6P+Svf0e4ao3qzebBcuudPfOb4
	sdQiv10FO+nBEle+d0nLxze74kudh3jliSG5WkPlwkirCfuD7HrtPRW/mmD5xUEftMU6
	EpJfVSAu5S4ouiHw54ROWFDzuVHl8b6unFRGc=
Received: by 10.141.34.20 with SMTP id m20mr2950179rvj.120.1251306207168;
	Wed, 26 Aug 2009 10:03:27 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 23sm1880753pzk.12.2009.08.26.10.03.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 10:03:25 -0700 (PDT)
Date: Wed, 26 Aug 2009 10:03:21 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090826170321.GG31371@gmail.com>
References: <1251299795-28168-1-git-send-email-edoiron@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1251299795-28168-1-git-send-email-edoiron@cbnco.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH v2] openvpn: add v2.0.9+2.1rc19
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
X-List-Received-Date: Wed, 26 Aug 2009 17:21:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (26/08/09 11:16), Evan Doiron wrote:
> Signed-off-by: Evan Doiron <edoiron@cbnco.com>
> ---
> 
> Previous Version I forgot to sort checksums, please ignore the first one.

I acked the wrong one.

Acked-by: Khem Raj <raj.khem@gmail.com>

> 
> 
>  conf/checksums.ini                       |    4 ++++
>  recipes/openvpn/openvpn_2.0.9+2.1rc19.bb |    6 ++++++
>  2 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 1b3e5db..7718e1c 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -18690,6 +18690,10 @@ sha256=347c551e7c88affc1f4b7a4b715080253c9298dcc512ed29fe8ca5cd26d015d9
>  md5=7401faebc6baee9add32608709c54eec
>  sha256=063f00d5b889beee910eb113c8cfbb4fc85cd404693494bcaaf79dd09a98335c
>  
> +[http://openvpn.net/release/openvpn-2.1_rc19.tar.gz]
> +md5=ba2ee667a8b7606b125b7d32f47ca578
> +sha256=d7f52e2217ed1cf367ca93257b27c8acb29fcae4fcaa31b4a94146a3c7a7de33
> +
>  [http://downloads.sourceforge.net/gakusei/openwrt-imagetools-svn-rev7641.tar.bz2]
>  md5=7f35543286911b827dcbf8d07a7d72be
>  sha256=bad49b59646dbea380cc88be13a77d17c70488b8e11e85f7dd474930fa9cf36a
> diff --git a/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb b/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
> new file mode 100644
> index 0000000..9375cd6
> --- /dev/null
> +++ b/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
> @@ -0,0 +1,6 @@
> +require openvpn.inc
> +
> +SRC_URI = "http://openvpn.net/release/openvpn-2.1_rc19.tar.gz \
> +	   file://openvpn"
> +
> +S = "${WORKDIR}/openvpn-2.1_rc19"
> -- 
> 1.6.0.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


