Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NkP8n-00081R-5m
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 22:51:33 +0100
Received: by pwi5 with SMTP id 5so4897079pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2010 13:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lI0eF0taLwNV9FU6hdds8IQa+x5BxU1rxdu76PmTl0E=;
	b=fEOBKu51HihU8FryoBYgP/tAkCH6YcSfqI5qs91d9QLp7C7kIA+TxPj1g1gTkhcVeu
	brlWkK0fBlXD9er/tF5r5sBi5IY9trjXxta0pT6Cq/cQW0EmBUgmuGXtEvCtzCQVdePX
	evGY+txBCzZbZewmfQl2xzgxZJM1rlKX7K2o4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=f2e2oTX0zWMKJ6GLlnYxvrW+gP9WzsBFIYfVTAcBmC1lCNANmaPs8kBkepHvnPfsMo
	X3uG1VtgXznuh8JdR6ZWAf9/t0k9N0aAl59coR8z8F7bawFrJMqAb1AOJDXClFuzWylq
	2JCw7k0QriUhI/7bVDK66S8aOyWorFpVaZ5Gg=
MIME-Version: 1.0
Received: by 10.143.20.29 with SMTP id x29mr206867wfi.254.1267048126587; Wed, 
	24 Feb 2010 13:48:46 -0800 (PST)
In-Reply-To: <1267045217.5437.326.camel@lenovo.internal.reciva.com>
References: <1267044772-10182-1-git-send-email-denis@denix.org>
	<1267045217.5437.326.camel@lenovo.internal.reciva.com>
Date: Thu, 25 Feb 2010 08:18:46 +1030
Message-ID: <6ec4247d1002241348i6dd2db32ifb3f9482287d91bd@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rootfs_ipk.bbclass: fix BAD_RECOMMENDATIONS
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
X-List-Received-Date: Wed, 24 Feb 2010 21:51:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 25 February 2010 07:30, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2010-02-24 at 15:52 -0500, Denys Dmytriyenko wrote:
>> New opkg requires full and correct package name, version, revision and
>> architecture to be specified when requiring de-installation of a package=
.
>> Collect that info from opkg-info.
>
> This seems like a bug in opkg. =A0Would it not be better to fix it there?
>
> p.
>

This is an unintended side effect of other changes, however I'm not
sure that I consider it inappropriate behaviour. That status does
apply to a particular package version, does it not?

-Graham


