Received: from [209.85.221.10] (helo=mail-qy0-f10.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L7uuz-0002Ts-1b
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Dec 2008 17:49:41 +0100
Received: by qyk3 with SMTP id 3so2909269qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2008 08:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=BOgQ+jPVE2MCS1D6Ccqlld21gOR6OBDUZOQW77KHx8o=;
	b=AiJcrnDb9sppuHVDZf44E/NprIjprYZ26QSgDypmRwzaX2sIRbooOKYbKddlkUdmtW
	RLcOwUJn41GX70WAt9xnYOzWcSEj+F+JDiKlPWMGZ/frwg4iZMVHQ+cIRujq8cGfWe1v
	REUIFr4vHigCdiB8fXl1rg09ERP/mtkRz2r28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=hV0mPgI4ZvrXA8w8DBNFVV6mw9sr6HSZ7hXVCE9mAW+ukllVptxkpDMhjVnGVk7spA
	2k0dNOXR8/vOUppiy1pcFIpO9TPTDdZ3GwsLcMrRhaOrxdf7bZz2IOwpB4X/7z8sydXE
	PmNWoDxN0admRYT2HUy7DtpSFDjpNyqUSiJgM=
Received: by 10.214.44.14 with SMTP id r14mr13584195qar.219.1228322764417;
	Wed, 03 Dec 2008 08:46:04 -0800 (PST)
Received: by 10.215.100.14 with HTTP; Wed, 3 Dec 2008 08:46:04 -0800 (PST)
Message-ID: <c384c5ea0812030846n604eccf0pe47d15f7122f0435@mail.gmail.com>
Date: Wed, 3 Dec 2008 17:46:04 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: [RFC Wild Ideas Department] create soft-links from <pkg>/<src>/patches/some_local.patch to <oe.git>/packages/<pkg>/files/some_local.patch
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
X-List-Received-Date: Wed, 03 Dec 2008 16:49:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

during maintenance of our local set of OE patches, it would be handy
not having to copy patches back into the repository.

i.e. the patch fetcher could instead of copy the patch to the work
directory, soft-link from the repo.

Does this make sense?

Regards,
-- 
Leon


