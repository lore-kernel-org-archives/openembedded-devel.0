Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PLZAv-0000xy-Nd
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 11:35:38 +0100
Received: by fxm8 with SMTP id 8so2077fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 02:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=s181IXQzkGPvT04zk1XJFZUaPrPGmuL7aaPnP/1VBHk=;
	b=Ende72J2HbaSnaD7YZ+bIsNZaJZ8Ey4eUFI8zYPTcxAqlryrWv5IQcK46Lyz03JDdy
	iSiXHuSZkk68v3j63VrwTIi1lqWTaPIX8ArdFrNVrOswctAmBJIKoIy7KDOQq3Ic3nfg
	LHCSLZvz9WuMSymsLCLqaJo2DsSGtO2rGanDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=ZSL25SFQWZrVgBR9mFHXn05ak7TZo2hup8iUNsnXwL66haJ9RCj7gqW2pnCuL4Z0I8
	38SsgzrWuEDmlg//w9pQ0ljHTdzuLcvsk7ViR1cO7CgJYQEiu9BVVMjnTnba2W8enVC8
	eelZ+C42ielY6xX7C3fSHU9H9sCndjDviOesY=
Received: by 10.223.79.72 with SMTP id o8mr530498fak.83.1290681262150;
	Thu, 25 Nov 2010 02:34:22 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d20sm132828fav.38.2010.11.25.02.34.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Nov 2010 02:34:21 -0800 (PST)
Date: Thu, 25 Nov 2010 11:34:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101125103409.GK3274@jama>
References: <1290676461-13283-1-git-send-email-eric@eukrea.com>
	<1290676461-13283-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1290676461-13283-2-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/5] shr: remove busybox's prefered version
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
X-List-Received-Date: Thu, 25 Nov 2010 10:35:38 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 25, 2010 at 10:14:18AM +0100, Eric Bénard wrote:
> and use the latest stable as a default.
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  conf/distro/include/preferred-shr-versions.inc |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
> index 22e1c82..bc08fdb 100644
> --- a/conf/distro/include/preferred-shr-versions.inc
> +++ b/conf/distro/include/preferred-shr-versions.inc
> @@ -13,7 +13,6 @@ PREFERRED_VERSION_emacs-x11 = "23.1"
>  PREFERRED_VERSION_ncurses = "5.7"
>  PREFERRED_VERSION_ncurses-native = "5.7"
>  PREFERRED_VERSION_python-pycairo = "1.8.0"
> -PREFERRED_VERSION_busybox = "1.17.3"

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


