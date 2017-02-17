Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id A4AAA71AC1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 14:39:06 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id k15so41770633qtg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 06:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ITV5TfYIhLSBSmbW6aUfN+nHIN4KXxC1L8D4o0YV6ng=;
	b=IupbHJ3SF7TZnbJh4PzUobt4cLPYdgRBwTkKHeUYcuRNZOklHxtpOExuTJ2tGNHfJ+
	VIW7syGou2GCvVsD4XZxkkrXV3bi5e01MVzv9iX81rhB85zFC1mJMTeLZ7gYEXydDtcv
	yi3i0PBvI8MTq+VEoGOZ4cOrGE1nOeAjz8sLKYyaXlhDoo5Y93vIp3ehhEchahhx7/Lq
	1gyI44Tc/VkTg0zr6kS4+oZy2YdsZMMSw4PvIJ12P8rfhP1RBWSnnSjYprLisCV9mSiM
	Rr0CKUeTLwWiLzgxC2NZWET8LiAIoP1HSrk2Vj0QOxqFDchCmGIsEkl7cQPkbqZzGxfy
	u4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ITV5TfYIhLSBSmbW6aUfN+nHIN4KXxC1L8D4o0YV6ng=;
	b=jT7XpJ43vaNs2JHtUJ9FJl5yjTrVnTpZYtRDIv62JeePLkUMr2k3aSt5Avc289BAli
	1fG9lFtxI0gPkNFeXHX4mQxyJlFxNsaReMgpyEoc7IBFYjraFlm43Fmj+ukQgAUsAEC4
	m9wU+YWI4SDsuIVopQKZvjhRxrKKzcwHeZxdORRzmYv4JYUtebWjP668k1MGoBCs7Vbh
	Kw+KCsgoL0UKbP3NpJBTsozx21uRVNjEq12tyVIoyITsgZft24K6z67zZ3c48S5noRrV
	Vy40O97xXIcAN8aGr9G3QQSjH8H362C333XvthNLKb9+5lMuO84/kZ+zd4IkKdBXEE5u
	BV5g==
X-Gm-Message-State: AMke39mFyJmSlTq/LABz/knH8UcBxS+mN2xF5pOWUW65u24ckcsX5p6x6885GmuIcY5n5J44ldKIsgQK48UOlkDB
X-Received: by 10.237.54.1 with SMTP id e1mr7236777qtb.68.1487342346305; Fri,
	17 Feb 2017 06:39:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 17 Feb 2017 06:38:45 -0800 (PST)
In-Reply-To: <CA+chaQeGCbp-LDyJjpqsLV+LpQVc9p7dd_T8m9a+KXEN+vRxhQ@mail.gmail.com>
References: <1487166114-3845-1-git-send-email-linus.svensson@axis.com>
	<CA+chaQeGCbp-LDyJjpqsLV+LpQVc9p7dd_T8m9a+KXEN+vRxhQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Feb 2017 14:38:45 +0000
Message-ID: <CAJTo0LaORq7gjh2JiqXC4kPdnKgRyqAzm==uQgHLt2D_Vz1_2A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 1/2] meson: Add recipe for the meson build system
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
X-List-Received-Date: Fri, 17 Feb 2017 14:39:07 -0000
Content-Type: text/plain; charset=UTF-8

On 15 February 2017 at 13:43, Martin Jansa <martin.jansa@gmail.com> wrote:

> > SRC_URI = "https://github.com/mesonbuild/meson/releases/
> download/${PV}/${BP}.tar.gz"
>
> I'm still not persuaded that the github tarballs aren't regenerated from
> time to time.
>

Upstream also uploads pregenerated tarballs:

https://github.com/mesonbuild/meson/releases/download/0.38.1/meson-0.38.1.tar.gz

That would be preferable IMHO.

Ross

