Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PON1Q-0006lD-W8
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 05:13:25 +0100
Received: by pzk12 with SMTP id 12so1339301pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 20:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=HxB+YylVrKLJvmZHuPa+I4mO3QJfEugqGTBo97WQ/SU=;
	b=FqW+X0P1U7DnyRqqDIIySgPNuBmOzMh6FkvFINDWJEG8DQmxPSbzqdpaLkBuIgvEbx
	laVg1cfYrDf871P+LxVAf2SBesLRq1CZcuWsNEJKfItubrvqq3y5gI2oMaMDA4V/xwCJ
	aIA+AHIw9TgLPfrdXFPIeupIHX7dWipZGNdYE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=fyzLsqBv+XHMhYgCoPlzr8aXu5X10RfQewNW7QlEU4PICAcZQg7RL3F1I4O7H2PY6/
	LoSfYTk7zVm/V80IiDhv1lUmlof7R7jNduw60ZylYLLm4SuyMKS64to9orVGtVhndXCZ
	hYSCq+M5rQp8+cxshUwMskif9Fgjz+k3QOY0w=
Received: by 10.142.11.18 with SMTP id 18mr1366607wfk.73.1291349507999;
	Thu, 02 Dec 2010 20:11:47 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w14sm1658163wfd.6.2010.12.02.20.11.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Dec 2010 20:11:46 -0800 (PST)
Message-ID: <4CF86DFD.904@gmail.com>
Date: Fri, 03 Dec 2010 14:41:41 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openjade_1.3.2.bb: Create directory before installing a file to that location.
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
X-List-Received-Date: Fri, 03 Dec 2010 04:13:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Fixes a breakage I introduced in last openjade commit.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/openjade/openjade_1.3.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/openjade/openjade_1.3.2.bb b/recipes/openjade/openjade_1.3.2.bb
index 6c69173..afd333a 100644
--- a/recipes/openjade/openjade_1.3.2.bb
+++ b/recipes/openjade/openjade_1.3.2.bb
@@ -44,7 +44,8 @@ do_install_append () {
 
        # The catalog must live in the sysroot and it must be there for
        # install-catalog to do its thing.
-       install -m 644 dsssl/catalog ${datadir}/sgml/openjade-${PV}
+       install -d ${datadir}/sgml/openjade-${PV}
+       install -m 644 dsssl/catalog ${datadir}/sgml/openjade-${PV}/catalog
        install-catalog --add ${sysconfdir}/sgml/openjade-${PV}.cat \
            ${datadir}/sgml/openjade-${PV}/catalog
 
-- 
1.7.1



