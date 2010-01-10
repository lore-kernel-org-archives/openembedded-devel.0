Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NTqaB-0003bc-Fd
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jan 2010 06:43:26 +0100
Received: by pxi13 with SMTP id 13so11517496pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 21:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:date:to:cc
	:subject:mime-version:content-transfer-encoding:from:organization
	:message-id:user-agent;
	bh=y/5ylcXv+7t2g1oriJjW3Wr7Byjjat9wTgFuZ0TPox4=;
	b=oEmShnFG51jONYeHnVnCNGnWTHX1vUXsZuFfP2+pTGvQRBg3wfRk9+7yKkrauA9av/
	NHnPpvlXejpLJbe2Gxddal4JaB03OPzlrS/utCL7OqC2paENx+4WHSMeAZl9818D0X8a
	PwwK9rnfkaH61lojG3htNzUviAEFKQ6l872mQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:date:to:cc:subject:mime-version
	:content-transfer-encoding:from:organization:message-id:user-agent;
	b=tl4pH0EmVGy2OhtjB+7Y8sPs6Ikk4IkwK+Pnq4CX7CZVRalVuy5X8bgmn4q6fKSzxz
	FO2STmXlZ0jRN78jj5IuVGgi6SBLZJ+x94qDIrFWNrGacHEiuH5V92dTg3QUavdqRweq
	A/w6BZK16fXeFQM+uAFQTwLBqZIBlVhizlk/g=
Received: by 10.140.55.12 with SMTP id d12mr1493050rva.160.1263102075041;
	Sat, 09 Jan 2010 21:41:15 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.100.219])
	by mx.google.com with ESMTPS id 20sm20155273pzk.5.2010.01.09.21.41.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 09 Jan 2010 21:41:14 -0800 (PST)
Date: Sun, 10 Jan 2010 13:41:05 +0800
To: raj.khem@gmail.com
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6ax2r1qmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: [Bug 5362] compilation of gcc-cross-intermediate-4.4.2 failed due to lack of fenv.h
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
X-List-Received-Date: Sun, 10 Jan 2010 05:43:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi raj,khem:
   I think the change you made is not equivalent with before. Please see  
the following patch. When TARGET_ARCH == powerpc, the  
EXTRA_OECONF_append_linux-uclibc should be set "--disable-decimal-float  
--without-long-double-128", but in your change, it will be set  
"--without-long-double-128"

Thanks a lot!

diff --git a/recipes/gcc/gcc-4.4.2.inc b/recipes/gcc/gcc-4.4.2.inc
index 4b11f31..32a27c0 100644
--- a/recipes/gcc/gcc-4.4.2.inc
+++ b/recipes/gcc/gcc-4.4.2.inc
@@ -36,4 +36,4 @@ EXTRA_OECONF_BASE = " --enable-libssp \
  EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "
  EXTRA_OECONF_append_linux-uclibceabi = " --disable-decimal-float "
  EXTRA_OECONF_append_linux-uclibcspe = " --disable-decimal-float "
-EXTRA_OECONF_append_linux-uclibc = " ${@base_contains('TARGET_ARCH',  
'powerpc', '--without-long-double-128', '',d)}"
+EXTRA_OECONF_append_linux-uclibc += " ${@base_contains('TARGET_ARCH',  
'powerpc', '--without-long-double-128', '',d)}"

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


