Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id E6577600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 20:12:25 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id o67so477334011iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 12:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=/x5J1irwbAhDetD3eKqdapFtMkUTaT9i0Y9XZpVZlyg=;
	b=ZRazfxsXO01bKwYPWawS4XJiT0I1vzQe2CzoSOuD3WLt72ViFwUkGEhXl/cBD4uR4t
	QEGjiAtj08zQtk8iRVzAcaw4jZf0fRoBksMDpMTnrCYUzblQt9qXNJq/XqV1jK8EFV5Y
	uhRz/6X79lW2tRcAOWN3Xws0gl9Nj3vuB+FS/zciJtTb++oNaB/2w/yeqG/QO26mYIPA
	cFKbmWkVZdL+YlbGcATQiHHMZ6Wmf/vss0QBgFTcryvSFQZhILwn0rU77RaR5X1UN/03
	y5Vu09dqd2kNaUtef17jrR8kysYpWaN6cxigneIWZVnWWxJ/CUbY7C4opRsT/rpkh/xA
	qSbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=/x5J1irwbAhDetD3eKqdapFtMkUTaT9i0Y9XZpVZlyg=;
	b=NEgxP6shk8Jo1FvT3SCrld9ClKGvSzZFhUUZvv++F4UjgMLyNv/gRH4PSVbbPF62qU
	DI28b1/SJxm3zwK+kQ/LBl7RiFujFy5+9HclGVhkbZ2AcBkhWIFodl0nUsYWhpvkQzP4
	BS38cvZ43OZlBm1kfAhY0fztmOjLAFXfs9SpThE+xYY+gw/k/u1JFONqT5qbyplnUpid
	fSadBOOCNXm5udh5+IGfi+38QHPC1qqKlTjUaSlGtxEfAcyqWRHy7DqLHTlGpv/Ttnwh
	ZKf8q8IFsMmMM/sXiM7Yqb6Ufm1lJEwQSItROdIx4VQxVtoYP95RVqPPZfQrhMN2YSJa
	SbGA==
X-Received: by 10.107.28.80 with SMTP id c77mr60738915ioc.98.1452024746406;
	Tue, 05 Jan 2016 12:12:26 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.104.194 with HTTP; Tue, 5 Jan 2016 12:12:06 -0800 (PST)
In-Reply-To: <20160105195415.GF2574@jama>
References: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
	<1449682880-21963-2-git-send-email-kergoth@gmail.com>
	<CABcZANnyzaeCgL7Ljzs82gsd_V2-SNoL5L2DZ3NeCZP41KMVPA@mail.gmail.com>
	<20160105195415.GF2574@jama>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 5 Jan 2016 13:12:06 -0700
X-Google-Sender-Auth: Q7psNiQL_rUQRfewVFvW4SsweN8
Message-ID: <CABcZANmzJzCrfGzimH6cwuC0z3FCz_T9zG49uvpd3QjCbCBaLA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCHv2][RESEND 2/3] lowpan-tools: add missing flex/bison deps
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
X-List-Received-Date: Tue, 05 Jan 2016 20:12:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 5, 2016 at 12:54 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Jan 05, 2016 at 12:15:17PM -0700, Christopher Larson wrote:
> > On Wed, Dec 9, 2015 at 10:41 AM, Christopher Larson <kergoth@gmail.com>
> > wrote:
> >
> > > From: Christopher Larson <chris_larson@mentor.com>
> > >
> > > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > >
> >
> > Looks like this hasn't been applied, any objection?
>
> No objection from me, meta-networking patches are applied by Joe, that's
> why I didn't move it from master-next.


Ah, right. Not a problem, just wanted to check on status. Thanks.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

