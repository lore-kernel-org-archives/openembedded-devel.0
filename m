Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OY6VD-0000K8-L8
	for Openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 02:04:08 +0200
Received: by iwn34 with SMTP id 34so4151874iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 16:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=blOYWnve0jtks1v7aodGXpFhu1TD9t35dNegb+WtI5g=;
	b=vUOtc8cS+5YjjYoHfrBb6B0qqMuwOLYaryOsFO+/RH0ehsLm/hhKDdlzUL51/A/nNJ
	rPcgFLDA1qARHNayLXW5qgCSG7lme28Xc8sTe11mcVvqLAA2+10v7E0JPkOuMMXp7KCK
	CZkbdvJK6veeulPz1VjTzPDmFSNdTTiVLz6fU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=O7Ns8GtQQC8dC/OP2etamGWMqJK5eok97EC+9/y1o1ZUCD5l7A3Z3ki+VboOf0fVye
	aNQDDhctK533ze100Lw5amH57LbzI/Mzvjpqv41AGXGqHKO1eQqqX++jva47xjYmuhYy
	lOFHRnh1UtY2N43pRx2YR5RuW/+QZGANmNdu0=
Received: by 10.231.17.137 with SMTP id s9mr13262428iba.163.1278892753254; 
	Sun, 11 Jul 2010 16:59:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.132 with HTTP; Sun, 11 Jul 2010 16:58:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jul 2010 16:58:53 -0700
Message-ID: <AANLkTilikvT3uoNJKYYT0iBF_Tp_XAsWswSvppB_mkEK@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: qemu-native with kvm acceleration
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
X-List-Received-Date: Mon, 12 Jul 2010 00:04:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

My build box has kvm support

$ kvm-ok
INFO: Your CPU supports KVM extensions
INFO: /dev/kvm exists
KVM acceleration can be used


but qemu that is cooked by qemu-native recipe still does not use it
if I use the default qemu that comes with build machine's distro everything
is blazing fast for qemux86 but not so with qemu-native provided qemu
and if I pass -enable-kvm forcibly
qemu dies.

if I look into configure of qemu-native then it has detected KVM

KVM support       yes

from log.do_configure.XXXX

anyone has encountered this or has any fixes ?

Thanks
-Khem


