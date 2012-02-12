Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rwhqn-0003FO-PQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Feb 2012 23:24:53 +0100
Received: by lahc1 with SMTP id c1so3692563lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2012 14:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=fcQOiOzT5F4X3g4u3Z2wETlHZmLdR9UKRjAVTURCC7w=;
	b=tx8/TTWXJNlbvDi6f0HwQzsjlCVfZ7vyvbvSbcbzMPRu+f/Arx5jGThbb0f1QJiaV0
	26YxyAwlKldJ6uARYQQ79jm0j+ZcpoZV6YpPFe9CihivU5x0yQKktuts19iii9Y+uhCq
	g2zUTGzhPXOu3D4ryukB3dkGxdANtevcwyBJQ=
MIME-Version: 1.0
Received: by 10.152.145.137 with SMTP id su9mr9645966lab.23.1329085005137;
	Sun, 12 Feb 2012 14:16:45 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Sun, 12 Feb 2012 14:16:45 -0800 (PST)
In-Reply-To: <CAP9ODKrPPETkPqEcuEJ=GocqiG4aQTk4fX_HJmJurgMUVJXz6w@mail.gmail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
	<1328925603-2967-7-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKrPPETkPqEcuEJ=GocqiG4aQTk4fX_HJmJurgMUVJXz6w@mail.gmail.com>
Date: Sun, 12 Feb 2012 23:16:45 +0100
Message-ID: <CALbNGRTUw9nYs4fzJCtSNbHWATm7Ckc=p3qMz0VcO4771-PTSQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 7/7] systemd.bbclass: automatically extend RDEPENDS for *-systemd packages
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
X-List-Received-Date: Sun, 12 Feb 2012 22:24:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 11, 2012 at 2:19 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sat, Feb 11, 2012 at 00:00, Andreas M=FCller
> <schnitzeltony@googlemail.com>wrote:
>
>> * append systemd (functionalty moved into systemd_add_rdepends)
>> * append base-pgk
>>
>
> This patch is OK but I think it would be nice if the recipe has it includ=
ed
> in rdepends byhand we could do a warning saying it's use is deprecated so
> we can know about it and cleanup the recipes.
>
good suggestion - V2 will have it

Andreas


