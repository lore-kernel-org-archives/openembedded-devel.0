Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id E3C417C93F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Mar 2019 15:20:10 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p17so667857iol.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Mar 2019 07:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q6YDBBV5ufAF0ZypFSKWXN/lJ3CmUSbH59YJ7VxE3OM=;
	b=DoBrJExfLL8P1yCXxVxTIuIxvCVVto+14tmHUdbyADPdfjjWMTOcBZHAvgNRMq48TL
	3Hw+rYRK0ygLtXAOBCfMyxLO7EXqw3Jvc6P37SesfSyVPF769eGXBxBE+82mVHLYAF5S
	bPjX2S3aKpMLs/myg/vv1RY4gQSgMJYm9wn2XEqTnJLuI7iinyYX5R6voxXpcOGPXpJE
	fomJN0Q7vQBrN/nHRhrWkUjjCb2sfcyCJyGYglpVCkgIU3GGs4/oG/AbNGfOMmAte88U
	OVd2aoICT0kmcYcpaADd47mI58FfRBIQa8sVRtOArjVKfSgfvHFl14wLzzr/XfTkw7g/
	3ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q6YDBBV5ufAF0ZypFSKWXN/lJ3CmUSbH59YJ7VxE3OM=;
	b=Ge31WKVbUJVDwzeg+aNzWL8bGsjjV+HxypDfBTHtfMw56D1yFVe/1c+xQiTidxa51y
	tHsuwZAG9vds39pmLvoc0kW0Jh/6vh1O+OAXQW23gpP6kPlktij2QXZY/LncJKlyl/oN
	Fg/ovtP/fTCo/od8y0LjttOcJdg1QfU+nIpesqZRZal4cZsIvh5dvvQVe0nGhB1YFzYc
	5eMi/MrqrznLX+cLm7x03Y1xUCfZlKIn66oz+mNGQq7eZ80oCFv61Ee+SzlxUwQ4cdM6
	Txg1+jqt/Ie41tQwIKVQaXjvcFxGHoetg3mQFoeImAKUL+jFJ/XvB7yFgVrAfikCYt1F
	cyhg==
X-Gm-Message-State: APjAAAXpbPfhm7aIb3JpRF9ZfXwF4zCvkpPUN/czCC13NkRdMuxLjecZ
	rPOdvOEaQsReXQOMcRTGnbiJjnOHbrmIM7erPUI=
X-Google-Smtp-Source: APXvYqxa9Vuvq/pe4mdLNyO93xZZgyUce27opBbGCluk867nB8bCD+3LdrpAL28bSz5vcNaREAfF1hrjsOXflW+LscQ=
X-Received: by 2002:a5d:9a08:: with SMTP id s8mr4867542iol.99.1551540011773;
	Sat, 02 Mar 2019 07:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20190302025034.10954-1-raj.khem@gmail.com>
	<CALbNGRTf6TvxoQmC=fxGyVo31xn8w5p2sdJ3+aHmpPVn=EAEEA@mail.gmail.com>
	<CAMKF1sp9AYu_skZBkVXw8ezFpVF2mS4w41EFFvQDdTEuXBHs8Q@mail.gmail.com>
In-Reply-To: <CAMKF1sp9AYu_skZBkVXw8ezFpVF2mS4w41EFFvQDdTEuXBHs8Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 2 Mar 2019 16:19:59 +0100
Message-ID: <CALbNGRTtHwWWDGK7ebDgqw3Q03fzMaTfG14S-gWq0_MEjTUT7g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] glm: Upgrade to 0.9.9.3
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
X-List-Received-Date: Sat, 02 Mar 2019 15:20:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 2, 2019 at 2:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> > Dropping the patch breaks several packages for me.
> >
>
> can you forward port and submit upstream as well
No I can't. Would you accept a simple upgrade patch removing all musl patches?

Andreas

