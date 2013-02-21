Received: from mail-bk0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1U8Vll-0002hS-M2
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 14:01:15 +0100
Received: by mail-bk0-f51.google.com with SMTP id ik5so4157139bkc.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2013 04:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=vJMDy/VPswpBUuXFhaEnbv5Pdh5xRsBB2kKN5e+02JI=;
	b=PTbmPeSr0YT3WlqDr3/8NGJKSammfi2KcZeP2wjGBUQI0Yb5/MaRJYdorwCfBetfKa
	PDpHjpWU6IpiImXRArTcSDRE3tQ3K+liD94UEkDtL8/zgtzzSq7q7dLUxzxQ23C1xkFm
	nusUjpjt0nCNoEsgZIIdVTCju1H0NhfV4Y+ErP/BeYvysoX1TWIO/6CyZT5/iWLYtFpQ
	bP+FLPPLeDPbJFtLHsqX/BddSNZ3s4BPqZ2lciITcx6t4UDstPyl6259k0Dwn4iMsyBJ
	BptowEtpskslbhAcBPOMzvME9FSidpEdp97XDYAnI8swlqxBtcBvUkHvyPj1rwJxkG38
	NuLA==
X-Received: by 10.204.127.6 with SMTP id e6mr10369398bks.13.1361450681623;
	Thu, 21 Feb 2013 04:44:41 -0800 (PST)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.204.25.141 with HTTP; Thu, 21 Feb 2013 04:44:21 -0800 (PST)
In-Reply-To: <51260D8D.7040702@linaro.org>
References: <51260D8D.7040702@linaro.org>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Thu, 21 Feb 2013 21:44:21 +0900
X-Google-Sender-Auth: r36TymxrKQAWdQv9PCccwaZjBPY
Message-ID: <CAPESJy627Ag==aVvd1jk0Eh5Ai0imph8_aYu=bQNK=WBcaPbuA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Building with gcc-4.6 is not working
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
X-List-Received-Date: Thu, 21 Feb 2013 13:01:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

2013/2/21 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>:
> CalledProcessError: Command 'tar -cf - -C
> /tmp/del/oe46/build/tmp-eglibc/work/armv7ahf-vfp-neon-oe-linux-gnueabi/gcc-cross-initial/linaro-4.6-r5/pkgdata
> -ps . | tar -xf - -C
> /tmp/del/oe46/build/tmp-eglibc/pkgdata/armv7ahf-vfp-neon-oe-linux-gnueabi'
> returned non-zero exit status 2 with output tar:
> /tmp/del/oe46/build/tmp-eglibc/work/armv7ahf-vfp-neon-oe-linux-gnueabi/gcc-cross-initial/linaro-4.6-r5/pkgdata:
> Cannot chdir: No such file or directory

this is the part where you must dig into.

The pair of tar commands are used to copy directory tree, and first
one can't source directory:
/tmp/del/oe46/build/tmp-eglibc/work/armv7ahf-vfp-neon-oe-linux-gnueabi/gcc-cross-initial/linaro-4.6-r5/pkgdata
-- 
Takeshi Hamasaki


