Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PDD2H-0000SS-4X
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 10:20:27 +0100
Received: by bwz10 with SMTP id 10so5193716bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 02:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=utRLoONtyib0JK48qXbZNJ9qraTD4H9NUatbu4yi1ZA=;
	b=t0XalsPAQGjpditUsgURQG5pGIvy3BpPgeEXBA9xPwAd+AaKF7QTzqqtI7Xi9aW0NB
	xAtwDfm/g3ImVA/NDYC6THfuyS8fr5xEzJyEbELkbvnTkUtmcBnL2pLV4mp5B7Vu9mSq
	nxk0DYHrig3yXCuM4jdFQLRz6W4TLJ2PeKZIE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VJEKc/ye8KFnZY0TYfu5IRqQqtRS+Gx+lpnuXDwub667eWBYD73eMFXmacrCaebbJY
	NnQlQru5IthSZs1FWMhhYTmR2nQXdLUgmetKax6UgPf6AJ+W9VNHK6igcS+IOLRo4TdC
	Tbkwy5uaM/DGsi3DNc3qm2gmflVgJ6hw2qp20=
Received: by 10.204.62.17 with SMTP id v17mr1392011bkh.67.1288689557222;
	Tue, 02 Nov 2010 02:19:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d27sm4357436bkw.2.2010.11.02.02.19.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 02 Nov 2010 02:19:15 -0700 (PDT)
Date: Tue, 2 Nov 2010 10:19:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101102091907.GC3440@jama>
References: <1288689207-4850-1-git-send-email-anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <1288689207-4850-1-git-send-email-anders@chargestorm.se>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] Resolvconf: update to 1.46
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
X-List-Received-Date: Tue, 02 Nov 2010 09:20:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 02, 2010 at 10:13:27AM +0100, Anders Darander wrote:
> Resolvconf 1.45 is only available from the snapshot mirror.
> Remove the recipee for 1.45.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
> v2:
> 	* Fix the subject line.
> 	* Remove the 1.45 recipe.
> 
> +DESCRIPTION = "Resolvconf is a framework for keeping track of the system's \
> +information about currently available nameservers. It sets \
> +itself up as the intermediary between programs that supply \
> +nameserver information and programs that need nameserver \
> +information."
> +SECTION = "console/network"
> +LICENSE = "GPL"
> +AUTHOR = "Thomas Hood"
> +HOMEPAGE = "http://packages.debian.org/resolvconf"
> +DEPENDS = "bash"
> +RDEPENDS_${PN} = "bash"
> +PR = "r1"

It should start with r0 or no PR (as r0 is default).

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


