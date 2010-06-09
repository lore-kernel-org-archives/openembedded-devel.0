Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMQSL-0007JX-7m
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 20:56:53 +0200
Received: by fxm9 with SMTP id 9so3989501fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 11:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=NL+E64maoWM5Z7GY76yOWw+he6GVLjqZljtO6hwdhng=;
	b=UHdZfjE2f1g1UxzXymx6ZIDS9+M6K5JzK+6ejHGrKkckG3wxjHplH8WRQkDQOQlM17
	uWIoR/cDtsNv4pNg9oyZPQERW/XQTowXGw8UvTp52bQDgL4bJBdN+DW64q9VZuFLuCmw
	MTe1+3w+lnb7uvnamUM9Sb2ZQMC88WtcYkObg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Dc8a3JYCOUV1JrgwCIOStWN2J3xx2gWVi4zCRK4NKZwMGlHwnxIKoiVClmuOw68KHx
	j1S4FRhszy8FNUEjShWN9AN1tls/ngHteuFhh62D9eW4TZ+UI2YBWjkli8l49oOojRdu
	BWcX8dC/q2YdfwLboxLzVrn+gZLKg0vyRam4o=
Received: by 10.223.40.136 with SMTP id k8mr1222848fae.24.1276109551062;
	Wed, 09 Jun 2010 11:52:31 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id u12sm4831696fah.16.2010.06.09.11.52.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 11:52:30 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMQOG-0001GE-GY; Wed, 09 Jun 2010 20:52:40 +0200
Date: Wed, 9 Jun 2010 20:52:40 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100609185240.GP14941@mx.loc>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
	<1276103437-2755-4-git-send-email-rep.dot.nop@gmail.com>
	<1276109098.4424.9.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1276109098.4424.9.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] busybox: picking IPv6 per default is not up to the package
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
X-List-Received-Date: Wed, 09 Jun 2010 18:56:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 09, 2010 at 07:44:58PM +0100, Phil Blundell wrote:
>On Wed, 2010-06-09 at 19:10 +0200, Bernhard Reutner-Fischer wrote:
>> diff --git a/recipes/busybox/busybox-1.15.3/micro/defconfig b/recipes/busybox/busybox-1.15.3/micro/defconfig
>> index 8431d19..f6eaa6d 100644
>> --- a/recipes/busybox/busybox-1.15.3/micro/defconfig
>> +++ b/recipes/busybox/busybox-1.15.3/micro/defconfig
>> @@ -608,7 +608,7 @@ CONFIG_TIME=y
>>  #
>>  # Networking Utilities
>>  #
>> -CONFIG_FEATURE_IPV6=y
>> +# CONFIG_FEATURE_IPV6 is not set
>>  CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
>>  # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
>>  # CONFIG_ARP is not set
>
>This change doesn't look very desirable to me.  What's the reason for
>it?

As long as you don't have ipv6 in distro features somehow, ipv6 will
not be available. See introductory message of this series.


