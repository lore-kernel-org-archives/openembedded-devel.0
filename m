Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1FCCA71C28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 16:02:22 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id v186so2466227lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 08:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=dZRZwDu6K1tUwMF3YGcLf1L+WQvF7EAcDnpRj+1+IdQ=;
	b=eMuACVGEop0PvA4KrHDWUweDghTwX00SsTCZ++k18HuPdxBrlAm6D+NNJDYegNxgz+
	PT9vbZXzSrOFNRBSrrHH/KsjKzMBu5QPQutKe5qiGnxcRyaD2Vjnd+vFjyVPOb/9cJUp
	PZ2KR9v5O7p7WCaA0qZLtI6mJWnm+J+EHpSxXTQhg5DQzj+8mybCAfVBkG8hg4jh1lp7
	uAfvU1GeWxVteQl39ukKPdrGOMkoxAFqyAgeAuuWtO26rLW0ZscPsSDTPJ38FbpFUg8Y
	kxQmflKqiKamcvxEMNrF+4WQ7ojLKHJt7d4SFsXPxnITGJ02KpW2k4WMbtzoweqY+LpB
	gp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=dZRZwDu6K1tUwMF3YGcLf1L+WQvF7EAcDnpRj+1+IdQ=;
	b=W9jOOv+J7ft5ZwE9pUH2nsPy6fiPnmEKxBOcGoPBOM3PK7yFDTjyJftyOgkG/HSs10
	Tp2Kdm2A5g5xvmDctN5dFfqZBxhVxL+bRwW2pHkr4OmM7fDZidfiJEOf0nNyN8SL622T
	QqA0JSE7+HAZY+59qB+EbugKap2m3xTcwFXY1QgMlrO614g9qXjzQtVkvZJOJ3L/lXuD
	OKT05YQ3s2orECV1fq6QdUXgxHqS91fS8Usb4PSiQkY+e1kavotuFMpkCE/OpGda/FHY
	Q3ml1SoyHxclwZ3W+87Z0u4CR4jh19B5Qcc6tNOhMT9TingArxn0DdE3ABxerQjWS3Mu
	/abQ==
X-Gm-Message-State: AIkVDXIOey0H9e8t2HWq6dyMZHxWxM1yYCuAt+tgIhpfkHFQ1Tb3Y+9X2fHYxsULi8jyJ0lsK4H559nwW+XDIg==
X-Received: by 10.25.44.66 with SMTP id s63mr5833505lfs.159.1484236941820;
	Thu, 12 Jan 2017 08:02:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.41.70 with HTTP; Thu, 12 Jan 2017 08:01:51 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <1484207068-21151-1-git-send-email-schnitzeltony@googlemail.com>
References: <1484207068-21151-1-git-send-email-schnitzeltony@googlemail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 12 Jan 2017 14:01:51 -0200
Message-ID: <CAAPZna1K6bhZkE0=i+rnNAz1byr9_N2xEpQRA0EifU9JQrkr1A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH V3 0/3] firefox build fixes
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
X-List-Received-Date: Thu, 12 Jan 2017 16:02:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas!

The problem was in git am command. When I ran git am, git changes files to
fix whitespace errors and patch 0002-use-pkg-config-to-find-nspr.patch
doesn't apply in firefox source, failing when running bitbake firefox -c
patch. So, I used git am --whitespace=3Dwarn and works fine. Patches are go=
od
and firefox build succesfully.

Thanks!

On Thu, Jan 12, 2017 at 5:44 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> Hope patches apply now...
>
> Andreas M=C3=BCller (3):
>   firefox: fix configure with oe-core master - there is no nss-config
>   firefox: use pkg-config to find nspr
>   firefox: do not link against crmf library it is not there
>
>  .../firefox/0001-use-pkg-config-to-find-nss.patch  | 47
> +++++++++++++++++++++
>  .../firefox/0002-use-pkg-config-to-find-nspr.patch | 37 ++++++++++++++++=
+
>  ...link-against-crmf-library-it-is-not-there.patch | 48
> ++++++++++++++++++++++
>  recipes-mozilla/firefox/firefox_45.6.0esr.bb       |  3 ++
>  4 files changed, 135 insertions(+)
>  create mode 100644 recipes-mozilla/firefox/firefox/0001-use-pkg-config-
> to-find-nss.patch
>  create mode 100644 recipes-mozilla/firefox/firefox/0002-use-pkg-config-
> to-find-nspr.patch
>  create mode 100644 recipes-mozilla/firefox/firefox/0003-do-not-link-
> against-crmf-library-it-is-not-there.patch
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

