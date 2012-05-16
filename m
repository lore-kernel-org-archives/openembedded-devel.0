Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SUir2-0007bp-0p
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 20:21:44 +0200
Received: by vbbfr13 with SMTP id fr13so1024178vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 11:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/asKvQI+H0j4qk0fh/io0Pp9Ldc5BFCdVvQPiIRwR2U=;
	b=t5jQB9s5Z2TNb7Hc3iaayV5i2fZOkL6rh4fmD8WyzlTQRtAgVGu1zCXP9tCBpsL5Cw
	An3Zyh8CAShHuaYwiqKYwecS2q7elhnhqDlLYBu2KJJ0z9E73owssb5Ror81J3JEnk8Q
	8Q4GB3/OUF7LkrZV/yk/t5Y5eiIyOvajrNkAzVfpiF7PtalBPu63c6IDSvwHtlSJlJBu
	ai957kfJaDnGvoNXXIjy9X701MwZUbxHaIjVKb0NHA1WeqmJvyVxNfvmkvtlX0ZgjoYU
	3KoXRxvIZnRf5Nyo04Z9I9jp0Fz+UXCXQNN9xdHlrvdGkwm35cUY8aNfHmxzWjwMzS4o
	c6xA==
MIME-Version: 1.0
Received: by 10.220.141.207 with SMTP id n15mr3080951vcu.68.1337191901951;
	Wed, 16 May 2012 11:11:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Wed, 16 May 2012 11:11:41 -0700 (PDT)
In-Reply-To: <1337187361-5043-1-git-send-email-obi@opendreambox.org>
References: <1337187361-5043-1-git-send-email-obi@opendreambox.org>
Date: Wed, 16 May 2012 15:11:41 -0300
X-Google-Sender-Auth: cc1KgtkX3tiidQBtFdgwLMfesR0
Message-ID: <CAP9ODKr0_Gw-bxct+8R1qQDYboqA-e2q32X9XS_mnWGHF=KAdA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] systemd.bbclass: drop postrm, use prerm instead
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
X-List-Received-Date: Wed, 16 May 2012 18:21:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 1:56 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> * Calling "systemctl disable" from postrm is too late and
> =A0causes the following error:
>
> | Failed to issue method call: No such file or directory
>
> * Messing with $D is not needed in *rm scripts.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


