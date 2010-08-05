Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OgwTA-0000U1-8B
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 11:10:33 +0200
Received: by fxm12 with SMTP id 12so2808955fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=ur14ohuroQbqUZHX97xdveLi0/o788gLNT0+h+f15jc=;
	b=v+w0t8GGtenYLdbSvRz/qSs4x12DCEio0VwSAvTrhw3ESQl86uwZQELsADIjdRmG5Z
	QFhEFFezMPsA4MqYrqDw4otZ/JwkqYppjIbdnzg58VgkHYXe+Njp8REhNbW6IuELCIVa
	f/iov130NkcikUU/kYBjM0CaMCmvEreQRVdWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=rEIVQQPHl7oRcl/j4MtNVKSch0YfwGPK/NfpVhA9b8gyj7eLCDKiDXuGiarcHys7YH
	rbulW5Y9LhGBWPpy+sCu6gxmz7rdyEn0hMZ5bmTrm312SUzc1qoT12na0+dQpT6jJz7f
	BEZ3rm03rq8FdI4Z18NOA6pMaSs/b+TEaRuiM=
Received: by 10.223.103.148 with SMTP id k20mr10162920fao.101.1280999426790;
	Thu, 05 Aug 2010 02:10:26 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r8sm3357426faq.34.2010.08.05.02.10.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Aug 2010 02:10:26 -0700 (PDT)
Date: Thu, 5 Aug 2010 11:10:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100805091047.GF29578@jama>
References: <E1OguCD-00023v-03@melo.openembedded.org>
	<201008051138.00510.khimov@altell.ru> <20100805082440.GE29578@jama>
	<201008051241.24091.khimov@altell.ru>
	<AANLkTimfaAw_wmNddavmknv4O5haMqLuXDa8v7ECYZyF@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimfaAw_wmNddavmknv4O5haMqLuXDa8v7ECYZyF@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Thu, 05 Aug 2010 09:10:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 05, 2010 at 10:55:05AM +0200, Frans Meulenbroeks wrote:
> 2010/8/5 Roman I Khimov <khimov@altell.ru>:
> > В сообщении от Четверг 05 августа 2010 12:24:40 автор Martin Jansa написал:
> 
> >
> >> I don't know if it's worth it to force builders to upgrade subversion or
> >> add their FETCHCOMMAND_svn UPDATECOMMAND_svn to local.conf.
> >
> > IMO we should not break support for major stable (or LTS) distros, so my patch
> > is broken.
> >
> I agree that we should not break support for major distros. but
> without your patch some of the recipes cannot be build easily.
> The solution of Martin seems a good inbetween.
> 
> Frans

I've pushed my patch removing --trust-server-cert and adding --accept,
but --accept is only for >=1.5

If we want to support svn older than that ie:
svn, version 1.1.1 (r11581) in RHEL4
maybe we should add subversion-native and drop ASSUME_PROVIDED?

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


