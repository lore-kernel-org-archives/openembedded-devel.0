Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NVPme-00053s-PY
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 14:30:47 +0100
Received: by fxm4 with SMTP id 4so20976561fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 05:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=apjlCGceu9H2WgJlR4fp2ZM9lUcZFp42ynLJxlbYb+U=;
	b=K4sAD+zbOk80crjhcU+Hh8qtATHP1mmBa+e/wsirIBwJmH9WkV2OW2UzSmH+2/nRG0
	sDfx+mpkIsFt7VZ3FzAKzFOarjFzBm+fdOBIC1Ur5zdvg6CVUnHnxjKbPwNy0O/3Dd9i
	Zb2ncAbcstAenew5kRRNGREasCbcFXpCorzf4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=n7LSi9PJMaJQ29OJ/dOAa8RCGLjBLBVxu0YPoXq4iEpSPf1uqdgvNxlckAZ9SM27ob
	3rRm49m5wgb/br7/RsTgsQAjFsEY700j+ndEzzXmbNUNMzP/xS6+eRx8JUqk5A0MzmzI
	NPtkPGe9GFISeW4O3oWjKNbVDovK7zHsXDCZw=
Received: by 10.223.5.8 with SMTP id 8mr1020288fat.48.1263475713624;
	Thu, 14 Jan 2010 05:28:33 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm337730fxm.2.2010.01.14.05.28.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Jan 2010 05:28:33 -0800 (PST)
Date: Thu, 14 Jan 2010 14:28:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100114132830.GA23665@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt4 GLES (once again)
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
X-List-Received-Date: Thu, 14 Jan 2010 13:30:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

With qt4 providers set only in compatibility-providers-conf and default
versions (no P_V for qt4 packages).

I got lots of bitbake errors like this:

NOTE: Runtime target 'qt4-x11-free-gles' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['qt4-x11-free-gles', 'virtual/egl']
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'virtual/egl' but it wasn't found in any PACKAGE or RPROVIDES variables
NOTE: Runtime target 'virtual/egl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['virtual/egl']

Whole bitbake -D -e qt4-x11-free log is temporary here 
http://jama.homelinux.org/org.openembedded.shr.images/qt4-x11-free.log

With 4.6.0 versions (as specified in conf/distro/include/angstrom-2008-preferred-versions.inc)
there is only this 1st error.

It probably builds ok after those bitbake errors, but is there 
some way to silent them in case they are harmless?

Not sure if it was different with provider named qt4-x11.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


