Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <redzhepoff@gmail.com>) id 1RMGVr-00071E-RG
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 10:56:39 +0100
Received: by eyd9 with SMTP id 9so1828621eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 02:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type;
	bh=YBEcyM5034O1JeOmER2hr2BJITVALPN0kbmecT7aiBI=;
	b=qy9/GsIdV8+SzlH4wqpXkOVYY3VWijiNAyYGxZaNg3U2owWJbZu3EzuI9tzTvFrJsj
	0hpN1GgP9KGh6KzSuqxURu4srn+K9w6QBaRuCO224rHUnB/EkIp0WW6DC5XLwFL4hC0i
	eF1VIB1bXJzcaHv8NsCa1SNSoJDHIwZbsFOW4=
MIME-Version: 1.0
Received: by 10.14.11.209 with SMTP id 57mr1321967eex.109.1320400230098; Fri,
	04 Nov 2011 02:50:30 -0700 (PDT)
Sender: redzhepoff@gmail.com
Received: by 10.14.185.129 with HTTP; Fri, 4 Nov 2011 02:50:30 -0700 (PDT)
Date: Fri, 4 Nov 2011 12:50:30 +0300
X-Google-Sender-Auth: 2sLnD0TMU0IJx8V9MNmvLf1dNNw
Message-ID: <CAK_2FrmQVqMCVYGGCS7+qJzg7tNMU_45FmhjNVFx3RhFxqpG9g@mail.gmail.com>
From: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Ivan.Kuten@promwad.com
Subject: [PATCH] new recipe - sdparm_1.06.bb
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
X-List-Received-Date: Fri, 04 Nov 2011 09:56:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

 recipes/sdparm/sdparm_1.06.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/sdparm/sdparm_1.06.bb

diff --git a/recipes/sdparm/sdparm_1.06.bb b/recipes/sdparm/sdparm_1.06.bb
new file mode 100644
index 0000000..b49a753
--- /dev/null
+++ b/recipes/sdparm/sdparm_1.06.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "The sdparm utility accesses SCSI device parameters."
+HOMEPAGE = "http://sg.danny.cz/sg/sdparm.html#mozTocId166213"
+SECTION = "console/utils"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=03299eb2d80659ec83507fcc511c5b42"
+PR = "r0"
+
+SRC_URI = "http://sg.danny.cz/sg/p/${PN}-${PV}.tgz"
+
+SRC_URI[md5sum] = "5e19913658bb4f9849ddd909e0f47cde"
+SRC_URI[sha256sum] =
"e011a7a9e87e4e24c9c115f456ac4916fdc314d36ae99167979175782ea2f6b4"
+inherit autotools
-- 
1.7.2.5

