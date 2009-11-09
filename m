Received: from [209.85.220.209] (helo=mail-fx0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N7SQY-0005Wg-TD
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Nov 2009 12:28:57 +0100
Received: by fxm1 with SMTP id 1so940637fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2009 03:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=iaX4oc9oukqpnpKCS6rTdmnJhsYv887wySDoMB0pcZY=;
	b=odixtNlNxmTYr8eAdqjvngwfkIlisHk0BJs8tLoK9QP/aLeUNwj+8ikdn6d3lIHB60
	0SmiOcwt6bcsY+T72AcyvrhaYxjWB28D25QHCfpSpJZgyT2rk9/y2dO+KEblkaar5csz
	e+A2zPZpaelRb7ZWWJJ5PNxVHllDiWXsWPAyo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=A3VPg2nYh1N0SftJRA3o4TKK0iV1AfIDreSyF9Qr9YC+xZ1ByoQX+G1clQzlHFbJR2
	sa3ECWTb4r04NBQwWrJu1Wt13hsAL79bqRM38xlMD1IobAxdPp59PQiRLXw/yyLeAa9U
	dAhpkp9pYSEyBLVXdFxSzf57uySCM9OFcJjRk=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.130.154 with SMTP id 26mr734272hbj.57.1257766058214; Mon, 
	09 Nov 2009 03:27:38 -0800 (PST)
In-Reply-To: <20091109093204.GF16449@ibawizard.net>
References: <1257504486-7975-1-git-send-email-ynezz@true.cz>
	<1257504486-7975-2-git-send-email-ynezz@true.cz>
	<be7a9f3d0911060413i778aec0cpf2c618832437665a@mail.gmail.com>
	<20091106140519.GA25214@ibawizard.net>
	<be7a9f3d0911070857t179c5c31o7f066945c5738917@mail.gmail.com>
	<20091109093204.GF16449@ibawizard.net>
Date: Mon, 9 Nov 2009 09:27:38 -0200
X-Google-Sender-Auth: 983a6c3d826641fa
Message-ID: <be7a9f3d0911090327p7d510233y73674c1cb4d575f1@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][geodegx] geodegx: Fix glibc configure error
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
X-List-Received-Date: Mon, 09 Nov 2009 11:28:58 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hello,

2009/11/9 Petr =A9tetiar <ynezz@true.cz>:
> My bad, of course it's glibc related, nothing to do with GCC.
>
> configure.in:
>
> [..snip..]

indeed; so I agree that it ought to be changed.

We ought just to test for performance it built as i486 and i586. IIRC
i486 would be faster for geode.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


