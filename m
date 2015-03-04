Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 44B3060144
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 15:20:37 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id v8so5911728qal.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 07:20:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GHwVisOYIqi5zFMyOLtCqUl9kfMMVqGapzP1eqTkkiM=;
	b=KjYhReFU67nvHv5o+YPDVYA1ZDEBTrQD/rnfip09sd+PcZx83AWyC3ZeTV1BZbBMeI
	Mj9H9xtUT8icaeZpUpyOwz+erujTXr7FqpKaS59XE9vsnEnP94PUBB98RGhav60cfhvz
	DpfTTf3BnoUkBYjc5J0+IPD4ItsvegaW+lQ+dmotRmBv/AhsbzUS9tRKlhONzuy1IX3Z
	9DQ9qYry5EEONJddzfF58FCv1mV+O0trKzCU9wwxzjfKFU+z7huNpyno3klIJN4ZuYxQ
	9v4LjgKYtEh9ujYnh2E5yTPfwiSGX/DHu7y+LAgh3KLoaYfqYt2dYdP5DLhjq6yaW7Ml
	MvwA==
X-Gm-Message-State: ALoCoQkGBFvYd7+paR8JXJIK3s6NGRgvv4uag+B8Tq75VjWW71iS8Epf6t49busiaJFTjOpCRvNU
X-Received: by 10.55.15.25 with SMTP id z25mr7833740qkg.87.1425482438708; Wed,
	04 Mar 2015 07:20:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 4 Mar 2015 07:20:18 -0800 (PST)
In-Reply-To: <1424108217.25541.4.camel@linuxfoundation.org>
References: <1424108217.25541.4.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Mar 2015 15:20:18 +0000
Message-ID: <CAJTo0LY0eJWv6y-7MOE_9ty5jg+zzex146eqf91L2ays60d1ng@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] Feature Freeze
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
X-List-Received-Date: Wed, 04 Mar 2015 15:20:40 -0000
Content-Type: text/plain; charset=UTF-8

On 16 February 2015 at 17:36, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I have to admit I've lost track of time a bit however the calender says
> Milestone 3 (M3) finishes this week and that marks "feature freeze" for
> the release. Beyond this point we have M4 which which is targeted for
> bug fixing only, no extra features and no package upgrades in general.
>

Judging by the number of package upgrades on the list in the last few days
not everyone saw this, so I'll repeat it just to make sure:

Milestone 3 is closed, so OpenEmbedded-Core is now Feature Frozen.  Version
upgrades are considered features.  So, no more version upgrades from now
unless you have an *awesome* reason.

I'll be occasionally collating the version upgrades that get sent into a
"later" branch for basic testing but obviously the focus from now until
release is stabilising, fixing, and releasing.  It's probably preferable to
sit on any upgrades you were doing until we thaw so they can be sent
against master instead of needing to be rebased.

Regards,
Ross

