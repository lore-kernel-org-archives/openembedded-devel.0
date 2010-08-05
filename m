Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OgvkW-0005xe-J2
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 10:24:28 +0200
Received: by fxm12 with SMTP id 12so2797090fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 01:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=ihHPlBEecNmq5Vn4OGGVvxDZ7r9mEQ0jFObYVNvxv94=;
	b=n35YN0UE2OvXt8Fjaijf/aL9pvr7HIF/ex3+VBkAOy6bmXdHSp136CkdAiCdDUkT5C
	B+BReXo6G8Ewa1PsIFCo6vxycsSlaGUA+7HZjRkws7u9rCnfCXeHNvhF2r98v0MbchyQ
	GMZnwb73G6za0TwDUx1kxKUY/7HcjSJIIzoa4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=Qkgs9AIH0jJmSWwN+d/IZ85gwO7hlxZfQw1T7k3BuB9ioO1cgI0t4MVXWa5k/lck1z
	ypI31CeYJJ9PBcOLJX0BGkbAYuNhtv8FaH5NPHX4ziKyj33KM2iOk0Bd6Gf0iiAHhGJK
	vUO/ZI4/y6QZ164TMWnUmqGRfK0ya78nTRRHY=
Received: by 10.223.113.144 with SMTP id a16mr10171348faq.41.1280996659621;
	Thu, 05 Aug 2010 01:24:19 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b36sm3343605faq.35.2010.08.05.01.24.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Aug 2010 01:24:19 -0700 (PDT)
Date: Thu, 5 Aug 2010 10:24:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100805082440.GE29578@jama>
References: <E1OguCD-00023v-03@melo.openembedded.org>
	<20100805071201.GB29578@jama> <201008051138.00510.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <201008051138.00510.khimov@altell.ru>
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
X-List-Received-Date: Thu, 05 Aug 2010 08:24:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Aug 05, 2010 at 11:38:00AM +0400, Roman I Khimov wrote:
> В сообщении от Четверг 05 августа 2010 11:12:01 автор Martin Jansa написал:
> > Maybe we should add also
> > --accept theirs-full (just in case)
> > --force (to force overwrite of existing files)
> > 
> > ie
> > matchbox-panel-2-icon-themes_0.0.1.bb
> > matchbox-panel-2_svn.bb
> > are checkouting/updating tiwo different SRCREVs and every few builds you
> > end up removing svn checkout from downloads dir, just because it
> > refuses to upgrade to newer revision (applets dir already exists there).
> > 
> > Any objections (someone intentionaly keeping dirty checkouts in his
> > DL_DIR)?
> 
> No objections here.

On older buildhost I noticed that
svn, version 1.5.1 (r32289)
doesn't support --trust-server-cert

Added in 1.6 http://subversion.apache.org/docs/release-notes/1.6.html

I don't know if it's worth it to force builders to upgrade subversion or
add their FETCHCOMMAND_svn UPDATECOMMAND_svn to local.conf.

I'll send patch removing --trust-server-cert and adding force+accept.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


