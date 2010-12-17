Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PTmPL-000192-1F
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 03:20:27 +0100
Received: by iyj18 with SMTP id 18so883511iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 18:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=jxySHaiUgTKvAU5qFoOEa+6KY5zEIUmdoBzXXOKL2Tk=;
	b=Aizol8xmcjecnbRQTuyS2vH7sXde8VWnenCaRJN0fBiM6Yykqs8kK0s7//aoRnnDeT
	H9ea2fwQGEPYl8dBb3GhtBRXOe7NVgh3fV7962QSApGH266fYdZ66VafcCLBqVHTazAV
	/l4IwSOeYBmtmjjH94H+qu7+W/EJlYsZ1skqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=nPH6g+yVDCErRjfXS/RECLOlnwU64ZCqyPlJPGIa9uIYSadSy0cfe6aMiOFAedF4rr
	6KHq+DEIZra6MxST8nUvfD/GLRRGiTBa/QhJ/OlEnl1dNAaRr0PVbM4Ml4IZbrRAeML2
	fkY/vHVUivQqphdFTyoCi3H5+2XupU+htm1WE=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr1340927ibv.32.1292623710795; Fri,
	17 Dec 2010 14:08:30 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Fri, 17 Dec 2010 14:08:30 -0800 (PST)
Date: Fri, 17 Dec 2010 23:08:30 +0100
Message-ID: <AANLkTin7AtzCpMmNq_SSHcbDjZqaFXcdgd6T5fHrfb0r@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: do_rootfs and mkfs.jffs2
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
X-List-Received-Date: Sat, 18 Dec 2010 02:20:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

I just tried to make a jffs2 image, but got an error that mkfs.jffs2
was not found.
Apparently somewhere a dependency to mtd-utils-native should be added,
but I have no idea where.

Frans.


