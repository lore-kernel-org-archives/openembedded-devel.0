Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 234366011C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 12:29:53 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id d59so38602021ybi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 04:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=g1aJZPsuigB8jmpokYZ8QSW64h2Y34LuwQt9tYaISlc=;
	b=VDQEJQDVi5QhLgJFk27Oj3hRHiN9u8lVeCvL2Db6Nv/jhG5bUa2/4qWtvV01vqWrVs
	fxRFr5MfOXlXvV9PzlPreP3qHQ4kpOgAflibQcqluj0vTAWSajKgdgaof/9Da9oeGfhb
	ndYeRwvcanqQ+hfCVUlRvP01R/RXMmK3I7juY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=g1aJZPsuigB8jmpokYZ8QSW64h2Y34LuwQt9tYaISlc=;
	b=WT8BoTkLGzEFnpbaU3x2GMzUDfi3qfR62ZQTcj3izWY2hOS57wYFr6LGKQ4dmDdVTX
	HYI+GSbwZwTJRYsLZ5qbvCpesJuRYx6SHyeQibf1yhyoesw1KPyJtnYupL6+1ZnT2xZM
	dLu5/HjdOD9FH8PfU+3ecyzxkHJbaT8VKTPMBupuSGm72WW7u7pflDRCkZSBlzF1+9E2
	XpGoeumpPd4icX11+wYYKPXecVgXqr1qZW/pTF0TybGXf0L2oIK4+VhRnQsfTUzLv4SN
	8TkXaJBCRXz7yfBC01N8DB+nhdfvwXv3ov6ADPmST2UTYB19wtxzIqa7mcpJ28aR1ho+
	JlXA==
X-Gm-Message-State: AKaTC02WZ3KkCzW/rKJ8gyF3lD01y6x4F8AhkCEu3LXrCumB4N1xzWz4ZuUh/InRXx4HGQ==
X-Received: by 10.37.248.14 with SMTP id u14mr18041070ybd.98.1480681794986;
	Fri, 02 Dec 2016 04:29:54 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id d5sm1802718ywf.20.2016.12.02.04.29.54
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 02 Dec 2016 04:29:54 -0800 (PST)
Date: Fri, 2 Dec 2016 07:29:23 -0500
From: Tom Rini <trini@konsulko.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20161202122923.GI2546@bill-the-cat>
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
	<20161129204327.GG2546@bill-the-cat>
	<d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
	<19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
	<53ca2ead-1b75-ff6d-30c1-abb16330bad3@linux.intel.com>
	<20161202083009.GB3721@jama>
MIME-Version: 1.0
In-Reply-To: <20161202083009.GB3721@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-devel@lists.openembedded.org,
	Michael Halstead <michael@yoctoproject.org>
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
X-List-Received-Date: Fri, 02 Dec 2016 12:29:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 02, 2016 at 09:30:09AM +0100, Martin Jansa wrote:
> On Wed, Nov 30, 2016 at 12:41:20PM -0600, Jose Lamego wrote:
> > 
> > 
> > On 11/29/2016 07:50 PM, Khem Raj wrote:
> > > 
> > >> On Nov 29, 2016, at 2:34 PM, Jose Lamego <jose.a.lamego@linux.intel.com> wrote:
> > >>
> > >>
> > >>
> > >> On 11/29/2016 02:43 PM, Tom Rini wrote:
> > >>> On Wed, Nov 30, 2016 at 06:52:46AM +1300, Paul Eggleton wrote:
> > >>>
> > >>>> Hi folks,
> > >>>>
> > >>>> Martin just brought to my attention that the git hook for the 
> > >>>> meta-openembedded repository that's supposed to update patchwork still isn't 
> > >>>> working and hasn't done so for a very long time. I thought we'd fixed this so 
> > >>>> that merged patches get marked as "Accepted", but at least for meta-
> > >>>> openembedded it seems like that's not the case.
> > >>>>
> > >>>> Jose / Michael - can you look into this if you haven't already? Please let me 
> > >>>> know if you need any help.
> > >>
> > >> The git hook was configured to update OE-core only, Michael will help us
> > >> to include meta-openembedded.
> > >>
> > > 
> > > There are more repos using patchwork beyond OE-core and meta-opemebedded
> > > please enable it for all of them  as well.
> > > 
> > 
> > Now all of the projects are enabled to receive automatic updates from
> > the git-hook (Thanks Michael). Please let me know if any undesired
> > behavior is detected.
> 
> Still doesn't mark anything as accepted:
> 
> OE @ ~/meta-openembedded $ git push origin master
> Counting objects: 293, done.
> Delta compression using up to 8 threads.
> Compressing objects: 100% (257/257), done.
> Writing objects: 100% (293/293), 48.83 KiB | 0 bytes/s, done.
> Total 293 (delta 179), reused 68 (delta 18)
> remote: E: failed to find patch for rev efd3696e70a6603f1a45faa4a172433514f0a487.
> remote: E: failed to find patch for rev 8c720146b718aae3bc194621f3e095cf11ecb2ed.
> remote: E: failed to find patch for rev fc2fc9097b2fa437d4af0338e418692b4dd6c989.
> remote: E: failed to find patch for rev 533826b7652a2cf86ca7b665c25b98c89afc266e.
> remote: E: failed to find patch for rev 6afb85d29286aaa4cdd892460f6adf68912917a5.
> remote: E: failed to find patch for rev a7f3ec87f957ff35b8a853cd0e04c6b18bac0ece.
> remote: E: failed to find patch for rev 877e52fd75c7d3b88add94691df3beb5e0c54529.
> remote: E: failed to find patch for rev 2f6e45baba961629bfe023599144be6cfcd45728.
> remote: E: failed to find patch for rev 86fed80d80bc33f0a3cdbf719c00ee5f05ed4d19.
> remote: E: failed to find patch for rev 41d7bac5d50091cab835eac0a5eaa6c431fb2023.
> remote: E: failed to find patch for rev a85e12928131fce057f777daa76a7f0c75cffa14.
> remote: E: failed to find patch for rev 45837e6c567b1b9ff9d152a7e2a752488d313455.
> remote: E: failed to find patch for rev 119e75e48dbf0539b4e440417901458ffff79b38.
> remote: E: failed to find patch for rev a4251575f41fa5aafe5072e562497b05c11b6702.
> remote: E: failed to find patch for rev b6ea2c0bacb21b83bae3605ef4da080de0cad15e.
> remote: E: failed to find patch for rev 4580e5ae201b320ed407eae26f58655b8768b387.
> remote: E: failed to find patch for rev c476219e845934f767927e81fe60dbaa157df9ee.
> remote: E: failed to find patch for rev 0288b204f3c12af1561218fa0cfcdfb9a5508b47.
> remote: E: failed to find patch for rev 5596b52d64c30d8e66ec6e379cf69a9fc9407fb1.
> remote: E: failed to find patch for rev 24e51a6a106bc10a8838b23e4bf9ea6304314bca.
> remote: E: failed to find patch for rev aac6bf8bf911c3f14ff9dce08f0f011838f5a426.
> remote: I: 0 patch(es) updated to state Accepted.
> remote: Sending notification emails to: openembedded-commits@lists.openembedded.org.
> To git.openembedded.org:meta-openembedded
>    761639b..aac6bf8  master -> master

I don't know how far apart the freedesktop.org one is from ozlabs but
when I was seeing that problem locally as part of what I was working on
it was because of some missing host deps (that are now not required).
FWIW you can pretty easily turn the hook into a script to run manually
and sh -x it to see _why_ it's not hashing out those patches.

-- 
Tom

