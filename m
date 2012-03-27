Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCeGn-0000Z6-60
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 23:49:37 +0200
Received: by lagw12 with SMTP id w12so437506lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=51Wi0tSkJZg6G3Z66P7QlbmwlzD0HcqUky77eAg8fZo=;
	b=ilKqVJ4BSA1RTlmxdQZfxWEjAHRrvCN/Yg3vTNBb+YHp9RcDPrKTo6fUQBqnGRuDlk
	cBv9KYAlmOfpauGxzLgxy9sJsWZK9HYxLu9rHsYjCDuK1HHLeuLG5BaFcKl16TYU7xQj
	L7kJKRl8cB+Z5dxcHSD5Oe6QqqQYaFDUHt9ok827GGXSqZDpaVf5wE2rVaapRHhS8CyY
	iyvNg6sIICZaHphaJBHymD1sOsJRtG/NLaviAwzEL8EdquKlVeymoy/yIp/HDumiPpyq
	4Ady+oqoIIBhdSs8GWJ4PapW3xS7rpDkv+7BLAkEKLILp06usY2C7MFcsITFX1kfvWJG
	A59g==
Received: by 10.152.102.173 with SMTP id fp13mr20015120lab.38.1332884435839;
	Tue, 27 Mar 2012 14:40:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Tue, 27 Mar 2012 14:40:04 -0700 (PDT)
In-Reply-To: <1332853398-9501-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332853398-9501-1-git-send-email-schnitzeltony@googlemail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Mar 2012 14:40:04 -0700
Message-ID: <CAMKF1srBsFmt=-WJ-NbjnOStg=Lw46PuXnK4Q+3ZFkFwyDVVaA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/4] libcgroup: fix QA warnings
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
X-List-Received-Date: Tue, 27 Mar 2012 21:49:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 6:03 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> +FILES_${PN}-staticdev =3D "${base_libdir}/security/*.la"

.la should go into -dev


