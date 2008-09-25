Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <maurizio.rottin@gmail.com>) id 1Kisa0-0000FH-J3
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Sep 2008 17:16:32 +0200
Received: by yw-out-1718.google.com with SMTP id 5so92685ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=BZ2Mz/MJsI5pGCWsCnM/n8mB2huGwzbA/Jn0eEGFtCE=;
	b=pA51xuR3aWdi1mmI5Q1ahCIFJ/1wp6i8gey4awqJ9i3Ul1qD8XKkKCkyF18HwmBv2I
	YYeHcQ95EqiptFmakaoMQr0ZCZEd9qbBB+tZS5i/YzAddfk5uOTeGjR/awM7zSTwZnoO
	FuGpg6zp4Op4/Xas2lRvqjlI15FsgA7lFu26g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=l3jU5gPbKIC3Jy6Fzxin4ILA+CWaLyzxOQyMPmKCXNcVQpEgn4CdjF5IqDTdQ3P3uh
	mX16CmhUhJ1IvkUR7XmRatJITe6doFBTKEZ58XlCiCxqEZcQIrU3dE6HJ6zFUXRTGZs4
	NX8u0yJvrbznESIIxQf1r+ulPtCxZseVB2ars=
Received: by 10.151.40.3 with SMTP id s3mr26043ybj.204.1222355570549;
	Thu, 25 Sep 2008 08:12:50 -0700 (PDT)
Received: by 10.151.27.11 with HTTP; Thu, 25 Sep 2008 08:12:50 -0700 (PDT)
Message-ID: <e83473390809250812r1ce933b1nd528d3dcf8b3d777@mail.gmail.com>
Date: Thu, 25 Sep 2008 17:12:50 +0200
From: "Maurizio Rottin" <maurizio.rottin@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <e83473390809250808h7ee77edeo8540ff1aff235c7e@mail.gmail.com>
MIME-Version: 1.0
References: <e83473390809250808h7ee77edeo8540ff1aff235c7e@mail.gmail.com>
Subject: Re: logrotate fails to install (while compiles)
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
X-List-Received-Date: Thu, 25 Sep 2008 15:16:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/9/25 Maurizio Rottin <maurizio.rottin@gmail.com>:
> logrotate fails to compile with this error:
>
> ERROR: log data follows
> (/stuff/tmp/work/logrotate-3.7.1-r1/temp/log.do_install.12011)
> | strip: Unable to recognise the format of the input file
> `/stuff/tmp/work/logrotate-3.7.1-r1/image/sbin/logrotate'
> | install: strip process terminated abnormally

if it helps i'm using gentoo, and /usr/bin/install is part of coreutils

my coreutils setup is
sys-apps/coreutils-6.10-r2  USE="acl nls (-selinux) -static -vanilla -xattr"

bye,

-- 
mr


