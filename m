Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rv7ZM-00057y-VZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 14:28:21 +0100
Received: by lahc1 with SMTP id c1so457387lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 05:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=aDHkRTuzd135A17hZc7D1pZsImshvriueA9i/YwhAbQ=;
	b=OYxhsCU3DMlhxrPsFj1tOhMivTjUfMZT8LKkfhXL7A5aq0XtbV763dEg2V7OtUJrkq
	G35/usro03YjV8/WPL9s7QseqIBzWNARmB7jdV9gMS70PCXdtAZ5cAx1LkFrBplWQKbI
	91EVCpqH8Bur9RRqDmHbCTl8nO/7FFwslJv+8=
Received: by 10.152.112.41 with SMTP id in9mr15444644lab.27.1328707217424;
	Wed, 08 Feb 2012 05:20:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 8 Feb 2012 05:19:47 -0800 (PST)
In-Reply-To: <jgtov9$fhv$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
	<jgtl0v$gd6$1@dough.gmane.org>
	<CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
	<jgtov9$fhv$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Feb 2012 05:19:47 -0800
Message-ID: <CAMKF1sqHnaU5QncuK_Dz5QFCorkx8p2cbcvy_TS-4JvQ-3J3dQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 08 Feb 2012 13:28:21 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2012 at 4:14 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> That is why I want to make an exception for polkit and udisks to keep
> initmanager selection an IMAGE_FEATURE combined with DISTRO_FEATURE. A
> distro maintainer can then choose to support one or more initmanagers and in
> the case for multiple it can be set per image.


I think having multiple recipes e.g. polkit and polkit-systemd might
be one ugly way to do it


