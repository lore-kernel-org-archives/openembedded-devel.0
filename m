Return-Path: <prvs=959aba4a0=Richard.Leitner@skidata.com>
X-Greylist: delayed 595 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Jun 2016 12:26:53 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 91B327319F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 12:26:53 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CsBACeulZX/0oKEKxdhRAGrmaHLxqEMoF5iAYSAQEBAQEBAYEBC4RHBCRVBiMHBgIFFgsCCwMCAQIBDyYWDQYCAogRAw+qa40XDYQMMYEBhSaHEIR+glkFkziEXzSBWIpUAYNkhFKDCRcMhTiGPYE2h2wlDIFZgjpsiRB/AQEB
X-IPAS-Result: A2CsBACeulZX/0oKEKxdhRAGrmaHLxqEMoF5iAYSAQEBAQEBAYEBC4RHBCRVBiMHBgIFFgsCCwMCAQIBDyYWDQYCAogRAw+qa40XDYQMMYEBhSaHEIR+glkFkziEXzSBWIpUAYNkhFKDCRcMhTiGPYE2h2wlDIFZgjpsiRB/AQEB
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <5756BB6E.1010309@skidata.com>
Date: Tue, 7 Jun 2016 14:17:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex1srv.skidata.net
	(172.16.10.92)
Subject: [jethro] Backport 12e31ce9d6065086fa0a84733f7b45664d41b7e9 from master
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
X-List-Received-Date: Tue, 07 Jun 2016 12:26:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hello,
please backport commit 12e31ce9d6065086fa0a84733f7b45664d41b7e9 from
master to jethro branch!
This is needed for samba to work on a readonly rootfs!

> commit 12e31ce9d6065086fa0a84733f7b45664d41b7e9
> Author: Johannes Pointner <johannes.pointner@br-automation.com>
> Date:   Fri Apr 15 11:23:42 2016 +0200
>
> samba: add volatile file to support readonly rootfs
>
> This patch adds a volatile file for samba which was removed by the
> update from 3.6.25 to 4.1.12. This file is necessary to build a image
> that uses the read-only-rootfs feature.
>
> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>

Thank you!

Kind regards,
Richard



