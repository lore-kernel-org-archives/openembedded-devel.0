Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNdEK-0005YC-Sd
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 04:19:41 +0100
Received: by pzk12 with SMTP id 12so948613pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 19:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=t/SMCpbuAnmsSo/3FQQ0SZy0KTvieY22AEJwycSVaM0=;
	b=Omc9PhpBWv7VMFP3L8Qs/+Fok1gBWKtH92x44I8h+AvT7kDUJjJxdgZAV3h4BT4oOw
	HsmdNdExkBLtJlcnJH7njO2KTbIpkJZB5a+JRKhbzt4VSow8SRXvJ7YqlXKyAo0kcsww
	Bz/PM1+6WlCfgS+CJcFk8a2QExbSvIyOblQhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=XMt5Na04vIfJpryRx11ekpbM8eQIQnaA44VxFwl3pH1jUqbyUvI68pBn6j3xuPUh5X
	Nji2cazBXT/SZTQVo1WAtoxWCH8qYljzTlvPq/ksUdrJDKIVmkt8Z/xfI+9K6cYQTjva
	jMRFldL8j07G2W/9JQlCr/hQ/guxFahi85CCI=
Received: by 10.143.41.7 with SMTP id t7mr6732945wfj.102.1291173498072;
	Tue, 30 Nov 2010 19:18:18 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	b11sm9828419wff.21.2010.11.30.19.18.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 19:18:17 -0800 (PST)
Message-ID: <4CF5BE73.1000100@gmail.com>
Date: Wed, 01 Dec 2010 13:48:11 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openssl.inc: Use cp -L, busybox cp doesn't support the long option.
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
X-List-Received-Date: Wed, 01 Dec 2010 03:19:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Reported by andyzammy on IRC.

| oe_libinstall: cd /home/rofl/Desktop/oe/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/i686-linux/openssl-native-1.0.0b-r13.1/openssl-1.0.0b
| cp: unrecognized option '--dereference'
| BusyBox v1.13.3 (Ubuntu 1:1.13.3-1ubuntu11) multi-call binary
|
| Usage: cp [OPTION]... SOURCE DEST
|
| Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY
|
| Options:
| 	-a	Same as -dpR
| 	-d,-P	Preserve links
| 	-H,-L	Dereference all symlinks (default)
| 	-p	Preserve file attributes if possible
| 	-f	Force overwrite
| 	-i	Prompt before overwrite
| 	-R,-r	Recurse directories
| 	-l,-s	Create (sym)links
|
| ERROR: Function do_install failed

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/openssl/openssl.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index 3091b4e..bcebc4a 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -122,5 +122,5 @@ do_install () {
 	oe_libinstall -so libssl ${D}${libdir}
 
 	install -d ${D}${includedir}
-	cp --dereference -R include/openssl ${D}${includedir}
+	cp -L -R include/openssl ${D}${includedir}
 }
-- 
1.7.1



