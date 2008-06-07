Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1K4sJv-00044n-Bx
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jun 2008 08:54:35 +0200
Received: by yw-out-1718.google.com with SMTP id 5so825332ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jun 2008 23:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=tEeXqq/HyYQ2lOiJZWeYr00S53Vgh59B34vOSLK2z1Y=;
	b=oRLp6BmDJBCz6Y12TTh/HviIM+U/VDXAOQ86mPq+43r4s/tSUS+A2vY4Fn13JPbN9z
	Q9xXsO9YvMokm00NHv6oqYVtKKI9maPMjzAu0CApHYIdFFhp8Krz3Pvt0m0lpdCCE9di
	mipuLS2yRxB5eMoBzVXOZN8y7lkDP3p8ZPmzs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=W0+sKhXNhkQ7DkhScEBMjw3QdrO9/46iaEoGSltxcrWJQeVwA+MzBXmwfM0rsVV2NL
	zhtW3hyyXk1DiuTn96yG9Y66GQqg6NiW2gn2HroSfOV3NP07KsT2m8ZHujAmZGU7rnEQ
	hLufPqkwdQ3/iMQKNlztI4RjQgWwZn3NW2wO0=
Received: by 10.150.58.1 with SMTP id g1mr1744834yba.85.1212821379842;
	Fri, 06 Jun 2008 23:49:39 -0700 (PDT)
Received: from ?192.168.1.204? ( [68.188.71.196])
	by mx.google.com with ESMTPS id x48sm8488332pyg.18.2008.06.06.23.49.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 06 Jun 2008 23:49:37 -0700 (PDT)
Message-ID: <484A2F7E.9020402@gmail.com>
Date: Sat, 07 Jun 2008 01:49:34 -0500
From: Gordon <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080516214710.GA21911@rhein.zuhause.netz>	<200805182358.50192.mickey@vanille-media.de>
	<4830AB85.80406@ecs.soton.ac.uk>
In-Reply-To: <4830AB85.80406@ecs.soton.ac.uk>
Subject: Re: Getting a tested patch into Angstrom stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 07 Jun 2008 06:54:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2008 05:19 PM, Matthew Swabey wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I have developed a backport for 2.6.24-rp to fix the zaurus' pxa2xx-udc
> clock bug.
> 
> If I want it to get into the current angstrom stable who do I bug
> (chortle, pun :) )?

This patch conflicts with two udc patches for tosa, as you aware in your 
bug report. We need to either conditionally apply this for machines 
other than tosa or find a way to solve the conflict.

Regards
Gordon



