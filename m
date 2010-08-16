Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ol0CD-0007P1-AA
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 15:57:52 +0200
Received: by wyb38 with SMTP id 38so5885124wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=m/DVludoGCLwG95pj9TKJ00zwtuaKoXKJ9haCJzp1AQ=;
	b=cRv3GKFpNDZC60weofBhj4scSNVB6ImYsXfd1AlxJsX0z/P0su73/Yuy46Colcx6x2
	B7UtUF5iyJlWj4vGzpBfotijHUep5F1CMS1AkZ6ojUXIPgPzxYJO36py+fnlc8rircu2
	kMRzt27OZ9pZtyGMkKdpyxsUes78tgFQwE4l0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=TejRItKhjipPPNNCICfTu850oblpyj1yzxUD/rXb1h09uAkJdKlQTVvzyKM4j+SSm2
	kzaW5L42vLMIq4e/MzpDqmCrEdKZnPKD0L2/trVWEiR5V9wJRaT/RjaW9M6/G44GBEMO
	rpGliI7cvG1Zq7T2z3ZnDo2hzsGA6cD+zMrM0=
Received: by 10.216.188.135 with SMTP id a7mr2592427wen.39.1281967052208; Mon,
	16 Aug 2010 06:57:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Mon, 16 Aug 2010 06:57:12 -0700 (PDT)
In-Reply-To: <1281955962-20571-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1281955962-20571-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 16 Aug 2010 06:57:12 -0700
X-Google-Sender-Auth: Zj0jfYomB0ItvjVn0KK2z9gGHsw
Message-ID: <AANLkTinJvBYrXuygk5B3_5WGJO51EcHV3=Lw7rwky0Fw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] oe.path: added 'recurse' argument to remove()
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
X-List-Received-Date: Mon, 16 Aug 2010 13:57:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 16, 2010 at 3:52 AM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> This makes it possible to specify whether the equivalent of 'rm -rf' or
> only this of 'rm -f' is wanted.  Due to backward compatibility it
> defaults to the recursive variant.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

