Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NCtOP-0007ri-BS
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 12:17:12 +0100
Received: by fxm8 with SMTP id 8so6724925fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 03:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Ylr8+T5UN8nOIDXmJS0SH7SBBqZGRd6a9unTE4JkUk4=;
	b=xb9Qfba88tqwq/vSKCADRH4khdyjHoOAnKmpXfohbULsknDxT9KcOsyAE2al18uVC7
	BaM8v1E5P9r9XPcJML4Sp3wWRRT2q8R1NPeaOxgyNPA+9qN5aD76wf+86VowiuPgLnSm
	fGAL17rIYdWtMXPxQKDz4yuCyXhAnN8bCP0Lo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EC0rEmD5/UHla3RLXpJM47s+SxBN0ufJVmgFuOaxbGgQ2aYW49FCAP4WONkZOsUYYu
	25zuWFf5YpUz3h/Z6/Ov0X6Zl4rw2aWhdZqYCClw1KuhMBmZ4Clg9itf/MgoC+Away8i
	4Ds/mktJFMCxojwGn/nWVj41Ft+lhFX4GKJaI=
MIME-Version: 1.0
Received: by 10.239.141.131 with SMTP id c3mr720029hba.44.1259061340676; Tue, 
	24 Nov 2009 03:15:40 -0800 (PST)
In-Reply-To: <1259004228.10321.168.camel@dax.rpnet.com>
References: <c384c5ea0911230925u5d6e29b4v5801057f25971574@mail.gmail.com>
	<1259001133.10321.140.camel@dax.rpnet.com>
	<c384c5ea0911231043h75ae7402me61d82d90b8234bd@mail.gmail.com>
	<1259004228.10321.168.camel@dax.rpnet.com>
Date: Tue, 24 Nov 2009 12:15:40 +0100
Message-ID: <c384c5ea0911240315v488a5d85v3621676ff8ed005b@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what is the expected STAGING_INCDIR for cross packages?
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
X-List-Received-Date: Tue, 24 Nov 2009 11:17:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Mon, Nov 23, 2009 at 8:23 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2009-11-23 at 19:43 +0100, Leon Woestenberg wrote:
>> On Mon, Nov 23, 2009 at 7:32 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
>> > On Mon, 2009-11-23 at 18:25 +0100, Leon Woestenberg wrote:
>> >> what is the expected STAGING_INCDIR for -cross packages?
>
> Take a look at what cross.bbclass looks like in Poky. There are things
> like ${target_includedir} defined there for exactly this kind of
> problem.
>
This seems the right approach.

Emptying STAGING_DIR_HOST opened another can of worms (/shlibs related).

Groeten,
-- 
Leon


