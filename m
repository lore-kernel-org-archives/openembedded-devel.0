Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KImNO-0007kN-50
	for openembedded-devel@openembedded.org; Tue, 15 Jul 2008 17:23:38 +0200
Received: by wf-out-1314.google.com with SMTP id 25so4553642wfc.6
	for <openembedded-devel@openembedded.org>;
	Tue, 15 Jul 2008 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:reply-to:to:cc
	:in-reply-to:references:content-type:date:message-id:mime-version
	:x-mailer:content-transfer-encoding;
	bh=QisLQrnzmxNAmIOFHAEbhyl7CPVt7bTS8qFsl3y1CVQ=;
	b=RZ0KuS/12px+OkWOHdCjLpliaUnmi9nJs6cfjuhneflWd0CNsddv1vjHy88qYhJg+p
	QCZoErx6AUTrBOCxNu8cymitbND7XDyyod3LJNYmrKeKjB3UznlAJi2En5f51dffqJqs
	1dJeV8y61MPXGh9zlKdDk5Uk5nPWkf4zTLyx4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:reply-to:to:cc:in-reply-to:references:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	b=e0KvL+uIAiLZk7ErR+viYz/+7mPLnqizPy+0cvcDorhhrQhGc4/kIVBHvS9CF2YuYl
	FbyiU1MuzrvJX1AMRGIxAgOB6qt50ersvTfDM3eJynrB8P/FAx6oR7b6QjWe6+x6Qo8r
	v9Y7GO3NoC+e/c3G2aG2CnVrsswgGyHQ8Bnl8=
Received: by 10.142.237.20 with SMTP id k20mr4720143wfh.146.1216135381546;
	Tue, 15 Jul 2008 08:23:01 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.10.255])
	by mx.google.com with ESMTPS id 30sm5895190wfd.1.2008.07.15.08.23.00
	(version=SSLv3 cipher=RC4-MD5); Tue, 15 Jul 2008 08:23:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <3972542e0807150806v67d607bbx5a43f147fa6f1c31@mail.gmail.com>
References: <3972542e0807141258i256cab38kb2023270a0aa14e9@mail.gmail.com>
	<1216087571.10214.10.camel@isis>
	<3972542e0807150806v67d607bbx5a43f147fa6f1c31@mail.gmail.com>
Date: Tue, 15 Jul 2008 08:22:59 -0700
Message-Id: <1216135379.22877.3.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 
Cc: openembedded-devel@openembedded.org
Subject: Re: Strange header file error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 15 Jul 2008 15:23:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-07-15 at 10:06 -0500, E Robertson wrote:

> > Its not clear from your email what you might be facing. You can
> > preprocess your source file with -E and see whats getting included
> >
> > what happens when you use  -D_GNU_SOURCE ?
> 
> I've always used -D_GNU_SOURCE to get around the problem but "why?" is
> the question I'm trying to answer.

These are Non Posix noticed (_NP) ? thats why you need _GNU_SOURCE which
tells compiler that you want this code.

> Clearly USE_GNU is defined so the only way I can try to determine
> problem is to dig deeper.

Can you formulate the problem once again

> I must point out however that if I use I define _GNU_SOURCE just
> before the pthread.h header file is included
> I get the same result (as oppose to -D_GNU_SOURCE in the cc path).

having this define on GCC commandline is correct thing to do.
> 
> I tried the -E option and it appears that all the necessary files are
> included. I don't see anything unusual.

Khem



