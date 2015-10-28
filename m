Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 280607669F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 11:32:36 +0000 (UTC)
Received: by igpw7 with SMTP id w7so930538igp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 04:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=xfxCWccRrJLXk+m32qRr/YpoNySewpPU03Wf4sFMM0U=;
	b=La/5FQ8Vctwcx/zt2k3rxkAR1T6/kMzTfSDR4wwl4J3YNDS83ULcIGFmMlFBQgFKKm
	bMoxA9gwPm5OGg4jsneTuNCDdkYIPNaawy6cUrGD9RiKJd5Z1kOm9wrpp2SCblwSzFog
	ObFFF+SYvxLUbhwMrI9Rlpi7DLxqF84j1LObu4d1WK13O5wxK0ynRBAPgFZ/LxtCLkfI
	FO4aEAVAYEoyr7HMv7e2LLTNKGN7oJ/QSdrxit+MSxlvTdbjYbaVZuNkcFXz1FMZ9EAJ
	z54EVRPmYfEdhUMyLIoGK0VgdCo3rdqgJdYBvfQ2wryTLWCmFJP8WhKSjkHbjrdrrOKK
	/LBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=xfxCWccRrJLXk+m32qRr/YpoNySewpPU03Wf4sFMM0U=;
	b=WpRvAXvy355Ud+GDT1T/qt4EyMN6VOrRcjOzdnW7zdOfrQD9FaeRXwp6hVaPXELBgO
	BV+oUu1xQ9YYLvyC0Cyo0ivdrhKYkwnS30wbdPktwd2JfMB/lNU6wgf9zaV830wmB5G7
	Pu4hQq/IPagv7ZPD/DnHuOSCpN12lMEsb6nu9b5q0QzEE4DhWSykyh3Moh5i+AvW2qkY
	CQ7P937XOQKU5Ythy5RWmXab4/A+mQbZCDYcLT/WryIOlyMv1HH13aBzizL/CB7dHfXW
	JGjN3dttTiGrAylLwdjirf304UuR4tf2fNgXMj3e6Wln2mrK5XQbD/3Pc/ofikqd6Hqs
	fvKA==
X-Gm-Message-State: ALoCoQlSFIYCU9+okpkr4kEuVw2k6CYaGpu1BkvHBm2J8Ma0Q8Ij/cUbkMcrCnEGaTzhSkRGsYUT
X-Received: by 10.50.79.201 with SMTP id l9mr2423052igx.60.1446031956739;
	Wed, 28 Oct 2015 04:32:36 -0700 (PDT)
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com.
	[209.85.213.180]) by smtp.gmail.com with ESMTPSA id
	s22sm2262414ioi.18.2015.10.28.04.32.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 04:32:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbdj2 with SMTP id dj2so4621649igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 04:32:35 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.128.194 with SMTP id nq2mr2244458igb.19.1446031955422;
	Wed, 28 Oct 2015 04:32:35 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 28 Oct 2015 04:32:35 -0700 (PDT)
In-Reply-To: <1446018829-28181-2-git-send-email-richard.leitner@skidata.com>
References: <1446018829-28181-1-git-send-email-richard.leitner@skidata.com>
	<1446018829-28181-2-git-send-email-richard.leitner@skidata.com>
Date: Wed, 28 Oct 2015 09:32:35 -0200
Message-ID: <CAP9ODKrHYnYRqpQD3oiveUGQzBBsEAPAt=NAVR=9dWKwx2=xYA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 2/2] openjdk-7: update to IcedTea 2.6.2 OpenJDK 7u91b01
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
X-List-Received-Date: Wed, 28 Oct 2015 11:32:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 28, 2015 at 5:53 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> IcedTea 2.6.2 provides OpenJDK 7u91, which adds the October 2015 security
> updates. For more details see:
> http://blog.fuseyism.com/index.php/2015/10/23/security-icedtea-2-6-2-for-openjdk-7-released/
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>

We could rename the patches directory for openjdk-7 and avoid the
version number on it. This would make easier for upgrades and to see
the diff between the patches.

Please send the patch file using -M for format-patch so it detects the renames.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

