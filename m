Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PE4CV-0005vA-Oi
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 19:06:17 +0100
Received: by pzk34 with SMTP id 34so317545pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=FL7jGPP4d+gX3w774QRCA6jxyU6E8Nv4yXaeqXuyruU=;
	b=gXOLQltvjL8ZFf31mbIjy775Op6C3YlTSgW1c4TwhiOrzaxyieJ/Wc2NOPAXc71To4
	vllAASFu7tfRrlESeNEkjsRHJgeMkN9kfO2L7894H5eRXLzlrtsgdMs+r7Qw/6lkaN7N
	jF/snqui7WTPXesGwwSO35IrZYfbg0rrArGjQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=H5VbstvodUmoxF9FKf8z/xVkPoBC7r7fANqcguCg6S/PAWPCUZE1f3VUebMliX/Se7
	pm/av1HOjH4j84X6QlY0NWMzrhoeguGo/VHkjXZB0Mm92tnLiKx4sf2eVBhqKsh9r8/4
	fOUgEzG+VcKrLI8o9fIkymqMAtvsgUN58akUA=
Received: by 10.142.229.8 with SMTP id b8mr1036730wfh.20.1288893921322;
	Thu, 04 Nov 2010 11:05:21 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e14sm257986wfg.20.2010.11.04.11.05.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Nov 2010 11:05:20 -0700 (PDT)
Date: Thu, 4 Nov 2010 11:05:45 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101104180545.GA21548@gmail.com>
References: <1288864342-20973-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1288864342-20973-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Eric =?utf-8?Q?B=C3=A9nard?= <eric@eukrea.com>
Subject: Re: [PATCH/RFC] qt4-embedded: tune QT_ARCH for armv6
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
X-List-Received-Date: Thu, 04 Nov 2010 18:06:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (04/11/10 10:52), Eric Bénard wrote:
> this is a RFC, I think it can also be used on qt 4.6.x and on armv7.
> Setting QT_ARCH to armv6 enable some asm optimized functions in QT.
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>  recipes/qt4/qt4-embedded_4.7.0.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/qt4/qt4-embedded_4.7.0.bb b/recipes/qt4/qt4-embedded_4.7.0.bb
> index 7e3d4b8..fbfaf85 100644
> --- a/recipes/qt4/qt4-embedded_4.7.0.bb
> +++ b/recipes/qt4/qt4-embedded_4.7.0.bb
> @@ -2,9 +2,10 @@ DEFAULT_PREFERENCE = "-1"
>  
>  require qt4-embedded.inc
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>  
>  QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
> +QT_ARCH_armv6 = "armv6"
>  
>  require qt-${PV}.inc
>  
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


