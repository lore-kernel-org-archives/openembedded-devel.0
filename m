Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Se812-0006YC-Ed
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 19:02:56 +0200
Received: by vcbfl15 with SMTP id fl15so2216103vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Gs3EXer8EmZH4pJgm9yWgHh/RFrf7+UPERWU+DCdYgk=;
	b=YwTYIVsvtRIryIdgJW1y/7JagFKJFvstrXkyRJi/cocaGkOaZD7DODz6+vJ8ID1Fi4
	to1jTKad4Y1JCrl1cn9Z+t4aoE0EduQ3p3xQWVCAaHfW9BCpNDiohVRQy0TrBTR6jqf+
	MDek/oKs9Orurlh7MWAVlsrbfJQBdvu9W2fhWpXs17xa/r/kV5O6t2LKBKM0ma8NO0NF
	D2ZVacfdzU1rbcsWIXnbWz95Vl0bO7CKbN8+/6yBN0gGqSsL1Hyf4Zj9jyFmIq/BFRRY
	Qg19qYGyCO7q617Zb/Nm/b2xLtxQWi8SImmWWS/j9Q3ZoLyLMOxvrXORIDcWW2JXvWSA
	6cOw==
MIME-Version: 1.0
Received: by 10.52.33.100 with SMTP id q4mr10826349vdi.59.1339433542421; Mon,
	11 Jun 2012 09:52:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.155.130 with HTTP; Mon, 11 Jun 2012 09:52:22 -0700 (PDT)
In-Reply-To: <jr57a2$tsp$2@dough.gmane.org>
References: <cover.1339428767.git.otavio@ossystems.com.br>
	<35554bb06b4c779574cdb162c1701b0791afd459.1339428767.git.otavio@ossystems.com.br>
	<jr57a2$tsp$2@dough.gmane.org>
Date: Mon, 11 Jun 2012 13:52:22 -0300
X-Google-Sender-Auth: xe-kCSV7hXBBneLeKcjCpB-h24k
Message-ID: <CAP9ODKo74pPDkwQB9z2DFaVX4XK+3Lb3if0bAo1Su2S94i3FZg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH][meta-oe 2/3] nodejs: force use of -mfpu-abi=soft for ARMv5
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
X-List-Received-Date: Mon, 11 Jun 2012 17:02:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 11, 2012 at 1:44 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> Op 11-06-12 10:34, Otavio Salvador schreef:
> > The build system defaults to 'softfp' but this use hardware instructions
> > that are not available making node to fail to run on ARMv5 based CPUs.
>
> That's not true, you are probably getting a wrong -mfpu setting. This patch
> changes the ABI, which is the wrong thing to do, NAK.
>

This is indeed the problem but this caused by the build system and the only
way I found to change it was this way. Can you propose another way to fix
it?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

