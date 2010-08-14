Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ok4ga-0001C2-Fw
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 02:33:22 +0200
Received: by fxm6 with SMTP id 6so2192117fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 17:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=rM0h2IPw6IVyFpFOSz9zKbUMECvW7ql81DXMcTjYdR0=;
	b=OP5PrJJOtlUCNIT68ltrlKA4VzxqjsEJZrN+Wz/t+hW5F2DxGxc9oLu8KqsR1Z1dNO
	lUqd43GRnKY1gKx0mAX9JL5pCeUdykUSK0VDKfJ6AmqEhu8wMmOyB38zB1EN0pUfU28n
	HorMMtMpCN51LcWHynl3/m72rJHrrqyA7AbzY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NqA4zsUmEAa15T4hUy5RuTk5Qt6Q/G5MqbMV+cYFa8unJxdua59jRu4tmvU6u4IoRH
	x3PRjt9Q0O69/zn12HIepKzBhko4mgF+xYbLbE2QTXKkSmWTLBFZI2KIpeEmUFlxfbHy
	XVcrLeaCW2hhPVDFXUZjHM63FW1EethtHRaIo=
Received: by 10.223.126.14 with SMTP id a14mr2742199fas.44.1281745984784;
	Fri, 13 Aug 2010 17:33:04 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c20sm939941fak.9.2010.08.13.17.33.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 13 Aug 2010 17:33:04 -0700 (PDT)
Date: Sat, 14 Aug 2010 02:33:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100814003307.GB10076@jama>
References: <1281468568-8990-1-git-send-email-morphis@gravedo.de>
	<20100813215226.GB19855@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20100813215226.GB19855@excalibur.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ecore: remove fix-ecore-fb-initialization.patch
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
X-List-Received-Date: Sat, 14 Aug 2010 00:33:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 13, 2010 at 11:52:26PM +0200, Stefan Schmidt wrote:
> Hello.
> 
> On Tue, 2010-08-10 at 21:29, Simon Busch wrote:
> > Removing the fix-ecore-fb-initialization patch as it let ecore open the supplied
> > touchscreen device twice which results in an error on platforms where the touchscreen
> > device node can be opened only once. Furthermore I doubt that it is necessary to open the
> > touchscreen device node more than one time.
> 
> Sounds good, but I want to hear Mickey on this before pushing it as it is his
> patch.

Tested on EFL bump I have in my queue and doesn't break anything on
om-gta02, so look OK.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


