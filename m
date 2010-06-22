Received: from mail-yw0-f202.google.com ([209.85.211.202])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OR6Nl-0003TX-Ut
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 18:31:43 +0200
Received: by ywh40 with SMTP id 40so3918868ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=M6yZ1s1QYCm7DtPihpZ2+GxZIXKYkBgDyjkwo1eZEdE=;
	b=W8djejTgZTwjMSppfw5q3g4GnxNmv30c6ELtstTS43KjRs9iWt3dX/Ce5d0ToMjULu
	YnRyANq0VqbCYwgz2KZmNt0Ju5fU2yHotmLVlUJ+FrVj15xAoMqv0QE6n5fGTc/xlDXH
	xk4xUKkLtnLWBfsjvi63icSsaBgs63cIxCeFI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=o8sTgSrzeZP79a1id0aoRu95z1V9K788i7BGrGIDGMbufgJtGwefboHWXcBtsHHESq
	SKgjU+CHKlS5Khq9+i7KIxAw0Mh5vPv7cddBMFscVrYq6lIOXj752jwHdL5CNHqOLJyY
	WYecSc7kOsOvcFai9zxPj7atIk1/qr5qENKKY=
Received: by 10.229.186.139 with SMTP id cs11mr3461006qcb.19.1277223959785; 
	Tue, 22 Jun 2010 09:25:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.241.204 with HTTP; Tue, 22 Jun 2010 08:56:24 -0700 (PDT)
In-Reply-To: <BAY127-W5364FE0717D0A6178A2EAD8C40@phx.gbl>
References: <BAY127-W5364FE0717D0A6178A2EAD8C40@phx.gbl>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 22 Jun 2010 08:56:24 -0700
X-Google-Sender-Auth: 0LXBouvkg_Fin8NkQfuI1whc5pA
Message-ID: <AANLkTilQuTcfbY3xhXiG1-E49_ZMo2egSMqvvxovG6Z4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.202
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: setting of ipk pakcages
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
X-List-Received-Date: Tue, 22 Jun 2010 16:31:50 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 22, 2010 at 8:51 AM, saleh usman <salehusman@hotmail.com> wrote:

>
> Hello
>
> How and where setting are made for ipkg packages in OpenEmbedded. What does
> hello-dev.ipk and hello-dbg.ipk contain instead of hello.ipk when hello is
> name of bitbake recipe.


Read bitbake.conf.  See the PACKAGES variable which lists what binary
packages will be emitted, and the FILES_ variables which control what files
go into those packages.  All the packaging is based on what the do_install
task installs into the ${D} directory.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

