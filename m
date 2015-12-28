Return-Path: <jose.alarcon@ge.com>
X-Greylist: delayed 2222 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Dec 2015 09:44:33 UTC
Received: from mx0b-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5793B6FFEC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 09:44:32 +0000 (UTC)
Received: from pps.filterd (m0048204.ppops.net [127.0.0.1])
	by m0048204.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
	tBS97VL3040380 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 04:07:32 -0500
Received: from alpmlip11.e2k.ad.ge.com ([12.43.191.1])
	by m0048204.ppops.net-00176a03. with ESMTP id 2031xb00em-3
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 04:07:32 -0500
Received: from alpmlip01.e2k.ad.ge.com ([3.159.17.48])
	by alpmlip11.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	28 Dec 2015 04:07:26 -0500
Received: from unknown (HELO clipsmtp.clients.em.health.ge.com) ([3.187.7.87])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 28 Dec 2015 04:07:23 -0500
Received: from ubuntu.localdomain (unknown [3.187.18.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by clipsmtp.clients.em.health.ge.com (Postfix) with ESMTPSA id
	8458C10B2541; Mon, 28 Dec 2015 11:02:43 +0200 (EET)
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Dec 2015 11:07:10 +0200
Message-Id: <cover.1450702572.git.jose.alarcon@ge.com>
X-Mailer: git-send-email 2.5.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-28_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1507310008
	definitions=main-1512280175
Subject: [contrib][PATCH 0/3] Fix oe-stylize.py issues
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
X-List-Received-Date: Mon, 28 Dec 2015 09:44:33 -0000

1) Ensure that the scrip is compatible with earlier versions of python
2) Add common OEvariables to the script
3) Make sure that a warnings printed by the script don't produce bitbake parsing errors

Jose Alarcon (3):
  contrib: ensure that oe-stylize.py works with python versions < 3.0
  contrib: add missing common OE variables
  contrib: print oldline within single quotes

 contrib/oe-stylize.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.5.0


