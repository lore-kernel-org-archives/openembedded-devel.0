Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6298B745A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 14:30:03 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id x23-v6so17458333qtr.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 07:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=XD3LoIh8yLcWJZj8BaQrlkJWqcouprPbOsmj8Aq9tNA=;
	b=Lhmn1o9xDm952VSkljVvxrPjT+iyI/yhjQNH6RFZSJrmD1gTgjLrIVtpdCfFUwKXEm
	c+brQNDRx/1hV0fcTkQ6mlXRVsvINPLUnGrNDk3xP8UDM8jPHWM7EFsS7ph0vwj4ItoI
	/Po0jWb6k6F8xDzbS9GPpvSorb2XQ3qKIbSFta/CcF21WDOeBGsnHfkF6kNPHeMIND7Q
	b1mFHBuATg3kkikPTEJtxWsTiBiI3OEvwS+qNi//58Qc2fl3tgis95QmAt5Hq2mxqLEO
	3pYkwKFT8RhbGoSXFHi9BUsHG5O6aLCGegJhnQ2yFSZ8UQg6x4EQMOcRoklH7N2OLrK0
	vykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=XD3LoIh8yLcWJZj8BaQrlkJWqcouprPbOsmj8Aq9tNA=;
	b=jskxcCUBvOu9cyhrcVPp23j0yJPv3ys8kWRttwgM7FYHCXceEDhtexD3r5ySXaP1yB
	JH+AesinZz8S/iaPFTBx9uN8giN/ElZ6eCl5XJQiaefvWM7/sMvDSUVOFPrEi9ORWwnT
	Uw9TV0X2XSqtx78o/ISFj4gnJdNAHVRxlbmcrwhy1xNwpwb08ZMQBVWJtYbqq3h5hMp+
	U+Qt5ne8P8fembRBH5Q1MAKi2uLClsCDC/2u63nJz7Kf/ehrec99uUDryEdwGvFTwiPW
	tfy4RGDTyiTqzl7yG1NzTQruoKt1bkrjDAxfDIfsSKTYGVhQ1Fpi7VRxDOw6phIyjCYW
	ZOgg==
X-Gm-Message-State: ABuFfohR3sqa25cUQOse/VhMN6Irg1tVJoxvJfiLh8N5zO0SK+aWWcqm
	EevfiJZxWBLLI6wVRVHmeVTcq0CSezggmrfK76DFOg==
X-Google-Smtp-Source: ACcGV63iBRhmkegSZXylyZz4kOgdy/U5MqsdR7gDIrvxqYAQs/11X8mXE/NYZSEv5IJmWdnDj8Vr3e33ySkFJ/RvWls=
X-Received: by 2002:a05:6214:1108:: with SMTP id
	e8mr4523660qvs.194.1537972203641; 
	Wed, 26 Sep 2018 07:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20180926132115.10455-1-max+openembedded@blarg.de>
	<CAMKF1soJtjx9nww37op-WSi3dhC8=zPD1tG2hBLUQZ7YiQHYTA@mail.gmail.com>
	<20180926142844.wcbqlarv5lw6wlwd@swift.blarg.de>
In-Reply-To: <20180926142844.wcbqlarv5lw6wlwd@swift.blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Sep 2018 07:29:52 -0700
Message-ID: <CAMKF1sq20aDnGhx7XNf7UZWwvqPx_A0NL-e8yGaoEgK5Nbs3qQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/7] mpd: sort PACKAGECONFIGs again
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
X-List-Received-Date: Wed, 26 Sep 2018 14:30:03 -0000
Content-Type: text/plain; charset="UTF-8"

Ok then I will take a look

On Wed, Sep 26, 2018 at 7:28 AM Max Kellermann <max@blarg.de> wrote:

> On 2018/09/26 16:24, Khem Raj <raj.khem@gmail.com> wrote:
> > Please reabse this on top of current master, some of these patches are
> > already in
>
> I know, thanks for merging - but this new patch set is already based
> on current master (i.e. 23d794b58661).
>
>

