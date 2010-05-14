Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OCz32-0007dh-Jq
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 19:51:47 +0200
Received: by gwb17 with SMTP id 17so747300gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=RVwycn3bw6Ksxadr2qaJD1jUn71DBEJnwG4OsmVbT6Y=;
	b=DZso7Sr9GiFLqWu5lqNzznwqD58PI0IuUQnk8Vc6Gh9CaArSplyo7mQXhxRs0sXWpG
	iSoP0EEi3VGL7nx8MzbxAeAFzz9uGcTg/ms8UZwHVGorvbM1KnVQMB5xSs9aLI1KISQj
	ZinIcc1sAJbrOgGGgw7sIy6D/2mfyuTu7o9XQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=raBAkv7WkfM3HIF1tnb5bjQ4zMXRv8Bfck/qcJVHOykPaD6yGXsTHA4dopuyx6C2P0
	ncIHHFuVdeJQfl2oIFm+elZfDiYOeJtx+cYXjJoeN7C9EcWlRhqu/JvXyBPksUyIaiyD
	c4E/TmLsauG+t4daep7BV4g2wZ7aWDuqn2nfI=
MIME-Version: 1.0
Received: by 10.101.173.28 with SMTP id a28mr1873518anp.229.1273859264931; 
	Fri, 14 May 2010 10:47:44 -0700 (PDT)
Received: by 10.100.108.2 with HTTP; Fri, 14 May 2010 10:47:42 -0700 (PDT)
Date: Fri, 14 May 2010 19:47:42 +0200
Message-ID: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Issues with parallel build? (Was: gtk+native missing dep ?)
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
X-List-Received-Date: Fri, 14 May 2010 17:51:48 -0000
X-List-Received-Date: Fri, 14 May 2010 17:51:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, May 8, 2010 at 1:12 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> PARALLEL_MAKE = "-j5"
> #BB_NUMBER_THREADS = "4"
> BB_NUMBER_THREADS = "2"
>
> fixed the things. This time the dependencies were (correctly) built before...
>
> Andrea
>

I repeated the build of console-image and gtk+-native always fails
using 4 threads.
Anyone can confirm?

Regards

Andrea


