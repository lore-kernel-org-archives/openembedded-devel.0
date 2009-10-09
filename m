Received: from [209.85.218.227] (helo=mail-bw0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MwGrE-0001se-6U
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 16:54:15 +0200
Received: by bwz27 with SMTP id 27so669687bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2009 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=bqe5pUsweAExszZakDbC1kRw9tAFIFF/t+QT03y/uB8=;
	b=B5vumTNOOEaNmhgEs1OOnTCfVnhRjzwlkPlYx+EWe//HchohFDvNtSYVJX5WKc+5Ad
	Cs6X7H9U9NfXYLKagAUKi0gqHIv/vleXayPYSQtfQMxK2F0zA6RmzpeCgaeLDekDkF/o
	49KucFvCsXydiGsGkR42/haVc2uNSakFuOZFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=U8d7h7EqJg5Y8S13RAqlQCbKuUZ0U+z9CxzeWvc3F9sEi/l6wuxY/vBTorW0Ghrpxa
	50fHzL0C+MxXVnyFVcU4THpp294PNUUceMsCQK9LqQx1laol0UNV0CnM4JoFmQOrYxmC
	1BMthWmhOzAmpVU9vxBRog040CwmhhvcaM6hQ=
Received: by 10.103.48.26 with SMTP id a26mr1148695muk.83.1255100000977;
	Fri, 09 Oct 2009 07:53:20 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t10sm4182034muh.43.2009.10.09.07.53.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 09 Oct 2009 07:53:19 -0700 (PDT)
Date: Fri, 9 Oct 2009 16:53:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091009145317.GD3109@jama>
References: <1255093465-29918-1-git-send-email-Martin.Jansa@gmail.com>
	<200910091626.26703.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <200910091626.26703.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.227
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Add latest xorg stuff for xserver-1.7, script for easy recipe bump and xf86-video-glamo-kms
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
X-List-Received-Date: Fri, 09 Oct 2009 14:54:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 09, 2009 at 04:26:25PM +0200, Marcin Juszkiewicz wrote:
> Dnia piątek, 9 października 2009 o 15:04:25 Martin.Jansa napisał(a):
> 
> NOTE: multiple providers are available for drm (libdrm-glamo, libdrm);
> NOTE: consider defining PREFERRED_PROVIDER_drm
> 
> Can you add patch which will select proper one for Angstrom and/or other 
> distros?
> 
> Regards, 

Sure, but I was probably wrong to create new provider for drm.. seems like 
not needed for oe.dev branch.

I'll create libdrm_git.bb and alternate SRC_URI for om-gta02 machine
with glamo.

What would you prefer?

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


