Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (unknown [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7549179ED6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 14:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F209208DA;
	Fri,  2 Nov 2018 14:04:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Lw-vAQQdbPDg; Fri,  2 Nov 2018 14:04:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37649206EB;
	Fri,  2 Nov 2018 14:04:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A2886164913; Fri,  2 Nov 2018 10:04:49 -0400 (EDT)
Date: Fri, 2 Nov 2018 10:04:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20181102140449.GE7186@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [meta-qt5] qt5: upgrade to 5.9.7 breaks rocko!
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
X-List-Received-Date: Fri, 02 Nov 2018 14:04:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Martin,

The recent commit you pushed to rocko breaks the build with these errors:

ERROR: qtscript-5.9.7+gitAUTOINC+da4e4ac0c2-r0 do_populate_lic: QA Issue: qtscript: LIC_FILES_CHKSUM points to an invalid file: .../git/LICENSE.LGPLv21 [license-checksum]
ERROR: qtscript-5.9.7+gitAUTOINC+da4e4ac0c2-r0 do_populate_lic: QA Issue: qtscript: LIC_FILES_CHKSUM points to an invalid file: .../git/LICENSE.LGPLv3 [license-checksum]
ERROR: qtscript-5.9.7+gitAUTOINC+da4e4ac0c2-r0 do_populate_lic: QA Issue: qtscript: LIC_FILES_CHKSUM points to an invalid file: .../git/LICENSE.GPLv3 [license-checksum]
ERROR: qtscript-5.9.7+gitAUTOINC+da4e4ac0c2-r0 do_populate_lic: QA Issue: qtscript: LIC_FILES_CHKSUM points to an invalid file: .../git/LGPL_EXCEPTION.txt [license-checksum]

