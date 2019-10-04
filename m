Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id DEB047F347
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 20:31:30 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id q1so16408459ion.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2019 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=51vbtJxCnQwQ8t3MiNNoieJ5PLSj/L04B9jT8omZu6w=;
	b=D1g75RW4eZju2pYvvnbB74bD8mDYaiogKtV8LAmI5vefFjxxVBiUEz56VaaXPnGMhj
	5rorMZaBFmfWInZeUzc/fHfb/BgTkBipBUjXuSOTnHkHGqP022T/Rpn2YTxjb3HJWD/3
	W+P4MSB1uJOPoBsd3rgz1IjPhOFIj2X6DkNWezxJbHlOImCsjcgr4kjK9TYat0OxMFJn
	C4ovz5qH6v76HGkeOJziTH2NTS243Wv58VWkAVSe6YpJpGo53zUUn1KRiWNIjWAsXO8k
	J4DpCWrEGdUVPFw5H7ekUDQvwR6aSTSew2egRxVyva9lM1vEiFN7LwSwEKNECMLTCgOZ
	uRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=51vbtJxCnQwQ8t3MiNNoieJ5PLSj/L04B9jT8omZu6w=;
	b=YYghvP7e6N1b1JnTnrZaWaxGLwsdBN/q9BrV+Tn25X/2Xz5L0D4hJ4tX4/7ZDzwwFV
	KYwCh1JNmB8FR627lVjD1KylVRGxElMHNEec6w/Y7UwCOd6a/FlMGBNSbtdj+xxvBinS
	MKmgaKdqYTw7icrhVY9UlYfynPXhnppxjtvOLhP0VergCS/tXR8hKRDuWvdz7otIh/am
	I9uihZ56lnCeXbZ9XFNpTMfroqqnpcKpx6UGxG+Iz8ie4DVle8Q/UGlXw7PXTu3nwZnV
	GnuV/XK3EOR31VC2/Gu1N6QVoIxibK9apDQWqoDnI2ki/jHzNr3NSv46nwvBBHLoxFRO
	D1Pw==
X-Gm-Message-State: APjAAAU7hvR0BXIN/pPpC4QSbp0OFBrgc6ORgQ/HY4TegGLW2LPiX1I9
	aTnWLVEYGCFBs/Tl5Cczux6yKWEAjKuk69QsMLb5Dbzr
X-Google-Smtp-Source: APXvYqxr2raPHNszqv51/xSim7VeCDIA3XKA1XETf/uf7Q/jBgsQnMLHtCOuoKvzAD+nbngf9pQJJxb/+FPtZKPhZ24=
X-Received: by 2002:a5d:83d3:: with SMTP id u19mr14939039ior.299.1570221091887;
	Fri, 04 Oct 2019 13:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190926223206.26850-1-schnitzeltony@gmail.com>
	<20190926223206.26850-2-schnitzeltony@gmail.com>
In-Reply-To: <20190926223206.26850-2-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 4 Oct 2019 22:31:20 +0200
Message-ID: <CALbNGRTwfXEP0skCASQRq86R78ugkZw5NJGMFTgKhtL_Ohu0hw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Kang Kai <kai.kang@windriver.com>
Subject: Re: [meta-xfce][PATCH v2 2/2] xfce4-panel: upgrade 4.14.0 -> 4.14.1
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
X-List-Received-Date: Fri, 04 Oct 2019 20:31:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 12:32 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> * important bugfix release: systray draws icons properly when compositing=
 is
>   disabled
> * while at it renumber patches
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
If xfce-patches require review these days: Kai can you take a look?
If not: Ping

Andreas

