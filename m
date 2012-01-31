Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RsEVc-0003rM-Eb
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 15:16:32 +0100
Received: by werc1 with SMTP id c1so44347wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 06:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=XUi/tkG//lpcDNuWal02VYip/5RnU4N9PSASwzoj7qU=;
	b=s2mgswkBZ3PQXgftvxD9VKIQase2234DwxWjMjYgp/ECNaaaIKjvo5qHdNZPqICf68
	loeT9SIP3HWSsgopzQYN01aC9GACSNVTASGJhMj0kDsp8e1gTzH/7edNKPpFj0bSfp0e
	/BfJhsObpgUxyerR0hrktfUBdG3YhDepT2joQ=
MIME-Version: 1.0
Received: by 10.216.138.8 with SMTP id z8mr2190752wei.20.1328018918833; Tue,
	31 Jan 2012 06:08:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.223.96.80 with HTTP; Tue, 31 Jan 2012 06:08:38 -0800 (PST)
In-Reply-To: <2408772.PAkgyL27F6@helios>
References: <20120131132717.GB3644@jama.jama.net> <2408772.PAkgyL27F6@helios>
Date: Tue, 31 Jan 2012 12:08:38 -0200
X-Google-Sender-Auth: sCCUKpagbdszDJ_Q3i4ekABS-e0
Message-ID: <CAP9ODKqwWyVcVk57POfgNomon0yNHMQPZU25qnk+H2yQ3Lr8-Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: WARN: polkit pulls systemd to image if not disabled explicitly
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
X-List-Received-Date: Tue, 31 Jan 2012 14:16:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 31, 2012 at 11:36, Paul Eggleton
<paul.eggleton@linux.intel.com>wrote:

> Are we now at the stage where we need a distro-level option to
> enable/disable
> systemd?
>

For now, OE-Core ought to disable systemd and Meta-OE needs a bbappend to
add it.

Later yes. But in fact it needs to be well designed because people using
systemd might not want to have init files around ... dunno how it might be
handled in future.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

