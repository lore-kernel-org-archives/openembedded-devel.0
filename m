Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id B78C373169
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 17:23:30 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id qu10so3049928igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 10:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IXSYD/NaRmALDrshzXh1PWsNglJ7mErpHY46W5GWJVM=;
	b=F+wUP4VcnJ2nV/o2C6ttntANT4fsqMc4tCJhpazRglTF+lXLCCXQc0411TUOl+GAyi
	7wXAU+HZEJlay7Uz/CafDHeITs/hROXoD89jMBbmiko3owQ0ZscLtXQeswRbJnIkA0jM
	C5I/25kx0WZCQbORBHUtEhSV3H4nmca6e1rdrLF3KXSPrA+7EewHXz89Q1Z+P6gIYWvM
	YE6DQcDGLw+TleTvt3I81d3Eq0+VNqsL8HnJMt4AZzSUpvWl2uGphj2/lzDkSOa5igrD
	iMz8/Q3wLer8UDq4OUvQoRMrMT7DlHK7Bf+ojI1tVkCOwmg497DXvJljUNjChGqxo0FG
	+A+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IXSYD/NaRmALDrshzXh1PWsNglJ7mErpHY46W5GWJVM=;
	b=TN9j5MnRJ4oKLd4eunqMYStOpVIDF8d2sM2BPTp+MFvoKuh4fFdJPjrWarzFkEmPnU
	xtud3z5RsMgEQsAyYvPB86rmeVXsQPbZd4qS7nVTm9p4MTtU1q/nTki9lKOjsk3tXMz7
	IbhJS/FO5+iAa0Y6yu1hqw0g7zo42r7gVbAG274SL0m8bMY8NtTqlpVHbvL4swiZGJUJ
	5jeXwkP+2/S7KmOFnkAkH7+XcbgBeEf/C7aFGkB9bmB6LhHVyKJadsIY+1GxhPMtSksc
	67s6soD2yzB8+4SoDoER8HVcd16WELlTJC6/vxnS5CkEH+GR40mX4hdlyNAaj5Not8Fa
	SWww==
X-Gm-Message-State: AOPr4FU8caj0ZvyjondlcTWA2UGjUBDdx4169VLbDgvzErF3m18ICVRy3a9lCoNijaubPQ==
X-Received: by 10.50.155.69 with SMTP id vu5mr5778177igb.59.1461345811428;
	Fri, 22 Apr 2016 10:23:31 -0700 (PDT)
Received: from linux-yxv0 (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	v67sm4424918ioe.42.2016.04.22.10.23.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Apr 2016 10:23:30 -0700 (PDT)
Date: Fri, 22 Apr 2016 13:23:27 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, gary@mlbassoc.com,
	openembedded-devel@lists.openembedded.org
Message-ID: <20160422172327.GA32568@linux-yxv0>
References: <20160418183719.GA7939@vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <20160418183719.GA7939@vctlabs.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-browsser] chromium issues
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
X-List-Received-Date: Fri, 22 Apr 2016 17:23:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon 2016-04-18 @ 11:37:19 AM, S. Lockwood-Childs wrote:
> If you just plan on using chromium as a normal browser without such
> bells and whistles, don't worry about the keys and get rid of the
> warning by setting them as blank when you start up chromium
> 
> export GOOGLE_API_KEY=" "
> export GOOGLE_DEFAULT_CLIENT_ID=" "
> export GOOGLE_DEFAULT_CLIENT_SECRET=" "

Yes, that works. Or you could use the 'disable-api-keys-info-bar'
packageconfig option too.

