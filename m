Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P32CT-0003At-44
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 09:44:37 +0200
Received: by pzk37 with SMTP id 37so1518215pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=h7gpKWBH5N2u9VscA/Bl6mqZGd2KgQlUdKXnxeh/CR0=;
	b=UshxCje/IBhWQtT2qIork6A97fTQQwjnVKm00aJ5Cdjc8yH1Wq8isBPkGDFycDbUXZ
	QFZSKcXTRbeadzbcQU4IVfGRSNa6SeDEz/MNyF/W3LD3W/IN8fp1w0Npe8stF4iYnn/0
	FNPTZeGDbqMxpA/1erifJtoCHpkq7T5Th705Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ZrYEYLz0ZXZ/2yLI1zRwIo6L4jQaKZJt0gB2VbtqA3cLe6bykiVhYc2Ld86L0eQc5C
	BxdtzX7UDG0Jhs9Df+e6U6UIHTg/vC81F/pjtbwJfuh5/mCG/D1XhKjmUlyZ1CTHjAxj
	TZH15zcXRqPoSClvhdpf9yGcmJusmZhqCEWRM=
Received: by 10.142.127.17 with SMTP id z17mr9823869wfc.42.1286264656361;
	Tue, 05 Oct 2010 00:44:16 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 9sm7531414wfd.0.2010.10.05.00.44.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 05 Oct 2010 00:44:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Oct 2010 00:43:57 -0700
Message-Id: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Tue, 05 Oct 2010 07:44:38 -0000

Hi

Following set of patches is intial support for getting libtool 2.4 into
openemebedded. I have so far built minimal-image for two machines successfully

The big change that libtool 2.4 brings is sysroot support and I have added
support to use this feature. It should make our life easier.

This patchset is not final but needs a lot of testing testing and testing

Please cherry pick the patch bundle and give it a try in yout environment

There might be libtool macro updates needed for few packages. I have
a patch which does it for gnutls the changes will be similar for others

Some distros pin libtool version to 2.2.6b

include/preferred-slugos-versions.inc
include/angstrom-2008-preferred-versions.inc
include/kaeilos-2009-preferred-versions.inc
include/angstrom-2010-preferred-versions.inc
include/preferred-shr-versions.inc

So if you are using one of these distro's then you might have
to override the version in your local.conf

PREFERRED_VERSION_libtool_local       = "2.4"
PREFERRED_VERSION_libtool-native_local = "2.4"
PREFERRED_VERSION_libtool-cross_local = "2.4"
PREFERRED_VERSION_libtool-sdk_local   = "2.4"

Please review and test and provide feedback

Thanks

-Khem



