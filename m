Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJuiw-00030d-Mr
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:39:40 +0200
Received: by pwi5 with SMTP id 5so2476217pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=uVh9SoUjqryjq0EjNLw1yv66zHWzFS8olL8epJUrKXA=;
	b=xBqOn7S2o+bW06WgKm8UMWx/tnzbOW2eUOwIOJkObRP9kKOoKPXyNvexv4cL6gUpjb
	xFrJJYLOagyvmSr53MxiUfjOuIL1Em77wCMVBOme+UC/U9ElQySe4aNmFNlxyyi408K2
	ZxCcuSM6Badt5s8yGnCBpXQqsdMQDtl+S2idg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Iw7WjpKW97WMADqU2XOAYVMKG9m0yfCTaycUl3sPviIPPEo39t0OoZzRBMhw7L9mOy
	bgB+lv/MdkLX3Ov8eMk6Bo0g04mMkcqyio70IUR8cvN4+b+x6bqPWFQAZNb15W601tr1
	2ONqsSgJ5n5D+N/RbD+RDPJRuqEy4mcdTYWD4=
Received: by 10.143.27.37 with SMTP id e37mr5469503wfj.250.1275510922656;
	Wed, 02 Jun 2010 13:35:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:40 -0700
Message-Id: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 00/16] Upgrade gettext, GNU utilities, fix general build issues with uclibc distros.
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
X-List-Received-Date: Wed, 02 Jun 2010 20:39:40 -0000

Hi

These patches are for three things mainly.

1. Upgrade to gettext 0.18
3. General gnu utilities updates
4. uclibc based distro builds

I have tested several images for qemu based machines
mainly qemuarm and qemux86

Please provide feedback

Thanks

-Khem


