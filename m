Received: from mail-ew0-f216.google.com ([209.85.219.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1NXKTz-0003Fd-8Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 21:15:26 +0100
Received: by ewy8 with SMTP id 8so3416379ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 12:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GRIIG4zLyBoInN9ZkJf3aQ0AOnovR28s/k2hylr3gq0=;
	b=GivD9cyosyW6L9cM7oJI/za0o+LKgSVi+fcIbgWGT9XJ3BZJmb+B3f4lXE3orcRqrq
	QjkHpsKQG7u0F0yVYlqO+KzJbAeX0I5rM9SJiqi73SDWwdX4N6H2MDVy4Uns3iy7pLII
	Abm8CZ1VZU8PADJBB0xeYhQSAwHbtW4ITkY9A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vIYm9bkwkQapKOOQxJwLFeKmJf0aNukyuj9rc5fNAHAfNsYWAYSgbTs4nDFuCjpRVD
	aqaz+H8oH99k4UXLSfyphuUSLLnknxwYcy49IFHGJEdm0fhM5yv8f7YtLuj9Rua5qr1m
	HNgiC+Aq2aWLXWxcT6BDBZ9Hek7qcGkNyh7VA=
MIME-Version: 1.0
Received: by 10.216.185.6 with SMTP id t6mr2703590wem.122.1263931987756; Tue, 
	19 Jan 2010 12:13:07 -0800 (PST)
In-Reply-To: <1263888546.2678.17.camel@ubuntu-desktop>
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<1263888546.2678.17.camel@ubuntu-desktop>
Date: Tue, 19 Jan 2010 21:13:07 +0100
Message-ID: <5f2b61001191213y5e09ea5ao56263b2db600e0ff@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.216
X-SA-Exim-Mail-From: bjorn.forsman@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: git pull
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
X-List-Received-Date: Tue, 19 Jan 2010 20:15:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Robin,

2010/1/19 robin <robinpv@iwavesystems.com>:
> One more input, When i use
> git pull
> Already up-to-date.
>
> and when i use
> git pull --rebase
> recipes/ti/ti-xdctools-native_3.15.01.59.bb: needs update
> recipes/ti/ti-xdctools.inc: needs update
> refusing to pull with rebase: your working tree is not up-to-date
>
> what is the correct command ?

You have a dirty working directory. Either 'stash' your changes away or
'commit' them to get to a clean state. (Or you can blow away the changes wi=
th
'git checkout .'.) Then do git pull/rebase.

Best regards,
Bj=C3=B8rn Forsman


