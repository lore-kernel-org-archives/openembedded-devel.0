Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id D91A56BF47
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:03:07 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id z5so194824lbh.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=+lp72lcUrVw+0M62xz0UpWbQAc4owJPCf/h67RMLbGc=;
	b=t5okFRLhYO9SaB26lpkOpYBqu1daUOXYHNKCWpLIqtRwToHVYbZdr9wONhmLcHhrCn
	py5e7a36hHuRKtgwGIF15PnOxmOXsa4E4ZPP39UzT7FjadcGmiDya04CSMcrsg+mxjYr
	oM/kmAcffCI3EVxO0BYQKd8xpX8Tk+F2rLKoZmgbaz4nNaXN/tf7w2qp0Fumf0yWXtPs
	IeE4IsLsyC4Sl/vH0i4JPtmJUQnxaVWWMT3efnyLdZp331ZoIpcp8wwkMm01eRKONu/b
	5aI7fN+9k22Om8vxssMpnWxiyqa2xEBbP4gHN0VqrAVsOL6z/B+eKBvz6YuUNB2phvsT
	T4cA==
X-Received: by 10.152.170.166 with SMTP id an6mr3495346lac.20.1377792187906;
	Thu, 29 Aug 2013 09:03:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Thu, 29 Aug 2013 09:02:47 -0700 (PDT)
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 29 Aug 2013 09:02:47 -0700
X-Google-Sender-Auth: Lh9Eh2vRKMPQ1bhvQHXPTAf_kSQ
Message-ID: <CABcZAN=1muf8Ta-ao47uZ2q3NPuTx285Fg9Fw2apWFFuc-1Vpw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [WIP][PATCH 00/66] Deterministic dependencies II
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
X-List-Received-Date: Thu, 29 Aug 2013 16:03:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 29, 2013 at 8:50 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> WIP because verification build is still running and I must admit that I'm
> mostly
> testing that all dependencies are correctly "disabled" and in the end
> deterministic.
>
> I'm not testing if every possible combination of PACKAGECONFIG options
> provide sufficient
> dependency tree.
>
> The following changes since commit
> 72e23c12296fbc77193898c38426add58d0c2d71:
>
>   mysql5: replace with mariadb 5.1.67 and tweak (2013-08-27 16:39:31 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib jansa/deps
>
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/deps
>

Haven't reviewed all the patches, but just wanted to say, this is an
impressive amount of work on this task, nicely done.
-- 
Christopher Larson

