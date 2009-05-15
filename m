Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1M54ji-0000q4-LN
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 23:14:34 +0200
Received: by bwz19 with SMTP id 19so2144239bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 14:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GLLYf4aiJy1g2viVQ7pthMr0o2vvNF8lQ2zTnFD6owM=;
	b=jrQaPoM9eM6oYB+HYvEGd90kudmo4mTlJBEFgU72GOflOsJzTTdzqbhcbNrHM5mGg2
	JNHYzsKMCQNdDgjPnAdX50+vtaKhPUdhTtLWJo7bN8qyt5t+whzXCI6mDkRaQYfjWx71
	qzWo2yZsovvBoF3fjBvtwAxW3t/FLjA3B2pgs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Xvwj4+6EF5jNTcw863m8WqfeO9YdmQfmDyw5/H0jCFdq97VsM+SXG1AQlmiAcxzjw6
	M9UVRez+GJ6K+6QjKuQHIG8n1ZXjpm2CaIL4nqvM4cTLQmsEBZeZZK57pCMj/BgM4erG
	t5O9zkPVMHbOlap44B14jVsGg7A2y2FH9K3Wc=
MIME-Version: 1.0
Received: by 10.223.117.14 with SMTP id o14mr2926600faq.21.1242421653522; Fri, 
	15 May 2009 14:07:33 -0700 (PDT)
In-Reply-To: <b6ebd0a50905150809y36426e69u96ac070414b96029@mail.gmail.com>
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
	<4A0CE800.5040407@dls.net>
	<d1b08f940905150033r570ee6d7ta83eb4948b8e2d5a@mail.gmail.com>
	<b6ebd0a50905150809y36426e69u96ac070414b96029@mail.gmail.com>
Date: Fri, 15 May 2009 23:07:33 +0200
Message-ID: <d1b08f940905151407o4b2135bcqd18c8a1c32dfe86c@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown implementation and use it by default.
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
X-List-Received-Date: Fri, 15 May 2009 21:14:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>> What about adding a -u (update) option? This would just give old behavio=
ur.
>
> I don't understand what you'd want -u to do? =A0This patch doesn't
> modify bitbake,

Why? Taboo?
Adding the 'update' option to bitbake would be logic at this point.
Buildscripts would just have to change to 'bitbake -u'.

(see Gentoo's emerge)

Regards

Andrea


