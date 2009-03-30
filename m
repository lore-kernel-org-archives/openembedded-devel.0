Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LoJaU-0006pj-7x
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 17:39:46 +0200
Received: by rv-out-0708.google.com with SMTP id k29so2207534rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2009 08:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=5HVtNcYb1F2rH9V6Y95wik5qh2JvGu/SS3jEsF+Kb+s=;
	b=eOyBH9aYy1TMbuLVoim8PHb8HeZa020g0wiuDVoniuvt2AjPjvAbutaPYVRhFriBcl
	oiM24ijfA2+NAAmxsu4ntIPjlho/D/GzhuJDIsJuvJQZGHz1Wkmh93psm9b5oyh8xXov
	3lGRTJxutsGdXAdLMuICh9PA2wR8R5becUpzk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=YRCnY3MIm5TzJGlXr2HBf5RpDNbuzFEzhg+Ji2L/IcCf0cE3faT1me6f23tM1ybFPi
	L+Cyk6EfTL/Q1DgfY2GnHc+PxS7fHPGkpAn9odCQk87mqoJFxSBgzJZ5tmkhyi0MtkmB
	4/SYX+M0eTJoVP9IdKX96cIx68lApFil6a61I=
Received: by 10.141.180.16 with SMTP id h16mr2888174rvp.295.1238427459002;
	Mon, 30 Mar 2009 08:37:39 -0700 (PDT)
Received: from is.home (93-81-69-87.broadband.corbina.ru [93.81.69.87])
	by mx.google.com with ESMTPS id k2sm14338439rvb.4.2009.03.30.08.37.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 30 Mar 2009 08:37:37 -0700 (PDT)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Mar 2009 19:37:29 +0400
User-Agent: KMail/1.9.10
References: <20090328211530.7700adb1@mail.villafam.com>
	<200903301333.04881.hs4233@mail.mn-solutions.de>
	<49D0CFC7.9090902@dls.net>
In-Reply-To: <49D0CFC7.9090902@dls.net>
MIME-Version: 1.0
Message-Id: <200903301937.29417.jay4mail@gmail.com>
Subject: Re: TinyLogin
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
X-List-Received-Date: Mon, 30 Mar 2009 15:39:46 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> IMO (for what that's worth), we need to support the "everything is
> busybox!" sort of build; there's just no alternative for small devices.
>  But the problem is what do we do for that middle ground, for devices
> that can't fit the entire set of "proper" tools but might not be willing
> to take the security risk associated with running busybox SETUID.

Can we build two busybox'es? One with ordinary non-suid-tools and one with 
all suid? Is it crazy idea? :)

Can someone look here for login replacement (about using on Linux):
http://www.freebsd.org/cgi/cvsweb.cgi/src/release/picobsd/tinyware/login/

and may be here for some other tools:
http://www.freebsd.org/cgi/cvsweb.cgi/src/release/picobsd/tinyware/

-- 
Yuri Bushmelev


