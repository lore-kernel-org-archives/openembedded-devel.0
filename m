Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ngf0j-0000XL-FD
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 14:59:48 +0100
Received: by fg-out-1718.google.com with SMTP id l26so341261fgb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 05:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=O9iajPYjzIYrHgP9WJazUeFYEUnYnN03G+4T2ZZvPlY=;
	b=oe2Cm6Av5TQDJ0znIDCbAARTEFrcbCm2dpH2CeRGjgA8M7WQ+hWOJT+4AOP7bXlmxU
	LsBv+83RIJUhd+Balb1B6ruLP68JJz16Ee4tvgAsJKn8nEHcX0ZWZLXYqO2JAz2PKza6
	6d9LXxvtR0jjQdCUwY35EPSZMnJ3fpdLVoVbg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=Rx0WHbzLLyztAf4e+GdH1qPI99z8PLsEV5KWZOnz7iOZ6G3vNn1NVQFa/gZe6DnZYf
	Lxgt68BCR9c8cwfPavEsmmevrp2YRaes3y95OynMEsH1WShETrQerhX3miYu+MPOI+0V
	VrjDY5b1x1/BbZyzaeJ6YOq9/FD3aQs/zUKr8=
Received: by 10.87.2.15 with SMTP id e15mr6866036fgi.22.1266155830590;
	Sun, 14 Feb 2010 05:57:10 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm2598385fxm.1.2010.02.14.05.57.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Feb 2010 05:57:10 -0800 (PST)
Date: Sun, 14 Feb 2010 14:56:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100214135613.GF5364@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Sun, 14 Feb 2010 13:59:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm just thinking about using bitbake only in minimalistic chroot.

What are advantages/disadvantages?

How I see it:

Advantages:
1) more secure (I started to use separate user for bitbake, when I
   started to play with bitbake master instead release - because that
   warning it said), but chroot is even better.
2) less problems when autotools pick some header or lib from buildhost
   instead of staging
3) easier to check, that -native package is missing for some important
   lib

Disadvantages:
1) Few more MB for building environment (extra libc, gcc, binutils, git, 
   svn, sh, etc. installed in chroot
2) More administrative to keep chroot system updated
3) harder to check, that autotools won't pick something from buildhost
   in normal environment before pushing new version/recipe (ie I won't
   have SDL libs installed in chroot, but everybody else will and maybe
   build will fail for them after I push some recipe.

If nobody points some big disadvantage I didn't think about, I'll give
it a try (with precompilled gentoo stage tarball it's task for half an
hour using cp :)).

Using some sofisticated sandbox setting (as gentoo ebuilds do) would be
also good alternative, is someone trying that?

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


