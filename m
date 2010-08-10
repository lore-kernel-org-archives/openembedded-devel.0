Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oiis4-0003zK-U4
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 09:03:37 +0200
Received: by pwj1 with SMTP id 1so1615415pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 00:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=uUX5M2+b1eIKgn/xnaRf5z46JkgcmlECop+MJRx0huU=;
	b=WemsKZL3pT3j20lDFjkak8cq55qOh+tiloNPS0qV6RDLnS8DhC5kkkYw03Z0DF2wSi
	rr9OlNBn3iCxWbVaPfUgIxszwWwXFFc5eddxpZKpBiODOxGDtYW5+Ln6s+2GCLRIzqXP
	htI3GLM7ztLXZdD6/NCdmfaR+yEV3KRCXZfGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=FXMSBYzoYi4V+qpn88oC/CUWAPmTxGZtJirs0zf4ctDgrjZxS5aAEhVcV4pwa5ECSO
	0h/84Dk/gwyt23zDRZ/nC+muUwjbJthkUiSKfzFH/PT2nbWg/xjSM70m3oKwnIBgpJZR
	kwjwVxtsyFkgv4WyfpXOUa/TaRqvnxadi8YPE=
Received: by 10.142.230.18 with SMTP id c18mr14526268wfh.226.1281423805549;
	Tue, 10 Aug 2010 00:03:25 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	t11sm7410255wfc.16.2010.08.10.00.03.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 10 Aug 2010 00:03:24 -0700 (PDT)
Message-ID: <4C60F9B6.1040107@gmail.com>
Date: Tue, 10 Aug 2010 16:33:18 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] package_ipk.bbclass: remove redundant dependencies upon opkg/opkg-collateral.
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
X-List-Received-Date: Tue, 10 Aug 2010 07:03:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 classes/package_ipk.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 3d70181..5d388da 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -1,6 +1,5 @@
 inherit package
 
-BOOTSTRAP_EXTRA_RDEPENDS += "opkg-collateral opkg"
 IMAGE_PKGTYPE ?= "ipk"
 
 IPKGCONF_TARGET = "${STAGING_ETCDIR_NATIVE}/opkg.conf"
-- 
1.7.1



