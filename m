Return-Path: <andrei@gherzan.ro>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id D7C7872F5F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 May 2017 10:03:29 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id r185so25017672itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 May 2017 03:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fA8p77R4eOVMCvnSTcfJ7nU3xXTY+z013uTl5NkiRuA=;
	b=rdALd8d6J55vAdQFDBSPEmuiupXMbmo2+ve6WycI7TWp9UdOFpBOhYXh2STbW+7JcP
	+xUcMF6p3Qu3UkWtui+hhND6GvdR5wlLO/FW+yXgtoxs4fXTpQSgGSdrzDpqquxsY8pm
	BRXYpfm79w8frQWgpuSy/DctWTm/8EGcxbPGMLsxqQRx/TGi+Rxs0goSc/hwJmN6hhh6
	V0EZ+HhmiY1qf0TVu/cqdn8Xv9WWatw1uiUkF2TR61ca5xN9e68w4J2GYejmhpcu0t0y
	y+YIVSzL4Ga7OPYRpqOBSm76nYxiUaMLlyNYXjmfvuqiuC5MHUXw5pFlx2IzLwQGrH8d
	I6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fA8p77R4eOVMCvnSTcfJ7nU3xXTY+z013uTl5NkiRuA=;
	b=obwXsp15aXeHPOpCeGygEtKMbWASnd1AeJ5Yqq5clwgrkqtnVO0yr1tjrSUiF8GW+u
	68LHUXhmBXjvaSAU0+mZg1BSSSrf46VyuseW2mS9E4D1ICkOzGq10uiiv4ZjDXWhPAby
	4gSR575MHXnPbQHPKDeh7LRaMuUOu+qA567EMR3PBcW/Jo1IHu10c4HjMBe0J7m4XAPP
	suXGqaUg76xUX9SF8zNRiLlAl2P/IwqQUfHPjU+R9EnIailAMyCB2vTNP5f+SiU0KAMl
	8lF+ODB4Yygpz/Wfb1KHG0jfM70jGajaKU6L4LPMroemLd/4+j38o1G3RKjZSe8/Qf9X
	yPGQ==
X-Gm-Message-State: AN3rC/7lNnjc9vC1TCQlsJYnKpYoE2Mv2D7ul8Gk4sqd2ijuYie4IhNq
	2q++n8wff+yylrfMdYPYJNMGALzxZA==
X-Received: by 10.36.66.67 with SMTP id i64mr4694589itb.22.1493633010739; Mon,
	01 May 2017 03:03:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.27.207 with HTTP; Mon, 1 May 2017 03:02:50 -0700 (PDT)
X-Originating-IP: [31.52.113.35]
In-Reply-To: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 1 May 2017 11:02:50 +0100
Message-ID: <CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
To: Sean Hudson <sean_hudson@mentor.com>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Mon, 01 May 2017 10:03:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 19, 2017 at 9:48 PM, Sean Hudson <sean_hudson@mentor.com> wrote:
> The board would like to hold a general meeting with all members.  Under
> the new by-laws of the OpenEmbedded organization, we can meet
> electronically.  This will also fulfill the requirement for an annual,
> general meeting.
>
> Planned Date/Time:
> Wednesday, May 3rd, at 8am US-CDT(UTC-06:00)/3pm CET(UTC+01:00)
>
> Wiki page with full details, including teleconference information here:
> http://www.openembedded.org/wiki/2017_General_Meeting

It seems like there is not Edit button for me to add my username to
the attendee list.

--
Andrei Gherzan

