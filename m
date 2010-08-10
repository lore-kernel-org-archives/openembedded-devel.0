Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OisUT-0006ge-CG
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 19:19:55 +0200
Received: by fxm6 with SMTP id 6so872687fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 10:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=7RtGy2ycR5Ch3z6146lxGf/K5zE3hFt76JOq570R7Lo=;
	b=hZS/Kwjv/RUIHjsV2USQg3mfFqaaQph3duVjC9FZj+64d6yE0S/jg9iVpsf5H6Etlm
	waimy102nzm/2sxh1VmsF/J1aG8Qc21XjboyzhBVxDP1bfZPIMx8Nx4UhilAOKisDafI
	SC2bPF1mtV9KFZQV/oQy22+QO4+C60dit8SFU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=lOWAQU5jtdV9JSToXbqVQ7FxAz7ew+eWLzd6cYhigQ3XArP/kA2xnJIX7uyZ+xgV1G
	rUMiJhsTMNPed0OjqviwoD/KJR+ydtaVAD9tHDSYq2e8jq3M+kvf+OxO1xDMrvFHtjgf
	sVVmnLkYQ2yAXT+Ze3flWWLAKp9pEQyRwYZuk=
Received: by 10.223.123.145 with SMTP id p17mr18539997far.90.1281460782452;
	Tue, 10 Aug 2010 10:19:42 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 1sm1473016fas.2.2010.08.10.10.19.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 10 Aug 2010 10:19:41 -0700 (PDT)
Date: Tue, 10 Aug 2010 19:19:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100810171950.GA32300@jama>
References: <1281459157-4103-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1281459157-4103-1-git-send-email-fransmeulenbroeks@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] conf/distro/include: remove unused versions
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
X-List-Received-Date: Tue, 10 Aug 2010 17:19:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 10, 2010 at 06:52:37PM +0200, Frans Meulenbroeks wrote:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> 
> While browsing through conf/distro/include I notided some files that were not used.
> Triggered by this I did a grep in conf/distro and conf/distro/include to see what files
> were actually used.
> 
> I manually compared this with the contents of the include directory
> The folllowing files were not used by any distro. (and there is also 
> no require for them in the recipes dir).
> Unless someone comes up with a reason to keep one of them, I propose to remove these.

IE fso-autorev.inc is still usefull and usually included from
local.conf.

preferred-xorg I proposed to cleanup already in 
http://patchwork.openembedded.org/patch/2262/

conf/distro/include/preferred-xorg-versions-live.inc is only one I
maintain up-to-date with my xorg bumps (and can be usefull if you want
latest xorg stuff from local.conf while your distro includes ie X11R7.5
and you want to overwritte it with latest).

No strong opinion about other .inc.

Regards,



