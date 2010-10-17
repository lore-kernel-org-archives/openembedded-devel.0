Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7aaf-0002ll-Ok
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 23:17:00 +0200
Received: by bwz9 with SMTP id 9so166448bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 14:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=qY51dsSJWFy9/C3jRe+12FeoacWusUxZkRn2KUP8EZk=;
	b=PTV+euyhH8+rZ+a/CGMXIW1Dw+6xyD/7PcHGWPye8b6GG+A+fSr5ufS4J03kd6+KQM
	Nrvmcj/qNBsOMcwdZ/fEGJ4Pg7hbzsYX19UDoI5wfdh4pQVfgIzAM7w/YFUPPZ0mAeS4
	/xYsCyCicp3uyOaXQbv/YPdxOVM9VOSjfbHSw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=i+mz3jM2HxosyYhLp+APl0h9gBL/w6MUPmtpvW1OuudXd3GkMYtkK4pSRi2+KG2GTl
	tovtXGECWll+1hp9XioLDLATUXG3asXqblQG5DrG8iYn3/hzYYrLzCm7liRFixtE7ftH
	OaoxYESQciuYRTWG3LadEK2NG9JcYcy9BdAXU=
Received: by 10.204.27.20 with SMTP id g20mr3645949bkc.114.1287350145318;
	Sun, 17 Oct 2010 14:15:45 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t10sm10513201bkj.4.2010.10.17.14.15.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Oct 2010 14:15:44 -0700 (PDT)
Date: Sun, 17 Oct 2010 23:15:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101017211540.GB3324@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] do we really need all OVERRIDES in FILESPATH?
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
X-List-Received-Date: Sun, 17 Oct 2010 21:17:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Currently
bitbake -e -b xserver-xorg-conf_0.1.bb | grep ^FILESPATH= | sed "s/:/\n/g" | wc -l
shows 65 directories where file:// from SRC_URI can be found.

base_do_unpack is looking for first directory where requested file
exists. Most files are IMHO found in FILESPATHPKG PN, files or P
(without an override used)

Number of directories tried before
PN:    38
files: 51
P:     25

I see many recipes really using that MACHINE or DISTRO is in FILESPATH,
few users of TARGET_ARCH and quick find/grep doesn't show any users of 
other OVERRIDES in FILESPATH.

BTW: ie initscripts have initscripts/files/arm/alignment.sh but that's only
alignment.sh and SRC_URI_append_arm = " file://alignment.sh" would work
ok even without arm in FILESPATH.

What about using only ${TARGET_ARCH}:${DISTRO}:${MACHINE} in FILESPATH
instead all OVERRIDES?

And if there is need to use some special OVERRIDE then recipe can use
SRC_URI_append_override.

Number of directories tried before
PN:    11
files: 15
P:      7
end:   20

If I'm overlooking other usages of FILESPATH or if this I/O saving is
not worth it, let me know.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


