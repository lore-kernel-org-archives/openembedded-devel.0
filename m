Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1L9Z16-0003hh-A3
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 06:50:48 +0100
Received: by rv-out-0708.google.com with SMTP id f25so1079787rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Dec 2008 21:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=9TH9l3tGhidz5FFswiqd1TSPs9nyV7xDNW4yp6j8HJw=;
	b=LsStHMCcnxSo6D0nQ5eN0tJ88DPpOXUthu0IRJcf6EcoUpShQRoZn7Z6w3BmFjTkGI
	SyAe/ms0Lwe41uyryrDbox7OHgtTF3ldnFHAB1hepM0n0NUhCnmxtZE/wjzcd9pvPVfP
	YvOYj7F9/pEJFc9t8xkgxiSOjOtAjfxKT84CE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=Gk4KlDXc32zICftrWP3Z6jwYRV5omqettUfRePjsQ0JvtzaiGmmi3cT8Qf7fYG6brC
	GPQ68r/ao4bRs9WfU93n84KVAMUR3qpGw2xIQcF42LaE9mcrILDfpEHd/RQhFrlLwrOH
	Cmuh0cweVPuiUYZq16sDNLjKgyHeva+qdqDO0=
Received: by 10.141.152.8 with SMTP id e8mr9481rvo.77.1228715217213;
	Sun, 07 Dec 2008 21:46:57 -0800 (PST)
Received: by 10.141.51.16 with HTTP; Sun, 7 Dec 2008 21:46:57 -0800 (PST)
Message-ID: <a7f8874a0812072146m13e56d10hcbcfe5171d27389e@mail.gmail.com>
Date: Sun, 7 Dec 2008 21:46:57 -0800
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: Indentation Error with latest bitbake (svn rev 1145)
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
X-List-Received-Date: Mon, 08 Dec 2008 05:50:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Has anybody seen this error yet:

bitbake -p
ERROR: Error in compiling:
ERROR: The lines resulting into this error were:
ERROR:  46:IndentationError:'    import bb'
ERROR: Printing the environment of the function
ERROR:  0042:#                          bb.note("overriding
PACKAGE_ARCH from %s to %s" % (old_arch, mach_arch))
ERROR:  0043:                           bb.data.setVar('PACKAGE_ARCH',
mach_arch, d)
ERROR:  0044:                           return
ERROR:  0045:
ERROR:  0046:    import bb
ERROR:  0047:    pstage_allowed = True
ERROR:  0048:
ERROR:  0049:    # These classes encode staging paths into the binary
data so can only be
ERROR:  0050:    # reused if the path doesn't change/

I am running kubuntu 8.04 and a fresh checkout of org.openemedded.dev

-- 
Henry von Tresckow (hvontres)


