Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OKgz9-0003ZA-QF
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 02:11:36 +0200
Received: by gwb20 with SMTP id 20so293092gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 17:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=lEswGfickIozMIC86xmXKWk/kVBJp1v4E8n0qmqUsDQ=;
	b=lFmvpQIpEmHS4YnFfW3TFiJX4J/Q/VZHb7TluooftHj/5oDCim1HMRjCWaMieesvWV
	vmmvMKcu4jy39vohBM8EtW3bsQVCI9LH33w3B24xpz2CYGM3shIDVzX/012u+/V36V9o
	iGH8QTzQwbGghF4uLUhnGuHRWbH/4fNBWcmoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=uFFbXz7o3kJaamHDumml/hTej+5NRQ+Y/v9JOaHZxzQHE8v1BCbVZRHpfBthFvdUl5
	x/H0YN0zyFddJ30F1xJMTJSsBcn47nkl7L6e34fZubGiwcX+KofSes/zKseXOZcEJFNf
	bc+QaJxHT04gsnjjcDbISgaLSfELnUUsg1ogk=
Received: by 10.229.217.144 with SMTP id hm16mr2964726qcb.113.1275696437970; 
	Fri, 04 Jun 2010 17:07:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Fri, 4 Jun 2010 17:06:56 -0700 (PDT)
In-Reply-To: <4C09946F.9040401@mentor.com>
References: <4C09946F.9040401@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 4 Jun 2010 17:06:56 -0700
X-Google-Sender-Auth: WY9ghUgMtdMCJ2PRj3TsEg5yGyI
Message-ID: <AANLkTimQs0f5vOz--Xhb-hDMzGbPVrn6K41HUZmqgqzb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Add locking on tasks that add package_update_index_ipk
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
X-List-Received-Date: Sat, 05 Jun 2010 00:11:36 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 4, 2010 at 5:03 PM, Tom Rini <tom_rini@mentor.com> wrote:

> We add a lockfile of do_populate_sdk and do_rootfs (in rootfs_ipk) that is
> also the lockfile that package_update_index_ipk uses.  With enough threads
> it is possible that one image (or meta-toolchain) is attempting to use the
> package index while another has only reached the point of generating the
> index leading to an empty index being seen later on.


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

