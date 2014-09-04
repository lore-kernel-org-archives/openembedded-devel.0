Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA5271401
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 17:29:44 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id la4so11164657vcb.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 10:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=nnEdaTS5ixpY7Nczt2gAjzLBtZUij7TRQBD3UHZE0Sk=;
	b=UcLHhwGABPDQC2eUEyzsPgrxY/I9vEpWtcRRtNtomcbvhdAnalNhXGpTIDGNu94daV
	QO3p9ekE4IChEaYABarhLUWeyAD0szu3jB/OMjPk4ZXvJNHNXxZLwg54MFnGzvw77sIf
	QuHLmx5VoM0az94ArtGirNKcNZZeLBE0m+fN940x4eKLByyhuE+h4OEPNG+iqFjYIUjY
	GgtUylyQ74UTeDj/uET8titTVWq+ZwHAuY6fw/1u+waa2elbE5egTylYKz8aFXQo/D7v
	Gc6+cj3C5O9XV2mklW2CDtGxZdw2nFZtcMu7NKx+8llgKwLFGjK1CgKclcO55HdtsFHH
	NLyw==
MIME-Version: 1.0
X-Received: by 10.53.2.10 with SMTP id bk10mr2707499vdd.48.1409851785678; Thu,
	04 Sep 2014 10:29:45 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Thu, 4 Sep 2014 10:29:45 -0700 (PDT)
In-Reply-To: <CAJTo0LYhvZHJEEQLWuCsfxqqbBCSXnxR3cxJZJt2Z0fgYgwEww@mail.gmail.com>
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>
	<CAJTo0LYhvZHJEEQLWuCsfxqqbBCSXnxR3cxJZJt2Z0fgYgwEww@mail.gmail.com>
Date: Thu, 4 Sep 2014 19:29:45 +0200
Message-ID: <CALbNGRRVvT7Qv868RNWbo8_DjLwkbUjOH_cCNMjPNifFEcHu3g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 17:29:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 4, 2014 at 6:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 4 September 2014 15:12, Burton, Ross <ross.burton@intel.com> wrote:
>> Quick question of style for the community to bikeshed on:  in the
>> general case should recipes be split into foo_1.2.bb and foo.inc, or
>> should they only split to bb/inc if there are multiple versions and
>> generally there should just be foo_1.2.bb.
>
> Another argument against widespread inc files: they encourage the
> impression that maintaining multiple versions is just a matter of
> having a .inc file.  The moment you start having to put
> version-specific statements into a .bb you've entered a world of pain
> in keeping the .bb files in sync, moving options into the .inc as they
> become used by all versions, and purging old version-specific
> statements.
>
> Ross
> --
I agree with Ross: It often took me time to find out where
functionality comes from. Inc-files do only make sense for multiple
versions of recipes or if different recipes share same code (only
example I can remember is meta-gnome gvfs/gvfs-gdu-volume-monitor
circular-dependency hack).

My feeling is that the inc-files are still from classic oe times where
we had multiple versions for many recipes and most can be merged into
recipes without loosing something.

Andreas

