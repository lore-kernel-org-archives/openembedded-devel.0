Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4u9j-000775-8d
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 14:10:19 +0100
Received: by vcbfl13 with SMTP id fl13so4568977vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 05:01:43 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.98.169 as permitted sender) client-ip=10.52.98.169; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.98.169 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.98.169])
	by 10.52.98.169 with SMTP id ej9mr41019700vdb.80.1331038903285
	(num_hops = 1); Tue, 06 Mar 2012 05:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WxIYpDnd8MiJkrOuGyweACz9MGNwqLq1TAx/GRIAh4M=;
	b=0oX5R+iFDUBcOuao10/b4ZforhVAptVJ8c8JjfgjnGEZB8aHFpVhEsiFVG8PPmHRFJ
	Nas1bWo4aZR2nu8wbOSiy7YHzPRTnbLAXn2FRY5KZUSdEPKVbNvVkb7xnmn2c6gh+Niw
	5XeaC7VQBjKDlnH637nHBMbN0c4/jvghvZ7zn2jEEsg26M5Zvz1GF6EGgIWg43eEFKaa
	ElQmOTuzOM7cbw1wjZRiiYihYPUTlrg2uGeNStHuwdKJa/T63hl9daB5C4GwkFVFUxWT
	N8qsz6nxAej4g1RqR3h3Rr6Ro+p2jbF0L1TOql4zWBypv2QdyS5xpcB7sTS5t8556FIp
	ALCw==
MIME-Version: 1.0
Received: by 10.52.98.169 with SMTP id ej9mr35112076vdb.80.1331038902546; Tue,
	06 Mar 2012 05:01:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 6 Mar 2012 05:01:42 -0800 (PST)
In-Reply-To: <4F560287.70904@opendreambox.org>
References: <1330986957-24272-1-git-send-email-obi@opendreambox.org>
	<jj4jcv$dnp$1@dough.gmane.org> <4F560287.70904@opendreambox.org>
Date: Tue, 6 Mar 2012 10:01:42 -0300
X-Google-Sender-Auth: IL71nwHYs3EMpJN1oioLkX4hWYM
Message-ID: <CAP9ODKpWFTH4ELpO5zfOJkOwY6w7Bzqb=mHe6_oyLMmViRCxZg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] udev: consolekit package requires x11
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
X-List-Received-Date: Tue, 06 Mar 2012 13:10:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 09:26, Andreas Oberritter <obi@opendreambox.org> wro=
te:
> I don't thinks so, because with x11 nothing changes and without x11 udev
> couldn't be built before (this is what the patch addresses).
>
> Albeit, I'm going to send a patch with bumped PRs.

I think it is always safe to bump PR so it can trigger, if it is the
case,  a regression as soon as possible otherwise a subtle change chan
break stuff and being unnoticed for loooong time.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


