Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0pkV-00020h-M7
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 08:39:27 +0100
Received: by pbbrp12 with SMTP id rp12so363608pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 23:31:04 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.208.136 as permitted sender) client-ip=10.68.208.136; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.208.136 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.208.136])
	by 10.68.208.136 with SMTP id me8mr4108498pbc.55.1330068664743
	(num_hops = 1); Thu, 23 Feb 2012 23:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=PumzQz9XdFH+CNbYj1MS4ACBJIZd7CY38xYdS73YqS4=;
	b=VYzuSRFbVrMWd6Vpl61agSqdwBh7pdBBe5Er1UgScRqoscu2MPyN50M9x3Iufom16c
	r1gd1eG4XL7FKdytClVV6y3CrY4vg+8DbaX9+VIVXBwZUz8NGWJUUjJa+a4wQ9Z1IRhu
	qc9Crz6NUC+UGWl6tDU7O8Qsyx8nD3eDSm4RE=
Received: by 10.68.208.136 with SMTP id me8mr3396839pbc.55.1330068664592;
	Thu, 23 Feb 2012 23:31:04 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id p8sm3649633pbs.51.2012.02.23.23.31.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 23:31:03 -0800 (PST)
Date: Thu, 23 Feb 2012 23:31:53 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120224073153.GB2479@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1329828457-23375-1-git-send-email-noor_ahsan@mentor.com>
	<CAMKF1sof5d-kmGrbEBqdheawFULL3YkEgpoRXv7+UFKYwxFOjQ@mail.gmail.com>
	<365E1805BC95084CBE82381A0B869994050F1CF4@EU-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <365E1805BC95084CBE82381A0B869994050F1CF4@EU-MBX-03.mgc.mentorg.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe][PATCH] libedit: Adds version 20110802 (initial recipe)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 07:39:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/02/12 07:15), Ahsan, Noor wrote:
> Does this block my recipe to be accepted in meta-oe and by your comment below you are suggesting me to upstream that patch to libedit project?
> 

Well I am ok since it has something in there may be just change it to
'Pending' so that if someone later wants to upstream this patch he gets
a right message and it does not hurt to get patches run via upstream in
any case.

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Wednesday, February 22, 2012 2:12 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] libedit: Adds version 20110802 (initial recipe)
> 
> On Tue, Feb 21, 2012 at 4:47 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> >
> > +Upstream-Status: Inappropriate [not author]
> 
> hmm thats interesting. We can still push patches upstream with proper
> attribution to author.
> therefore this may not be a reason to make it Inappropriate.
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


