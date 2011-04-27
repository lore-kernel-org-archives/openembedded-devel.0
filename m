Received: from smtp-out05.msg.oleane.net ([62.161.7.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QF9er-0005xA-9H for openembedded-devel@lists.openembedded.org;
	Wed, 27 Apr 2011 20:40:17 +0200
Received: from smtp03.msg.oleane.net (smtp03.mail.priv [172.17.20.112]) 
	by smtp-out05.msg.oleane.net with ESMTP id p3RFKl3b028630
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2011 17:20:47 +0200
Received: from [192.168.1.148] (AMarseille-551-1-48-89.w80-9.abo.wanadoo.fr
	[80.9.223.89]) (authenticated)
	by smtp03.msg.oleane.net (MTA) with ESMTP id p3RF0Lrj021184
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2011 17:00:21 +0200
X-Oleane-Rep: REPA
Message-ID: <4DB82F84.3090407@cioinfoindus.fr>
Date: Wed, 27 Apr 2011 17:00:20 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.5.9.395186, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.4.27.144517 (no antivirus check)
X-Orange-Auth: Y2I1NTMtM0BjaW9pbmZvaW4uZnIuZnRv
Subject: [PATCH 2/2] python-numpy: add missing release dependencies
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
X-List-Received-Date: Wed, 27 Apr 2011 18:40:17 -0000
X-Groupsio-MsgNum: 31499
Content-Type: multipart/mixed; boundary="------------070900020804060904000009"

--------------070900020804060904000009
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Hi all,

this new recipe will build the painting soft mypaint.

In order to correctly run on the target, it is necessary to add new
recipes dependencies in python-numpy recipe.

Here are the two patches.

Hoping it will be valuable.



  From 0ba53d830cbc429082244be68de367750b2f3702 Mon Sep 17 00:00:00 2001
From: C. Charreyre<christian.charreyre@cioinfoindus.fr>
Date: Thu, 21 Apr 2011 16:26:38 +0200
Subject: [PATCH] python-numpy: add missing release dependencies
necessaries for mypaint

Signed-off-by: C. Charreyre<christian.charreyre@cioinfoindus.fr>
---
   recipes/python/python-numpy_1.1.1.bb |    2 ++
   1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python-numpy_1.1.1.bb
b/recipes/python/python-numpy_1.1.1.bb
index f5c23e0..9dda508 100644
--- a/recipes/python/python-numpy_1.1.1.bb
+++ b/recipes/python/python-numpy_1.1.1.bb
@@ -4,6 +4,8 @@ PRIORITY = "optional"
   LICENSE = "PSF"
   PR = "ml0"

+RDEPENDS_${PN} = "python-compiler python-pkgutil python-pydoc
python-mmap python-unittest"
+
   SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
              file://unbreak-assumptions.diff \
          file://trycompile.diff \
-- 
1.7.0.2




--------------070900020804060904000009
Content-Type: text/x-vcard; charset=utf-8;
 name="christian_charreyre.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="christian_charreyre.vcf"

begin:vcard
fn:Christian  Charreyre
n:Charreyre;Christian 
org:CIO Informatique Industrielle
adr;dom:;;11 Avenue Marigny;Marseille;;13014
email;internet:christian.charreyre@cioinfoindus.fr
tel;work:04 95 05 19 41
url:http://www.cioinfoindus.fr
version:2.1
end:vcard


--------------070900020804060904000009--
