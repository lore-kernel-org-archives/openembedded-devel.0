Received: from [209.85.211.198] (helo=mail-yw0-f198.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mmca9-00032p-JI
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Sep 2009 02:04:44 +0200
Received: by ywh36 with SMTP id 36so3271873ywh.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Sep 2009 17:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=PxUawl4hS3Ize5jQykfSlB6PsnWrcDa+NCCpMP6p4+A=;
	b=cthObFRq6TcvBPypf8YW38z/J1HwonS6lRHNOZMszeiPpRAaJgESDH+YgM1EYFm+k/
	PS/HLjq1IcMGAXG+UwdkS88pQiqZK3dz1vyJirMIT2V0KwPBdTU58aQpFPPEV/cCHl4B
	VSrZS3HL/tPqoZ7OfI/DfKUaswwBrZwTKJT4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=doBPw2izhcjEJsRmyofX5EJmaC8g/3QX1mmSWEzyTjR0vHn33h/l2zAP/D1qzH1WUX
	I/Q6XmwVTelLFR/42+CFbaF9A9NEGQm75O0bHRLi2Dr835Ar+b4cVs7jXBIPbyB1gj43
	rVix6eYyVgMmK+C/s15RUHp96qWiKe8dxpn98=
Received: by 10.151.20.17 with SMTP id x17mr7448111ybi.102.1252800251488;
	Sat, 12 Sep 2009 17:04:11 -0700 (PDT)
Received: from gmail.com (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id 22sm2486376ywh.4.2009.09.12.17.04.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 12 Sep 2009 17:04:10 -0700 (PDT)
Date: Sat, 12 Sep 2009 17:04:05 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090913000405.GA29370@gmail.com>
References: <20090912200308.GA10819@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20090912200308.GA10819@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.211.198
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] mysterious armv5te-linux dir under staging
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
X-List-Received-Date: Sun, 13 Sep 2009 00:04:44 -0000
X-Groupsio-MsgNum: 13079
Content-Type: multipart/mixed; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline

--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (12/09/09 13:03), Khem Raj wrote:
> Hi
> 
> On hrw's suggestion I looked into the mysterious directory armv5te-linux
> creation on my omap5912osk build.
> 
> This directory is created by staging tasks for cross packages like
> gcc-cross, binutils-cross gdb-cross etc. 
> 
> This is because in bitbake.conf we set 
> 
> BASEPKG_HOST_SYS = "${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
> 
> which is ok for target recipes but its not ok for native or cross
> recipes.
> 
> It works for native because native.bbclass redefines it. I decided
> to change it to 
> 
> 
> BASEPKG_HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
> 
> HOST_ARCH is defined based on -native -target or -cross package
> so it works in all cases. Overriding in native.bbclass would not
> be needed but I left it in there

It turns out to be that the correct results are obtained if it is
overwrritten in cross.bbclass.

Here is revised patch.

Thanks
-Khem


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index 7debde6..68e3803 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -17,6 +17,7 @@ HOST_OS = "${BUILD_OS}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_EXEEXT = "${BUILD_EXEEXT}"
+BASEPKG_HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"

--2oS5YaxWCcQjTEyO--
