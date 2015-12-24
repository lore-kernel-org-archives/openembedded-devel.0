Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 31814731A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 09:09:49 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id jw2so93587308igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 01:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pz1Hdmn/9SpLfP1K6Yw/YJspLNFYP4v3rv0xCqFZ+s8=;
	b=mP4mY+b2BfGJq1tPkCcKrcgEFTkQG0Xy/0/1O0cpKGD8E6emN3S6Tgt1ZtxR/O1HZy
	4taaQYv4wwB+UojWI5N/CuwHwtmoObFmWxgNKgx4G0SsNKCPIUvkiTchvoudCdgaIW8J
	Dwj63FHjBtdyJOPRwEvWL1ALBcm1ol3ROZIxjc/g2E496mMEzHHnP0rLJb2dbI0GU5Qu
	qJnEQim1iri766yGuWsWn6buKubpElwrM2GUfdpYrQkNnRLaKpHORv2h2tAkGGHMvxeN
	5V4Kf3ENfcBQ4ZnMfmFT+R7vqI2tCv/L7Gk5Sx5Fme7YTYd01UiJdN/8xv7RHLU70QpC
	i9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pz1Hdmn/9SpLfP1K6Yw/YJspLNFYP4v3rv0xCqFZ+s8=;
	b=iyLFhDltGSB7dgxMD5f50cykmtDBevlKTRAbC38uKXt7ajREaoBOlnu1Ip22QSg6Xn
	wKaqOzpt6H1Zc/4ZNYruaheqQoLuKpxs77wMemN6Gt4DLqgfDHeu+sp/5Rphnp42JYtO
	WrnzTI7GLClnCn0Yt/qyLGTwqvG024fXGzu+G7LjRxNic4W1wfEOG8Xz1lYQcOV9M7VF
	lFFECt1FNF1tCSYOURTX2H1l4EiYE42CBAiO13VkreM9EQH0CBwHjcrWNxMKpAkEYt1O
	J2CMfGRaun9aAVUj+QFllyZcKL6qNxRMGP7tVhaZnzhbluC75RBiJcWwgGQuEGZkeZaY
	zGsg==
X-Gm-Message-State: ALoCoQm+v2Ff2Xu2rT7OooVniltlzQ1mKM6U6v4Ij3st8NPiuVC189kCc+LLMkIxa4GEKdDP9QAAbqjbRKdvBlbC4tC1+yoR84quujMt5ADWk6i1VQTYSZc=
X-Received: by 10.50.126.8 with SMTP id mu8mr33320407igb.52.1450948190601;
	Thu, 24 Dec 2015 01:09:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 24 Dec 2015 01:09:31 -0800 (PST)
In-Reply-To: <1450910987.2002.86.camel@pbcl.net>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
	<1450910987.2002.86.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Dec 2015 09:09:31 +0000
Message-ID: <CAJTo0Lbrb-yu=71a+7YnF0pSkiNxB26U7xh7dbS7Jr8DPEJmag@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] Delete all .la files?
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
X-List-Received-Date: Thu, 24 Dec 2015 09:09:50 -0000
Content-Type: text/plain; charset=UTF-8

On 23 December 2015 at 22:49, Phil Blundell <pb@pbcl.net> wrote:

> Sounds good to me.  I have been using the patch from:
>
>
> http://lists.openembedded.org/pipermail/openembedded-core/2012-October/069912.html
>
> for what is apparently the past three years and it continues to work
> well.
>

That's good to know, thanks Phil.  Does  your work not build
openjade-native?  As I said that needed .la files to be present in my
testing so I'm wondering what the difference is.

Ross

