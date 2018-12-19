Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 66B786C4E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 16:24:22 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id i145so10522279ita.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 08:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QcPx5shMSk04au9GVApH0oduW3yLPseceHyJRpl7V6Y=;
	b=zfb+lt2gmi9+N0lzx2UXzPwN4ul3bh+eWotolJpj2qz3Zp0mK6Ae5FZpLGcuGg9MaM
	IB+OILG+VgwrsAslD6FpWiSDDNVDfCsnaLbaagP1nWdEW3/x+HCxUoZx01mtHSgUKEJM
	QGItnTcHLfcueAza9TvuzjNKADgf91uxpgILm/VWZhoOnAKNCw+ACPnTDD2E6W2OKod0
	WOm2bV6pBqkV6UwztuiE79tNTwrhdwTAN/tN6suZT9N3omds4Z/l/zVDqLgXfJxYglJN
	pP3dFfo7l7noC+ph7lo7ZW0CmWCJu68wAY3PjlgnzzMhx0kJbzhtOKSpPpL84U/NbZPn
	Tunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QcPx5shMSk04au9GVApH0oduW3yLPseceHyJRpl7V6Y=;
	b=KhOSnudJT09yeiy88khEuTv+5i6xGpVxvpb2nj2Zs4Xa2CGR7ikn6jAUcnPRiIK53t
	ubEovoJkEXQ7r6VWhwXCKLihPRMybjfkcKkman/hUR8OxQuSipAFDG+vxCYcSnbGLB4y
	A+uTBiB3mZ9SQl6NGwp0aO7sqFIo0Yf40kCQuHCfvs13hQLtJHjz09O/MJG5kKErUROw
	0Epw60ZFGUEdVXfqOTB8/7bozm477lWSDQAG9ok6VuqV9Y7QEH7BPRQ7QVa4uNX1fAhN
	OdRaepaZKKzS5+B/LEuKVFrYLGjLBiF+h6JMu5pMLFGRVjjvjESPRNgnHELwGGMH0GcV
	c45g==
X-Gm-Message-State: AA+aEWbpRsCUnwksemrVM6l3vL/01RsSJSdyLfx3Hk1xIUBHVb53rDrh
	0ZDD1mLBhUjeZ3bz/vAcDjaj0yIOgQ2EWT2sa1nGyA==
X-Google-Smtp-Source: AFSGD/V5cWggv7jhYc6rvUfi7dKPCwljqio0KVoKUIniLNi35qoUhUG+xcjj4/pDlqYc/ze+87Gl1ieUJ5Qp3V326KA=
X-Received: by 2002:a02:1bc5:: with SMTP id 66mr20948154jas.105.1545236663344; 
	Wed, 19 Dec 2018 08:24:23 -0800 (PST)
MIME-Version: 1.0
References: <CAJ2oMhKm02QeiF5dqpvYqeXBRCo+jWh=cjb2Sj2DjAt+ZqirTg@mail.gmail.com>
In-Reply-To: <CAJ2oMhKm02QeiF5dqpvYqeXBRCo+jWh=cjb2Sj2DjAt+ZqirTg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 16:24:11 +0000
Message-ID: <CAJTo0LbddHddV+sFk326_Rj5GCZpaiMft77Zt_O_HQ5f3w-f+w@mail.gmail.com>
To: Ran Shalit <ranshalit@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Build suddenly stops and desktop logouts !
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
X-List-Received-Date: Wed, 19 Dec 2018 16:24:22 -0000
Content-Type: text/plain; charset="UTF-8"

The usual causes are not enough RAM (so the OOM killer steps in and
kills something inappropriate), bad RAM (you're actually using all of
it for a change), or CPU overheating.  The latter two often cause
actual reboots instead of logouts, a logout suggests the OOM killer
was involved.  Setting up a little bit of swap might be useful, or
turn down the parallelism in local.conf.

Ross
On Wed, 19 Dec 2018 at 15:27, Ranran <ranshalit@gmail.com> wrote:
>
> Hello,
>
> I have strange behavior with ubuntu16.04 LTS, in which after building
> for couple of hours, suddenly the ubuntu OS logouts.
> I see that others also have the same issue but seems that there is no solution:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130617.html
> and
> https://stackoverflow.com/questions/48148169/whenever-running-bitbake-stops-all-application-and-locks-the-system
>
> I have increased my virtualbox memory to 11G, (no swap in my ubuntu)
> but it still happens (might be less than before not sure), also
> strangely even after increase with "free" command I see that it get
> sometimes below ~150M free.
>
> Is there any idea what's wrong?
>
> Thank you,
> ran
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

