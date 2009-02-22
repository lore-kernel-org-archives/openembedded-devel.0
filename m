Received: from [209.85.198.234] (helo=rv-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <linuxfpga@gmail.com>) id 1LbJCi-0005WB-Vk
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Feb 2009 19:37:29 +0100
Received: by rv-out-0506.google.com with SMTP id g9so1506238rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Feb 2009 10:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=EWmJQbSWZjNniEp2uBFkgAyHebUSJzisNYxxLT1QDFY=;
	b=LDAeQ9iOKxjyyS0pLq0AC1yp1RaIZE8jeeKOB4w9afDNJvLKcjfrTWZWREwriny34I
	/bgDYtTxdoDS95N0J1dd2SQUE14wcJtQJXxR97gGPBye32Ad6YER7sbzduwQApFVHi00
	x2sC4U3pN03WswCyelKGa3ZggmLjlIbbho5VY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=id9OvhAsBQKpKUJ+Z2Ms5J3MIxVjlJLFWSgPuHm5Fu7OlDvC9e7BTPURF5FkqpYGPo
	U2lAxtoiMrTuPECeFVfW8QgY47Pqo/eQl//jdrr9VoccYTGz28admq5/0wnF9L8YsneG
	O4+UoP3a4cRZ/GR+A58E03wyBTGIQELB4tccg=
MIME-Version: 1.0
Received: by 10.142.171.3 with SMTP id t3mr1570284wfe.26.1235327682780; Sun, 
	22 Feb 2009 10:34:42 -0800 (PST)
Date: Sun, 22 Feb 2009 21:34:42 +0300
Message-ID: <d741b6090902221034t224cd1e5ja6b3e863fd54bbda@mail.gmail.com>
From: Alex Williams <linuxfpga@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: koen@openembedded.org
Subject: Angstrom, ep93xx, broken rootfs
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
X-List-Received-Date: Sun, 22 Feb 2009 18:37:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello!
I decided to update my OpenEmbedded from git today. Result: broken
rootfs, many applications lost such as busybox and many other files,
symlinks. Tried to build minimal-image... One week before update I had
perfect rootfs and everything work fine... Resetting many commits
since last week did not helped me.
Details here: http://pastebin.com/m7ddd3941


