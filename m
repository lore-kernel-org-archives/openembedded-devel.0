Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RunVu-0007ro-JJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 17:03:26 +0100
Received: by eekd41 with SMTP id d41so2192656eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=//FGi2npXjGFpFLjIBXx5LJA72TcXUTAR72F+MUtAes=;
	b=Mdn1oDx2Rxn+4djoIc5xDymFg1Lp+H3FANVbmedNdwBsHLK/HNJ1P7fWcoT6UBaAKx
	r1QC8Jqy+75k2vb9zKWXwY7D1H+XwGqvzVaiybNRqtZvrHeI0NEKTJpcyHReOY66SXfs
	V8Tvpon6bKrOFMgl8i6R2b3F5cEFtOzQDsrBk=
MIME-Version: 1.0
Received: by 10.213.113.143 with SMTP id a15mr2206631ebq.50.1328630124397;
	Tue, 07 Feb 2012 07:55:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Tue, 7 Feb 2012 07:55:24 -0800 (PST)
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 7 Feb 2012 13:55:24 -0200
X-Google-Sender-Auth: I5FOm4VSUivDfF-AZfngH1sNmKs
Message-ID: <CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
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
X-List-Received-Date: Tue, 07 Feb 2012 16:03:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 13:12, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> * These are my first python experiences - suggestions welcome.
> * In local.conf (or in distro) the configuration variable INIT_MANAGER
> selects
>  the initmanager to be build into an image. When changing the selection,
>  a build from scratch is required. INIT_MANAGER currently defaults to
> systemd
>  (see image.bbclass and initmanager.bbclass)
> * In systemd.bbclass debug messages were left in to have a better overvie=
w
>  what's going on.
> * An additional patch series goes out for meta-angstrom.
> * This is a huge RFC which might cause serious impacts. What I have alrea=
dy
>  detected after a build from scatch is that /var/lib/opkg is missing in t=
he
>  image (although it can be found in libopkg.ipk). I will spend the next
>  days with my new friend buildhistory (thanks for this!!).
>

I've looked at your changes and they does seem to be a good base for
further work:

* The init system ought to be a DISTRO_FEATURE (as sysvinit ought to be too
IMO)
* I'd like to see sysvinit packages splitted onto ${PN}-sysvinit as well
* I'd use rootfs generation to install ${PN}-${INIT_SYSTEM} packages for
packages being installed

Thoughts?

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

