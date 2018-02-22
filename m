Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 12B6371AB3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:18:33 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id v65so9759017wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 01:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=0YALnYX4QTAPoGVBV56lWfx2kjlejbApQEMufnwhZjE=;
	b=VrHMZwFvkZUbBv/g/iYGYAU/683Jfo7ivPPLOXD4iUFt1Rm0Ty2OCchkA4iKeTm9mU
	1bBTbaBYNWG9qnTURJa09x72LnlP9dL0eN8tGwRmmuefAW511oARRTWoW/3yhEB7ft73
	reaIIfKFxWOG1jTCkE36czJsXFcydOBn2IfboqDaf50j8c0T9ZfHjtFO2KmGDhnO4hwG
	0d4J5w0X9okQ/llHgGkeDDUXxLdcNszSWa0aeW6CeL68FC30C+k5iEaxCYZg2rvxqV/Y
	CP6NUgTyTTo34ireYDnSAHVu2h4w+vrHUftrAg4x836C0z4xGtuG7xyW4bMW0LAQ3zpT
	CBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=0YALnYX4QTAPoGVBV56lWfx2kjlejbApQEMufnwhZjE=;
	b=WRYe04Y/LlDGmBBxWHhK7140l7zsFSnaRdDgBh/96BSeW7RF9sT4tO+KKXVGBhHH55
	t8g98/qqBt8wFJWMfS1eHUWNX8S//48l1N8ZbkJlVV5TDxhQCnqgAmPbgG0JCoI9pgDQ
	+9hLwov7rntO7ltDfGrtNDk6AAGAgaRkt8s1wkmcBtnUiAlHcwETpGixFX+W1O6yOpnJ
	1mvFhE9y2QFeS+2d23P0lYMSz34VDcVOg1fUAPficMc5jxA6e2YiOaz9g9HMtGUyXz4T
	Pt41+Cdnoq0/DDNx7McJXCV4IeVYc9HhzhPzwzF84KR0x1RIBE8IoP1heZOFZ6dTKXoS
	wfIw==
X-Gm-Message-State: APf1xPBV+D7duUOINnG4y/5H9kjUrby9gBmJE2GkkDd9kowDNtPa7JbK
	fz0C23Cj7PWc/0nXtkXpQWCCkf8=
X-Google-Smtp-Source: AH8x2266qastuk6EmF7hNebHsVCO0AaAhRB0/irHXRFr8MNW0kJeumhQeLw9+zKYBJm8Tzk/vw+oRg==
X-Received: by 10.223.197.197 with SMTP id v5mr5657814wrg.161.1519291114736;
	Thu, 22 Feb 2018 01:18:34 -0800 (PST)
Received: from pohly-mobl1 (p548497B7.dip0.t-ipconnect.de. [84.132.151.183])
	by smtp.gmail.com with ESMTPSA id
	e15sm38219060wmd.26.2018.02.22.01.18.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 22 Feb 2018 01:18:33 -0800 (PST)
Message-ID: <1519291113.6698.11.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Thu, 22 Feb 2018 10:18:33 +0100
In-Reply-To: <20180221203352.55cd9a96@t460p>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<CA+chaQfpXBL3=z3QwTKQ6MNBKUVhbMjA6G+nADz562zFuYUTUw@mail.gmail.com>
	<CAAQYJAsOFo6md-ZCRg+KmGQtC9O+pwFzVjpEMOXOFVFWzr4iMw@mail.gmail.com>
	<CA+chaQfcD5n9Gs+Hos26qOqE5D8ch0JwTm+7pn_ZtysPCpHmjw@mail.gmail.com>
	<20180221140252.d4rmbn73c3nzsvac@mentor.com>
	<CAJTo0LYe1koEr7kJg7RfXLDbZLVa0qQyWiig5Sng_hpRTr_3dw@mail.gmail.com>
	<1519225097.6698.8.camel@intel.com> <20180221203352.55cd9a96@t460p>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Thu, 22 Feb 2018 09:18:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-02-21 at 20:33 +0100, Andreas Oberritter wrote:
> On Wed, 21 Feb 2018 15:58:17 +0100
> Patrick Ohly <patrick.ohly@intel.com> wrote:
> > The approach used by meta-freescale works with older releases.
> > BBFILES_DYNAMIC [1] (supported by bitbake 1.36/Yocto 2.4) is a bit
> > more
> > robust.
> > 
> > [1] https://patchwork.openembedded.org/patch/140532/
> > 
> 
> That's interesting. Is it possible to express dependencies on more
> than one layer for a group of recipes with this mechanism?

No, not at the moment.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



