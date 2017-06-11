Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7149D781F2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 19:05:25 +0000 (UTC)
Received: by mail-yb0-f181.google.com with SMTP id 202so23332288ybd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8ZoZOP90ATu2RW8n0qxVFpCwFHxUu3zFK5HoW39U3ts=;
	b=PlkH3L5a4HjnDWxu5RC8765tCIlhyntiMytiyaIpGCOJuf5MzjXoYGLrzWwvJ6u0Zo
	hLFiXytS7+bPlNfvTUhmoLenUsNlo7NQo9fp04mYKKc7dp3O2y4xNbahz0FLmf88RSVw
	kM/K26yRy9UVmuJFtZ2GrPU4YdLGEVOKKkYxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8ZoZOP90ATu2RW8n0qxVFpCwFHxUu3zFK5HoW39U3ts=;
	b=hSE8KbiMXJyYppsGY430zDKuXyKdJcaA/5dhFJ7TD80t3n9rB30CJiGRXKOMdDBxdl
	FfiBFz7e9KHWkmlcCCORChl2+9ykckAo8c5+yVxhMi1XKpjo0f1dQTqNIrDDifcK9FTU
	gLPubxoKjgcLe6p9N+PfVtvVB01TCwxKbfq0njX0tnGZhE5LXRhqI0AWVeq39UiP1BwM
	GBoJegi004NVRDkapmXh/VVlF20LfmQN48NS0ZzjPXb0ZVDcbES2rKSLTPe9Eb1Bgxq4
	aZKzS4fNtzzmq1L9ERPdxFDVhBpNiIBlUf0ide9q8FHzEkvzlgxZ27Nmlqf5wCh33+8S
	Kl/A==
X-Gm-Message-State: AODbwcAkIbKjbfwD3cYMsTMrIk77qSkYlNoGqkKA3yXnUHrMU9ozJUo2
	8u4R08zZ6h+LIOQ4
X-Received: by 10.37.206.198 with SMTP id x189mr21273131ybe.46.1497207927240; 
	Sun, 11 Jun 2017 12:05:27 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	y195sm1839925ywg.65.2017.06.11.12.05.26
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 12:05:26 -0700 (PDT)
Date: Sun, 11 Jun 2017 15:05:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170611190546.GV10782@bill-the-cat>
References: <1497193576-3774-1-git-send-email-trini@konsulko.com>
	<1497193576-3774-2-git-send-email-trini@konsulko.com>
	<CAMKF1soYoKjRue_y6w=yjZRP5ByOkLcrtZ=RwBTfopammubT1w@mail.gmail.com>
	<20170611165939.GT10782@bill-the-cat>
	<CAMKF1sqCTT0qV0naEXPn=U+GRxaOR=oQb8euPruXOAr89FDxXA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqCTT0qV0naEXPn=U+GRxaOR=oQb8euPruXOAr89FDxXA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] debsums: New recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 19:05:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 11, 2017 at 10:20:38AM -0700, Khem Raj wrote:
> On Sun, Jun 11, 2017 at 9:59 AM, Tom Rini <trini@konsulko.com> wrote:
> >> order of directives seems a bit displaced, may be running
> >> meta-openembedded/contrib/oe-stylize.py
> >> will be good.
> >
> > I'm not sure about that, I copied the order here from prelink_git.bb in
> > oe-core.  Unless you're referring to something outside of the -cron
> > part?  Thanks!
> 
> prelink_git.bb might not be a perfect template for new recipes too. Since
> this patch is adding a new recipe, I think its probably good to have known
> structure for it. I am thinking PACKAGES and FILES variables should be
> after do_install

But with the rest up to still?

-- 
Tom

