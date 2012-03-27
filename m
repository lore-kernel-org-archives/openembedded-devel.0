Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCeG9-0000SE-6i
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 23:48:57 +0200
Received: by lagw12 with SMTP id w12so436697lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Sjg6g4mUvm8mIhEucw5/KpejCTHDyKRgLYQhUL1CkUA=;
	b=NaG/+MpxHRJPYE3IHzAwFHDfkdW01YeoayMkJxohB5TO70CW4teDJIv2udLu0jOYbG
	YIytvHsUL8FhwFJEi/FlN1kzecFq8HJH2x73JsP8EcyZbAyJByhmSd4hl3Modu0EnPh1
	KL9amBx4F42JLqlAMsaVIEjYejzI85mLRomNk9MEw93o1QeDSgbPMIvebMI9egsOnprU
	HPzlqF0Q3Vc7GYiO1nIXKi80PDPugTL+MfzbkzMt3R87SrtJ8hqRcCFARHMPX6ehqTJ/
	6zvRENc2+ei441ynykSypd7LywRRrW3BHQLNgsC43Tm8FjKeLxX/kfrdLixs4B15E5BZ
	p+nA==
Received: by 10.152.131.66 with SMTP id ok2mr20413828lab.10.1332884395682;
	Tue, 27 Mar 2012 14:39:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Tue, 27 Mar 2012 14:39:24 -0700 (PDT)
In-Reply-To: <1332853398-9501-4-git-send-email-schnitzeltony@googlemail.com>
References: <1332853398-9501-1-git-send-email-schnitzeltony@googlemail.com>
	<1332853398-9501-4-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Mar 2012 14:39:24 -0700
Message-ID: <CAMKF1srMQNAREe-ttJR1bH-gfG1LLRZ04o8L2L_YtxZJPxJd1Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/4] obexd: fix QA warnings
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
X-List-Received-Date: Tue, 27 Mar 2012 21:48:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 6:03 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> +do_install_append() {
> + =C2=A0 =C2=A0# remove empty plugins dir
> + =C2=A0 =C2=A0rm -rf ${D}${libdir}
> +}
> +

can you use use rmdir instead so it gets flagged when the dir
is not empty ?


