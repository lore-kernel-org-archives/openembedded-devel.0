Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rv6ky-0007MI-1Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 13:36:16 +0100
Received: by eaal10 with SMTP id l10so131475eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=kV1VbRkjCSb1T5BADQ6Wd2DOB6CkL8ExOzg7a9B67g8=;
	b=cbu4IABWzYJh1vHvTR84ohk8pzfQgCFNP2OEQnMrNmGPasqNph1k4AHrbae4XXPabf
	eEVkJE0GwgdSDNE8dsxPhqH6myzkGv8irZDpEENAvRNSUxl5TyKk4ROBKyGw9HJnffl/
	sRMeVoukOULZ7pylap7H+QQ+g5NAn3l9+Mssg=
MIME-Version: 1.0
Received: by 10.14.206.133 with SMTP id l5mr8363826eeo.22.1328704092743; Wed,
	08 Feb 2012 04:28:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Wed, 8 Feb 2012 04:28:12 -0800 (PST)
In-Reply-To: <jgtov9$fhv$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
	<4F31C45B.1010600@linux.intel.com> <jgtb5c$8oh$1@dough.gmane.org>
	<CAP9ODKpDe4Up_mCuRdTqNY6a-Kkxyz2ZR-GR9uQ+VFFW0HGsJQ@mail.gmail.com>
	<jgtl0v$gd6$1@dough.gmane.org>
	<CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
	<jgtov9$fhv$1@dough.gmane.org>
Date: Wed, 8 Feb 2012 10:28:12 -0200
X-Google-Sender-Auth: mASXfIoT7RtQrlr2q-QkOIwh__U
Message-ID: <CAP9ODKp7LW3f3-fKk_K_iZsfw2p7R3sH+b_8-QFXNQ89u90+dA@mail.gmail.com>
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
X-List-Received-Date: Wed, 08 Feb 2012 12:36:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 8, 2012 at 10:14, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Images with sysvinit will be working the same as before, just with
> libsystemd-logind.so.X being installed. Images with systemd get working
> session tracking.
>

AFAIK polkit uses consolekit or systemd. In case you build it with systemd
you break consolekit support.

However a stronger point IMO is that some changes, for one or another init
system, might involve specific compilation options and thus making their
runtime incompatible as it's the case of polkit. Usually people will want
one or another init system and I see no gain in have both available.

Forcing user to use a bbappend to have one working well is the wrong way.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

