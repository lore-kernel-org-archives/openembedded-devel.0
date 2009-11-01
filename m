Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N4hAI-0004ob-Tl
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Nov 2009 21:36:45 +0100
Received: by bwz9 with SMTP id 9so5515943bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Nov 2009 12:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=02O2SO0XuWgHIIBD/x7FwhtZz22tadf9kifk0qfVvrc=;
	b=MGrdF9hgqj/fQEHvfufE8/LS8U7RbE9phwwKOuFIj53NAoxoQ3bhxV/QuqrrvQlX3+
	OQZ/jw8xqN0GBSRsxV5bDHzgkZcPks8IQ/CBp0XG7YGpqcaJxWzpHrq4J9KVfXRw9sBu
	PIL3y4dtjG1QcCb9BI3VSPxbwVApQu9C3mii8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=nRjXehdMWAYjch6HRTeqLMpLWP4DgskVc/hER0EDzX/omFuBY96n8JcU6tbFYy2XNz
	johpM3+d1H+EGDmcSpJ2KapWgh0E+pNhc8hYPZzzgc+t6I4996LLk35Mnyn9yEIPC5W8
	BDckxbZu4ByWF+jvLoqpn2qor9ZwkearylmBs=
MIME-Version: 1.0
Received: by 10.239.183.26 with SMTP id s26mr435846hbg.179.1257107732286; Sun, 
	01 Nov 2009 12:35:32 -0800 (PST)
In-Reply-To: <200910291241.35265.marcin@juszkiewicz.com.pl>
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
Date: Sun, 1 Nov 2009 21:35:32 +0100
Message-ID: <c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Sun, 01 Nov 2009 20:36:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Oct 29, 2009 at 12:41 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> [archivename]
> url0=url-to-sources
> url1=alternative-url-to-sources
> url2=another-alternative-url-to-sources
> md5=md5sum
> sha256=sha256sum
>

Can we simplify this a bit? i.e.

archivename
url=url-to-sources
url=alternative-url-to-sources
url=another-alternative-url-to-sources
md5=md5sum
sha256=sha256sum

Why not just url instead of url0, url1, url2, ... ?

If you need ordering, just use the order they appear in the file.

+1 for the idea,

Regards,
-- 
Leon


