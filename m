Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PB9Ia-0004dW-KA
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 18:56:30 +0200
Received: by ewy2 with SMTP id 2so446981ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=4f9ZKaVbcw7kVqi9JAWLcWeN8Ip+TktV9jOD3NHQUUU=;
	b=chzOenhjVtGn9+vs5VzkB2K5V13TZvkfbGp6d33GnGyQ1PDDgZ7Kv4x/s6QMj0+4te
	IDRiy/3UpU1mfZbmeeZQeUapmU+zp0u57zxZYdPKM85i7LeasmNw2hpN4GXursgBs4R/
	j3VAFXtx7d3ywlO/MqFAxfKXq7chN8Yrv4kOA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=sr3rQLdypbgo+PvjZV4K8FgbncdRDyCNqhGYIDpIyjJjW8y9noNvZTOH+n1jLZ83iD
	h3l0CZUJ1ljm7ubCXskBHmljJckpu/QbcouuNjX36DV3BcOgPoTV8RKaubChsCcgPEwC
	h2/GpdxIvLVrwqDxdGD7T/sAlnaRpyXh3LmPU=
Received: by 10.216.7.137 with SMTP id 9mr1094464wep.97.1288198545061; Wed, 27
	Oct 2010 09:55:45 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Wed, 27 Oct 2010 09:55:24 -0700 (PDT)
In-Reply-To: <1288169605-11133-1-git-send-email-Martin.Jansa@gmail.com>
References: <1288169605-11133-1-git-send-email-Martin.Jansa@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 27 Oct 2010 09:55:24 -0700
X-Google-Sender-Auth: X_bO2nZYq73g_0avJ1im-fTDQkw
Message-ID: <AANLkTimLteXptn=1SDUU64vt=wt=vWfyjjUJ3XADC4K3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC][PATCH] base-files: add empty /etc/profile.d which can be filled by distro/machine profile scripts
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
X-List-Received-Date: Wed, 27 Oct 2010 16:56:30 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 27, 2010 at 1:53 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> * used for gtk_im_module.sh in SHR
> * would be better to be able to fill it from more sources (maybe put
> profile.d.machine, profile.d.distro, profile.d directories
>  and install all files to target profile.d), is it worth it?
> * /etc/profile.d/empty is used to prevent install call not failing because
> /profile.d/* not found
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

