Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JwOfg-0004Sg-Rm
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 May 2008 23:38:00 +0200
Received: by an-out-0708.google.com with SMTP id b38so25305ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 May 2008 14:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	bh=TnpfJ8ISaWAoYwV9ih130T/ffonqK82bQqWKjqRluNE=;
	b=EwLozGVmtuEGbeC418/k0GZiuZ7o8PxNJf/wIR3uHxXk+quR02N5mtICTJFo1APM2SU+FzNonXlyF0uShAOJRlDOkETEk0xpIA5vTvuZHrOPNFd27HdYPOvMEPTs9bLJ6R0D6cAc6jxbsyBIxQCHLq0UVZ0mwPDdeabo3Ge8I8Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=MTotiOFBfx1QcEmrSQIL5RQ0EotLnGPmFyABiOslIXbInk1F3arVeU9eY6US0/gVyyA+WZNGupqVKDpLaELOYDHjvnZDXy5j3A/fch4vhEAKaXLmQLIaU8lLnYhocW0dUoARdX1kWCIglVTbiXAXeYsq3Q9tu+VPWFSRtQ+7orw=
Received: by 10.100.127.15 with SMTP id z15mr2073384anc.61.1210800984982;
	Wed, 14 May 2008 14:36:24 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Wed, 14 May 2008 14:36:24 -0700 (PDT)
Message-ID: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
Date: Wed, 14 May 2008 23:36:24 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
Subject: [RFC] Stop on multiple providers but none explicitly specified
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 14 May 2008 21:38:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

in trying to explain a new user why his build fails, it was the
classic situation of multiple providers available but non specified:

NOTE: multiple providers are available for virtual/libc
(external-toolchain, uclibc);
NOTE: consider defining PREFERRED_PROVIDER_virtual/libc

Now, as far as I know, this makes the build non-deterministic, because
bitbake "just" chooses one.

Why do we want this behaviour? I cannot see any benefit in this situation.

We should at least prefer one over the other, or just bail out in my opinion.

Regards,
-- 
Leon


