Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv9fs-0006hN-AV
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 16:43:13 +0100
Received: by eaal10 with SMTP id l10so180718eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 07:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Tl2XTePDKXAfn+1n1lPr8ZmzqSNbKDOYAPmXArqgVKc=;
	b=gWWK9AeRMOeXVrMrSZ4wlDHC8eyO5CyHmkt1Pcghn/BAUC8bubaGdAFa3oKbVyjhXB
	5+xXXxHBRRr/sv5oExeko/VOdv2yNrfUw7x/p3MoiY5rL2UXuOAjipEbT8N6RBeIO/3z
	O29Gn0wzQef4V5x4Vol6D+0ANoq3UMue5Bq7E=
MIME-Version: 1.0
Received: by 10.213.10.145 with SMTP id p17mr2832648ebp.12.1328715308212; Wed,
	08 Feb 2012 07:35:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 07:35:08 -0800 (PST)
In-Reply-To: <CAMKF1sqHnaU5QncuK_Dz5QFCorkx8p2cbcvy_TS-4JvQ-3J3dQ@mail.gmail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
	<jgtl0v$gd6$1@dough.gmane.org>
	<CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
	<jgtov9$fhv$1@dough.gmane.org>
	<CAMKF1sqHnaU5QncuK_Dz5QFCorkx8p2cbcvy_TS-4JvQ-3J3dQ@mail.gmail.com>
Date: Wed, 8 Feb 2012 13:35:08 -0200
X-Google-Sender-Auth: U00uvBXQxrJbPEKMFLYOEYjapCQ
Message-ID: <CAP9ODKpAYvJZDV=v8nxUOiSxaEVahg2M6Fe7=VDjzggyj-w1pA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Wed, 08 Feb 2012 15:43:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 11:19, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Feb 8, 2012 at 4:14 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> > That is why I want to make an exception for polkit and udisks to keep
> > initmanager selection an IMAGE_FEATURE combined with DISTRO_FEATURE. A
> > distro maintainer can then choose to support one or more initmanagers
> and in
> > the case for multiple it can be set per image.
> I think having multiple recipes e.g. polkit and polkit-systemd might
> be one ugly way to do it


Yes, agreed.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

