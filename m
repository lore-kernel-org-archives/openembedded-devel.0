Return-Path: <d.mukhametgaleev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E859C531DC
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 14:32:22 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.20786.1724164337418729095
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 07:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=cMfH2Sgl;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=kALAXPDN;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: d.mukhametgaleev@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com B7355C001A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1724164333; bh=7S8dHVVjA518zVWspnJ6uBw4LWj9jFskhZ0fch9/a8M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=cMfH2SgljTGfaII3ZiTQrdzFTwXlW9wAW+sJkd4jiewr65lP91SII8MRehqzlQoT5
	 rxT1N1F/083BKAKbSVLCYfp2n1kp+EHPCPbapr853DPJF1qCATvQdqBVpCd0nVo1ly
	 +Xcl31GCCKnnqU6gFukNHhYhM1iVT4A14c+QQv51CR8CtTbG7M4/A/Lh/Epl+na5xq
	 6+lyypWUYlOsIGbbRJzS4Makn1fHVdbqLUQbn++9vB5PKTX9552+m/V2JdBHfFz842
	 eAfuHjC/7HID3hSbyaXDU95FMG1SdWCT+XLrHyfkd4gLLdAjV69CDuOdG7r+m/CDa+
	 ZvQr1s5CnjfpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1724164333; bh=7S8dHVVjA518zVWspnJ6uBw4LWj9jFskhZ0fch9/a8M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=kALAXPDNstXheG+n2ufua1MbUGaADISAc12CWjf6mChN1oFArsSBBWdULkgIryN3Y
	 frkOKAo5IZR00nZYIFsbl1kzIQic4qvgyRiu7YVTv11D5lNgsv7dO5SXW+9KhDor5O
	 IbUUHCzPpbMON2KC04BnherPkTlCR2un8RhYdJ61RPxvJW1Av4gdFsl7AE7n78h1EM
	 Us45DhUcMBppdsTJ7H2obt3DQwQbAzMvY4y3eIT48h2QAUY5IDGEUULPF4dfRJV+kt
	 aLIZEyy10JvJbkpXk7WB3j5NJeCZdT8qDMAzZ4YdtST8KQekJOQdjPsZtZuU1CvMXA
	 Abd3oGKo2QgRA==
From: Daniil Mukhametgaleev <d.mukhametgaleev@yadro.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Daniil Mukhametgaleev <d.mukhametgaleev@yadro.com>
Subject: [PATCH] waf-samba.bbclass: Declaring WAF_CROSS_ANSWERS_PATH without the ability to override it will not allow you to create a custom samba recipe
Date: Tue, 20 Aug 2024 17:31:39 +0300
Message-ID: <20240820143139.3915495-1-d.mukhametgaleev@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-07.corp.yadro.com (172.17.11.57) To
 S-exch-04.corp.yadro.com (10.78.5.223)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 14:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111868

Support WAF_CROSS_ANSWERS_PATH overloading to be able to use waf-samba.bb=
class outside of meta-openembedded layer

Signed-off-by: Daniil Mukhametgaleev <d.mukhametgaleev@yadro.com>
---
 meta-networking/classes/waf-samba.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/=
classes/waf-samba.bbclass
index 79acacc98..84c28ded6 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -65,10 +65,10 @@ def get_waf_parallel_make(d):
 # to help generate the cross answer when adding new board support.
 CROSS_METHOD ?=3D "answer"
=20
+WAF_CROSS_ANSWERS_PATH ?=3D "${THISDIR}/../../files/waf-cross-answers"
 do_configure() {
=20
     # Prepare the cross-answers file
-    WAF_CROSS_ANSWERS_PATH=3D"${THISDIR}/../../files/waf-cross-answers"
     CROSS_ANSWERS=3D"${B}/cross-answers-${TARGET_ARCH}.txt"
     if [ -e ${CROSS_ANSWERS} ]; then
         rm -f ${CROSS_ANSWERS}
--=20
2.30.2


