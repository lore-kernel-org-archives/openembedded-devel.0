Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LySwA-0001kn-P6
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 17:40:07 +0200
Received: by yw-out-1718.google.com with SMTP id 5so1402349ywm.30
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=CE0G76eT1iFk7ALPhGz3UK3H8nROotkdn5LzdVbwruE=;
	b=S+4LwO6drMeytDed9mrSMsd3CDwEgLeXt12tev04W6ZIllo6HplQ1C3Rj0gQ66lcwV
	y2b+7scrQ/NECR6Ef/Mc54z86UA/YHPuiTJwWUFMS7k/AJ/pXGKxPdXjICOP2C1iFZMw
	7QZXjmyXQ9QCTHcRl2MtM1a1lLDOjaGUfcIC8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=x4qgcmcffO1RoIabha5TsWxHnG9TwxPdfzTQzN8CsnHV6iNEz+KZs2nw+GHmMaxwBn
	Q4TJrwPzmEigSOKxY33yIkndjdkfAXlN49e7dqTgNtuZGvnKkGpMpwtFdPf72omSpEHo
	FPpeTd3omVlVenuzL+2fqkjpLxUmJtX3enmiU=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.96.9 with SMTP id t9mr8592369anb.106.1240846503109; Mon, 
	27 Apr 2009 08:35:03 -0700 (PDT)
In-Reply-To: <20090427141943.GG18788@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
Date: Mon, 27 Apr 2009 12:35:02 -0300
X-Google-Sender-Auth: 6c0f82929451b0d7
Message-ID: <be7a9f3d0904270835s32c5adafu9ac11f2dd1b2a81d@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Mon, 27 Apr 2009 15:40:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Tom,

On Mon, Apr 27, 2009 at 11:19 AM, Tom Rini <trini@embeddedalley.com> wrote:
> That branch has been tested with bitbake -g meta-toolchain minimal image
> for every distro for nslu2be nslu2le and beagleboard (arm/armeb/newer
> arm) before and after, and the only differences are the stuff that now
> parses thanks to the glibc changes. =A0I've got a loop going now with
> qemux86 db1200 and mpc8313e-rdb but don't expect any problems. =A0I'll be
> following up with the patches shortly.

qemux86 raises an alarm from my side ;-)

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


