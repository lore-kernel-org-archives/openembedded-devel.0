Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1ULHfj-0003nN-8v
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 19:35:38 +0100
Received: by mail-oa0-f41.google.com with SMTP id f4so7846350oah.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=LMq4C4cBxEgrbDnr7J6IE4IyPKFbajf5MvIFPk4vVJM=;
	b=DlbN/FCcfoWmgjX4Jr9txjlI9i/IbxsGMhFR3lYCN8KZ7adPPQGu9Nm9Nckp+uVtIX
	ghcvxWsN4al6oZ7m3wbZiM9LyOlZSvOQPeWvGWFQ/JDPg53FuMP65OR1OVz6ovK1WFRU
	cyBRqsq/kTeKLZ59iuaWdUB+WClQcNj2F1Yk8MWRuwDpCYCM9P30ZXIsA+S/dRC1MqYP
	lOHnkPcyVUFj6gpK7qoplvRR3rK/tPCowaNntfOqksaR/HiEf7oIlkQ81xYs9KcoYNsL
	b1lw/4PpyQDGUmRUtgq8r/0+GBrbvTJYA3cqs+UNuE/bvebuTPscVjHnIda0o32w8nH0
	KRXA==
MIME-Version: 1.0
X-Received: by 10.60.37.229 with SMTP id b5mr17992899oek.21.1364494711569;
	Thu, 28 Mar 2013 11:18:31 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.76.154.4 with HTTP; Thu, 28 Mar 2013 11:18:31 -0700 (PDT)
In-Reply-To: <CANyK_8eU2E2VPjroU+nuQ7pkpYABE4-utjHyfTR3vBg+Uez_eQ@mail.gmail.com>
References: <1364469370-12082-1-git-send-email-paul@paulbarker.me.uk>
	<11972732.k3n4Vx4bzS@helios>
	<748453ED-9798-48BC-9C60-158A22EA82BE@gmail.com>
	<CANyK_8eU2E2VPjroU+nuQ7pkpYABE4-utjHyfTR3vBg+Uez_eQ@mail.gmail.com>
Date: Thu, 28 Mar 2013 18:18:31 +0000
X-Google-Sender-Auth: 36FCH4kHFpQ40FbhYh84XSek0jw
Message-ID: <CANyK_8fm-zr94rYnigMsh67V8+ufzB0g0TT41-3uDas+haf29Q@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: Khem Raj <raj.khem@gmail.com>
Cc: Tom King <ka6sox@gmail.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][TEMP PATCH] gd: Temporary patch while libgd.org is down, do not commit to main repository!
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
X-List-Received-Date: Thu, 28 Mar 2013 18:35:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 March 2013 16:08, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 28 March 2013 16:00, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> exactly, send the tar ball to Tom he will populate the oe mirror.
>>
>
> In which case, these two need adding to the mirror:
>
> ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/live.2011.03.14.tar.gz
> http://fossies.org/unix/www/gd-2.0.36RC1.tar.gz
>

Another one: lzip fails to fetch as the upstream source has discarded
the old version in .tar.gz format (It's still available as a .tar.lz
but that would create a circular dependency unless the host already
had lzip). The file is available from
ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/lzip-1.13.tar.gz and
matches the existing MD5/SHA256 sums.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


