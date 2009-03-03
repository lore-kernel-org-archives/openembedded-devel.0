Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <piernik@gmail.com>) id 1LeTwi-0003Xf-QX
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 13:42:04 +0100
Received: by mail-fx0-f167.google.com with SMTP id 11so2352845fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 04:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:date:from:to:subject
	:message-id:in-reply-to:references:x-mailer:x-face:mime-version
	:content-type:content-transfer-encoding;
	bh=TDCy705pKUoZQ8SFy5EaZIMpK5/LS3aF4jqN+CLY5Bw=;
	b=EigrxAZpS7cU7IQxpCs6feexDT+MtKZ/1LgWLdqjs5VLSsXCcBfYH7x9vNu5bfX3Ov
	axrUmylJ8iIPZ6qR9pOPT5EBSnawJ+uLA9adr1FtDmeiIyvAY3x9pcQB0FBBpWn7jTXg
	8SZ1opepiIMo48ZKjlGj49gVlubm+sTd10gqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:subject:message-id:in-reply-to:references
	:x-mailer:x-face:mime-version:content-type:content-transfer-encoding;
	b=s5QmmPZrDdV4/XzkdortEUYK3Eu1uGrWYscfIwE1t4Td6lOdmuC5+1cs54DhiSxY7e
	pYDGoqUUEek61CNPBHqMUMWsad4dcMSaqV3xs3lD9CB+4ZATZwYAMqpd56Pp2pCmsqhU
	dkCn7Nzgc+DzcRKur5anqBS2nmyA+2K+cy7bA=
Received: by 10.86.82.16 with SMTP id f16mr6781558fgb.26.1236083883115;
	Tue, 03 Mar 2009 04:38:03 -0800 (PST)
Received: from mobil.site (87-205-79-201.adsl.inetia.pl [87.205.79.201])
	by mx.google.com with ESMTPS id 4sm568046fge.44.2009.03.03.04.38.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Mar 2009 04:38:02 -0800 (PST)
Sender: Krzysztof Kotlenga <piernik@gmail.com>
Date: Tue, 3 Mar 2009 13:36:26 +0100
From: Krzysztof Kotlenga <pocek@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090303133626.5706500e@mobil.site>
In-Reply-To: <20090211213312.919E8189338@amethyst.openembedded.net>
References: <20090211213312.919E8189338@amethyst.openembedded.net>
X-Mailer: Claws Mail 3.7.0 (GTK+ 2.12.9; i586-suse-linux-gnu)
X-Face: U{.sZrXl+;
	-boiB]N4=wPdrR|YT0!fcISDza0Y}=n*z')0S{iZW<Uy$s~&}09$vR^IuFq,E0)iS]JFG0-3Wmow(MTQ!]rN*<Pa(<PO:*9RFU_\(15s:]Pj}lCTcP(,pUZLy"[4/jpF1l^Y4z!>jV!F"n+n2Rpp8jcp53&OWJgn?AJcD2
Mime-Version: 1.0
Subject: Re: [oe-commits] Frans Meulenbroeks : opkg: fix bug that occured with file names of exactly 100 chars in the tar file
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
X-List-Received-Date: Tue, 03 Mar 2009 12:42:04 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 4e1b79d2d824ae7e0204251a09e852c24045c54a
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=4e1b79d2d824ae7e0204251a09e852c24045c54a
> 
> Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Date:   Wed Feb 11 22:32:06 2009 +0100
> 
> opkg: fix bug that occured with file names of exactly 100 chars in
> the tar file
> 
> ---
> 
>  packages/opkg/files/opkg_unarchive.patch |   13 +++++++++++++

Hi,
this is actually a new bug, it causes paths in .list files being cut at
99 characters. I've run into this issue when I couldn't find gcc in
meta-toolchain.

-- 
kjk


