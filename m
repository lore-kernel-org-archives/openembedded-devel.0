Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PCBKQ-0005Ys-KY
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 15:18:39 +0200
Received: by bwz10 with SMTP id 10so3272044bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Oct 2010 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=TkxJANLQlwTi2bT7N5Ugio8ZqfG1HCukw/P7Ee6zO2Q=;
	b=WZNZ1rk/QXlddZcCHySFui9Vop7sbq6K06bY4g6DehdRFrW+LMkm8+I0lLQc3e3mAQ
	NRbcEJv5L+p2uoLfTKOzZlGWarlLHfCQ+PrXsBGHcBEL3zFrVkSFxQHkDf4Ii3Ksvc/w
	6m2eHFfBiUd9OsJ9KYZK5L/ixBz9itB+5JeVI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=HWGzqbS0auRiow7zzh3MxskSkw3tahqZCadvifZnt1eEx8pwNv8gl4pKb9MWybnVcu
	pcC/gYSR5p04/LlgHe2ewiyjRRp6mjKniEMoBMyBzyhzFWBTEJFZD0qC4Lo9qIzMyw1v
	Uh8a+CZOgbH/xPv+aI/byHXZucZNXvFkQrXGU=
Received: by 10.204.100.82 with SMTP id x18mr10886864bkn.75.1288444670909;
	Sat, 30 Oct 2010 06:17:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y19sm1742065bkw.6.2010.10.30.06.17.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Oct 2010 06:17:49 -0700 (PDT)
Date: Sat, 30 Oct 2010 15:17:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101030131745.GA6312@jama>
References: <1288395329-10474-1-git-send-email-eric@eukrea.com>
	<4CCB5DC0.3030607@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4CCB5DC0.3030607@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: remove unused versions
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
X-List-Received-Date: Sat, 30 Oct 2010 13:18:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Oct 30, 2010 at 01:50:24AM +0200, Eric Bénard wrote:
> Le 30/10/2010 01:35, Eric Bénard a écrit :
> > keep the following versions :
> > 1.2.1 (used by oplinux)
> > 1.7.2 (used by nylon)
> > 1.13.2 (used by angstrom, kaeilos and slugos)
> > 1.17.1 (used by angstrom)
> > 1.17.3 (latest one)

not sure if it's because busybox config or added by latest version but
with 1.17.3 I got 4 colisions:

ln: creating symbolic link `/usr/bin/flock': File exists
ln: creating symbolic link `/usr/bin/sha256sum': File exists
ln: creating symbolic link `/usr/bin/sha512sum': File exists
ln: creating symbolic link `/usr/bin/timeout': File exists

I've patches for util-linux-ng (flock) and coreutils to use u-a on those, so
I'll push it today.

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


