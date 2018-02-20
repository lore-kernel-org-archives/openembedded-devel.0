Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 650D478852
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 10:45:34 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id l129so8233212ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 02:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=yCuoYhE9AtofzEtTGAlHo4l7DdbyEzT4MS5+bAfrGQQ=;
	b=RgnU/7tHaQPYHt9sFYmXrzX0ZE2v4dditaSe7Xy15sJa6kvhOLy1J3UlQj8cec7YWh
	7uIsSdkbyhPKcG6EpxPM+meFGfz1JaytkG5sP2MhOosNy4dx7qJM52COZJyHO0iA5dY3
	UZ56b0lSQD4AoCeSUWzao6r2SyECLLq4Dt3WEI4LnluGZda9XRl09uWSZbqbEEOxuSJu
	x8eWUg6t5Udab7sahWTRopIvz6OTcRoJ/8pIETz+NYocyBa2CPioCskukAQLhhVMusPB
	zgKeHweYo2k1KG0y10pSPNcTe16VoWSmbUmFoEi9dNocMyB25NH44eTvVbUoOrBEz6m1
	iO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=yCuoYhE9AtofzEtTGAlHo4l7DdbyEzT4MS5+bAfrGQQ=;
	b=o2v/pLF9VW75WQ1X6pWexFdEXk6kHjMX1upHEfJRe0RmA1GxNt64m4we9OO168P481
	kVaLmPWxyQpE3EIIII4kZjayfivs0H5Q1uYgyjWWi9lAjdG6v8dYGHWKjmt06mmM0OJD
	dsoiRlWw9l/A+xZt53COPXSIi3SdkTQuMR3bT4W3ojHtFaVuXyt3941oRFKfvcXjHEYM
	Y6ZQSf4OlBC+Wh6Xm3Qri4jXUJJiF7Xr9dcb47/qnbJYLQIzUS1CWskjZoMZWdP9alof
	Ov2W0UkTsMDAPMOh3gVks6zCdrhNHI1gv0ipiOFzcRgpnpCKhzHKAzffsnd7/SCxBq3O
	lbJw==
X-Gm-Message-State: APf1xPBkVc+dA0Q7vlHqZtKkNHaXGMjom8sOSahmHBvHvZZbrJ9uBg8s
	urLhJqlpVXlbVETbIthD7k3sZuStBvwMd+Z0FsQDtg==
X-Google-Smtp-Source: AH8x225Z6NertCWCaoq6DaWyWbC8IerHRwq/T6G4K7CorGdMj0YIYsZjMSa1QPjo/N3ADjqAdhkVGaGBDEnSg0gAxq4=
X-Received: by 10.36.144.68 with SMTP id x65mr23575752itd.60.1519123535554;
	Tue, 20 Feb 2018 02:45:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Tue, 20 Feb 2018 02:45:15 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Feb 2018 10:45:15 +0000
Message-ID: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Splitting meta-oe?
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
X-List-Received-Date: Tue, 20 Feb 2018 10:45:34 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Is now a good time to talk about splitting up meta-oe?  Some layers are
actively developed and maintained (one example: meta-python), others are
basically bitrotting and only get touched when something else causes them
to break world builds (one example: meta-gnome).  I've long felt that
meta-oe should be split up and the high quality layers managed in their own
repositories so patches to them don't get held up by breakage in other
sub-layers.

Another advantage of splitting out the high quality layers is that we'd
like to look at running more community layers through the Yocto
autobuilder, and granular layers make that easier to manage.

Comments?

Ross

