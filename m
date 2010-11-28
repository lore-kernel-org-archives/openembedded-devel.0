Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PMdk5-0002oL-AJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Nov 2010 10:40:21 +0100
Received: by fxm17 with SMTP id 17so1706860fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Nov 2010 01:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=7xZNcCZxpxJLCGMpYaehF46lWPUJ9ORDvb63M3AMHd0=;
	b=ijbVaGDzxdrjYvXTN+R+1u3YJau68qgp40e3xqG15GA1LbAlmfUqh1ZLAb/b5gBSIO
	9HUIbiu9SkCltebWVMvwV36egBqsR1RlUCEbt0itfD+Po6SDDHXrKZjOIM8Oy9xwNNlf
	dlTryLJH1FCkPHZi5QuOaGn+z0P86zHmxHVC0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Q8zI7uhFLPHBPA2KlH7pQZSfeFRVT2+hG2pq2TxXerwiZ4Y+hzPZLTQJtK+tqFxvL1
	p38sNydjZWMZ+d/+HI0+m4XSb/8oIn1Ig7coO/Zek1XLTO2JfycMKJJT12iceUnmXq9t
	rp3jatbiVOZ6L7ZfN17Lq5q9tnvkmWeUA/m1w=
Received: by 10.223.79.7 with SMTP id n7mr3509799fak.33.1290937142198;
	Sun, 28 Nov 2010 01:39:02 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm867940fam.16.2010.11.28.01.39.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 28 Nov 2010 01:39:00 -0800 (PST)
Date: Sun, 28 Nov 2010 10:39:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101128093903.GA3387@jama>
References: <4CEE24A8.2090007@atmel.com>
MIME-Version: 1.0
In-Reply-To: <4CEE24A8.2090007@atmel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libXext-native fail to compile (x86_64)
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
X-List-Received-Date: Sun, 28 Nov 2010 09:40:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 25, 2010 at 09:56:08AM +0100, Nicolas Ferre wrote:
> Hi all,
> 
> While trying to build from scratch the latest .dev branch with:
> - angstrom-2010.x distribution
> 
> Build Configuration:
> BB_VERSION        = "1.10.0"
> METADATA_BRANCH   = "dev_for2010.12"
> METADATA_REVISION = "a1bba89"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "at91sam9m10g45ek"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "next"
> TARGET_FPU        = "soft"
> 
> 
> I have the following error with libxext:
> NOTE: package libxext-native-1_1.2.0-r9.0: task do_compile: Failed

fixed
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=b2822ad25e2a3db8936df34b0aebb65747f3f5d9

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


