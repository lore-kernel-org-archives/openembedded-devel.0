Received: from [65.182.109.74] (helo=mta5.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1MQdBb-0004MQ-PU
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 10:16:27 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta5.brinkster.com (Postfix) with ESMTP id 1D92A32817A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 04:03:08 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.563
X-Spam-Level: 
X-Spam-Status: No, score=0.563 tagged_above=-10 required=5 tests=[AWL=-0.753, 
	BAYES_05=-1.11, MSGID_MULTIPLE_AT=1.449, RCVD_IN_SORBS_DUL=0.877,
	RDNS_DYNAMIC=0.1]
Received: from mta5.brinkster.com ([127.0.0.1])
	by localhost (mta5.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ayMcI0YRJFj2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 04:03:02 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta5.brinkster.com (Postfix) with ESMTP id 4D2CA32853C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2009 04:03:00 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Jul 2009 09:02:46 +0100
Message-ID: <049101ca0459$7a27f580$6e77e080$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcoEWXicRNGi/gjtRGq4HDQH/7RaLQ==
Subject: [PATCH] Fix build issue with rdesktop_1.6.0.bb
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
X-List-Received-Date: Tue, 14 Jul 2009 08:16:28 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Remove duplicate audio-2008.patch patch line from recipe (fixes build issue
introduced with 013c006d11a59269b9d3adc6cbb6fb8091144965).

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 recipes/rdesktop/rdesktop_1.6.0.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/rdesktop/rdesktop_1.6.0.bb
b/recipes/rdesktop/rdesktop_1.6.0.bb
index 1959200..93d46bd 100755
--- a/recipes/rdesktop/rdesktop_1.6.0.bb
+++ b/recipes/rdesktop/rdesktop_1.6.0.bb
@@ -5,8 +5,6 @@ PR = "${INC_PR}.2"
 SRC_URI += " file://audio-2008.patch;patch=1"
 SRC_URI_append_ossystems = " file://rdesktop-addin.patch;patch=1"
 
-SRC_URI += " file://audio-2008.patch;patch=1"
-
 inherit autotools
 
 EXTRA_OECONF = "--with-openssl=${STAGING_EXECPREFIXDIR} "
-- 
1.6.3.1





