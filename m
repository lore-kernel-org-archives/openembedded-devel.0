Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ONarc-0000se-VI
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jun 2010 02:15:50 +0200
Received: by iwn39 with SMTP id 39so2783122iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jun 2010 17:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=I/Ec5ztwQc1YJ0YEhHoH2pBoFMWj1RW6kZBvDuEjfGo=;
	b=uxXcxg6NZh0Gv3p0NFoZy1VjW+Kk584DXANv/UY3i5s4qsVEVns1/WCOGkVNwPlQCN
	j6GNwyzJqIEsBZnz5BnrqGnbyInOq70t6ATjWxWG9VhOQ/h1b9M+JVoko8jlXgn/WdMB
	X3z8sto1Bf9l4FYn3+O2jJKbbeWkAZXPHRSL4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EIM5lHZN6Im1uqDZWjJiGjU8OAqWudgc/TVbTGZp6IQWozeFm3yudPtKlnn6gvKV2f
	w9ATi5i/svtz0sT61cn/YUnHtoCQD0tNb5qZSR2XMSDWBLFPfFTPpemCyJ0tXJJerxe1
	1KLCgCv0T6zdudU8rtUesrES50lrcNeB5XPDo=
MIME-Version: 1.0
Received: by 10.231.142.158 with SMTP id q30mr3684737ibu.145.1276387884704; 
	Sat, 12 Jun 2010 17:11:24 -0700 (PDT)
Received: by 10.231.19.76 with HTTP; Sat, 12 Jun 2010 17:11:24 -0700 (PDT)
In-Reply-To: <201006122237.42920.jay4mail@gmail.com>
References: <201006122237.42920.jay4mail@gmail.com>
Date: Sat, 12 Jun 2010 17:11:24 -0700
Message-ID: <AANLkTik7gGq-1cX_t-08rH5LULpYjam94dwmPDMco86t@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: neon, gssapi and host's krb5-config
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
X-List-Received-Date: Sun, 13 Jun 2010 00:15:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 6/12/10, Yuri Bushmelev <jay4mail@gmail.com> wrote:
> Hello!
>
> I've problem with neon-0.25.5 (0.26 was not checked). Neon's configure is
> catching my host's krb5-config and hosts includes. This causes QA error.
>
> I've tried disabling gssapi in neon (--without-gssapi). This disables
> looking for kerberos includes and libs. And this helps me.
>
> So question is: do anybody uses neon with kerberos or gssapi?
>
> Can I disable gssapi in neon?
> Should I provide neon-gssapi-0.25.5.bb?

I did not find recipes for kerberos or gssapi in OE
so disabling gssapi support would be ok I think

>
> --
> Yuri Bushmelev
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


