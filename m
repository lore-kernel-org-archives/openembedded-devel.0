Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pn3CK-0006Zt-70
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 07:06:40 +0100
Received: by qyk8 with SMTP id 8so1029350qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 22:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=wTGq9BOfMOocQQZCQ37sHTyHaKvh37X2PphjGf1koaY=;
	b=q1rhF98S4Po+jGsdgQBM9c68FT8ea3I6NnUM/ulWENN1aQjG+AqCj5RwLuR5oreAl7
	zTIxHwOqpup0x1wsKQSSN6ovInT19Ny/9K4QDLEZeXuZy4a8JSH6rBV4CMsG0qXTqWnS
	igEIZxY33JDM6IiC+FBFhi7+XF465PQidFMzY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=l3Jz2GV1rrjVJuUQ0p4b8U2wMDHNFQasKSnta2uQ0m8JcAnHEXJZnet6W7wueN7ngN
	J6EX6472JKPGsEMtq2PuGcOYA316hs73CiXNxxDAnmfEWLsX8V+qUv0uM1FSjagrunjy
	MP8FUmMNa5B2mBuDqsfgXcjHdMlzU8Gea7FpU=
MIME-Version: 1.0
Received: by 10.229.91.2 with SMTP id k2mr4143216qcm.260.1297231536708; Tue,
	08 Feb 2011 22:05:36 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Tue, 8 Feb 2011 22:05:36 -0800 (PST)
In-Reply-To: <iisfb2$fps$1@dough.gmane.org>
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D517D6C.3070604@mentor.com> <iis1mg$tj9$1@dough.gmane.org>
	<4D51B0C1.6010505@eukrea.com> <iisfb2$fps$1@dough.gmane.org>
Date: Wed, 9 Feb 2011 07:05:36 +0100
Message-ID: <AANLkTimzBvUFpqYgmWmn4t9_8-zR7FLr6FZZp3nQV-_b@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Wed, 09 Feb 2011 06:06:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/8/11, Koen Kooi <k.kooi@student.utwente.nl> wrote:

> Use a different task, nobody is forcing you to use task-base

But bootstrap-image is hardwired to use task-base. Should we have our
own version of bootstrap-image then?

I assume that bootstrap-image is: "a minimal set of software needed to
be able to install packages from the internet".

bye,
Filip Zyzniewski


