Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id BE1C46CA7E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 21:35:23 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id u16so2256838iet.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 14:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=9DE4pPbe0CobPj7f1u1CC26vaEEXjypZIlnS7oa/BBc=;
	b=YXlnU483ISzEdHzixatMwovKju6uEQEsXf4BTRfJRe8mykYPLrywUcpxyXysKYyvXK
	y4qTG6C4eNFUJZK/QhJ2kguzcfIOaHm9R3u3SP41HxU7C0dPAy+xmJ0N2TLBDn7fM1Df
	Bd1p23YUnS4QnkrvpWWbKVvCH91f1teXKko1bpKxHSxcSi6bYvyIRoz5jzEXxxI+ehl4
	qT/nnGx5yTSFmKpNZxKFgY2oBtNuUdmNPjMSXXc8RoF20nL3SWAekgMuvCoIcOZtGnSo
	9a0g6skLWYJQj+qbltoiLfCVZYHW1e4/TazT7QeifR3aNb2iRLuuZ81deGPT9XtrUU0B
	znXQ==
MIME-Version: 1.0
X-Received: by 10.42.62.196 with SMTP id z4mr3699181ich.49.1380231325285; Thu,
	26 Sep 2013 14:35:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Thu, 26 Sep 2013 14:35:25 -0700 (PDT)
In-Reply-To: <1380187231-23854-1-git-send-email-b28495@freescale.com>
References: <1380187231-23854-1-git-send-email-b28495@freescale.com>
Date: Thu, 26 Sep 2013 18:35:25 -0300
X-Google-Sender-Auth: TvuIBv_T7IrPFMvZTPH1iw033JY
Message-ID: <CAP9ODKrT0WFvxceeNM0YmfxpoMq09j8mRPxSvJa0sCpHfhDmbQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] netperf: set _FILE_OFFSET_BITS to 64 to support large files
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
X-List-Received-Date: Thu, 26 Sep 2013 21:35:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 26, 2013 at 6:20 AM,  <b28495@freescale.com> wrote:
> From: Ting Liu <b28495@freescale.com>
>
> Without this patch, netperf2.6 can only
> support files smaller than 2GB with TCP_SENDFILE item.
>
> Signed-off-by: Ting Liu <b28495@freescale.com>
> Tested-by: Jianhua Xie<jianhua.xie@freescale.com>

Please make it conditional as:

 ${@base_contains('DISTRO_FEATURES', 'largefile',
'D_FILE_OFFSET_BITS=64', '', d)}

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

