Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id D6B1E65C78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 09:01:39 +0000 (UTC)
Received: by qgg60 with SMTP id 60so6293978qgg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 02:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=YEPuG52oscqbPQBIV/YQUM0YmCK17s3j+nsJAUk6QFE=;
	b=jFjrJi8NmF8PPwj+VmC7kM59KJ4/XKkHmONl+ASeaJOUMVUFRRRM0+EPCYi4g1IGoO
	3Vq56cx2/3AzL7LhxjzY6PgJ+4XkrtzlY/yVojL8iMW+8U5Jjnx3pO0WbQCWctcJURh0
	bkQYYm19kL3i1DpelyQ5/FGLN9uLNKhnsUipE5p76mEootqIK03P1o3J5MLjuEktDa/U
	vv/Nvh5J3qgm7O6UGIWKqDxbcUat3IdKI2Vplkm5HPbR225pMqT509kM7zPhaCCSsX5v
	jkzq8uqq1pVakQTXTFBUfxEImvVchHbQbeZsvbmaBT8I5YmhIOy3ZyP4PN7v3ApOW9IA
	Yg5w==
X-Gm-Message-State: ALoCoQljxQlqDgSZhHFJ8bl3xNOrXYfHNP6BiPNlGqiGnhM2C02FJISLOpBZzv8b3tZApO6KBL9/
X-Received: by 10.55.43.130 with SMTP id r2mr53660852qkr.14.1432630898793;
	Tue, 26 May 2015 02:01:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 26 May 2015 02:01:18 -0700 (PDT)
In-Reply-To: <55635034.9010702@gmail.com>
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20150521110638.GB2377@jama> <555F5517.5000100@gmail.com>
	<CAJTo0LahDus8tjxEvwZUtyjBjtLO6tsYokx=iMH=WegL9ix46g@mail.gmail.com>
	<55635034.9010702@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 May 2015 10:01:18 +0100
Message-ID: <CAJTo0LYMFNo4dcEN6p5LEuF+xZEmRUqWxOOLr0BqHvf2-Y2KBQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 0/4] Add GStreamer 0.10 and things that depend on it from oe-core
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
X-List-Received-Date: Tue, 26 May 2015 09:01:41 -0000
Content-Type: text/plain; charset=UTF-8

On 25 May 2015 at 17:39, akuster808 <akuster808@gmail.com> wrote:

> would creating a virtual/gstreamer help?
>

No, because GStreamer 0.10 and 1.x have different API/ABIs.  They are
parallel installable though.

Ross

