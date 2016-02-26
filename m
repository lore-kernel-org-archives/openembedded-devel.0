Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 356197747A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 21:43:39 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id ho8so58704052pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 13:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=8EFv8I76iN2A2KJMM3cWKcbNU1qLyNA6I/3+0p0huVs=;
	b=OsOTkj9TRMLgsas9++myvJFAboGGC1hQUet7QZffJeY08dp49eM4acUnPwuISnvSv3
	/wUQnfqlKqa8xtPL7vkR/qs2NwyK3tj44Dh3AjugnAXY+JO2857Y+vp/Fyw49YrO2d7z
	2eR3iKv8GtubxQrmxv/Ifk8Mcv05e0uaFTHh3sXiOJNU6abAiOzcxPl1a/Nxq+eun/tO
	wpyagTR/nyhr4nQpr8pAubMs1tAL9O81xq+LZs7oKlrbgZbQvELD8QgZwTuh5XB4duNX
	H9ZEKmJIf1MUwNZonunEIJ2MojDCBrKjA1kUnU6or5Le3LvAgtLQkt3fbNubNePJBgHx
	+u0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=8EFv8I76iN2A2KJMM3cWKcbNU1qLyNA6I/3+0p0huVs=;
	b=fZKEoWlDS5c+GAnKHdMHIokHFzhjyvoEZTKUDTYCNRAyWhUmFxjO0XV2g4Jt6pkwq4
	HwoZirqFDOl7P3Eb8XPjOiP51xhaRIosvu75UT1Wp8V2H2zVVKbdvGlmCaGlTlmFZj0Q
	aO+a9XbbfKnoKZNEl18C1z6SjIK9XpJ2HwAZt8+lnw2gFTwirHSR750Yq8HZo7LQ6DEv
	NaNp+z3dokd6TSB5Cu/gwz/6slovhp8HE/r0v00HkVfnn4c1hWLDFMmHwVCT7WDYas8q
	ED0gD2z0uX6UsWPtAEfZ4o/8phFWtS/fqoA3h2h/xXovm044bLp2szC8vTo2RCgZ/jDq
	/yNw==
X-Gm-Message-State: AD7BkJJuMh1Jxr1Di+5wSPMRG/0JRHAqALPS9PcGyVNBFc/2Eo5LP9gcXDMxOa2JtIR4Ow==
X-Received: by 10.67.8.100 with SMTP id dj4mr5279847pad.88.1456523020768;
	Fri, 26 Feb 2016 13:43:40 -0800 (PST)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com.
	[209.85.192.182]) by smtp.gmail.com with ESMTPSA id
	70sm21417776pfs.78.2016.02.26.13.43.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 13:43:39 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f182.google.com with SMTP id w128so10632048pfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 13:43:39 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.93.155 with SMTP id n27mr5318031pfj.88.1456523018809;
	Fri, 26 Feb 2016 13:43:38 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Fri, 26 Feb 2016 13:43:38 -0800 (PST)
In-Reply-To: <CA+chaQeJDw6a4CTDQZqY_TLqn47w24THGZcGA_NTm7HTi6tyBQ@mail.gmail.com>
References: <CAP9ODKpg19uSG8=jvwrqsA88EJQQOTkWROwxvmdziLpoA8HG_w@mail.gmail.com>
	<56D0BBDC.4080101@gmail.com>
	<CA+chaQeJDw6a4CTDQZqY_TLqn47w24THGZcGA_NTm7HTi6tyBQ@mail.gmail.com>
Date: Fri, 26 Feb 2016 18:43:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrU9=S-+jm_ffYPqYdt+cuLLSywMALdT7x029JbMkYq3w@mail.gmail.com>
Message-ID: <CAP9ODKrU9=S-+jm_ffYPqYdt+cuLLSywMALdT7x029JbMkYq3w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [jethro] Backport proposal
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Feb 2016 21:43:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 26, 2016 at 6:07 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> better to include oe-core ML not oe-devel.

Resent.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

