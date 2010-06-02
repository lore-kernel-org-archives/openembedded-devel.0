Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OJggm-0000Ad-Qt
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 07:40:29 +0200
Received: by fxm9 with SMTP id 9so670866fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jun 2010 22:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=txtZJOFV3a+bvKqtnFE9HuaGnsb785TXeNlZKziNRWA=;
	b=CP8IZcPriFF2tWze7EnXvwHiS2ztDu2UVRO/2KXJ/SYWAAzGBHA5UIREArn11UduZ2
	RqIIOw8VPD3t2zv2+fldQgF+oXVEIUqjVMHCsx6mlKkjMPQgxoLZPb0Ne8I9SwMZ6fNs
	LqA0Cyz2FcKk5MHue8wVlat/ahhA8ysYN0Kes=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Wd9wC78l/xnqEslwZavO3VIWBeOamIySsvdB1xSmL3xwj+cLVmCCOjiMeMuyud5YA/
	DiZfO706bsRvM5goI1sX5veCyrXuPS8Q/AeCmxE2b1sriDTg5nglvUss1EH7WoFgj7ER
	bMJTrZ9Lf90OAmzKb92V6APDigVAV21103zgU=
Received: by 10.223.17.150 with SMTP id s22mr8105817faa.14.1275456974129;
	Tue, 01 Jun 2010 22:36:14 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r12sm50589645fah.20.2010.06.01.22.36.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Jun 2010 22:36:12 -0700 (PDT)
Date: Wed, 2 Jun 2010 07:36:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100602053606.GH5446@jama>
References: <20100601195258.GF5446@jama>
	<1275428876-1406-2-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTikc5u5SS7Nxlwc0RuaXrVlYl6-JMyC9Jto0S7gm@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikc5u5SS7Nxlwc0RuaXrVlYl6-JMyC9Jto0S7gm@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] klibc: fix packaging without moving PACKAGES and FILES_ back to recipes
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
X-List-Received-Date: Wed, 02 Jun 2010 05:40:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 02, 2010 at 12:59:45AM +0200, Andrea Adami wrote:
> Martin,
> 
> building klibc_1.5 we have the same
> NOTE: Not creating empty archive for (dmesg,sync,ls)
> 
> and building 1.5.18
> NOTE: Not creating empty archive for klibc-utils-insmod-1.5.18-r14.1.5
> 
> If you prefer to warn the user that it's version lacks those packages, ok.
> At first  I saw them as packaging quirks in this case.
> Again, no strong opinion :)

Then it's 1:1 :), someone else with some opinion?

My point is that I see "Not creating empty archive" as harmless warning
about me using version not providing some files which some other version
does and this message I see quite often during builds..

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


