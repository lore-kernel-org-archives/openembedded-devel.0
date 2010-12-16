Received: from mail-bw0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PT9le-0004gy-LK
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 10:04:55 +0100
Received: by bwz12 with SMTP id 12so3272358bwz.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 01:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=3sERuE69pdLIlEbJz35hTr+vEA3YmoAfvRqzYlSQksg=;
	b=FU1ltnC/YQyzVFCevaxeOwlgKK6DbGxZlxOMrgawVtcSqdqgYFFGBl58hHgUtIvtKE
	Ba1oPZheNzDtIlVg2tAL8qDolRajjtvPOsI3TV8+w5soJfHDegF+D4YwUqehXMnz5rSQ
	Q1B4cvSZODhleIdPRD9A8CzyOeRURlhpv38yM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TF2YNsZ7YaMKU+WFOoO8lfedAivVG2oVQy9qa1XXSoslM0C7UGaYjVdR1Vomnb3MPa
	VxUHgo5mVZBcZTb9Cj7N+UqzOcq5zVtoaiZBqBSMk0rkvhjR6FsW4ZxFQP1QzbZB+fGr
	kOJzOnchtCMr4cj+/i3Ms4TkMJZB/lCO4Y7LM=
Received: by 10.204.8.24 with SMTP id f24mr7957076bkf.206.1292490198024;
	Thu, 16 Dec 2010 01:03:18 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l3sm1735378fan.2.2010.12.16.01.03.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 01:03:16 -0800 (PST)
Date: Thu, 16 Dec 2010 10:03:22 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101216090322.GA19482@jama>
References: <E1PSZng-0001y3-K3@melo.openembedded.org>
	<20101214205943.GF6662@jama> <4D07DF4B.7000800@balister.org>
	<20101214215011.GG6662@jama> <4D095CA5.5020400@balister.org>
	<AANLkTikKhNKT4kB4BC5Tog8bJvtzTyto9s7hRoPNW_TE@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikKhNKT4kB4BC5Tog8bJvtzTyto9s7hRoPNW_TE@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.44
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Steve Sakoman : coreutils: experimental coreutils fix
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
X-List-Received-Date: Thu, 16 Dec 2010 09:04:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 16, 2010 at 09:58:37AM +0100, Frans Meulenbroeks wrote:
> 2010/12/16 Philip Balister <philip@balister.org>:
> > On 12/14/2010 04:50 PM, Martin Jansa wrote:
> >>
> >> Then please remove all older coreutils versions which doesn't provide
> >> complete set of bindir_progs, base_bindir_progs, sbindir_progs, because
> >> ie coreutils-6.0 now breaks ie timeout:
> >
> > So it looks like we can remove the coreutils-7.2 directory since there is no
> > recipe for it. Does anyone object to removing coreutils-6.0?
> >
> > Philip
> 
> You have my ack to remove both.
> Frans

My too
(I've built coreutils-6.0 only to show example why that test was needed)

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


