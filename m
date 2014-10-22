Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id B02CC65C91
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 20:29:01 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id z60so3273282qgd.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 13:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=wGnoJXngCkgI/lobWrQdsDruRy+flQFaO+ET82p98iw=;
	b=nH4mnvraAdbTNE9sMYbHVB9egV0IZODSYAFXDvmdRQTZuCz965LAFpg4osa82qHQOJ
	2jFiath1KmMRuhgKNBp264bA59Aefl9lviKimDoUjmDe0i3YWxmbB5TeyqS/gQrwHZJ9
	53qKiHllcUWiJjXY8S/BZ3J8CnZanozDgaHwsxd3gt5gzfIE9K/IV6mhE23sNmiVVTf0
	87TQfkpiSWCqkj4P6ZPibXx9XUXkOLjrcWjy1VgYRqUmDMQg3JP2ZfjL0OgzgBFzEhTQ
	j6OpZzb3E6LXhe1dP6mPf0nfGIVcWqqDpcIHmRNBKBl5bgTzxp3wg+K99btKWB2KSz+W
	L7Vw==
X-Gm-Message-State: ALoCoQlrUuz159d78oUIrQarQRoAHcHhBenGRNS4t3HKCiIKJ/Xvd5LxnSR+QTMOIqwMJduBbBWH
X-Received: by 10.224.79.79 with SMTP id o15mr541300qak.93.1414009742339; Wed,
	22 Oct 2014 13:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Wed, 22 Oct 2014 13:28:42 -0700 (PDT)
In-Reply-To: <CADz3at2pcrG1NgAJJNV2Tfk2JxhDYnNYwPxmf-Or45ZSB3qT3Q@mail.gmail.com>
References: <1413992945-33655-1-git-send-email-mike.holmes@linaro.org>
	<20141022162140.GJ2455@jama>
	<CADz3at2pcrG1NgAJJNV2Tfk2JxhDYnNYwPxmf-Or45ZSB3qT3Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Oct 2014 21:28:42 +0100
Message-ID: <CAJTo0LbZ9eo-Die1W5yU6M4YJWTjuXsg8ukKr-yR8s+adS_bVw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] add CUnit test suite
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
X-List-Received-Date: Wed, 22 Oct 2014 20:29:07 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2014 21:19, Mike Holmes <mike.holmes@linaro.org> wrote:

> I think the reason is because CUnit places its docs in /usr/doc/CUnit which
> is not the same as docdir (usr/share/doc)
>

In that case the recipe should fix the location.

Ross

