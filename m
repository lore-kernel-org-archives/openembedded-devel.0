Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tardyp@gmail.com>) id 1MljPO-0004kj-R4
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 15:09:57 +0200
Received: by fxm22 with SMTP id 22so73559fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 06:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=eraT+Zisgbn58FtQYfqbiIvDz7VPC3RtUsgVloEW/8c=;
	b=GNN3sY8hSxqttt5kXdV9l37c077FFx5OGPpKspUe7IDbmuxbmIDDv2qCo5FI8gwc6x
	W7U7RY4VMekFwKTd3xff7dWVfCJo1Hdi53kK1KByCeEUI1b5ccScO1d4X2LZXmIkLnuz
	yrtkqXHkLXxdqhUzprYPT20gQMShx6PMQbrh8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Y0Td/XTJi+F2JsS3NQdH+aAiLjz77Gtt3VQc3L/ZQAw8IKDUNtt1FBfU8YTvvXyaKV
	xZtNOTrixIuzJqxS2uMcLNdLvQ0usEKobAydcVQnp/kS9hEdBAo9nrl1/PjERQtn6s/i
	+LBu3mmkl+dqg+yNZpf1gH0U2A47bQ2/uBPMg=
MIME-Version: 1.0
Received: by 10.204.8.72 with SMTP id g8mr930107bkg.199.1252588166620; Thu, 10 
	Sep 2009 06:09:26 -0700 (PDT)
Date: Thu, 10 Sep 2009 15:09:26 +0200
Message-ID: <826a2b270909100609q3055ac48m1ab7d6ea76f7f0e3@mail.gmail.com>
From: Pierre Tardy <tardyp@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: tardyp@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: srctree and gitver
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
X-List-Received-Date: Thu, 10 Sep 2009 13:09:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,
Working on clutter, I want oe to build it easily, without making another
recipe.
I found out that adding those lines to local.conf will do the magic.

INHERIT_pn-clutter-1.0 += "srctree"
S_pn-clutter-1.0 = "/local/oe/localforks/clutter"
PV_pn-clutter-1.0 = "local"

The thing is I'd like to write:
INHERIT_pn-clutter-1.0 += "srctree gitver"
S_pn-clutter-1.0 = "/local/oe/localforks/clutter"
PV_pn-clutter-1.0 = "${GITVER}"

but GITVER wont get expanded:

NOTE: Running task 1 of 16 (ID: 1, /local/oe/poky/meta/packages/clutter/
clutter-1.0_git.bb, do_setscene)
NOTE: package clutter-1.0-${GITVER}: started
NOTE: package clutter-1.0-${GITVER}-r2: task do_setscene: started


-- 
Pierre

