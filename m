Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id AA59C71633
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:15:44 +0000 (UTC)
Received: by iofz202 with SMTP id z202so7853167iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=CE4KvV7bsuk9bWxUj5FP9RRZvs3u+ILZlx/mopAftn4=;
	b=HHEixeqnkSJFnRXt1SxEe0vU72ktMJmr3B1U47ESci2TuQKsIMf4Aio/Ys8M9VC08G
	x0WSHR9aCxf0YfLNadEudVpMb2IsMs44vCHvEGqDlJssZ2OsRUCpKgU00mrMRLCOLnHb
	q++mdIaYWTKc4KfclrSSQXgpcRZXCi7cZz1ohTHMQwseVtHQCuR5J4LY2e0by9stkUe/
	4bMBu2jAxginUJMV2H0ROxck3Ea6pJW9W/hb0nBdzzZGiHoQo1pJSPCkw1gimbCXfCkX
	4DMVHkwZNIpsRBYkwWgPNBiWcaqRA92YF4kqgbO/d8PEKgnZy46+fFxIgYwazo/RoTev
	pfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=CE4KvV7bsuk9bWxUj5FP9RRZvs3u+ILZlx/mopAftn4=;
	b=LIRZvhRZm5o6cJldSJwE3Acm/ScejoGWUGF5lBpV/BUKz8hESuzqagnAW/s3kXuDmb
	fNYUIhiDnAfsB4+1w9pMlbcaUakLdnAwfsbDyGMuemfjNiJYTsOcgO/MfsafMyXS+Kfo
	y/fqcYCQHn43Gl4PFh5u9llsdaQ9pgqoqDeaeZd8ZpMCfDlJ/SDgkuj6JP1IuF4OFrqw
	szFxVSkUN2ez1W1KyLVQT5dlNT/kfX6WK0qE9G54gQNPZ8fLN+N9QXIA1M48s6hCB/+f
	DfkN0y2wDknvJdnPS+XT9QiqPmCSmboDo9ZtALQ1F/6H03hdcpXt3nfm6GaIn1nSs2kW
	woqA==
X-Gm-Message-State: ALoCoQnfZiHaauuuDKtVoJceeQNX53IeELq2HDeTunLMF5MnPpSgP3MG0iREx7FGYHgW231f42WP
X-Received: by 10.107.149.203 with SMTP id x194mr16703327iod.170.1446034544520;
	Wed, 28 Oct 2015 05:15:44 -0700 (PDT)
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com.
	[209.85.223.178]) by smtp.gmail.com with ESMTPSA id
	kb4sm9850800igb.12.2015.10.28.05.15.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 05:15:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iody8 with SMTP id y8so7901968iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:15:42 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.17.18 with SMTP id z18mr43224040ioi.28.1446034541998;
	Wed, 28 Oct 2015 05:15:41 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 28 Oct 2015 05:15:41 -0700 (PDT)
In-Reply-To: <1446034039-1169-1-git-send-email-richard.leitner@skidata.com>
References: <1446034039-1169-1-git-send-email-richard.leitner@skidata.com>
Date: Wed, 28 Oct 2015 10:15:41 -0200
Message-ID: <CAP9ODKrfx4_LaXuKeALknjz8Te-AXfER+7OQTLe_U5J2GJi-7Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH v2] openjdk-7: update to IcedTea 2.6.2 OpenJDK 7u91b01
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
X-List-Received-Date: Wed, 28 Oct 2015 12:15:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 28, 2015 at 10:07 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> IcedTea 2.6.2 provides OpenJDK 7u91, which adds the October 2015 security
> updates. For more details see:
> http://blog.fuseyism.com/index.php/2015/10/23/security-icedtea-2-6-2-for-openjdk-7-released/
>
> Furthermore the patches directory for OpenJDK-7 was renamed to avoid the version number.
> This makes it easier for upgrades and to see diff's between patches.
>
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

While on that, would you mind to remove the preferred version from
README? As we just offer one now, it seems not required.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

