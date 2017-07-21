Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 9E06F782D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From;
	bh=iWMsepvUhtj0geA62jpADo8V3IOH7cIqy6AJhP+vsDs=; 
	b=vly6jtWvoLH5ySgreOZI68Dzn1AE2I2cwZNu5rtgjuRFFSkXVgaN/ZzgD+NdXdY8mkBPGBb55SIn8nqgWw2GK5ijjik7kjfmOnHMYuWO9reIp1rk7nVmk4G74OWudWML2Yr04DAgMYme23UBq0yZUMqQ+nkYGUYVVUVuIAUKMNoe+IGXqUKMt2x2DDDxGHLQjQ0mBCF1Mu6by7vd/oxngta9E87S+tp2i+U2AB5fBv12UcHpHHxKERTqEv0bcoFe01Nu7JVjwaGvlU8XFqHPqkbcijfrZLOMc8TSoqPtSSaPIL3e+Bajeeyw/5YUP8YcpH31s8UUDfl7x/ZBR202Kg==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dYRyD-00067n-8v; Fri, 21 Jul 2017 10:03:29 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dYRyD-0007lX-7Q; Fri, 21 Jul 2017 10:03:29 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Jul 2017 10:03:14 +0300
Message-Id: <1500620597-28886-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [meta-oe][PATCH 0/3] Add CVE_PRODUCT fields to a few recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jul 2017 07:35:56 -0000

This way yocto cve-check can find open CVE's for these recipes. See also:

http://lists.openembedded.org/pipermail/openembedded-core/2017-July/139897.html

"Results from cve-check are not very good at the moment.
One of the reasons for this is that component names used in CVE
database differ from yocto recipe names. This series fixes several
of those name mapping problems by setting the CVE_PRODUCT correctly
in the recipes. To check this mapping with after a build, I'm exporting
LICENSE and CVE_PRODUCT variables to buildhistory for recipes and
packages."

Mikko Rapeli (3):
  fribidi_0.19.7.bb: set CVE_PRODUCT to gnu_fribidi
  krb5_1.15.1.bb: set CVE_PRODUCT to kerberos
  udisks2_2.1.8.bb: set CVE_PRODUCT to udisks

 meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb      | 2 ++
 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb | 2 ++
 meta-oe/recipes-support/udisks/udisks2_2.1.8.bb       | 2 ++
 3 files changed, 6 insertions(+)

-- 
1.9.1


