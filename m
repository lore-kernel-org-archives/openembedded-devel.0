Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9B50B6D7F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 11:10:57 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f73so8227875yha.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 03:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=p61PWuLOF1+149vvwq6T/EDyzsshvKZ+hbMILLfAWUY=;
	b=YLPazmpKIZZFPSsSYerajHj4CyI6FTggpf1jT2fp/kg3K6HjhGUCxpJpHtdQlQ/DGF
	qt4+8kHcDlGnTxpZ3c23fXDzlXxpeYej2uc9klx/SlL+eCaz9JFXZkpoZAjxXatPz0i8
	l8eDH8XacTMo9Ppak3PWQHINrKaOtHqA28DmAUueK1Pc50adhnAB3rop4BorxtSW4PkW
	AvyUyNBkfcccT5IK7ECMMfDoPb4khepVjAcUr9onp8f22xIEN8tjJSrjDS+0VdmMAN5a
	qE8RtsnHvvaDUEzqK6+ByXyNp1dRvSV8NDctjL2XT1ZRV10t8/5pQBC5EC45dMfDk1Zs
	utdA==
MIME-Version: 1.0
X-Received: by 10.236.4.67 with SMTP id 43mr11295301yhi.9.1392203458347; Wed,
	12 Feb 2014 03:10:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.161.3 with HTTP; Wed, 12 Feb 2014 03:10:58 -0800 (PST)
In-Reply-To: <1392141388-25288-1-git-send-email-otavio@ossystems.com.br>
References: <1392141388-25288-1-git-send-email-otavio@ossystems.com.br>
Date: Wed, 12 Feb 2014 09:10:58 -0200
X-Google-Sender-Auth: dBAhFaNjngSSkq5QdJnZoRnj5GU
Message-ID: <CAP9ODKrJa+WtpPTeLs+Xc65YGEo4b82cejRn_69RVcuTkt9NJg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH 0/5] Qt5 SDK integration
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
X-List-Received-Date: Wed, 12 Feb 2014 11:10:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 3:56 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> This patchset integrates the current nativesdk recipes into the
> OE-Core toolchain generation logic. It includes many contributions and
> reworks suggested by Denys and the final patchset seems quite good.
>
> For every image, using Qt5, to add support for the 'populate_sdk'
> command to proper generate a working toolchain, just need to 'inherit
> populate_sdk_qt5'; for convinience, Denys also sent a
> meta-toolchain-qt5 recipe so it works as qt4.
>
> Denys Dmytriyenko (1):
>   meta-toolchain-qt5: add Qt5 SDK standalone meta recipe
>
> Otavio Salvador (4):
>   README: Reword the section about github forking
>   nativesdk-packagegroup-qt5-toolchain-host: Add packagegroup
>   packagegroup-qt5-toolchain-target: Add packagegroup
>   populate_sdk_qt5.bbclass: Allow generation of toolchain

Applied to master.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

