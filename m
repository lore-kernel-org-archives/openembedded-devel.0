Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3fZH-0004dK-LX
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 03:46:48 +0200
Received: by pwj1 with SMTP id 1so39052pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 18:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=NBo+KpEiAQtrfz4qnpl/tEMpj+Zz3t/tK61qicecOfY=;
	b=W1A0cQSGPwGMsiRQSoZPmBl6cmNkrONocxWABEH3U8B3HE2Cos6U3SkKYlXSkuGNwU
	IqEtKw0BKO3C0Ut6BC3IEh8v+fc3mqOdB3iEyIqAzwl0Zkn69hNKrOpt4MNo6JM/mR3z
	lcEwPlE8/ZiDb7rhBpQNmdNv5LwNt+T5HxNoc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=JxSviTt6IiJw853R+hosJPrl+rf69szDwlqxcOsp1GyY00VyQV+g8pASV83Xu7fDVF
	LSco6pt+dGCiBwJajIHjCd4SIuPncGM/7Bw7SpKDICh1X1UMcjg81vL8bimPGOoJXwBk
	8/xhXeF+DTB+OlJBbsiCcddIzVioi/e3DxQQA=
Received: by 10.114.39.4 with SMTP id m4mr82226wam.98.1286415985569;
	Wed, 06 Oct 2010 18:46:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q6sm2413207waj.10.2010.10.06.18.46.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 18:46:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 18:46:05 -0700
Message-Id: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Thu, 07 Oct 2010 01:46:48 -0000

Hi

Following set of patches is v2 of the patches adding support for getting libtool 2.4 into
openemebedded. I have so far built minimal-image for two machines successfully using old 
and new libtool.

The libtool sysroot feature knob is added through LIBTOOL_HAS_SYSROOT variable. If this is
set to "yes" then you ought to use libtool > 2.4 by default its set to "no" which means
the current behavior remains.

The big change that libtool 2.4 brings is sysroot support and I have added
support to use this feature. It should make our life easier.

This needs a lot of testing.

Please cherry pick the patch bundle and give it a try in yout environment

Some distros pin libtool version to 2.2.6b

include/preferred-slugos-versions.inc
include/angstrom-2008-preferred-versions.inc
include/kaeilos-2009-preferred-versions.inc
include/angstrom-2010-preferred-versions.inc
include/preferred-shr-versions.inc

So if you are using one of these distro's then you might have
to override the version in your local.conf

LIBTOOL_HAS_SYSROOT = "yes"
LIBTOOL_VER = "2.4"
PREFERRED_VERSION_libtool           = "${LIBTOOL_VER}"
PREFERRED_VERSION_libtool-native    = "${LIBTOOL_VER}"
PREFERRED_VERSION_libtool-cross     = "${LIBTOOL_VER}"
PREFERRED_VERSION_libtool-nativesdk = "${LIBTOOL_VER}"
PREFERRED_VERSION_libtool-sdk       = "${LIBTOOL_VER}"

Please review, test, and provide feedback

Thanks

-Khem



