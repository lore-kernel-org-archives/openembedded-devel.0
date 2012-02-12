Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RwhSQ-0002Hl-V9
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Feb 2012 22:59:43 +0100
Received: by lahc1 with SMTP id c1so3684323lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2012 13:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=B+Xw0s5QKTEEMjdDYsr98Jp34wahsTGqZsuo75YveNs=;
	b=NwoLhIWch7yTeIG02pnqiYUQ/kQ+GYTk5XOHlUD7z9po84BwerCgKC1ckF6YbJR4ur
	LvS3KOCXhne5tljj/biN1X75wv2SnL5a57nCByuIhTZnu6qlB6cIR6OH7TK1HpVa8DCJ
	RYhO27ahKXJpOkx0RhqFv4QMCX6UpOrGyNYh8=
MIME-Version: 1.0
Received: by 10.112.103.8 with SMTP id fs8mr4718714lbb.39.1329083494275; Sun,
	12 Feb 2012 13:51:34 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Sun, 12 Feb 2012 13:51:34 -0800 (PST)
In-Reply-To: <CAP9ODKo94_GmSq0YbKgLO+n__y8rOixra385fSghHCdpfBn+AQ@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-2-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKo94_GmSq0YbKgLO+n__y8rOixra385fSghHCdpfBn+AQ@mail.gmail.com>
Date: Sun, 12 Feb 2012 22:51:34 +0100
Message-ID: <CALbNGRQ9KqNyKB9Wvpx1BF5Ff7CwJafsCuvqv4uSRUnYT86=Tw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 2/7] systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and SYSTEMD_SERVICE
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
X-List-Received-Date: Sun, 12 Feb 2012 21:59:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2012 at 2:09 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Feb 10, 2012 at 23:59, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> + =A0 =A0 =A0 def systemd_check_vars():
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 # not for native / only at parse time
>>
>
> Doesn't it need to take into account for cross and nativesdk too?
>
Currently there is no case for this. Since I see no harm adding cross
and nativesdk I will extend in V2.

Andreas


