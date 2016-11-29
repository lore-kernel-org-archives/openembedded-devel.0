Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id CCE8F70178
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 20:43:28 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id a10so144945908ywa.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 12:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lH+tzjy3k3aBgDWL9yiH3ZQOjoHp5e339VBNIZzg0HY=;
	b=sKh79Rnhd7Q99C1bpBin511Ec3kTKxS4H/3HGciCp9wKViYQkH9eODe1Qi/EkS1zPJ
	yi7GAOvVt6APHlAn+BqOujErC2dyhnXqZ/acTBPEdjbt5CNRjpOyBi4fN6SKX3iTXGyP
	jmfrkBAcmA1BNK9pMtQfM6B3NBPRops1fQx88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lH+tzjy3k3aBgDWL9yiH3ZQOjoHp5e339VBNIZzg0HY=;
	b=d1sVBisKvRhoZ9Aj6YY99ktJ+YX/Eo8m1uiWwYIlIJQWOd5458UfCAPihqXSi6h6yc
	rIkHa7DWESgT4q7OlZVcPcBXcPzaHL42KVncxdG/gBt5Cf8Jn3ZxZiPlMo6J/o4efcTK
	zDXNiqRwZfPh8FE1lVc9mnzPBMXAySVc6bw6dQcRt8FsfQ8Tmj27J06XPh1Eii/CIYgZ
	KtrYYTiY19uy72lrAWhAbuHfPQ2TfasKQuLDoOV4sO7txma7Ye/6DEq3RdZzx7HVqiJX
	RdKJQKJ7/eDv4CPe7UWePHrVI11SWoCyRoPDR+pTyra4ahcBb/q2/1WUa6FB+nXhzeSp
	Pd5Q==
X-Gm-Message-State: AKaTC020Dmds86IcCsMjRSRcLTOwh305NMyEtr2aMyme2nKEZMB6adQYjXzC0BT4ho4NcQ==
X-Received: by 10.13.200.3 with SMTP id k3mr38627155ywd.173.1480452209790;
	Tue, 29 Nov 2016 12:43:29 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	m136sm22223152ywd.19.2016.11.29.12.43.29
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 29 Nov 2016 12:43:29 -0800 (PST)
Date: Tue, 29 Nov 2016 15:43:27 -0500
From: Tom Rini <trini@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161129204327.GG2546@bill-the-cat>
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patrick Ohly <patrick.ohly@intel.com>,
	Michael Halstead <michael@yoctoproject.org>,
	Jose Lamego <jose.a.lamego@intel.com>
Subject: Re: meta-openembedded patchwork git hook
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
X-List-Received-Date: Tue, 29 Nov 2016 20:43:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 30, 2016 at 06:52:46AM +1300, Paul Eggleton wrote:

> Hi folks,
> 
> Martin just brought to my attention that the git hook for the 
> meta-openembedded repository that's supposed to update patchwork still isn't 
> working and hasn't done so for a very long time. I thought we'd fixed this so 
> that merged patches get marked as "Accepted", but at least for meta-
> openembedded it seems like that's not the case.
> 
> Jose / Michael - can you look into this if you haven't already? Please let me 
> know if you need any help.

Since I brought this up on IRC, I wanted to chime in here.  First, if
you want to use top-of-tree patchwork you'll also want to grab
https://patchwork.ozlabs.org/bundle/stephenfin/post-receive%20fixes/
(and fwiw, I also have been setting the DJANGO part to 'dev' rather than
production for my use-case).  Second, I think part of the problem is
that there are just some cases where the hashing fails, which for me is
around 10% of the time.  Depending on how much one uses bundles and
tracks what ends up being committed this may or may not be a problem.
And I'm sure upstream patchwork would appreciate any changes to improve
hashing success :)

-- 
Tom

