Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P4BxJ-0007wN-J7
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 14:21:46 +0200
Received: by bwz7 with SMTP id 7so555747bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Oct 2010 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=dJ3RdUpvUGoFiTX2L4a+cFP3o5EFuLW+VJynh1L935o=;
	b=erfVrtZJoFXpCFN0anAk85x7NUzI3haTO01MaSUrLorlZILPWfE7LrfJhckziQG2NT
	hlBiM5pKlnx1cSvoN3pEusT2M8n4xP7OWLkJ5PlX9EwNzz8Eb6sPGWfRJOF6tutD1SAf
	222ljtvUe7XHGWbpK5niItJ8fNar/RZ2FQ/rw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=f4nc83FSAF/vboD5Xc5moes9QXEFeQEUXw3Bk2EaB31XjwmEMMjhIk2FEQrYKId+4p
	zXcfjNGGnfKrlTnumqyPVnSq8qvT/GzSN1D0W0Uj7qjrrx4kXp1Fsr69KdAK7Zqdi1fs
	U/T7lldpBx5qlv0IJs4MZYXuLCOYWqxbN0HfY=
Received: by 10.204.57.197 with SMTP id d5mr1988122bkh.42.1286540482741;
	Fri, 08 Oct 2010 05:21:22 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p34sm435992bkf.15.2010.10.08.05.21.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Oct 2010 05:21:21 -0700 (PDT)
Date: Fri, 8 Oct 2010 14:21:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Steffen Sledz <sledz@dresearch.de>
Message-ID: <20101008122142.GI3163@jama>
References: <1286539640-9333-1-git-send-email-sledz@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <1286539640-9333-1-git-send-email-sledz@dresearch.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] syslog-ng: increase u-a priority to 200
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
X-List-Received-Date: Fri, 08 Oct 2010 12:21:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 08, 2010 at 02:07:20PM +0200, Steffen Sledz wrote:
> Priority for update-alternatives was 50 before which was the
> same like the one for busybox-syslog. Resulting order now is:
> 
> * 300 rsyslogd
> * 200 syslog-ng
> * 100 sysklogd
> * 50 busybox-syslog
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

please bump INC_PR with it

> ---
>  recipes/syslog-ng/syslog-ng.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/syslog-ng/syslog-ng.inc b/recipes/syslog-ng/syslog-ng.inc
> index fbe9adf..e58f1ea 100644
> --- a/recipes/syslog-ng/syslog-ng.inc
> +++ b/recipes/syslog-ng/syslog-ng.inc
> @@ -22,7 +22,7 @@ do_install_append() {
>  CONFFILES_${PN} = "${sysconfdir}/${PN}.conf"
>  
>  pkg_postinst_${PN} () {
> -        update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 50
> +        update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 200
>  
>          if test "x$D" != "x"; then
>                  OPT="-r $D"
> -- 
> 1.7.1
> 

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


