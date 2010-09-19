Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxKH5-00062Q-Am
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Sep 2010 15:49:49 +0200
Received: by iwn2 with SMTP id 2so3495885iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Sep 2010 06:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ShuZ0mk5s53qERJnupa3acaztiwV8D/NZCYB/n3m4+E=;
	b=eAFyyrd57qEdexLkuoUNRfc227+eRuhXJMYLbKpGLMybxSk8I3VFUFygIfqsQwFt8z
	aOBecLbH4UrmdAGCYSiUTohRQ54njbPeKFl59g32xqER6PACi/pBMCwsaDiQf59hYI8n
	14d0wYGkJInIV7NorYyxRbqxwNU8YUXbf+DQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dlt/wvaDwtjFe7LPEn7pKYe8q1mqwRAxcBHmZIc3rhaivZ+OSI6It1jkxm5KaqNTqM
	RwWXzGXRtyaZZqJ3modVuFL5AhtXaKUfKtjgmSbfjJ+8Et8jtZZiS8W3MRO8PQaG9n5v
	zsNhjUmK4Fpa90OQ+o0oEDv6Eyui6n4lfK7/s=
MIME-Version: 1.0
Received: by 10.231.11.72 with SMTP id s8mr8197190ibs.110.1284904135073; Sun,
	19 Sep 2010 06:48:55 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 19 Sep 2010 06:48:55 -0700 (PDT)
In-Reply-To: <i74kqu$skg$1@dough.gmane.org>
References: <1284810428-19013-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i74kqu$skg$1@dough.gmane.org>
Date: Sun, 19 Sep 2010 15:48:55 +0200
Message-ID: <AANLkTi=Dyj-ZxNi9+12YEYLrj5nRE7FhukZb--U8S=QK@mail.gmail.com>
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
Subject: Re: [PATCH] clutter: moved COMPATIBLE_MACHINE to clutter-common.inc
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
X-List-Received-Date: Sun, 19 Sep 2010 13:49:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/19 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-09-10 13:47, Frans Meulenbroeks wrote:
>> moved COMPATIBLE_MACHINE from clutter.inc to clutter-common.inc
>> the other recipes all DEPEND on clutter but do not have a COMPATIBLE_MACHINE
>> defined, but of course do not work for other machines.
>> This patch moves COMPATIBLE_MACHINE to clutter-common.inc which is
>> included by all other inc file and so it applies to all
>
> NAK! Only clutter itself has the need for COMPATIBLE_MACHINE (actually,
> only virtual/egl needs it, clutter can drop COMPATIBLE_MACHINE), gst,
> gtk and box2d are generic libraries that do NOT need it.
>

They are not generic as they have a DEPENDS = "clutter".
But I am fine dropping COMPATIBLE_MACHINE from the clutter recipe.

Still that leaves the question posted in a different thread is
COMPATIBLE_MACHINE should propagate upward implicitly.

Frans


