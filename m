Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 911E06F1A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 12:22:02 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id t59so500057yho.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 04:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Xt9n55PBVEtTyuMpRU85nDry6l4wwfpNc1rp0WMcEv8=;
	b=GNJiquKVxzBBkuVcHXHN9IJ/ppU3Xhn9f4qo8VfDAlp5wbdOsVvX9u4nQyCJ/l90dl
	A/bUqxsJ1BPj0CqEIjmLbxTMcbE5A+FmvJGtlB7rvlqUxpqIX7zBkrlF1+mK3B9ER3UQ
	hWN4QgEX9mOCgHFYEcugljZyCTrGk40WoFnyzGUYlE3E5BBZwPm0mZ9fvVyX01kNLN2J
	y5Rn60Z6loG8GkBYk4PEm0+ifHXlrpUFvKXgD5e10cznjvd4P12n/YN3fwKfZlLuvo7o
	CSIM57H4pBhkuNecSw5LBvZW0aoX9/CE5HZeZ9AZ7Rii35dIPfZ7xNnTov9PnimOnoi5
	PVhQ==
MIME-Version: 1.0
X-Received: by 10.236.118.212 with SMTP id l60mr2644513yhh.78.1392898923520;
	Thu, 20 Feb 2014 04:22:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Thu, 20 Feb 2014 04:22:03 -0800 (PST)
In-Reply-To: <20140220121807.GD3854@jama>
References: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
	<20140220121807.GD3854@jama>
Date: Thu, 20 Feb 2014 09:22:03 -0300
X-Google-Sender-Auth: I1l_tixY6aPjZ67fRmX_bXTZD8c
Message-ID: <CAP9ODKqGy4-cOisGa-cV06kHAs7UKt_=yM+Mv6=W-uyuj5RFfA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Use Qt version specific paths
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
X-List-Received-Date: Thu, 20 Feb 2014 12:22:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Martin,

On Thu, Feb 20, 2014 at 9:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Feb 19, 2014 at 12:22:36AM -0300, Otavio Salvador wrote:
>> When looking for Qt5 components and files we ought to use the Qt5
>> specific path. In case the distribution wants to have a flat tree it
>> can set QT_DIR_NAME and it will still works as expected.
>
> NAK
>
> I don't think this is good idea, end-user applications shouldn't install
> their data, archdata, examples etc in qt5 subdirectories.
>
> https://github.com/meta-qt5/meta-qt5/wiki/Building-with-OE#wiki-bad-include-paths-and-build-failing-to-find-qt5-headers
>
> If you don't care about qt4/qt5 separation just set empty QT_DIR_NAME
> and all qtmodules will fold into default directories and you won't need
>
> OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
>
> listed in above wiki.

and what about we change just the headers? I want to avoid every
recipe using Qt5 and qmake to require setting the headers var.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

