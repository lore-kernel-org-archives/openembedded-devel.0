Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OEcDx-00052D-8M
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 07:53:46 +0200
Received: by fxm8 with SMTP id 8so1610647fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 22:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/8xp8usqzaec4SD4rVZV7/ksT15awm703G4zS5Dx9bA=;
	b=XtRXmhWKnT3AC+QO9aH8k28oWpK0L3fVk6PEoUTWVPWwVBRcDcmOazMTcfw2USrl6y
	hknUKj2LsCCuqq6kCC2yxESdTIa6eTehG0AyEzAlihuZDtROOrEwtfIk+XHk+HEpzu5G
	Z/nyFJztUdQiI6rTYiGA5yE6+eV68UzliYtFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=o4M+goEiIxvjJC4TnuifJFCVgJLxSy7Ixds12F4P5kjXfOgd0lB4tYlEl4L+y6uNGc
	Zl/qIKW23EbFk/YNKJiPnRYuNFrs3f3WN2F6wlsAB+5SIjPcphm5Kjqzd2weOIjcVe+y
	IzUQueb/A+BpMqCw8dJzqMbdtjgJIUVMX0bcE=
Received: by 10.223.29.156 with SMTP id q28mr3077996fac.77.1274248184486;
	Tue, 18 May 2010 22:49:44 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j23sm34437648faa.2.2010.05.18.22.49.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 May 2010 22:49:43 -0700 (PDT)
Date: Wed, 19 May 2010 07:49:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100519054939.GA3302@jama>
References: <1274234538-26516-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1274234538-26516-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFA][PATCH] automake_1.11.1.bb: Remove DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Wed, 19 May 2010 05:53:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 18, 2010 at 07:02:18PM -0700, Khem Raj wrote:
> Hi,
> 
> I was working on upgrading gettext and some other packages to latest
> versions but they use features from automake 1.11. We have this recipe
> but it not enabled. I ask for approval to make it default. I have
> build few images thus far without any problems and SHR already uses
> it as preferred automake. Some distributions ask for specific versions
> they wont be affected. 

Few recipes needed small patch when make install refused to install same
file twice, but those patches were rather trivial. Those used in SHR are
already fixed, so ACK.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


