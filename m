Received: from fg-out-1718.google.com ([72.14.220.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NHQIk-00032u-37
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 00:14:05 +0100
Received: by fg-out-1718.google.com with SMTP id 16so443713fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 15:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=vgfJRdHa4QC59CeLoVCi3wsWw1qtWO4afPcqUXBtMXA=;
	b=HXrMDjKqia5tsBv+RGGYuy+ivO7mDPENA/3upFLvLrDelZkUVa4dbAM+0RhZ5FbYVJ
	MrXMTME9fbXb3vpFOSCtB0UNO1bOQ81ZW9JTsXXkvPRr6pML4YmFFKQkb3wFCkU4YqbF
	rd/c8wp66OZtYQf9zs4aTbdjdexej0uAkYpUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=i6LK4fH3G46AAew2z5/QnMRdYpUqJk5TVJQBrr/0/7AFV8PkWVXW0tBR4LuA5OjqmE
	q9uuKmvBcB+aa/QEU7ckGMFSM9iNYxxZLfQmd6QJUmoB1rRBmbGgGbmWiBH3GN2bdFFl
	uHKFGz2J+Y0ZDRk7WnFPbdrJeJB82eDNLY3DM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.130.145 with SMTP id 17mr568005hbj.52.1260141145076; Sun, 
	06 Dec 2009 15:12:25 -0800 (PST)
Date: Sun, 6 Dec 2009 21:12:25 -0200
X-Google-Sender-Auth: 91cb19ac1d8b08d2
Message-ID: <be7a9f3d0912061512x5bc07adeo82c10cecb19af423@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFH] Best way to handle qt4 native tools
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
X-List-Received-Date: Sun, 06 Dec 2009 23:14:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Here at work we'll need to integrate few packages into our OE tree and
most of them has been quite easy to do, as usual.

After integrating most packages we are now on we need to build a
native tool to be used in the compilation step and this tool depends
on qt4 to be compiled. So we'd need to have a qt4-x11-free-native
recipe. What bothers me is that we do most of qt4 compilation already
in the qt4-tools-native and I wish to discuss the possibility to
change this to qt4-x11-free-native and this to provide the
qt4-tools-native one. What people think about it?

Cheers,

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


