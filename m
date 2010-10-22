Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P9QUU-0000KT-TS
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 00:53:39 +0200
Received: by wya21 with SMTP id 21so1410231wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 15:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=YF44mzsUzPCYXk/Q+oAxKtcUdvlozYYVQ8Pom3zz/Hg=;
	b=oKoZl/6dPg+Cc+Kxtdr70Gx3TxuXh0o9zJI1gZbieafgv38rnpM6usV91D2PJGQLcU
	+pREnIZJYkntJ93VeBzN+Krgy/cXrazNXCvmLGJDyDmLaMkLU2LAufV+pg8uIN+Adpay
	suDD7lqpQsURk9jNtzr0hxxFgH+w1smaVOGOc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=WlkU4thA5jS8a4nYQtui5khy9iVFhg0BvPB0Lfr9h94Z4S7BBfwBEixUjjycSls5x6
	BgaOtAmqEwn50VoH/lparO5ht6s0X27NXit3ZohTA19wVHIMQXBrIB2OPDKJHOnYfFos
	ldEo8cpJe8+Wm7mTnpLqtaQnYpAhoX4xiuci8=
Received: by 10.216.232.29 with SMTP id m29mr119363weq.0.1287787980347; Fri,
	22 Oct 2010 15:53:00 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Fri, 22 Oct 2010 15:52:39 -0700 (PDT)
In-Reply-To: <1287783567-32647-1-git-send-email-raj.khem@gmail.com>
References: <1287783567-32647-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 22 Oct 2010 15:52:39 -0700
X-Google-Sender-Auth: M8qVkNDQh6NhzPyHSJCzGfh_dqM
Message-ID: <AANLkTimVXfWXFhAro5fiK_zjeow7_WqhZnzZCxswTM=n@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] bitbake.conf: Add one recipe identifying OVERRIDE based on recipe type
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
X-List-Received-Date: Fri, 22 Oct 2010 22:53:39 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 22, 2010 at 2:39 PM, Khem Raj <raj.khem@gmail.com> wrote:

> It adds an override based on type of recipe
> e.g. recipes ending with usual suffixes like -native -cross, -sdk
> add the same to overrides with out leading '-'
> It also add the same override for BBCLASSEXTEND
> For normal recipes we add 'target' to overrides
>
> This will give up better control over defining and combining
> recipes into using BBCLASSEXTEND and still have finer control
> if needed. We wont require to have virtclass-xxx overrides
> anymore
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

This looks good, but please reword the subject text of the commit, its not
very clear.  Your first sentence of the more detailed information is a
better summary :)

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

