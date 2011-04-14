Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QAKYX-0007S2-FR
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 13:17:49 +0200
Received: by pvc30 with SMTP id 30so575252pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2011 04:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=FKhg6+LshSqUWKAt52mTkLYlbtNpbTGnQCbD28DgGHY=;
	b=c0CENWUpMNWwfDOUD3j2WGh43+KggDZNkzuosWnrDZF7lTk43feCUfFC4fv2Ek44wD
	hYmkYDirmm2kyjhAjje2RxDv1MG2fy6RsjbYhX8gnkyExseRCNA7CEvWL4LCy96GrRYJ
	czuIxgPPVfhN4y0ts3I1MtGlgm4mGV11e0QU4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=mgsUKvKv77HRNcAG2kFWTbrofAV0gPKknDtC7yzWEAVFvvlJy4thkZXgRpyEP40Pvm
	d/Oj+pLZttQkW8JIUwvRhKnhuM9zSclN89Snf8KKSNG7XgHOlPuLyOODJcnMN3WqAxyZ
	LGsvuKgd2cC7FLWTUvFRVXiy/Yag4y93PLnFA=
MIME-Version: 1.0
Received: by 10.142.212.5 with SMTP id k5mr211836wfg.285.1302779731570; Thu,
	14 Apr 2011 04:15:31 -0700 (PDT)
Received: by 10.142.237.11 with HTTP; Thu, 14 Apr 2011 04:15:31 -0700 (PDT)
Date: Thu, 14 Apr 2011 13:15:31 +0200
Message-ID: <BANLkTimare4-m0H7QRDZF5k-FqDBZgZATA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: udev startlevel S03 like sysfs?
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
X-List-Received-Date: Thu, 14 Apr 2011 11:17:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Since commit 523f22b938703b56a823fa9e9c577869669ddb82 [1] udev starts
at level S03.

Initscripts_1.0.bb expects udev as S04

...
       # udev will run as S04 if installed
       ln -sf          ../init.d/sysfs.sh      ${D}${sysconfdir}/rcS.d/S03sysfs
...


Recipe in oe-core still has INITSCRIPT_PARAMS = "start 04 S ." so I
guess we should revert that change.

Andrea




[1] http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=523f22b938703b56a823fa9e9c577869669ddb82


