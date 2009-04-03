Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LpopI-0002Sd-VM
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 21:13:19 +0200
Received: by rv-out-0708.google.com with SMTP id k29so1176896rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 12:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=GkNRG0LNS6dYbabO9AQaw3yuWMQudxvCeXyQeqYxm4U=;
	b=OVGKiFhMn40WZpAUiJ5TeoRrmxhabApXrxp46rdROyrKToD81X0QdqYZKpObAQq2yQ
	u/vrcLbVoF7NV4/ic/C3kqfM+6tBk1KaY2ly5Bl9ZldJl4z0WieIn0fD7d75XD/7tbfl
	iQtU2zZal08EvKRhtnpgRTnY7PmjGS8GSll18=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fV9vrPbsSLhyuwaR9b18BgyFtcp5g4617IRM7mNeQ/Z/4tv7kQ9lpPfk0wth3tZXYW
	ebp3b8SetLbYLOFM7+lJa6+7tS3E+11bG34HE6VjZYSq3gwHDF3gozMYdErunNntU6CM
	Ri7JoHQMhTZ9Ccvw8Sue+/IHQw4FOu3Bw7Qrw=
Received: by 10.114.106.13 with SMTP id e13mr749150wac.128.1238785843375;
	Fri, 03 Apr 2009 12:10:43 -0700 (PDT)
Received: from gmail.com (adsl-71-146-4-184.dsl.pltn13.sbcglobal.net
	[71.146.4.184])
	by mx.google.com with ESMTPS id n33sm2546975wag.18.2009.04.03.12.10.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Apr 2009 12:10:42 -0700 (PDT)
Date: Fri, 3 Apr 2009 12:10:39 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090403191039.GB29161@gmail.com>
References: <20090403171052.GE30840@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090403171052.GE30840@smtp.west.cox.net>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 209.85.198.245
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [PATCH] wireless-tools: Fix libiw/ifrename packages, bump	PR.
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
X-List-Received-Date: Fri, 03 Apr 2009 19:13:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/04/09 10:10), Tom Rini wrote:
> I'm sending this for review since it actually puts ifrename into its own
> package as was apparently intended, but not happening.  Giving people
> the weekend + Monday to complain and Tuesday AM (US -0700) I'll push.
> 
>  We weren't creating the above packages as we needed to use '=+' not
>  '+=' here to take things from the default package.  For these
>  additional packages, add files with '=' not '+=' and we only need to add
>  ${sysconfdir}/network to the base package glob.  Also we need to run
>  install-static to get libiw.a to be installed.
> 
> ---
>  recipes/wireless-tools/wireless-tools.inc   |   21 ++++++++++-----------
>  recipes/wireless-tools/wireless-tools_29.bb |    2 +-
>  2 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/recipes/wireless-tools/wireless-tools.inc b/recipes/wireless-tools/wireless-tools.inc
> index d2a7b89..f52c3f1 100644
> --- a/recipes/wireless-tools/wireless-tools.inc
> +++ b/recipes/wireless-tools/wireless-tools.inc
> @@ -31,7 +31,7 @@ do_stage() {
>  }
>  
>  do_install() {
> -    oe_runmake PREFIX=${D} install-iwmulticall install-dynamic install-man install-hdr
> +    oe_runmake PREFIX=${D} install-iwmulticall install-dynamic install-static install-man install-hdr
>      install -d ${D}${sbindir}
>      install -m 0755 ifrename ${D}${sbindir}/ifrename
>      install -d ${D}${sysconfdir}/network/if-pre-up.d
> @@ -39,13 +39,12 @@ do_install() {
>      install ${WORKDIR}/zzz-wireless.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/zzz-wireless
>  }
>  
> -PACKAGES += "libiw libiw-dev libiw-doc libiw-dbg ifrename ifrename-dbg ifrename-doc"
> -FILES_libiw += "${libdir}/*.so.*"
> -FILES_libiw-dbg += "${libdir}/.debug/*.so.*"
> -FILES_libiw-dev += "${libdir}/*.a ${libdir}/*.so ${includedir}"
> -FILES_libiw-doc += "${mandir}/man7"
> -FILES_ifrename += "${sbindir}/ifrename"
> -FILES_ifrename-dbg += "${sbindir}/.debug/ifrename"
> -FILES_ifrename-doc += "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
> -FILES_${PN} += "${bindir} ${sbindir}/iw* ${base_sbindir} ${base_bindir} ${sysconfdir}/network"
> -FILES_${PN}-doc += "${mandir}/man8"
> +PACKAGES =+ "libiw libiw-dev libiw-doc libiw-dbg ifrename ifrename-dbg ifrename-doc"
> +FILES_libiw = "${libdir}/*.so.*"
> +FILES_libiw-dbg = "${libdir}/.debug/*.so.*"
> +FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
> +FILES_libiw-doc = "${mandir}/man7"
> +FILES_ifrename = "${sbindir}/ifrename"
> +FILES_ifrename-dbg = "${sbindir}/.debug/ifrename"
> +FILES_ifrename-doc = "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
> +FILES_${PN} += "${sysconfdir}/network"
> diff --git a/recipes/wireless-tools/wireless-tools_29.bb b/recipes/wireless-tools/wireless-tools_29.bb
> index 196a194..fb68127 100644
> --- a/recipes/wireless-tools/wireless-tools_29.bb
> +++ b/recipes/wireless-tools/wireless-tools_29.bb
> @@ -1,3 +1,3 @@
>  require wireless-tools.inc
>  
> -PR = "r3"
> +PR = "r4"


Look ok to me.

> -- 
> 1.5.6.3
> 
> -- 
> Tom Rini
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


