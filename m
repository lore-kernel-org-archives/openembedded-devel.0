Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvlYG-0008SU-NY
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 08:33:06 +0200
Received: by iwn2 with SMTP id 2so6837804iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KuXF8s0PurBSTGW+gQw7pwlsBteWqrqf1tjxVng3jdg=;
	b=KGyybrKhUpV4KFhTywoqOyyDEZlIyDjsjXqgJPi3hNKx18fvvkKSw/C6bTw6em2y9G
	6gbccIVetkd6p2muOTftMmVCe4kO1ekjLEfFDoi0UaT8Wr/cVBXM6s0cwQabqLP/uBEm
	AD8e9lTM7rG8DFo69uwim6agzFgHcwM/cMrzY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=t5NtO/QNYA1yDAMFw6Pcv++FlKmlmuMycJvOruxIBAIX83XLK677WXy9uLOGI/39zq
	cjUKiANOGVwsWkAb55k3OGFNpsDL6jkQfg0wIRThvlgvftpjuVK0FL4zEtuwxVGYGB2D
	MRmv0tqqvOqab/R3KDBWNnGQux+YNBoBLeHs0=
MIME-Version: 1.0
Received: by 10.231.182.196 with SMTP id cd4mr1080815ibb.191.1284532335832;
	Tue, 14 Sep 2010 23:32:15 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Tue, 14 Sep 2010 23:32:15 -0700 (PDT)
In-Reply-To: <4C90130C.3040303@gmail.com>
References: <4C90130C.3040303@gmail.com>
Date: Wed, 15 Sep 2010 08:32:15 +0200
Message-ID: <AANLkTi=ZF3uT1Y6=yy_+wAizh64KYv0nRjq9BoFZN6E2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] p4: remove broken and 4 years old recipes.
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
X-List-Received-Date: Wed, 15 Sep 2010 06:33:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/15 Graham Gower <graham.gower@gmail.com>:
> Recipes are broken for all architectures except one (probably arm)
> because the files in the SRC_URI depend on TARGET_ARCH and the md5/sha256
> are presumably valid only for one of these.
>
> Anyone wanting perforce should submit new recipes for new perforce versions.
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Agree with the reasoning of Graham, so:

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Actually I am not too keen on having recipes that just "install" an
externally downloaded binary blob
(and functionally speaking this does not seem to be something for an
embedded system either)

FM


