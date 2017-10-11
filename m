Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id D599865D00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 12:20:43 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id a43so4479569qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 05:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xploDvgtaiQS4QF5kczF3sAMITghn8B5Zv8UaYKCdwM=;
	b=aFypMp0lkyvqnwuUfvmJz5PNyiG9cIk855huo6lQb8vFJUCUqKElU0QtBLFn7rnPuA
	TJVQ9fsmP6CUDL4Ft9c9zQNzoHi3MCG9LnnwZ+E2Ub45BKGWbEwhLPZLn/SSkTaLJmuv
	IsKwMLezPHevDeL9VPOaBtoKtHCkxaIe/5Ww64CwJtna87T1EW07HzGLCUKmGOkpGUCt
	H+TD5wOX2BjQGdt7wurDCc5CstOMBcJ3dUD0CEB4S+FMvSJ4B2mHmXxxg+MKEiHSfEqD
	FRBIJTwGiEhmusl0L5YPniktZozUCTd6jrzDu48XEVTVjk2rJ5wpxkQT91xgoAV8K1Jj
	3new==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xploDvgtaiQS4QF5kczF3sAMITghn8B5Zv8UaYKCdwM=;
	b=L7IQtV+RX67Me3pvPb8YCtiArcWlzMbhd/gz6oJ7SKFNYtnbJGSr1KxeEDxr/f1nKt
	fhRPCUkpcnvhkDAL4DPQLtjAx9fBbGn/4Bt3EP1AbqL2YYhxksDxMaUoYHv1x+5/UYZZ
	H2PIZqJW45oF7RwQF/BuMP5nmcZz9IQImEcvJZ7pWsMDoPuiJoI/vzS7lXj4p9vWUW21
	rb7vQLD4Whbs195BslNwNPjBd2oqcqwwP6c8Ka9pyT0ONXwvRWGQxsCz5ohpJOB0KbXa
	hzd6MMORhBl6rG17mk85PGAPL6K4r2MlWiONTEtlMIfR5jpVvIc0wEXMw0AKVRzpWoVy
	fIRA==
X-Gm-Message-State: AMCzsaXDSaVkHpONqWiF+GpT0BuUXp0zr60tzUogl9TXGnqZoql211TF
	l4ln13Ct/x1EfZbcyQ3mqp/Qv0xXDETGRuTqeYI=
X-Google-Smtp-Source: AOwi7QDajqiF8rglktgfE0jhO68U4DpCJR405stPg+RiNrD9MKgPpLiIG52NW3iXFUxOgjj7vfnEwJ6zbiSO1rPFSMY=
X-Received: by 10.55.215.93 with SMTP id m90mr18962954qki.197.1507724444761;
	Wed, 11 Oct 2017 05:20:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.199 with HTTP; Wed, 11 Oct 2017 05:20:44 -0700 (PDT)
In-Reply-To: <1507662641.20629.9.camel@intel.com>
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<87d15w4a02.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapSvuLFcVyjc+FB4cG7U753SeedOfJ5xCtFLCx-+fK0QVQ@mail.gmail.com>
	<1507662641.20629.9.camel@intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 11 Oct 2017 08:20:44 -0400
Message-ID: <CAHUNapRps8ck3S=aKHYH3UmzBgsZW-VDx4x0PgY2D4zXuh88_Q@mail.gmail.com>
To: "Kubo Da Costa, Raphael" <raphael.kubo.da.costa@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Wed, 11 Oct 2017 12:20:44 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Raphael,

On Tue, Oct 10, 2017 at 3:10 PM, Kubo Da Costa, Raphael
<raphael.kubo.da.costa@intel.com> wrote:
> On Tue, 2017-10-10 at 14:28 -0400, Trevor Woerner wrote:
> I've pushed commit a0db280 to my chromium61 branch; that one allowed me
> to get to the end of the build without any other issues. Let me know if
> that's enough to get master working for you.

Excellent! Yes, this update works for me against master :-)

Has anyone started trying to integrate this with meta-browser?

