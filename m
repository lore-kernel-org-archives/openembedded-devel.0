Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q5fBJ-0001m1-GH
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 16:18:34 +0200
Received: by wye20 with SMTP id 20so3262021wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 07:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=aFnOYwnIKOq2/6xAjcuX/T6fKzFDH6ue11Aw7/zc0h8=;
	b=s/20JftmCQzuXDHuNq9v5N0i0OCjudgNxx7DGHXtyifK4iyS11kez/F+DmkfuwIveF
	6OGll5QOFHI1tifDIXZoChzXr64vNxYlj/vV0M0kScYyb77gaKj5zM9BFjMsUYRg8uvr
	iMpVu53KrL4T7fGPqPCFMnnBOhYrLz85/963c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=t9pW2cagyqX0zbI0DDT5AolIOAcSdBegVi7xWNnMtILN0x7XeLJgeTIxIq/zts2ONC
	CQcnLL+yf6C48iG0GIxgYGKc/Oj0MpmhyJXD0lgGeWkqSrnxYJbA+A5cpOb/JVCNyHtl
	JsM/5CS/AarpUIVPafC5kby5z5it8mgUVCAnQ=
MIME-Version: 1.0
Received: by 10.216.134.207 with SMTP id s57mr3980455wei.25.1301667391765;
	Fri, 01 Apr 2011 07:16:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.15.67 with HTTP; Fri, 1 Apr 2011 07:16:31 -0700 (PDT)
In-Reply-To: <CC5D751E-FF84-40C2-B184-4C813C49F5E4@dominion.thruhere.net>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
	<1301660208-31105-3-git-send-email-otavio@ossystems.com.br>
	<in4lhs$326$1@dough.gmane.org>
	<AANLkTimRF7Q3=XeF1EOHgPNAGfJwnp5PmjHGyjUhTyef@mail.gmail.com>
	<CC5D751E-FF84-40C2-B184-4C813C49F5E4@dominion.thruhere.net>
Date: Fri, 1 Apr 2011 11:16:31 -0300
X-Google-Sender-Auth: 0nA4SRJ5xbqae12-6MgGNVV73Ss
Message-ID: <AANLkTimS+CcrB7cHUF+ao=XwD0aXeFqt4r1N4erHoKFs@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Fri, 01 Apr 2011 14:18:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 1, 2011 at 11:07, Koen Kooi <koen@dominion.thruhere.net> wrote:
> I guessed that much, but why don't you want .la files in the -dev package=
? Your commit message doesn't give any clue about it or anything else.

Those are  for the modules that are dlopened so not required. It ended
up on the regular package, no -dev.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


