Return-Path: <gizero@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 04AEE60268;
	Mon,  1 May 2017 10:27:22 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id k87so113492655ioi.0;
	Mon, 01 May 2017 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8JpsrHp7Hfdu1/TTtapQqYtDrVIy/UcTdd7ljxG8hho=;
	b=SGrp4Mq0PZ+KqshR1gxdaveTZM34aeuoRB5Qk5gV+17roQ1TYDc/+6SHB+jAKJdfre
	BP6Jv3CJdlJZ6K1lTn4vKTY6RwmvQXhp3kSdm3V7ISB/Gkl8bwsulPJ5x61y9RJnvR1q
	AfVub1bpRWkuJ/vPj2Fa/XONSEFZ7ImlPA9vhnchCRNor32s4satMcJUs01PfMNVtAJr
	39aXZhnnOwAxNRKmEH9a5184uUytVd4NULbOLDspZYbyQpO2NxSTwi8ZYaOk2wbL/lLR
	M6mi/wNkl0y1HGeGv0GeC+oLfWcubQr1op8Dr59BsEc68Ma7W+oXih+Yv5/mOdQR0aIQ
	3+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8JpsrHp7Hfdu1/TTtapQqYtDrVIy/UcTdd7ljxG8hho=;
	b=PTsXbABbgCHrtXGtdGTG3qNI77/PTf2oSnrTA5LrS5P4inkm/JTZHGm4GeRVBQJDMw
	vl50GRa5kqo0J4AiOkx07IZRokLLawukrC7oBD8N6OBB7/vMOHFLtqW3tSS35DrjiFcD
	bEzxpYsTA44NoW0ZXzc/UwY56K1vKpdmoVL5OSuYP6BdhLnuFaKJEZWhcbXWyj+S4xxd
	Fjc6ItNrUfsGdyTcvRglGdhg2255WaxsLRxIDJQ6wz9suUOM/e/GcAqQyJROV0BS4CxK
	cSZcLOyYxO7+e2ZlJenDYZSqAmJTlFTx9W95MPenVMAVNOBVrbqxyyN+TZKgQfhWrPUB
	zRGQ==
X-Gm-Message-State: AN3rC/6zrbxEdIaoyjAgokCLIo1REfiQHEM0pBEhvB9cmPvcpclk2VFh
	7a2amamKppo5urh8RsGQXvJHoo7pKA==
X-Received: by 10.157.35.136 with SMTP id t8mr10053531otb.59.1493634444058;
	Mon, 01 May 2017 03:27:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.24.107 with HTTP; Mon, 1 May 2017 03:27:23 -0700 (PDT)
In-Reply-To: <CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<CAK18fxHF1dPOAXSwFwtS0s_vaMo5--t4QS2dq8pBwbDPdFDmbw@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Mon, 1 May 2017 12:27:23 +0200
Message-ID: <CAC+thW0rVtEFKKoJChwLjK-2=aMmZuW5vRufJ9iaFXJt6JiEAg@mail.gmail.com>
To: openembedded-members@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 01 May 2017 10:27:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 1, 2017 at 12:02 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> On Wed, Apr 19, 2017 at 9:48 PM, Sean Hudson <sean_hudson@mentor.com>
> wrote:
> > The board would like to hold a general meeting with all members.  Under
> > the new by-laws of the OpenEmbedded organization, we can meet
> > electronically.  This will also fulfill the requirement for an annual,
> > general meeting.
> >
> > Planned Date/Time:
> > Wednesday, May 3rd, at 8am US-CDT(UTC-06:00)/3pm CET(UTC+01:00)
> >
> > Wiki page with full details, including teleconference information here:
> > http://www.openembedded.org/wiki/2017_General_Meeting
>
> It seems like there is not Edit button for me to add my username to
> the attendee list.


Same for me...

