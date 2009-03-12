Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lhor5-0005ht-Tu
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 18:38:04 +0100
Received: by wf-out-1314.google.com with SMTP id 28so1195223wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rSuK6EfEQxB2bBNeWeBTRlqmWtRzonJmjYiveRaVLfo=;
	b=OidXSN4cQbiowXPED9+qbXD/DZ1nhPCdifWaJa9+2yDXXN6/b2QYeQ9AAkxSRq+RwW
	XzYQh/L5338fiPUi6Hjuh2QhCnqE2SOfu3zAbc8c3F09+N58zE6FQdI8WNdIcxSyFWNy
	G114JRP6pa1jQzUQkj7Ny8K/CclSpWpuc7Etg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WulITewkh4PVnIEcNUJ8hbuXEXFGkeVLllkRRUmeMr6xr8EAdD2UO8opCxL0cAdNkz
	4GmrB4udS0jJ+/ZOwv/bcZdk1TORKGs6xv0dNaABi/z4AzvTVumgQns3DpUzFX7c1QkG
	6ygsdMdFXEulxWXbGVcPdEnPaLb5xVs5bap3A=
MIME-Version: 1.0
Received: by 10.142.239.11 with SMTP id m11mr90918wfh.174.1236879469528; Thu, 
	12 Mar 2009 10:37:49 -0700 (PDT)
In-Reply-To: <ac9c93b10903120252x292ff544gca18ac8684ce0f2f@mail.gmail.com>
References: <ac9c93b10903120252x292ff544gca18ac8684ce0f2f@mail.gmail.com>
Date: Thu, 12 Mar 2009 10:37:49 -0700
Message-ID: <19c1b8a90903121037g5726bf99qadca1e5d95dcae7@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: g++ lib problem
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
X-List-Received-Date: Thu, 12 Mar 2009 17:38:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 12, 2009 at 2:52 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Hi,
>
> I was trying to port a program that used asinl etc. but apparently
> asinl is not in our env.

Did you link with -lm ?


