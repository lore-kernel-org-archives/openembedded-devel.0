Return-Path: <ka6sox@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1E99E65CB2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 06:13:10 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id g201so6425379oib.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 23:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=+IVUun7cvWGGTbcCRZ1Y1SeqBH8QMCJwsWD4QYlyJ3Q=;
	b=RwOdf3Ka1UAOn4z695/4Nd8z2bJ7k7jpGq+Y8r/4nidwGjBMMDVBGaKY9MVKdMyoEf
	1d7uk9wLxCdIrybYcg+9Y3i1619vhAudSFj0qDLkU+WiuCpAt9VP6Zz8s2xu0HG+LiC7
	THUXB7X0OGKF48DUnbnRS5fPDniL7YYbk+IWiEOvRslIkTmWyqmRqp8lH5r4MLIGS01c
	DEGETTqGvhdUomxN/QISNsQmPLzxH2fHR3QrN50AeFYPSvP9YaEVsLjr1mMZL4zt/3UV
	I8HkLX1zPq5P/moVf2HCcvNlqNP9fyomyU+ZQWrV+fjTMLu1FTSeEdMcBGv91yVRvidB
	E0/g==
MIME-Version: 1.0
X-Received: by 10.60.94.66 with SMTP id da2mr54081709oeb.59.1408601591288;
	Wed, 20 Aug 2014 23:13:11 -0700 (PDT)
Received: by 10.76.6.136 with HTTP; Wed, 20 Aug 2014 23:13:11 -0700 (PDT)
Date: Wed, 20 Aug 2014 23:13:11 -0700
Message-ID: <CAHQecY6bxmkDi3U6nN3MhF4x6-ysPnXyb0nwrjXwq3-xX5NdcQ@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [META-OE][PATCH 1/1] oscam: fixed QA issue where binary was being stripped
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Aug 2014 06:13:20 -0000
Content-Type: text/plain; charset=UTF-8

http://lists.openembedded.org/pipermail/openembedded-core/2014-August/095778.html

WARNING: QA Issue: File '/usr/bin/oscam' from oscam was already stripped,
this
will prevent future debugging! [already-stripped]

Fix above warning by telling cmake to do Debug type build, which prevents
linking with '-s' flag that removed symbols before bitbake could put them
into dbg package.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
Signed-off-by: Tom King<ka6sox@gmail.com>
---
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
 b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index e3f2708..c4a4d99 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -14,5 +14,5 @@ S = "${WORKDIR}/trunk"

 inherit cmake

-EXTRA_OECMAKE = "-DDEFAULT_CS_CONFDIR=${sysconfdir}"
+EXTRA_OECMAKE = "-DDEFAULT_CS_CONFDIR=${sysconfdir}
-DCMAKE_BUILD_TYPE=Debug"


--
1.7.9.5

