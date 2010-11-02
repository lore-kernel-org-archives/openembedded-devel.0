Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PD5mO-00082b-0b
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 02:35:53 +0100
Received: by pxi2 with SMTP id 2so694271pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 18:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=Vsb/veLWfx5Mi9gDtiZ4QSKyWdDYBcmF0bG1TScPPM4=;
	b=XSmlWYTYNb7HeM3FlCdGJyu8V44nGXee1MWHkLaALiMQj/S7NzJi7VPKvlvocssCjl
	v3I+J/Yoyzis04dGFsOTa9cc9izIogrPbdYzN+MclKnPgCb+rqxxsFGpnCXI4Zz+nw1L
	H1JQJkFEioYs1tkyj8ws3Tp5DcXF3nAIO/Pts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=bERuLqSFF+OnsMf35Q9qMaMS33VrIHcm03Ty6oji01hBOa5Ya+DrsoNZ+sTpqafuI9
	tsK2F9LnePsgAQ5vBi+gxPpj/kd806Ktchlf5XTM01XrFzTxkUf8XKk/AyVhtvuLMIkM
	XeOL2AE9VURXZ870YkxM1pyZFcNXEc6RfRp5k=
Received: by 10.142.162.5 with SMTP id k5mr4539857wfe.203.1288661666233;
	Mon, 01 Nov 2010 18:34:26 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	x35sm9874505wfd.13.2010.11.01.18.34.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 18:34:25 -0700 (PDT)
Message-ID: <4CCF6A9B.7030302@gmail.com>
Date: Tue, 02 Nov 2010 12:04:19 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101020 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] site/mips{,64}-common: Add apache vars.
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
X-List-Received-Date: Tue, 02 Nov 2010 01:35:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Also, fix CORBA pointer alignment for mips64 that I missed previously.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 site/mips-common   |    6 ++++++
 site/mips64-common |    8 +++++++-
 2 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/site/mips-common b/site/mips-common
index 49e6dee..3e68667 100644
--- a/site/mips-common
+++ b/site/mips-common
@@ -35,3 +35,9 @@ pgac_cv_alignof_int=4
 pgac_cv_alignof_long=4
 pgac_cv_alignof_long_long_int=8
 pgac_cv_alignof_double=8
+
+# apache
+ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
+apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
+ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
+apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
diff --git a/site/mips64-common b/site/mips64-common
index 90c2efe..8413f81 100644
--- a/site/mips64-common
+++ b/site/mips64-common
@@ -26,7 +26,7 @@ ac_cv_alignof_CORBA_long_long=8
 ac_cv_alignof_CORBA_float=4
 ac_cv_alignof_CORBA_double=8
 ac_cv_alignof_CORBA_long_double=8
-ac_cv_alignof_CORBA_pointer=4
+ac_cv_alignof_CORBA_pointer=8
 ac_cv_alignof_CORBA_struct=1
 
 # postgresql
@@ -35,3 +35,9 @@ pgac_cv_alignof_int=4
 pgac_cv_alignof_long=8
 pgac_cv_alignof_long_long_int=8
 pgac_cv_alignof_double=8
+
+# apache
+ac_cv_func_pthread_key_delete=${ac_cv_func_pthread_key_delete=yes}
+apr_cv_process_shared_works=${apr_cv_process_shared_works=no}
+ac_cv_sizeof_ssize_t=${ac_cv_sizeof_ssize_t=4}
+apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
-- 
1.7.1



