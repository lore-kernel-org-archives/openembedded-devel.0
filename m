Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 62F816AAB0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 14:17:20 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so3719685pab.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=F6wtePCpop1tPuKIjncZcWAgc32BsvvOOJtgg634og0=;
	b=tSELc0OZbPMUCwQDOl9ywKIbR9grMT6ghpnq43XvHTQMb3x4zL+puWuYabD8Aoynk7
	/DvrWMtfFhUoZdMfL9pkmvCrmtr6ryaW6P0WMseGHsHDKMN1Gg7MEYqpJDWFePepDeiw
	FYwx8C+4ANUVqezHfhduNJJiYG8+Fq8vrpTZEoWInHEYKfPOS1aVEmJQ+JA9S9OnC7dx
	JSKOpGvrtPOQHQITI01oPzrAzoZ1s9NOQvCyEtaej+R9wPIAa+aSMAOTvnKHM4fsq3e3
	6gPZ4j4TRiWSWVGz6VARmjMu7kquO5NkO+VCpcWumIhZ0FiEhw8fpqMv4vN2MYSae8w/
	Y/Pw==
X-Received: by 10.68.163.4 with SMTP id ye4mr19895680pbb.207.1371046641446;
	Wed, 12 Jun 2013 07:17:21 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	cq1sm19328049pbc.13.2013.06.12.07.17.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 07:17:20 -0700 (PDT)
Message-ID: <51B881CC.4050303@gmail.com>
Date: Thu, 13 Jun 2013 00:12:28 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Fix guide for unshipped files in run directory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2013 14:17:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

After 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=ea647cd9eebdc3e3121b84074519c4bb305adac9, 
some recipes that previously installed /var/run or files inside /var/run 
may now show QA warnings. The following is a rough guide on how to fix them.

Fix guide for unshipped files in run directory:

- If package just installs empty run directory, remove it by adding
the following to do_install_append():
rmdir "${D}${localstatedir}/run"
rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
Reference: 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=2aa350acca1c6b6ada6a4508611ce25e9f9576ab

- If the package creates folders inside the run directory, stop the
service, rename to something else and try starting it again. If the
service recreates the folders with the same permissions and still
starts correctly, these folders can be removed in do_install_append()
with:
rm -fr "${D}${localstatedir}/run"
Reference: 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=aa6408b05c5eb17b6e9fc280069f3b15eafbdab0

- If the package actually requires folders inside run directory to
start up properly and doesn't create them automatically, a file
listing them needs to be added to tmpfiles.d (for systemd) and
volatiles (for sysvinit).
Reference: 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=9623ccf70221f81861a42cac1eb372d77ea40ba9

Regards,
Jonathan

