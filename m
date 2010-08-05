Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ogukh-0007dE-Ui
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 09:20:32 +0200
Received: by fxm12 with SMTP id 12so2782240fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 00:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=TJgyFlq+dCr7PfaCV8FPPXdfhICHNkglWuMi4IRJOwE=;
	b=eorePN1yI8PDS/xZOYgxxoyG7ezZV4sXSqlQhP3jkzws6RCK0tWUtRkzHQEAz4XQiX
	fp7Mp8NPgokmkHYPCG20RPtScZ+C7a3QX97m1W02L0+fn1qyLLvT2hQsr2BOcAH54Sgl
	2uzwOohPH3aFL9fX/eciWs8dTPmZJIPV8r+VE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gWpR+BE25sgP6HCiyOCDWH0qifbEkEhDlaTxlNaxP7c9Fdyr+FkN5WbQtR+/rXZeja
	M8qbvfx/bYVuGguKLprH1bXedwz6sc15oQGF5CuSiJB0hP00dlvjTZ+GyBqGFLHOVgx9
	i+AY2D5VpRNHhKeYzxp9seJXtNFKJp7SGB94c=
Received: by 10.223.119.198 with SMTP id a6mr10046634far.66.1280992826810;
	Thu, 05 Aug 2010 00:20:26 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b9sm3326925faq.7.2010.08.05.00.20.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Aug 2010 00:20:26 -0700 (PDT)
Date: Thu, 5 Aug 2010 09:20:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100805072047.GD29578@jama>
References: <4C5A5AD6.9090409@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4C5A5AD6.9090409@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] package_ipk.bbclass: add lists_dir to sysroots' /etc/opkg.conf
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
X-List-Received-Date: Thu, 05 Aug 2010 07:20:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 05, 2010 at 04:01:50PM +0930, Graham Gower wrote:
> This makes the sysroots' /etc/opkg.conf agree with opkg-collateral on where
> the package lists database should be found. Fixes a problem whereby opkg
> cannot find the package lists after opkg-collateral is installed.
> 
> This fixes the same problem as acc720fa80227d08fd15764117e0c34e2387e804.
> But since that doesn't take into account other dependencies bringing
> opkg-collateral into the image, it doesn't solve the problem in all
> cases and could probably be reverted.

Agreed about revert, because for ONLINE_PACKAGE_MANAGEMENT == "none" it
calls "opkg-cl ${IPKG_ARGS} install " without package name and image creation fails.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


