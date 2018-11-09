Return-Path: <winfried_mb2@xmsnet.nl>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Nov 2018 20:24:27 UTC
Received: from smtp-1.concepts.nl (smtp-1.concepts.nl [213.197.30.124])
	by mail.openembedded.org (Postfix) with ESMTP id 750926C182
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2018 20:24:27 +0000 (UTC)
Received: from [213.197.30.241] (helo=webmail.xmsnet.nl)
	by smtp-1.concepts.nl with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <winfried_mb2@xmsnet.nl>) id 1gLD5q-0004U3-K5
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Nov 2018 21:09:26 +0100
MIME-Version: 1.0
Date: Fri, 09 Nov 2018 21:09:26 +0100
From: Winfried <winfried_mb2@xmsnet.nl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <6d0000e0ded4140378a2e54e28c3acc9@xmsnet.nl>
X-Sender: winfried_mb2@xmsnet.nl
User-Agent: Roundcube Webmail/1.3.6
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1gLD5q-0004U3-K5
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: winfried_mb2@xmsnet.nl
Subject: [meta-qt5] eglfs imx6 compile errors ?
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
X-List-Received-Date: Fri, 09 Nov 2018 20:24:27 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am upgrading our i.MX6 BSP (Congatec QMX6) to Yocto Sumo (using the 
default gcc 7.3.0).

Both when using sumo branch and master branch of meta-qt5 I get the 
following compile error:

| 
/home/wdobbe/yocto/dynniq-sumo/build_v2x-m300/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/git/src/plugins/platforms/eglfs/deviceintegration/eglfs_viv/qeglfsvivintegration.cpp: 
In member function 'virtual void QEglFSVivIntegration::platformInit()':
| 
/home/wdobbe/yocto/dynniq-sumo/build_v2x-m300/tmp/work/cortexa9hf-neon-mx6qdl-poky-linux-gnueabi/qtbase/5.10.1+gitAUTOINC+6c6ace9d23-r0/git/src/plugins/platforms/eglfs/deviceintegration/eglfs_viv/qeglfsvivintegration.cpp:68:41: 
error: invalid conversion from 'void*' to 'EGLNativeDisplayType {aka 
wl_display*}' [-fpermissive]
|      mNativeDisplay = fbGetDisplayByIndex(framebufferIndex());
|                       ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~

and a few similar conversion errors.

Is the Vivante eglfs support currently broken, or am I doing something 
wrong ?

thanks in advance,

Winfried

