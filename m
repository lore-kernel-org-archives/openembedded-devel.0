Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1O2MCI-0003MJ-7H
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 12:21:22 +0200
Received: by fg-out-1718.google.com with SMTP id e12so2422285fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=QbXZMW1DIblpRUKuS+JE1dGlyW131FOeLXK/YJwZZcs=;
	b=CPqag5Fku19T6mhXZMd+o3Aqru1N4aaJCVOy/WXa8FPNCr6upSdzMpoH+1/TlO48nZ
	wVwFimoVmcBgV371/RlSvaCSJ4+CUBQv52izU4jdfGqXqOVTsY7yinifQw6XCiZ7Y/7l
	5t2Wz5bWhPD8mOQOjyqhRZVJEIPFblTqz/idA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ux8KjADV+A9NWBGYmrXCbWiP7Jclt4GXXQy8OW1N2yieOhFwCCTkXKPIJAqtpQ5lhV
	YDEMoGQex51Scd+U8P32EUvtZHi2A2A5S3+g8jo4E0/UZIYTpp8bqbpMcxYeJmzvx0SB
	3KYkU56oA3JHeXzgy5vwQGkSax7jElYM8xgZ4=
MIME-Version: 1.0
Received: by 10.239.170.136 with HTTP; Thu, 15 Apr 2010 03:17:55 -0700 (PDT)
In-Reply-To: <E1O2Ljk-00073j-3j@melo.openembedded.org>
References: <E1O2Ljk-00073j-3j@melo.openembedded.org>
Date: Thu, 15 Apr 2010 12:17:55 +0200
Received: by 10.239.186.84 with SMTP id f20mr508203hbh.176.1271326675258; Thu, 
	15 Apr 2010 03:17:55 -0700 (PDT)
Message-ID: <r2ud1b08f941004150317i789f7c89qb3f5a3bd14a7ac5a@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Koen Kooi : kernel bbclass: read version from ${B}, remove obsolete hostap logic that breaks the build (from poky)
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
X-List-Received-Date: Thu, 15 Apr 2010 10:21:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thx, this unbreaks the things!
Still, is masking the broken base_version_less_or_equal (bitbake's
vercmp) issue.

Chris seems working on it.

Andrea


