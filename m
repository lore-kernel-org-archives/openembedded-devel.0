Received: from [209.85.219.15] (helo=mail-ew0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LSWEa-0006va-Np
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jan 2009 13:43:05 +0100
Received: by ewy8 with SMTP id 8so2010700ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2009 04:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=Ljm/Nbg+41yeYpiqr9moFCKU54O+38PRDb8jgswEh90=;
	b=extcI/bWu9Q7ZTryRIwmBoB+dVwJhWmptdihSPiV/7KkEnDPHTtCHzYS2fLJEBsHbI
	NwLiwlprLNqTlEWJ3cdfiG6XiIAJdniy/v70NTmmMoaCvXRayDUWkRnPAk4bMYzXAMYN
	c0orPLsjnZzuWSKMGn98yofjk/wu4jaA1PARM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=ZDee3YNnEuGVLTDMPL3biFuzfIzRSHjwk6nzOT2ii/8DjjiUVybPZ4LOlWm8+uIWdR
	bGmdqDJ4Z7EdQdm4XoiwAPG8BmxU6zkiCqR9AVbbJ/ZUPubhXe0RRhLz/12pV8uAQW+T
	qpJchUkWt4/WifBpgZ8foGhKiU1Ftapb3PjFE=
Received: by 10.86.76.20 with SMTP id y20mr56438fga.37.1233232521709;
	Thu, 29 Jan 2009 04:35:21 -0800 (PST)
Received: from is.home ([93.81.136.171])
	by mx.google.com with ESMTPS id 4sm1963398fgg.44.2009.01.29.04.35.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 29 Jan 2009 04:35:21 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Jan 2009 15:35:16 +0300
User-Agent: KMail/1.9.10
References: <1233059140.7818.4.camel@ubuntu2> <49802D8A.6020208@gmail.com>
	<1233227644.6517.5.camel@ubuntu2>
In-Reply-To: <1233227644.6517.5.camel@ubuntu2>
MIME-Version: 1.0
Message-Id: <200901291535.16495.jay4mail@gmail.com>
Subject: Re: Build problems
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
X-List-Received-Date: Thu, 29 Jan 2009 12:43:05 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> I try to install GRUB using
>
> sudo grub-install /dev/sdb
>
> but the answer is
>
> /dev/sdb does not have any corresponding BIOS drive.

Try with --recheck-devices or something like (look at grub-install --help).

-- 
Yuri Bushmelev


