Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 85BF871F2F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 20:33:28 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 142so3663228ykq.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Oct 2014 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=xTDRyFO/ZFfaPXjKPUlh3BbcM/GCqTlvesgFTe7V5JE=;
	b=db3e1uOKbkW/ZZ5J67Bbc0O+mfRHWxklG6ULNISa3QYayTQujBDykf0zxFmV/SE8ox
	hD/zFEzxDy/kgVFRs6nYCzPn4FRZFjmDfybjXbiiq/Xp2Ne7gUXi6LpgPFoJOgjcSfsK
	R0B6ILDbnJRFyYVqg4RLAAjJW63e9U+ugLkyDw9qN983sYVS9KwsZyxtOFNswtkMyE2O
	xBroU09/Xe/ogwOkx+xvj5fA6HaPPGsegnoVnqduy2YUzvJyOj+QLsXgxa56vh2KDr7S
	aYjjrUJ0lh+hR32bO/n8X7iYw5G8IjKwXtoVw2D+H5ldZBgyUpnEvyuHYbYBNFCHU7L1
	niGA==
MIME-Version: 1.0
X-Received: by 10.236.222.10 with SMTP id s10mr16058346yhp.102.1414787607483; 
	Fri, 31 Oct 2014 13:33:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Fri, 31 Oct 2014 13:33:27 -0700 (PDT)
In-Reply-To: <5452F2DB.5030603@tames.com>
References: <5452F2DB.5030603@tames.com>
Date: Fri, 31 Oct 2014 18:33:27 -0200
X-Google-Sender-Auth: i-QPKJrP8lprogZmVfiwADISDzw
Message-ID: <CAP9ODKpaTKCod4zLRNwjc8MT5YDfUxUSKwMS41tau9FHXUt9gA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: gcc-cross-canadian not choosing correct float type in meta-toolchain-qt5 (dizzy)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Oct 2014 20:33:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2014 at 12:24 AM, Alfonso Tam=C3=A9s <alfonso@tames.com> wr=
ote:
> Did your patches to meta-qt5 that recognize hard float and configure
> meta-toolchain-qt5's gcc-cross-canadian accordingly ended in dizzy or are
> they still in the master branch? I just fresh repo synced and bitbaked a
> dizzy image with a meta-toolchain-qt5 and gcc-cross-canadian is not
> configured///--with-float=3Dhard/ by default.
>
> I would be happy to help but I am still figuring out how Yocto works. In =
the
> meanwhile I just forced an ugly /--with-float=3Dhard/ in
> /poky/meta/recipes-devtools/gcc/gcc-cross-canadian.inc inside the multili=
b
> environmental variable that does the trick.

I think we have all fixes merged in dizzy and master now.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

