Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id D79B173D27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 12:26:31 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so24888130wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 05:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ILKWC7amuLfbhOl3kHwqNJxwiE+v/EuuAcpH0Fmu2l8=;
	b=CTou+MvNKcs2VviiUZ0+lFZJ1WIt95+wnesJx2UowI1ZbHfTYmTOYDK+eDMY9hOJ8N
	+uH8QwV7I5Mup1eZb7NTukWePLshIgoeNptGkCH37p+xKTrh9v9uxX4EYJWussstNGB7
	1CfUVkMWsPJNtBKg4/PEj2dECFQFubD8RnaAc+/66nZnDDOfiOT1DfT4dRS3iDep1hGS
	z7VYkkKwuAjBqHEVN9lPPc6cP9l9yP5xvmmB3aHYXJLgh1ObWmW7y1mZP4Fpbzofx9Mw
	S26bWBUDix2Spi53VvGTkL0NI+YlKWMiT6yKuB5YW3L7GYs+5a8QVOaGmh0NJx/q2KYF
	YzoA==
X-Gm-Message-State: ALoCoQm/BxtwT0g+JnYTVeybpoHZJyOVyNSc7Fg66gCNOlQgrckYlwpp7Gi7hoBVtzC4BV9y0jHG
X-Received: by 10.180.75.176 with SMTP id d16mr6977398wiw.75.1442319990690;
	Tue, 15 Sep 2015 05:26:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Tue, 15 Sep 2015 05:26:01 -0700 (PDT)
In-Reply-To: <CAJTo0LZVtrC-93qCesHSpet689+3vQN=Wc0+N46_H8g4qkFb7A@mail.gmail.com>
References: <55F7EF3A.7020403@topic.nl>
	<CAJTo0LZQhC+QjAcNxxUuQpUkfWgXc-rVDohQe-sb8Ch1d57R2g@mail.gmail.com>
	<CAJTo0LZVtrC-93qCesHSpet689+3vQN=Wc0+N46_H8g4qkFb7A@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 15 Sep 2015 15:26:01 +0300
Message-ID: <CAHiDW_H0Nu_T_PVzE+9q0OaD6s+MRFTvRHNJw4ZNaXPD9kVfwA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: gnome-icon-theme?
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
X-List-Received-Date: Tue, 15 Sep 2015 12:26:34 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2015 at 14:14, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 15 September 2015 at 12:13, Burton, Ross <ross.burton@intel.com> wrote:
>
> > Yeah this was just removed from oe-core but the addition to meta-oe
hasn't
> > happened.  I can send a patch now if there isn't one on the list.
> >
>
> Hm, alternatively,  we make adwaita-icon-theme provide gnome-icon-theme,
as
> they're broadly compatible anyway.  Any thoughts?

gnome-icon-theme has effectively been abandonware since adwaita become the
actual gnome icon theme so I'd suggest not adding it if adwaita works as
alternative (which I believe it does).

I've been pushing off building an image with the remaining gnome-icon-theme
users (using adwaita) to check that things seem to work. I'll do that now
and send changes to those recipes if they're fine.

I guess we could still make adwaita-icon-theme provide gnome-icon-theme but
is there a meaningful benefit after I fix meta-oe recipes?

