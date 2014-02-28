Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5AB6EE3B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 13:48:06 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f73so651768yha.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 05:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=0I7R99xK+U2t4Ufz/5H7YOgdxb/KsevQVuv9cVxXR5o=;
	b=v3QrCKi5AzHe8KrqNnwgDE9pp4A8up8n8IuE9m1c7lqwsowLNzuDRzIe0pIGS52QR2
	gnqEmPH1uzLe2DVID9NVWDUaWGCopzWDKf0a7ccx77OCujZpu+5Rk9qmyOmNFWTHJk+J
	7viIungBAiozu0Hxt2qvq+icHMGzriIVidQLGXc0uS0ke4ozqodFy7BRFNPQ5E4/pRwk
	FP/3BFNCeVapwcPHGjnEp88K/Qc992dJ9Cr7M/qLdFQF26cnyn5BhI1SAnhcLY4jWcHI
	e1rOrF2giCKRm4zJjh7d3VSo+nN6BFc+X6HVovzaNQHYVL7bJI+X4ROVManA0YmTPB0n
	+x5g==
MIME-Version: 1.0
X-Received: by 10.236.16.83 with SMTP id g59mr3288411yhg.14.1393595287711;
	Fri, 28 Feb 2014 05:48:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Fri, 28 Feb 2014 05:48:07 -0800 (PST)
In-Reply-To: <1393594488-10792-1-git-send-email-jacob.kroon@mikrodidakt.se>
References: <1393594488-10792-1-git-send-email-jacob.kroon@mikrodidakt.se>
Date: Fri, 28 Feb 2014 10:48:07 -0300
X-Google-Sender-Auth: O13mkWDUkxz9LnJwQetrMU0ZYoM
Message-ID: <CAP9ODKog092AwYuMVjYR6=xf8CMR1Nve--Kxu66XDKdQOoZ6OQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v3] nativesdk-qtbase-tools: disable Debian-style package renaming
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
X-List-Received-Date: Fri, 28 Feb 2014 13:48:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 28, 2014 at 10:34 AM, Jacob Kroon
<jacob.kroon@mikrodidakt.se> wrote:
> Since commit 8da5017712a7ddcb8488e095b9aa03b0273f23e9, libQt5*.so files
> are included in the nativesdk-qtbase-tools package. However, this together
> with the fact that the binaries are placed in a subdir "qt5" of bin will
> confuse the Debian-style package renaming logic in debian.bbclass, causing the
> resulting ipk package to be created as "nativesdk-libqt5core5".
>
> Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

I applied this one. I confirmed it works as expected with buildhistory.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

