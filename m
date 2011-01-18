Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bgamari.foss@gmail.com>) id 1PfFsS-0001Dw-GF
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 19:01:56 +0100
Received: by qyk36 with SMTP id 36so6380016qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 10:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:user-agent:date:message-id
	:mime-version:content-type;
	bh=D7ljbQXGlYQoi4r9JWjDlwocD4EQIjBXVensGyp4QQE=;
	b=O9BfqYLz4edcHfNESOdug1lxKTGG2pyrFe4KgCrwLsjwkBATrCY6d1GEmj/fyifqSq
	zxnmKbIweWLdMGCkZy1kvUYNnEsIxLfy5toaO9w0PqIS6WUBKsBaCMaUQKG6RF0AZEMz
	X23pvDwjRlQU9oCsKarjLNdHKAJK1NYX5tv+s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:user-agent:date:message-id:mime-version
	:content-type;
	b=qXx80z1Fw5oU8BgH/OJli+ZKmXNd6vH3/oG+kf1L+b5YJBCtn5yEzZTjzDAXKcAnrm
	SZku9pR2oRonQqYpiWHFJOMHgaBWM2WBiNzcBXaBadRwZ4cCFi+oUBPt+/NbYYgEHdw4
	3N7qHquC91xYAhe4BR2eTVv4Zka/uTZJUN+H4=
Received: by 10.224.28.76 with SMTP id l12mr5341036qac.294.1295373677076;
	Tue, 18 Jan 2011 10:01:17 -0800 (PST)
Received: from localhost (gamari.physics.umass.edu [128.119.56.223])
	by mx.google.com with ESMTPS id nb15sm3972707qcb.26.2011.01.18.10.01.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 Jan 2011 10:01:16 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
To: openembedded-devel@lists.openembedded.org
User-Agent: Notmuch/0.5-17-g2d1420b (http://notmuchmail.org) Emacs/23.1.1
	(x86_64-pc-linux-gnu)
Date: Tue, 18 Jan 2011 13:01:15 -0500
Message-ID: <87lj2im6qc.fsf@gmail.com>
MIME-Version: 1.0
Subject: Dealing with ttyS -> ttyO rename on OMAP3 in 2.6.37
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
X-List-Received-Date: Tue, 18 Jan 2011 18:01:56 -0000
Content-Type: text/plain; charset=us-ascii

As you may know, the kernel's OMAP serial driver has been fixed in
2.6.37 to move away from the ttyS naming towards the OMAP-specific ttyO
prefix. This was done in light of the fact that ttyS is apparently
reserved for traditional PC-style serial controllers.

I've spent the last day or two trying to bring my setup up to a 2.6.37
kernel. So far this has been quite painless, although I did get hung up
on one simple issue resulting from this name change for several
hours. Namely, the inittab still uses the ttyS naming, resulting in no
visible login prompt to be started. This is in addition to changing the
kernel's console= command line argument in the u-boot
configuration. This sort of naming mismatch could be tricky to handle,
since openembedded users will no doubt soon be using both pre- and
post-2.6.37 kernels. Any clever ideas for how this could be dealt with
in an non-obtrusive way?

Cheers,

- Ben


