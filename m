Received: from mail-yw0-f193.google.com ([209.85.211.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OCyyu-0006mz-JH
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 19:47:30 +0200
Received: by ywh31 with SMTP id 31so1318810ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 10:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=JBzgeEvFXKwsQK/DUHuUWCXgSjY7EakyhQgmRsBpcOU=;
	b=W60bpA5P7X3LHAFBZfd4u2RKchuW2mXMNuBJIyQeQ01TvDlxAqA1oJo3xOI+xamMIr
	ezZEEKMfIlccqBY597pifgrAZlStJUIHiniSg1DL7xJ41BK4pZuH1TlvRrA1xhb6zhJP
	wV3gWkSpjwiHVwgeT6QQHn3DsT4XkAKQN8ISw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sj2ihBbA6nuVj8yK735YiDQCZNA8iwwIl1gbolFVkOPS6uPT8Vd1mOvMG8CvVOvR7i
	W77LRHB7Q+1PJCLOLZlVrZJsXB9dRVHuj6GI8J+VPEqZphf4GM9zUqtmh0W9A9C5UQd7
	crHqTrlXJQyRsGtCHwR+KmlZzj6fNdly0JoCs=
MIME-Version: 1.0
Received: by 10.101.4.26 with SMTP id g26mr1709558ani.157.1273859011625; Fri, 
	14 May 2010 10:43:31 -0700 (PDT)
Received: by 10.100.108.2 with HTTP; Fri, 14 May 2010 10:43:31 -0700 (PDT)
In-Reply-To: <t2ld1b08f941005080507ue8b8d7e1jfe61e941de10db29@mail.gmail.com>
References: <t2ld1b08f941005080507ue8b8d7e1jfe61e941de10db29@mail.gmail.com>
Date: Fri, 14 May 2010 19:43:31 +0200
Message-ID: <AANLkTilgh99CZ7IsYLxpr1GMnbbAqAtavQHYd5e8l1Ts@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.193
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [bitbake] tasks repeated
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
X-List-Received-Date: Fri, 14 May 2010 17:47:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, May 8, 2010 at 2:07 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> I'm using bitbake 1.10.0 I've noticed some tasks appears twice in /tmp
> of each package:
>
> run.base_do_fetch
> run.do_fetch
>
> run.read_subpackage_metadata
> run.staging_helper
>
>
> I don't think this is normal...
>
> Regards
>
> Andrea
>

Anybody can confirm?


