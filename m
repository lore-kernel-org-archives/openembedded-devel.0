Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OgucO-0007QP-10
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 09:12:11 +0200
Received: by fxm12 with SMTP id 12so2780496fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=xcs6ox/ESjm6YIuSCfE+rccPa7LZOPp/AcmOJuXJjlU=;
	b=xh+lMg1s6cplkpxpjTxtTiM2dbrqm7jP7mtN8pm1zlTGH3wMx0EcZHBVjwFm839Ln/
	LTCjgWjazR3vuEHRHshh0t7YbZQr8SM8LI6nG/ky8ozKXI87CEzul3IJRe0mBdJPCO5x
	xYCMp7sFU7d5DdTAFOKzCqCrwODUoF2YcMFwo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mv7Gf/FhHZT8y/ubBAyZeXxKiBriQq4YTmr2BlNUkoZ390X3NOw9+FtAgcMNA4aJBz
	f9trvBEU8hPt8OfgbKWn8nVNRYad9IKH5cVdCPcG+RyCDMjhtDWAEB6irQY9XxIv/G5P
	U60zemfir/uMS4qJZQzdLYi50HDZmhH7IHTEg=
Received: by 10.223.121.193 with SMTP id i1mr10008883far.77.1280992301330;
	Thu, 05 Aug 2010 00:11:41 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b36sm3322790faq.35.2010.08.05.00.11.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Aug 2010 00:11:40 -0700 (PDT)
Date: Thu, 5 Aug 2010 09:12:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100805071201.GB29578@jama>
References: <E1OguCD-00023v-03@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1OguCD-00023v-03@melo.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Roman I Khimov : bitbake.conf: trust server certificate when doing svn over https
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
X-List-Received-Date: Thu, 05 Aug 2010 07:12:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 05, 2010 at 06:44:53AM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 64b73f5d3bc4516de7deaf2c3647a96a1d5285e1
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=64b73f5d3bc4516de7deaf2c3647a96a1d5285e1
> 
> Author: Roman I Khimov <khimov@altell.ru>
> Date:   Thu Aug  5 10:16:54 2010 +0400
> 
> bitbake.conf: trust server certificate when doing svn over https
> 
> Fixes fetching from https:// svn repos with self-signed certs.

Maybe we should add also
--accept theirs-full (just in case)
--force (to force overwrite of existing files)

ie 
matchbox-panel-2-icon-themes_0.0.1.bb
matchbox-panel-2_svn.bb
are checkouting/updating tiwo different SRCREVs and every few builds you
end up removing svn checkout from downloads dir, just because it
refuses to upgrade to newer revision (applets dir already exists there).

Any objections (someone intentionaly keeping dirty checkouts in his
DL_DIR)?

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


