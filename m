Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1MhOtN-0007FB-9s
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 16:26:57 +0200
Received: by ewy19 with SMTP id 19so3636828ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 07:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=xEeMplWbCQ4NppEQYD27M0gRW6kVVkQeybvMoLHoQ3k=;
	b=suXBQCI1G+0gY0qOWPTA452tSWzM4PjeBCaCaef15PIs/jSk07GEqMDGzLlOSos81z
	OfhSAWyfdO5otcPmOHA/Efru48uslPS8bTJyrIBWFGlnvCgxHzIfKS1tDbnQhDKSNuP5
	ZnagYSMBgI1lrE461H+6wCH9MOfjMWLst8sGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=QoDgL/ptjrFxzs/9WLcRfPWxjBdJBQDd+zRHK+ZeDFMwherVhCalbm+ZFVA4KWbCCz
	hhj066XUSYLrSxgy4FZX+dIoIKQYeFZS/zbxfX+894jLh/+5gXOscolc+SaOTrhu4Kl1
	jwOzNXwARQnHLt8yPodkK8RGjmkhYWXTgkJuQ=
Received: by 10.211.128.15 with SMTP id f15mr2665723ebn.84.1251554918308;
	Sat, 29 Aug 2009 07:08:38 -0700 (PDT)
Received: from ?192.168.0.7? ([94.180.58.182])
	by mx.google.com with ESMTPS id 5sm7274eyh.3.2009.08.29.07.08.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 29 Aug 2009 07:08:37 -0700 (PDT)
Message-ID: <4A993694.7040205@gmail.com>
Date: Sat, 29 Aug 2009 20:09:24 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: eglibc, do_prep_locale_tree() [: binary operator expected
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
X-List-Received-Date: Sat, 29 Aug 2009 14:26:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

While building eglibc faced following error -- it fails on do_package 
with following message:
  libgcc_s.so.1 must be installed for pthread_cancel to work

Digged a little and found in log.do_prep_locale_tree.10438:
  
/home/raydan/work/oe/build/tmp/work/armv5te-oe-linux/eglibc-2.10-r6.1/temp/run.do_prep_locale_tree.10438: 
line 795: [: 
/home/raydan/work/oe/build/tmp/cross/armv5te/arm-oe-linux/lib/libgcc_s.so: 
binary operator expected

Line 795 context in run.do_prep_locale_tree.10438 is:
  795: if [ -f 
/home/raydan/work/oe/build/tmp/cross/armv5te/arm-oe-linux/lib/libgcc_s.* 
]; then
  796:     cp -pPR 
/home/raydan/work/oe/build/tmp/cross/armv5te/arm-oe-linux/lib/libgcc_s.* 
$treedir/lib
  797: fi

Due to this libgcc_s didn't copied into lib dir and eglibc couldn't find 
it at package stage.

Maybe it should be:
  156: if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so ]; then
instead of
  156: if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.* ]; then
in recipes/eglibc/eglibc-package.bbclass?

P.S.: org.openembedded.dev branch

-- 
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



