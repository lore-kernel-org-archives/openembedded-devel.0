Received: from [209.85.217.174] (helo=mail-gx0-f174.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LZCW4-0005pu-TE
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Feb 2009 00:04:45 +0100
Received: by gxk22 with SMTP id 22so1483046gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 15:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=sYP4BjOnP59BR0aPaSan7FZvBRFmiwtCgkY2ZNFKmvc=;
	b=H8i/6P166Gg+vLkMXm/kA5xkKnilt41iVaQRNG7fKhZE6GGow32UIF/GsNYqxXGjWv
	5als4gpbzDOCcL3CeWA7NIho2Ra2VhkDkiwWdG+a4tCScb0W5yFVch3APr48zfpTw+t9
	J+08idiSl6eDDDTddA7UsH0K99bJtgMjQr0WI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ARBNpO4Ht4c6Q1O72PAz73csgv4w4zyEN6cp6fKJ0gS2Wy6ZRTqAfx+TEGKGutGqQy
	EIQ2vyfHjh1Fb2rkc+5JWsF+vZA2QbLhrL+gDV3/vJIx+l85DU5BX4I9h4hljkTVJu7a
	kPAVTp1/sem7hg36B4uOk1jI/jETC/qGgzyjM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.125.12 with SMTP id x12mr60688anc.159.1234825367229; Mon, 
	16 Feb 2009 15:02:47 -0800 (PST)
In-Reply-To: <200902170936.57379.jk@ozlabs.org>
References: <87ocx2rq7w.fsf@neumann.lab.ossystems.com.br>
	<200902170936.57379.jk@ozlabs.org>
Date: Mon, 16 Feb 2009 20:02:47 -0300
X-Google-Sender-Auth: adeea83505ed1388
Message-ID: <be7a9f3d0902161502y3e5ca44biac0b9acc4ff7b6ba@mail.gmail.com>
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Subject: Usage of groups
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
X-List-Received-Date: Mon, 16 Feb 2009 23:04:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello folks,

I've contacted PatchWork people and asked for details how to make it
properly fit our needs. Bellow goes the answer they gave me.

>> The OpenEmbedded project started to use PatchWork to allow us to
>> better track the patches that come to us. It has been working fine
>> except that we're not finding how to add groups to make easier the
>> permission setting for users and like.

> The built-in 'groups' system doesn't affect any of the permissions on
> patchwork at the moment. To allow a user to alter patches, they need to
> be a 'maintainer' of the project that the patch belongs to.

> To make a use a maintainer, just open their UserProfile page in the
> admin interface, and select the appropriate 'maintainer groups'.

> Cheers,


> Jeremy

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


