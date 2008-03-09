Received: from [66.249.82.235] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1JYE87-0006lk-0n
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Mar 2008 06:31:28 +0100
Received: by wx-out-0506.google.com with SMTP id h27so1137136wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Mar 2008 21:29:42 -0800 (PST)
Received: by 10.150.177.20 with SMTP id z20mr1662267ybe.118.1205040582895;
	Sat, 08 Mar 2008 21:29:42 -0800 (PST)
Received: from ?192.168.1.204? ( [24.107.189.117])
	by mx.google.com with ESMTPS id 61sm8903929wry.13.2008.03.08.21.29.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 08 Mar 2008 21:29:42 -0800 (PST)
Message-ID: <47D375BD.6010009@gmail.com>
Date: Sat, 08 Mar 2008 23:29:33 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 66.249.82.235
X-SA-Exim-Mail-From: xjqian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: htcuni.patch generic for all devices?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Mar 2008 05:31:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

htcuni.patch is not clean in .dev and breaks linux-rp_2.6.24 for all 
devices. My questions is why this patch was applied to all devices in 
thefirst place. Shouldn't this patch be put under the htcuniversal 
section, regardless if it's broken or not?

Regards
Gordon

#
# old_revision [b61252165c378556cbcf99189fda2993232e1c3e]
#
# patch "packages/linux/linux-rp_2.6.24.bb"
#  from [9e6dea22aa706ffd224579092a86fb5572432109]
#    to [f0a3a1d140b091261e05dbd98aab07db9a786aac]
#
============================================================
--- packages/linux/linux-rp_2.6.24.bb 
9e6dea22aa706ffd224579092a86fb5572432109
+++ packages/linux/linux-rp_2.6.24.bb 
f0a3a1d140b091261e05dbd98aab07db9a786aac
@@ -56,7 +56,6 @@ SRC_URI = "${KERNELORG_MIRROR}pub/linux/
             file://pxa-serial-hack.patch;patch=1;status=hack \
             file://connectplus-remove-ide-HACK.patch;patch=1;status=hack \
 
file://connectplus-prevent-oops-HACK.patch;patch=1;status=hack \
-           file://htcuni.patch;patch=1 \
             file://binutils-buildid-arm.patch;patch=1 \
             file://versatile-armv6.patch;patch=1 \
             file://defconfig-c7x0 \
@@ -194,6 +193,7 @@ SRC_URI_append_htcuniversal ="\

  SRC_URI_append_htcuniversal ="\
  	file://htcuni-acx.patch;patch=1;status=external \
+#       file://htcuni.patch;patch=1 \
  	"

  SRC_URI_append_zylonite ="\


