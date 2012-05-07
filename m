Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty@dasty.net>) id 1SRNI4-0001tb-8Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 14:43:48 +0200
Received: by eaae1 with SMTP id e1so1196949eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 05:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dasty.net; s=gmail;
	h=sender:subject:from:to:in-reply-to:references:content-type:date
	:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=vYA2vG40yLgLZrYYAFC875ljNGapjDIp7Jjs6NA0Uqk=;
	b=L1p9DhQ//KvapDLTIkKbW2gdPDB3RPdFwWn4BZIsaa7lvR/oIK+Eo25A12RLY89hVD
	ujL5gNEVpyDiDxxBysIhN46lPakHszD8R9P/XCImYaNhgXL/s66VmQgC1N8Np7NG/ULV
	5KxlGgUIzXru4KhIXVZRz65nDOEtZjukev8sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:subject:from:to:in-reply-to:references:content-type:date
	:message-id:mime-version:x-mailer:content-transfer-encoding
	:x-gm-message-state;
	bh=vYA2vG40yLgLZrYYAFC875ljNGapjDIp7Jjs6NA0Uqk=;
	b=J4PhHsfYCT1fddTTHC0MLCqQO1bvq5kfZPjtmuvRM4ShIgxBHvzuYhzDeFsEaJ7Gzs
	qe1RIiJJDgPw9Svn2l0qvQ+G6DHuTGeLwgh2uBV48jZmqFwWTYNLYIA0oDC8N320FxgZ
	AN/GlrlpP2pVA1D26OX/5XUA68L9TUQtkgfGovAYXoAK7cZMPIep3R2wZL6g3VUUu7yh
	uTvERkvgQeFvpbbbsxxXQjLFnx5WW3XWeN55OTBQBqVb03x5dy0zMAfRtOw2VN8XNIcz
	w4eIU/dFk3Lp4FhM0Slj1XABv2pMFoE6YiBPaxON5NgrJXwtnCO5TtPJma5BK69YlUay
	qG4g==
Received: by 10.14.29.76 with SMTP id h52mr700198eea.96.1336394037851;
	Mon, 07 May 2012 05:33:57 -0700 (PDT)
Received: from [192.168.1.111] ([81.89.61.168])
	by mx.google.com with ESMTPS id n52sm78650060eef.6.2012.05.07.05.33.56
	(version=SSLv3 cipher=OTHER); Mon, 07 May 2012 05:33:57 -0700 (PDT)
Sender: Radek Dostal <dasty@dasty.net>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4FA7B9DF.60304@mlbassoc.com>
References: <1336391680.3417.7.camel@dasty-laptop>
	<4FA7B9DF.60304@mlbassoc.com>
Date: Mon, 07 May 2012 14:33:55 +0200
Message-ID: <1336394035.3417.12.camel@dasty-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3
X-Gm-Message-State: ALoCoQlL9JiF9lFAFGvV5Scu5pM4Ufop6v+V+CpCiuhCeCzOd9TqwShs5dFFLdzw8/cBUfBPy/XR
Subject: Re: Simultaneous build of two intree packages
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
X-List-Received-Date: Mon, 07 May 2012 12:43:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-07 at 06:02 -0600, Gary Thomas wrote:
> On 2012-05-07 05:54, Radek Dostal wrote:
> > Dear All,
> >
> > I have three intree recipes A, B and C which are part of the same layer.
> > =>  B depends on A
> > =>  C depends on A.
> >
> > There is no dependency between B and C. Only important thing is that B
> > and C are not build simultaneously. This is not a problem unless I use
> > configure BB_NUMBER_THREADS>  1. Than builds B and C starts to collide
> > and produce mess because they are both intree builds.
> 
> What are you doing that makes these clash?

usually it crashes during "ln -sf target dest" which is executed
simultaneously with same parameters for both builds. There are other
issues as well in addition to this ln issue.

> >
> > Is there something like a mutex/lock mechanism in openembedded-core,
> > which would forbid two recipes to be build simultaneously?
> 
> Just make C depend on B

I have already considered this, but unfortunately I also have
configurations where only B is included or where only C is included :(

Thanks,
Radek



