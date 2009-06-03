Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsfa-0000e6-T9
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:46:26 +0200
Received: by fxm20 with SMTP id 20so73110fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=dpnJnjthcQOsDDOZHIgocNE9sR/GuUcLyfWy1Dwlxwo=;
	b=wYmFefhPGXkItOkb+XIMaOByfSb7rYTcJPYH4BilRumFgaGjrN3x9e4tOCP+/RbbSA
	t+woghK64tUJXEUbPTDfSVyAlV6Xt5CHToIpFKHeN63A5eYuPFwa3llx6xx3EpScI2S7
	6mylimw5EJ3OFf5WPH5Nj02hDm/y59bsxAj54=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RJVef3iM0yIHVe1MVsfm6Yqv9dEwMM2F2d3e3pWYQroFTcbp/CwJ+gxmAKWk9eB6bi
	tHKfrf8eS2RlMLzNJ3KaHcAlCj6c77xrIfKL/9lHbWYB+5WrxGOlhv0hpCwpmekuv4JH
	T9Lme/Thg4BCTERGrBfX7wbSRXEpNByhV/9CI=
Received: by 10.103.214.8 with SMTP id r8mr730703muq.12.1244043447328;
	Wed, 03 Jun 2009 08:37:27 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id y37sm1607798mug.49.2009.06.03.08.37.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:37:26 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:10 +0300
Message-Id: <1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <20090603151754.GI26065@smtp.west.cox.net>
References: <20090603151754.GI26065@smtp.west.cox.net>
Subject: [PATCH 00/12] different qt4 related patches
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
X-List-Received-Date: Wed, 03 Jun 2009 15:46:27 -0000

This patchset:
- adds meta-toolchain-qte.bb to install toolchain with Qt/Embedded and
  all the needed tools ready to use for qt4-embedded development;
- adds directfb support for qt4-embedded;
- includes missing files to qt4 packages;
- fixes code style, generalize qt4 recipes and classes, reworked directory
  layout;
- occasionally ports pkg-config to INC_PR.



