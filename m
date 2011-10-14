Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1REd1N-00083U-JF
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 10:21:37 +0200
Received: by ggnq1 with SMTP id q1so857614ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 01:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gjrnLHhdT7QrLq6lXMj+hVyyeSrNYkhLBbadtpxoOFo=;
	b=L2fvcQkWQPIFmikNAFF3VqhWlamSf74QAkTH0ib21Swo0E8k7n2TOKvknIeKktJMoa
	ti673UyTaWQGFYv5EnXG2TzKmtZgKp3ZT7QyffZHRtWyuGCH8nlGKGrWkLp26Z/ifvpL
	z/+9ulaRTDdCmHLFnJIJK3+AwkK5jXPMMYUck=
MIME-Version: 1.0
Received: by 10.146.7.31 with SMTP id 31mr1497058yag.10.1318580152043; Fri, 14
	Oct 2011 01:15:52 -0700 (PDT)
Received: by 10.147.124.18 with HTTP; Fri, 14 Oct 2011 01:15:51 -0700 (PDT)
Date: Fri, 14 Oct 2011 10:15:51 +0200
Message-ID: <CAAQYJAuwL6f1eGGDsKh1Uf1CCfpjuLuFaCgX6LEeXt+pYHN1Pg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Race during build of kernel firmwares ?
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
X-List-Received-Date: Fri, 14 Oct 2011 08:21:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

building with 4 BB_THREADS and -j5 I repeatedly see this error during build
of linux-2.6.39.

MKDIR
/oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/linux-2.6.39-r0/image/lib/firmware/cis/
make[1]: *** No rule to make target
`/oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/linux-2.6.39-r0/image/lib/firmware/./',
needed by
`/oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/linux-2.6.39-r0/image/lib/firmware/ti_3410.fw'.
Stop.

I'm using no-distro and following layers:

openembedded-core
meta-openembedded
meta-handheld

Note that I'm thus using kernel.bbclass from meta-oe and linux.inc from
meta-handheld.

I had to start bitbake core-image-minimal 5 or 6 time before the issue
vanished itself.
So, it could be a race or some missing dependency. I'll inspect the logs
later this evening.

Having recently read patches about firmwares in the ML, I'm wondering maybe
some recent commit broke the stuff...

Regards

Andrea

