Received: from mail-pd0-f176.google.com ([209.85.192.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1ULV4N-0000vL-B2
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 09:54:20 +0100
Received: by mail-pd0-f176.google.com with SMTP id r11so173889pdi.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=txL3CNmL4S8aIpjNWDEMTmT7HxZErEfRfFCqx1AGl+Q=;
	b=D5cKilaS25pI5jBZqRyT18FygjS6icHpga1Azj7QxuebKiOOKCsxJ2GrOLw3VHyoGO
	NeLjOGZ5kCZaYqOCXqbdElUDC9Z/+iZjQLrR8RkB3QNNtnDGr6xVZrR9JsrkesCrNR5Q
	y0eb8fAkGf3pFTtssVfOQsen+SxIYGt1NdaSZTLdSBW1Mo1FiW8wusyJmGvZeuX1GoSM
	JudCzOolZKnXE/LmKsdKsGY1vdDccfMVtZTRUZCToUee2krABW4ceZQAwBut5v5j2Fw1
	NfYC9Kc7Uz++MGEV3dtHyjF03EobTZUHo+EmoQcNeAMdmLuB0lHIMdINAGQ/o1oW7ydh
	+QLg==
X-Received: by 10.68.171.99 with SMTP id at3mr2494918pbc.136.1364546211014;
	Fri, 29 Mar 2013 01:36:51 -0700 (PDT)
Received: from titan.du.ae ([94.205.105.6])
	by mx.google.com with ESMTPS id u9sm2595184paf.22.2013.03.29.01.36.48
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 01:36:50 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 12:36:37 +0400
Message-Id: <1364546198-20792-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [oe-core] [v2] gcc-4.7: Refactor gcc-4.7.2 patch files.
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
X-List-Received-Date: Fri, 29 Mar 2013 08:54:21 -0000
X-List-Received-Date: Fri, 29 Mar 2013 08:54:21 -0000


This commit renames and re-orders the gcc-4.7.2 recipe patch
files. The patch files are now git am'able, so that you can
directly apply these patches to a local copy of the gcc
git repository, to develop futher patches for the gcc-4.7
recipe.


