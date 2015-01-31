Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8566AC56
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jan 2015 00:36:39 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so29929891wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 16:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=SH9eAjQ+f6i0cL3btDArdmcLx+Zo4nsYk4x0+c58aXY=;
	b=Wlm5EZ0DOgSAs9Ov4EnObb6AORW9TUUbP30VNs+SrdGlWP8WhSKSkb7KMbwiOnF9jo
	eEfYubLy/ErieWuIA6V8jgBxbBmsNjGfELratl/ADVKF2QAPI+ADk/Nb0JHD2fgiU8Ch
	AB0tfHgFNmp/5TL1ebddkWKx7uZLER9xJMff17Qd6zfD/GZVsVyBewGtxMQD376RZMsP
	nVaBXorSvJRRQSf6gWdPY8G3dWg/B1d8WbQEc5vxXTEMXH+BuZna9xSnWqkuwlip2Plh
	VUHWFbquNtjcoJGSWUpwYALN5UHfzdTh2vrI04e3+SnQTrxpqWq3XZoYbAr4bgziNqct
	UMIg==
X-Gm-Message-State: ALoCoQmxhHqqOMXgsCQM4RD9ieO8c/fD2QURTgHJQbg5M+Ytj9BPgBwp6kxz2p+cRrIxb1ruNEoV
X-Received: by 10.180.73.84 with SMTP id j20mr32307wiv.43.1422664600069;
	Fri, 30 Jan 2015 16:36:40 -0800 (PST)
Received: from gmail.com (dhcp-186-165.gjk.dk. [195.249.186.165])
	by mx.google.com with ESMTPSA id
	ku8sm17077423wjb.23.2015.01.30.16.36.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Jan 2015 16:36:39 -0800 (PST)
Date: Sat, 31 Jan 2015 02:36:37 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150131003637.GB9471@gmail.com>
References: <1422339291-43625-1-git-send-email-coldnew.tw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1422339291-43625-1-git-send-email-coldnew.tw@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-raspberrypi][PATCH] layer.conf: handle dynamic layer configuration
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Jan 2015 00:36:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On Tue, Jan 27, 2015 at 02:14:51PM +0800, Yen-Chin Lee wrote:
> Using a separate layer specific directory as meta-fsl-arm does with
> qt5-layer, this will prevent meta-raspberrypi change layer dependencies
> when add qt5 packages.
>
> patch is taken from:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/conf/layer.conf#n20
>
> Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
> ---
>  conf/layer.conf | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 7bffd4b..71f22b4 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -12,3 +12,7 @@ BBFILE_PRIORITY_raspberrypi = "6"
>  # Additional license directories.
>  LICENSE_PATH += "${LAYERDIR}/files/custom-licenses"
>
> +# Let us add layer-specific bbappends which are only applied when that
> +# layer is included in our configuration
> +BBFILES += "${@' '.join('${LAYERDIR}/%s/recipes*/*/*.bbappend' % layer \
> +               for layer in BBFILE_COLLECTIONS.split())}"
> --
> 1.9.3 (Apple Git-50)
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Thanks for your contribution but meta-raspberrypi uses the yocto mailinglist as
stated in README. Please resend this patch accordingly.

Thanks a lot,

--
Andrei Gherzan

