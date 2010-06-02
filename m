Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jan.paesmans@gmail.com>) id 1OJknF-0001GF-2V
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 12:03:26 +0200
Received: by gya1 with SMTP id 1so2289961gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=txizOIYu2K1QiWhckxCRbJP+X4XZwoEKN2Lh3JZAglg=;
	b=H1J2D0ZQ/XRVFtL86+gxRSnkGdke8E4D2JYSZERdQmOIaJMR0dEyFZzbI85juHZ9CP
	8Q8Nfq4WyPPDkmSHuN0EqgaBWud0jEh2Mg06VY4SoLvsbNB3Rh7Ztbp8u+f2HRYGNmnl
	xCI0LOqXJMt7rn5JSNq2zutavfUGq68ThA+KE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=T0cXGh/u7AD275Ogtwq7eKK89dJXkoB6DyPjJH131j11MmUnFaRBq488k+OSHn7qzj
	tn8JrvBgic8DGPo31FBVJcdC4TDn59QNGnSA9XbY4jAXJq7JaIYeO0zPfsRr6wKbLgTR
	kr3OR0eX8KBTM75VT3EtVreGraeO2Cupz48Ys=
MIME-Version: 1.0
Received: by 10.150.61.9 with SMTP id j9mr7302119yba.388.1275472749763; Wed, 
	02 Jun 2010 02:59:09 -0700 (PDT)
Received: by 10.151.15.14 with HTTP; Wed, 2 Jun 2010 02:59:09 -0700 (PDT)
Date: Wed, 2 Jun 2010 11:59:09 +0200
Message-ID: <AANLkTim658V2N3h7yhIiG2jgMjebaTMfClCWMDUy7Sos@mail.gmail.com>
From: Jan Paesmans <jan.paesmans@gmail.com>
To: OpenEmbedded Mailing List <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: jan.paesmans@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] add missing inherit on gettext
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
X-List-Received-Date: Wed, 02 Jun 2010 10:03:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

gettext-native is a prerequisite for building grep-native.
Inheriting also from gettext takes care of that requirement.

Signed-off-by: Jan Paesmans <jan.paesmans@gmail.com>
---
 recipes/grep/grep-native_2.5.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/grep/grep-native_2.5.1.bb
b/recipes/grep/grep-native_2.5.1.bb
index 51a9932..430936d 100644
--- a/recipes/grep/grep-native_2.5.1.bb
+++ b/recipes/grep/grep-native_2.5.1.bb
@@ -1,5 +1,5 @@
 require grep_${PV}.bb
-inherit native
+inherit native gettext

 S = "${WORKDIR}/grep-${PV}"

-- 
1.7.0.4


