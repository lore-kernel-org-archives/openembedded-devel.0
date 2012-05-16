Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUby5-0008VF-SJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 13:00:33 +0200
Received: by lbol5 with SMTP id l5so406545lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 03:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=r9mum1mBFIoI9+ht8srx1UjbaLNjlmOsJBNWb2rtIOk=;
	b=KAoYNF3YHXfUM6lEDVy9hOg5fXwbHgwrNO8nGdQ8CY3qEA+l6lgsO4VWQup/y6l+HH
	oglJTHXG6U7LgqgjMQge3B79Z2kFVzMpO5RxnO8xpP46mPprc8bcAxcm8pnMP8BNTPw4
	K7AwTeYatrOS21mUAjyqE/FhtZhJIHQ+Q9ihfohYS/oepwpP590oELjhDswxVwFeq/p8
	6MflOM7bYpMoRAxEfJX6JS0kF/AfLqKqPTCwwK0SAGP4D2EmSw8+cx5zICPP0eQxo779
	B7zvNig5ciup9I2y5F+GcpStnkZvGedYHX89S1lv8R5oMgKp+doMncx1H+MRu5EUxxCX
	LJJw==
MIME-Version: 1.0
Received: by 10.112.41.130 with SMTP id f2mr355959lbl.5.1337165432552; Wed, 16
	May 2012 03:50:32 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Wed, 16 May 2012 03:50:32 -0700 (PDT)
In-Reply-To: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
References: <1337119302-28549-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 16 May 2012 12:50:32 +0200
Message-ID: <CADZ6=avUxq8fBHF3UMCZ3T6A-W+tm7ZOVR-kCa48L_4_J9+2ZA@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlOG00onh+WGDnSdJNbuDgok/pLV3FUmLhIGKEyLR7+T+MsYl28YwqMbqgfV41hOBtQOUSO
Subject: Re: [toolchain-layer][pull-request] Remove old toolchain recipes
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
X-List-Received-Date: Wed, 16 May 2012 11:00:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello *.*,

> Khem Raj (3):
> =C2=A0 =C2=A0 =C2=A0eglibc-2.12: Remove
> =C2=A0 =C2=A0 =C2=A0binutils-2.20: Remove
> =C2=A0 =C2=A0 =C2=A0gcc-4.5: Remove

Removing gcc-4.5 would kill Texas Instruments DaVinci (dm814x, dm816x)
support. You only get a heavily patched 2.6.37 kernel from TI for
these (linux-ti81xx-psp_2.6.37). Unfortunately gcc >=3D 4.6 is unable to
build a kernel which boots for these platforms. After

Uncompressing linux ... booting the kernel

there is silence. We can reproduce this reliably on a ti8148-evm
development board. My best guess is it's because of an ancient kernel
being compiled with a very recent GCC.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


