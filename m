Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QVB84-0002Vu-7f
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jun 2011 01:28:41 +0200
Received: by pvc30 with SMTP id 30so1529719pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2011 16:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:mime-version:content-type:content-disposition
	:user-agent; bh=ZFvbPCGk3MBdUQojCBS7JHzxKRmVzhY2LlLkR+BlxG0=;
	b=aLotbCh0A3ZJIdL/uvNnherfyJwYtXNCTVGv6SQUd+G31gYthed3OcX/a8irgI2KjS
	h4Q4NnKQpetUqZAE22ZpR+rE6iVatTPyMYlD03INdblGgqCmnX+ZMpbkF/8EFlorI3Ic
	JLAUUMWUb04jeIyzM1DgfEukcC9YZp+fTDDDs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:mime-version
	:content-type:content-disposition:user-agent;
	b=NynkgWphz1cqguZF53rDGo51yiqeF4E7ukJw93R2Neii2F37pZ5WSgvkHQDh7tHf6R
	bZJwBUKv9U2Nr1TdE5P/P4/vpDRG+Bi/IcTEDw/I9fEmTM9wCGkXCveXUzLwM7fVo/c9
	af3kBQztF3C09s3bGPB7giZYwr8fSv0f9XOOY=
Received: by 10.68.38.133 with SMTP id g5mr1249956pbk.83.1307748317667;
	Fri, 10 Jun 2011 16:25:17 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c5sm2681229pbj.9.2011.06.10.16.25.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2011 16:25:16 -0700 (PDT)
Date: Fri, 10 Jun 2011 16:24:55 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110610232455.GA20068@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: git remote prune is needed on oe github mirror
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
X-List-Received-Date: Fri, 10 Jun 2011 23:28:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I see that oe-core when cloned from github still shows the 'maste'
remote branch which has already been deleted in oe-core repo.

So we need to run 'git remote prune origin' periodically or somthing
similar operation. It seems it does not get the removal information
when the mirror is updated

Thanks

-- 
-Khem


