Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 664 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Feb 2017 18:01:06 UTC
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id D6296755C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 18:01:06 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170213174957388_0684
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 17:49:57 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [216.191.234.70] (port=38176 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cdKl5-00060k-LW for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2017 12:49:51 -0500
Date: Mon, 13 Feb 2017 12:49:49 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702131247470.29461@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: add "zlib" build-time dependency to "netdata" recipe
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
X-List-Received-Date: Mon, 13 Feb 2017 18:01:07 -0000
Content-Type: text/plain; charset=US-ASCII


Given recipe-specific sysroots, add the missing "zlib" dependency to
"netdata" recipe.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i'm assuming there are probably a few recipes that will pop up as
needing build-time dependencies added to their recipe files now that
there are recipe-specific sysroots.

  this patch fixes the build problem i was having.

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index 40b32ad..3e6d4f0 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -3,6 +3,8 @@ SUMMARY = "Real-time performance monitoring"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=747afe070ea9d6c2be0a31353609a35b"

+DEPENDS = "zlib"
+
 SRC_URI = "git://github.com/firehol/netdata.git;protocol=https"
 SRCREV = "36c1304e37094174ea51001903058e65053107ca"
 PV = "1.0.1+git${SRCPV}"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


