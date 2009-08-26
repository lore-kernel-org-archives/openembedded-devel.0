Received: from [74.125.78.148] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1MgI35-0003ns-Jw
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 14:56:23 +0200
Received: by ey-out-1920.google.com with SMTP id 5so25515eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=Rp/8NaXeE4dDv+IgyfHwUDOJpYIFgvwTFU7eOcD7PNo=;
	b=Q+uqKq+QbTE4QvGqMbAN7Va+Pe7wBSqLfLeOpD/2s6Esy+UgPNAO6D83vllgak67qy
	da4oYh8BffjrEcXsZIDpRclzqFD8XY9dLMDByiErl2uWtSWHgTZ7TNtJlLbPHfthMqKR
	b2Ok5D+VHDTpfD0GhBvxUh2tmHGDV2O26NQ30=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=lZI9VBfr2dyD1MGPKkL/Kw3yxdHoe5zyhI+LmrqSBLuw0W/pcFn6euivFiXX/+zDfq
	qlATNVKyxsj/kG1tGLnGJ284eSQnODIVWedvYsdF/yMBc7jv1xheJYo4dazxx5T7IuhH
	RFUsg3QVlrmhSS9jzfU0X+SKOxW6rlQRzsXY4=
Received: by 10.210.71.12 with SMTP id t12mr8217992eba.60.1251290306988;
	Wed, 26 Aug 2009 05:38:26 -0700 (PDT)
Received: from ?192.168.0.7? ([94.180.47.99])
	by mx.google.com with ESMTPS id 28sm244493eye.6.2009.08.26.05.38.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 05:38:25 -0700 (PDT)
Message-ID: <4A952CEB.2020006@gmail.com>
Date: Wed, 26 Aug 2009 18:39:07 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Use '?=' instead of '=' for KERNEL_CC and KERNEL_LD
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
X-List-Received-Date: Wed, 26 Aug 2009 12:56:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Recently I've builded kernel using foreign toolchain and thought that 
possibility to set KERNEL_CC (and maybe KERNEL_LD too) in local.conf 
will be more convenient for developers than if it will be hard-coded in 
kernel.bbclass. Setting HOST_PREFIX is another way of course, but it may 
have influence on another things. I suggest it because in my case ?= was 
more convenient and I thought that it may be good thing in general case too.

What community think about it?

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index c5192d5..e457bf9 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -54,8 +54,8 @@ HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
 TARGET_LD_KERNEL_ARCH ?= ""
 HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
 
-KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} 
${HOST_CC_KERNEL_ARCH}"
-KERNEL_LD = "${LD}${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
+KERNEL_CC ?= "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} 
${HOST_CC_KERNEL_ARCH}"
+KERNEL_LD ?= "${LD}${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
 
 # Where built kernel lies in the kernel tree
 KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"

-- 
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



