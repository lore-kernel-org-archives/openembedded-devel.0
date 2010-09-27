Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P09LW-0003Sy-Fn
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 10:46:02 +0200
Received: by iwn2 with SMTP id 2so2781820iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=yka3YqOCWu2QBI9oAifRYQqbQQZ2qheUINz6Oh5MwnM=;
	b=h0FGwj5sVUEgxEmc4uNWrslW3W0OJ3KVLd20fUkcaDVwuKGTWY35Fw5NSuwqT2Nz2M
	xvb3NG84LCEqp3WCsZoEk2i6iutV4ZImt8IMdKQNpZGkHx61H8GEtBpPZdgvglDh6WGO
	FeGYtr3trI4PhTRfDbMpJ85aqpSlEEdxPsKmo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gfiI23I5iabaqfE+y3UQtI5NZJMyPrS/jmXmJ2ggOqMcle5yTQ06nwtl5Gy67OMjfI
	Edm7V0sBHXcJiaEF9BDJMDf/tAymtH/wJamMDVChj4iw4VCm7BMWV/SYgy/wr9EI1wxM
	b8UmHfveZZInEG06t1xGXKXYqPMlXu7+V4xCQ=
MIME-Version: 1.0
Received: by 10.231.33.129 with SMTP id h1mr7290263ibd.140.1285577153414; Mon,
	27 Sep 2010 01:45:53 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 27 Sep 2010 01:45:53 -0700 (PDT)
In-Reply-To: <20100927082120.GS28423@ibawizard.net>
References: <20100926124317.GR28423@ibawizard.net>
	<AANLkTi=_gXRqO6Se0it=rG3rRoCF1rUVejp=TFqNOpXo@mail.gmail.com>
	<20100927082120.GS28423@ibawizard.net>
Date: Mon, 27 Sep 2010 10:45:53 +0200
Message-ID: <AANLkTinp+X-z9wwF-DSd9hOQZ0jVo1eHLFk4D2MLezHp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Strange bluez dependency for ppp
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
X-List-Received-Date: Mon, 27 Sep 2010 08:46:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/9/27 Petr =C5=A0tetiar <ynezz@true.cz>:
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> [2010-09-27 08:38:46]:
>
>> never peeked at bluez-utils, but bluez itself drags in a lot of stuff
>> because it depends on alsa and gst, so even if you only need bt
>> serial, you get a lot of stuff you probably do not want.
>
> All I wanted was ppp, not BT serial :-) But ok, I've just removed that
> bluez-libs dependency from the libpcap recipe in my branch, so it's fixed=
 for
> me. Thanks.
>
> -- ynezz

I know.
Reason for raising this is that this is an issue on other places as
well, which could require some attention.
There are some flags that control things (like MACHINE_FEATURES), but
the granularity is maybe too coarse.
Also the blues recipes do not seem to take MACHINE_FEATURES fully into acco=
unt.
e.g. EXTRA_OECONF contains --enable-alsa. Ideally this only should be
done if you are building for a machine that supports alsa.
(issue is that if you make this machine dependent the whole recipe
becomes machine dependent)

Frans


