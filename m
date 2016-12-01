Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id B37E671AEB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:16:07 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id p9so130991161vkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 08:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=094DLskgnJBmIy6VRYhmMvwl48p41Gi+hZX4bAfMeKU=;
	b=UH52x5FOMgMBy+4JlZhq2qtUla7NvaM5wOcnXwC9H0Pc3kRNv6fHf5rrEBGadP0tlZ
	pTdxv850P9PkUsPg1X3kaS+2srU+s2ybduLtSeqmPNBHx4Jvd1mPPlkRRpdlQd4lT8KP
	1IVBM5L3h61W8XuG+NHUgIYv22SOJv07lOSD/YsDBa6EaRq8Z1JtZev7cqEWoCK4x6gx
	RQnP3E+8zercRSoa3dzpc70UyDcIWd2nG0cdqAy6G27dOSdEiyamoAulrnDqCVhUvATb
	iCHPiWELe5SmtH+uBBkm4/ORSgsyqwo9OI/QgEanigjy6XL/o5Vos1fJuJkLRaLuG1UL
	zZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=094DLskgnJBmIy6VRYhmMvwl48p41Gi+hZX4bAfMeKU=;
	b=I21hGRM1d82ze0fHoW1uN7qqjmphLeWagjodd+WylakY60SasypNBkV81+L0PBuT8x
	r/uwAr9Cn4+GlkqFI4JgIsEf6bAsggzx2rWcYdFQlcbVklv97QhmXUBHXQRbk/Nfcu5b
	TI0DwMX0i6XB4WLn79mij4PbeA7Keuq+HEbNQ6ripCcG9hntEZBLyegnfCPDYIDoOqbZ
	J2BlSY2jgm+uer3466VA5pdZqluTVIVNc916tuCGtgyJHiARgPsOsSwCe2qI3d6i5IMh
	mytKSHYhnx7I7GurB4JUmMnOPolNLDo/rN48YQjxo9zE0lXf2cShBYX9kMuAFViXy9pv
	QA3A==
X-Gm-Message-State: AKaTC02+yTKgiVTRjHN0TJKqslLiWKW28SmSOGE3sQntDCsVBTKRspXYZAr2IPp+vk9et0kkg6YTeDpX9a72CQ==
X-Received: by 10.31.50.214 with SMTP id y205mr14589092vky.29.1480608968622;
	Thu, 01 Dec 2016 08:16:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Thu, 1 Dec 2016 08:16:08 -0800 (PST)
In-Reply-To: <cover.1480608365.git.akuster808@gmail.com>
References: <cover.1480608365.git.akuster808@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 1 Dec 2016 17:16:08 +0100
Message-ID: <CALbNGRRT2Nz_nHaJZeFLNfYGvoi01hiTuMADrz=kjyAjkTKqvg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/67] meta-oe pull request v2 morty
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
X-List-Received-Date: Thu, 01 Dec 2016 16:16:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2016 at 5:08 PM, Armin Kuster <akuster808@gmail.com> wrote:
> Please consider these changes for meta-oe Morty.
>
> removed two commits not needed.
>
> The following changes since commit 659d9d3f52bad33d7aa1c63e25681d193416d7=
6e:
>
Please consider also

commit 5a752d719eb35dcbdf4b58bd70ec904befbe0c59
Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Date:   Fri Oct 28 22:59:50 2016 +0200

    exo: unbreak Thunar's detailed file view

    see further details at [1]

    [1] https://bugzilla.xfce.org/show_bug.cgi?id=3D12916

    Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Andreas

