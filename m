Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bgamari.foss@gmail.com>) id 1PXMVA-0004pM-63
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 00:29:16 +0100
Received: by qyk8 with SMTP id 8so9443757qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 15:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=BpSw5ewGr+6ly0+y56KBw+ehJmMK6aXoj+oLC7Cp+cI=;
	b=hWOqTMuzWmyblf4zrhEtm5axeD1OkgX+eT0SZjx/wMaEiANT+L2XYJI6ScysRAKznx
	LHhQgCMuGCuiraThlgh5cpS6nHP6gSoTM1VPMmY3oO7WUShOjiTmA3bFe5NqlNv07+fQ
	8oTiS0zqKktnDrpHHM2dfn2bUdF2pneLFo4Gc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=DREtTceuBYXMceNSfl/QARZBORCxXGVSbdKX47A9y0e8HZ7uZLrBmsXe/Yq92xuZpK
	2WTNLivpyLYryOhlxNw/SjhrHL7g20k300P5wc/7NMtQpxoEPz6waNh127ISDHDlB42X
	GmV9Xvt5rbRfXOqwgdbaNYw7dUxGeDz0cm6LA=
Received: by 10.229.187.196 with SMTP id cx4mr11452670qcb.178.1293492489262;
	Mon, 27 Dec 2010 15:28:09 -0800 (PST)
Received: from ben-laptop (c-24-61-223-13.hsd1.nh.comcast.net [24.61.223.13])
	by mx.google.com with ESMTPS id t7sm6133841qcs.40.2010.12.27.15.28.08
	(version=SSLv3 cipher=RC4-MD5); Mon, 27 Dec 2010 15:28:08 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Dec 2010 18:28:03 -0500
Message-Id: <1293492484-13523-1-git-send-email-bgamari.foss@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: Boost 1.45
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
X-List-Received-Date: Mon, 27 Dec 2010 23:29:16 -0000


For a long time, the newest version of boost in openembedded has been 1.41,
released over two years ago. As far as I can tell, the reason for this is that
the recipe uses the cmake branch, which has been stagnant for the last several
years. The reason for this is that the build system used by boost, bjam, is a
travesty at best and a crime against packagers for the most (see the comment in
the existing boost.inc for another poor soul's thoughts on the matter). Over
the last few days, I've been trying to bring my embedded environment up-to-date
with the current openembedded tree.  Unfortunately, as it turns out boost 1.41
has some serious issues with gcc 4.5.

After quite a few exchanges with the boost folks and many hours of frustration,
I think I finally have a working recipe. I'd appreciate it if people could try
this and perhaps give some feedback. I can successfully build the package, but
given the quirky nature of the build system it seems likely someone will find
some configuration-specific issues.

Thanks,

- Ben



