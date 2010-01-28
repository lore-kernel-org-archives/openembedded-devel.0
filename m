Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NadFo-0000f5-SQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 23:54:27 +0100
Received: by fxm6 with SMTP id 6so114297fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 14:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=GgYWG7GXyy61IEO81kt7kb03m3kZvUYbdGV1XYxY23U=;
	b=Q6EAvMT6AgStZbK8iRd2f2iMJIlAD85N6WANCF16IPaCmxTpOiKfqtehHz4Qb1uW0v
	lXjRNz0kGjCGxzUmxV88TJ9H+QAEY+JgaffxbQ2b6ARPCR8P/oYfWJrGarARn6H4nKRa
	CJdqEuno6JPxl4fwNyeaSDD0PPFLGLz+w5Dd4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=qXBe50WdkSa2rkDM5TREKRqnQm3hpdgDhkPUCqwVIPDvahEGgFXdH88s2FpGsBVVUD
	X0kA/HTJMjdN5K3aZGkrCTAnPyp1oCo8NjDoZxRgYHQTb/c2rgym1vwvJE//MkLryOo4
	39cZaIDGKfcHVsx7iD0VW3i8+M6kWfBDrOSgE=
Received: by 10.87.24.4 with SMTP id b4mr611430fgj.51.1264719121725;
	Thu, 28 Jan 2010 14:52:01 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm233632fxm.11.2010.01.28.14.52.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 28 Jan 2010 14:52:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Jan 2010 23:51:21 +0100
Message-Id: <1264719083-19638-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6.1
X-SA-Exim-Connect-IP: 209.85.220.214
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Python 2.6.4 and cython 0.12 - please test/ack
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
X-List-Received-Date: Thu, 28 Jan 2010 22:54:28 -0000

Hi,

with last issues with python bindings for E libs I tired newer python and cython.
E libs issue was found somewhere else, so it wasn't old python/cython fault, but 
as I already have those upgrades, here it is:

All older patches apply cleanly, no new breakage found with build test, 
few python apps tested on arm4t, but cannot test them all properly myself, 
please try it and report possible findings. 

If nothing found in a week, can I push it?

Tested on build from scratch of shr-image (om-gta02) + building task-python-everything.

Few formal fixes already pushed now there is failing:

ERROR: '/home/projects/OE/dev/recipes/fam/fam_2.7.0.bb' failed
http://tinderbox.openembedded.net/packages/447591/ - missing iostream.h - not python related

ERROR: '/home/projects/OE/dev/recipes/python/python-epsilon_svn.bb' failed
http://tinderbox.openembedded.net/packages/447594/ - this is new with newer cython 
  - but epsilon is deprecated by emthumb and not supported by E devs

ERROR: '/home/projects/OE/dev/recipes/python/python-pyqt_4.4.3.bb' failed
http://tinderbox.openembedded.net/packages/447592/ - doesn't look like new python fault

ERROR: '/home/projects/OE/dev/recipes/dtnrg/dtn_2.5.0.bb' failed
http://tinderbox.openembedded.net/packages/447595/ - gcc-4.4 needs patch



