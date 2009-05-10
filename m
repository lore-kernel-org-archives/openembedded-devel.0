Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M3Hb0-00080u-4D
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 00:34:11 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1526061yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 May 2009 15:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=dqrT9X3pi+4RqBXXMcJkJd0MRk3ucVVHSHlWy7joHpw=;
	b=fy2+9eZGMQZrxaw50K8L11j+iIMTVlX2KyjsgqxGz1B/v4swEO0ZuStvOb2jaFTUSX
	oQ4uFCWZG9TZ2rrsVz6PFGxbdAyIVOpZPAJGPnKkd7JEiWWAZJXidmQyLqBltXkd0byB
	fK9A+i6MysvJ0TdvkjVzes7w5v2Qy5BpIEbuw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=WDueu7pbpEnMtxPm5J+KFK2YJhwPdNrYZbEEhYtQa3eggn8kgVB6Xlzz9og4gwNewk
	+WAamiTN3p4c9ZTgz2NlzgqnQsHznk7vRUOc0kxOhnEDPW+NkdrqLJSSL4YTqC3Z/l1y
	5gnkSffn00k0ZT0umyzveX1/QYIE+8qTnsCP4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.166.7 with SMTP id o7mr13677863ane.90.1241994462508; Sun, 
	10 May 2009 15:27:42 -0700 (PDT)
In-Reply-To: <20090510215154.GA7973@smtp.west.cox.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090429161224.GB18788@smtp.west.cox.net> <49FCA524.10102@dls.net>
	<c384c5ea0905030529n585de20awfcc6bb835a282483@mail.gmail.com>
	<20090503165318.GA7973@smtp.west.cox.net>
	<20090510194704.GZ7973@smtp.west.cox.net> <gu7ff8$cmr$1@ger.gmane.org>
	<20090510215154.GA7973@smtp.west.cox.net>
Date: Sun, 10 May 2009 19:27:42 -0300
X-Google-Sender-Auth: e89891f4848fac26
Message-ID: <be7a9f3d0905101527i3123f921sc86f01f43d5eacfe@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Sun, 10 May 2009 22:34:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Tom,

On Sun, May 10, 2009 at 6:51 PM, Tom Rini <trini@embeddedalley.com> wrote:
> Not too wierd looking? =A0Otherwise, is there somewhere we can do,
> roughly, sort -u, on ${OVERRIDES} ? =A0And not require a new bitbake for
> everyone?

I belive that we shouldn't add hacks into OE recipes to avoid the
requirement of new bitbake. If someone is using dev tree we can assume
that this person can also use a development version from bitbake
stable branch.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


