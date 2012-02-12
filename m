Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RwhTr-0002jn-0r
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Feb 2012 23:01:11 +0100
Received: by lbol12 with SMTP id l12so2196864lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2012 13:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hr5GCrcFDsnuIXoHmPTmXTJnlLahjsqPfmHLMEYXsCA=;
	b=bjI6aNBaPIWv0tbnq/YXyaGpRg86JZzdHLk6peDYGtdlIWInyO5vluCSfIE5tzTtZ5
	N5wh0uXvbhr4BFX2p2wBTevup8SUGCnOb6sT5wGYHSejGFCfTd6aoAD+uWse3eEWHt0X
	ea96oQrhAL9Whnzf7ZfMPM+Y1sQV+Rnn6fB/U=
MIME-Version: 1.0
Received: by 10.112.10.70 with SMTP id g6mr508000lbb.0.1329083582296; Sun, 12
	Feb 2012 13:53:02 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Sun, 12 Feb 2012 13:53:02 -0800 (PST)
In-Reply-To: <CAP9ODKrUO2t0wmWvB_4q8UQrK3G1kZQJ8P5R6tAjsCVY0j_W0w@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-3-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKrUO2t0wmWvB_4q8UQrK3G1kZQJ8P5R6tAjsCVY0j_W0w@mail.gmail.com>
Date: Sun, 12 Feb 2012 22:53:02 +0100
Message-ID: <CALbNGRQhH3=RBF6R_KebYyG=nxNsU9uOcRgugd=PCGV2e4g2NA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 3/7] systemd.bbclass: cosmetics
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
X-List-Received-Date: Sun, 12 Feb 2012 22:01:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2012 at 2:15 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Feb 10, 2012 at 23:59, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> =A0python populate_packages_prepend () {
>> - =A0 =A0 =A0 def systemd_package(pkg):
>> + =A0 =A0 =A0 def systemd_prepost_instrm(pkg):
>>
>
> I fully agree about renaming it but wouldn't
> systemd_generate_package_scripts(pkg) be more descriptive?
>
V2 will get that

Andreas


