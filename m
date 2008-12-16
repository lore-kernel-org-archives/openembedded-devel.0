Received: from [209.85.200.172] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LCfFW-0002yC-Nc
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Dec 2008 20:06:31 +0100
Received: by wf-out-1314.google.com with SMTP id 29so3247047wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2008 11:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=U2RCoqslWMwjha/TE6V4WMkrH9zKOpVyZfGJ3sAVXyg=;
	b=DxEMgN9ZkcsUTJIoDPEztGfdXVF9wbFu3l6SrJcP8kcJHxWZLMczmz9DTBfgaMuDn9
	mFbTVz8eVXANcpa2aspaEgTiihljQ64vT7CV1CJPCStPv3eoIi310pCwF5kiojyxMUVV
	UhgASC+BxsasyWcN1j1/JgO+YurtGw8l0HR/g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=UpeeblMHGSveqmrq95ET/Wy5bYNF2hYygQhjrw8M5z/5PyQf1xQnADk5NUclic2mur
	NXXpYnylwvyHFQVoCX/UzWJN1Eq41hKELgWEPx18qObnOKvVjXfAEiNymaMkbsammUhW
	oW/pwoirq5fgriBOPeYaOgZBDgvZK4kYlokL8=
Received: by 10.114.144.1 with SMTP id r1mr5947540wad.2.1229454122329;
	Tue, 16 Dec 2008 11:02:02 -0800 (PST)
Received: from localhost (adsl-71-146-25-70.dsl.pltn13.sbcglobal.net
	[71.146.25.70])
	by mx.google.com with ESMTPS id z15sm1516624pod.14.2008.12.16.11.02.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Dec 2008 11:02:01 -0800 (PST)
Date: Tue, 16 Dec 2008 11:02:00 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081216190159.GA9967@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Bump kernel version for osk5912
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
X-List-Received-Date: Tue, 16 Dec 2008 19:06:34 -0000
X-Groupsio-MsgNum: 7003
Content-Type: multipart/mixed; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I have tested this patch which uses linux-omap instead of linux-omap1
on omap5912 machine.

OK for .dev ?

Thx

-Khem



--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch

diff --git a/conf/machine/omap5912osk.conf b/conf/machine/omap5912osk.conf
index d8caf93..9fcd76e 100644
--- a/conf/machine/omap5912osk.conf
+++ b/conf/machine/omap5912osk.conf
@@ -5,7 +5,7 @@
 TARGET_ARCH = "arm"
 
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
-PREFERRED_PROVIDER_virtual/kernel = "linux-omap1"
+PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 
 UBOOT_ENTRYPOINT="0x10c08000"
 

--k1lZvvs/B4yU6o8G--
