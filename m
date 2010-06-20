Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OQ8bh-0000Qn-Kl
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 02:41:54 +0200
Received: by gyg10 with SMTP id 10so1818859gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jun 2010 17:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=15Cy4rCdLMB/N3OoU5Tw2LhzBR31Eq93YDF3YjB27Oo=;
	b=A1oHZuNyVgQzqqTyf5Lgthz4xhp13UsUgAZoSayLM9IC0ugWbgxPQbj5fjVEflEY/Z
	9nVlmnoE38BUnZsyGdyyJod5AuOOFKn5/gy9+la/KE9OcPcV3N/c2TUFsunAgbZ20PeB
	s1zPNtrE/89hjrJGBhTIFde7t3/dra0CMW6l8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=niq+k7Amu1wQu3W3+LP+U13J91awBv/G8V9PSUVko98Qa+guQij19IaKvQf7vHHURd
	HPbtWPet5OnOOZHWgYxYKZrPbbaspz84rqc4OPu5Te9rCvmapMpZppg6RvkFd3CvUDWC
	0wH5oeRr6VoxiyoXsP0Wzny5ECsKv//qUu+0g=
Received: by 10.229.188.132 with SMTP id da4mr1692624qcb.40.1276994240326; 
	Sat, 19 Jun 2010 17:37:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.241.204 with HTTP; Sat, 19 Jun 2010 17:37:00 -0700 (PDT)
In-Reply-To: <A24693684029E5489D1D202277BE894456043549@dlee02.ent.ti.com>
References: <A24693684029E5489D1D202277BE894456043549@dlee02.ent.ti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 19 Jun 2010 17:37:00 -0700
X-Google-Sender-Auth: mmYTgwI_g50rLR--Icq1d2rx5Cw
Message-ID: <AANLkTimkxAXIRkqjwUQqpDScvv09fMTqWTDSIrBuOCON@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Amend nullifies cache
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
X-List-Received-Date: Sun, 20 Jun 2010 00:41:54 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jun 19, 2010 at 3:58 PM, Ambrose, Martin <martin@ti.com> wrote:

>    # Adding all amend.incs that can exist to the __depends, to ensure that
>    # creating one of them invalidates the bitbake cache.  Note that it
>    # requires a fix in bitbake.  Without the bitbake fix, the cache will be
>    # completely invalidated on every bitbake execution.
>
> Which bitbake fix is that so that I can confirm or deny? Though I expect
> I have it since this comment was added in an older commit (73bf2289) when
> the
> file was named amend-recipes.inc. I couldn't find reference to this patch
> in the
> ML maybe because of its age.
>

See 3adb0d1c23f8b0d153859e78899a0694a27aa0af in the bitbake git repository.
It looks like this may not have been cherry picked to 1.8, I'm not certain
offhand.  I'd suggest trying out the 1.10 branch and seeing if you encounter
the same problems.


> Looking further into the amend.bbclass I see that it doesn't add the
> amend.inc files
> to the dependency list if they aren't present on the filesystem. And I
> verified this by
> further debug prints. This is good but leads to the question of where/when
> these non-existent
> files are added to the dependency list.
>

This is incorrect.  The files that do *not* exist are the ones explicitly
added to __depends, if you look at the class again.  The files that do exist
get parsed and therefore are automatically added to it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

