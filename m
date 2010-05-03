Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1O8u8p-0007B1-L0
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 13:48:52 +0200
Received: by fxm11 with SMTP id 11so1925594fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 May 2010 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=UTLqzLSHb6rYfPf6cjYXBRcq3M9cf16ulrBDPVx7C/c=;
	b=CAVYvN3DzohdlnUUVSQU0qRu5EXCRj35mpAczOTsLdKHw6VB3Kft5YeCrwptjxLAYh
	7b6HUGeD5uvjP668uSnAaKg0utjm4uYQpphzepdOl3kAJmemJAYLtCjh+CXuuVeMp1NW
	nHqbymHhyL4IwD0YHUd8tboba6RNlvxfEBN7c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rYcZb2MkEN6a37nVVleeg6Be2tOdpb+s9Q2DtH8x03o1HcB2Lv+NSROLyLW6vvVut7
	S3eBr78U70/yCR5Pu5YL5WKFjJL+49sLLJC75GJ0ksUSP7fWhh1840hvW8fcxW6ozGeH
	U8mqygLTsEAvA2/+AuvoHzPz5xWkjIDrkXNjE=
MIME-Version: 1.0
Received: by 10.239.183.131 with SMTP id u3mr1440633hbg.122.1272887106068; 
	Mon, 03 May 2010 04:45:06 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Mon, 3 May 2010 04:45:05 -0700 (PDT)
In-Reply-To: <j2id1b08f941005030439m701d0eejb89a75e2499924f4@mail.gmail.com>
References: <1272879651-27000-1-git-send-email-Martin.Jansa@gmail.com>
	<4BDE9E9D.9020003@eukrea.com> <20100503113525.GO7123@jama>
	<j2id1b08f941005030439m701d0eejb89a75e2499924f4@mail.gmail.com>
Date: Mon, 3 May 2010 13:45:05 +0200
Message-ID: <l2td1b08f941005030445ye08925d5qe8c1337a797fa7b9@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] klibc: cleanup all version
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
X-List-Received-Date: Mon, 03 May 2010 11:48:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

> >   convert all to new staging (don't know how to install to cross with native install).

Hic sunt leones:

do_stage() {
        oe_runmake  install
        cp '${STAGING_DIR_TARGET}/bin/klcc'
'${CROSS_DIR}/bin/${TARGET_PREFIX}klcc'


Cheers
Andrea


