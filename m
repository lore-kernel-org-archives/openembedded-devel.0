Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PLvxK-00012M-Ki
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 11:55:07 +0100
Received: by wyb40 with SMTP id 40so1840448wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 02:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=j9m2apku7HhhnSY8gWLI/5zMgwAf38RP1wAQs5OzKuc=;
	b=Pp/omGQAtG28LgkCSgyEfVv1Inb5vPEBZB2wIDij4PkBXxUHYFuUEPLpmB7siuFMIW
	sy3n6kMmuHUnaoq6NDQBYWzE0kDqlqQc4nHJkRz9jANtajEl9NTat4sZnbOttl5Qrmha
	hLMkN1aPkDVVYItNazNE8cpw6+qZXfv3q3r4k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uhJYzuQHI9kbrRZLLUSxRVx//m5sbAEN4YO5NVHB93t323SF98oWRhqaMG8Tsj/gZk
	Mq2vuG1VqHLE5+532Hhs+ke8br12Wix6xUwQgtHKpP5+0axSd2u1sI2duMlcHwd6cj+l
	06EO7GjtVw5qZgiWAqNzH/xPd9o3UmT2ttO4Y=
MIME-Version: 1.0
Received: by 10.216.52.11 with SMTP id d11mr1736853wec.0.1290768830567; Fri,
	26 Nov 2010 02:53:50 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Fri, 26 Nov 2010 02:53:50 -0800 (PST)
In-Reply-To: <1290768432-13366-1-git-send-email-ynezz@true.cz>
References: <1290768432-13366-1-git-send-email-ynezz@true.cz>
Date: Fri, 26 Nov 2010 11:53:50 +0100
Message-ID: <AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-2008.1: bump uclibc to 0.9.30.3 which unbreaks x264
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
X-List-Received-Date: Fri, 26 Nov 2010 10:55:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> -PREFERRED_VERSION_uclibc =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "0.9.30.2"
> -PREFERRED_VERSION_uclibc-initial =A0 =A0 =A0 ?=3D "0.9.30.2"
> +PREFERRED_VERSION_uclibc =A0 =A0 =A0 =A0 =A0 =A0 =A0 ?=3D "0.9.30.3"
> +PREFERRED_VERSION_uclibc-initial =A0 =A0 =A0 ?=3D "0.9.30.3"

Hi,

this would only fix x264/freempeg.

Unfortunately build will fail on e2fsprogs afterwards.
See http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2010-Novembe=
r/004257.html

So I suppose we should do a combined upgrade of uclibc and binutils.
I'll test with current gcc-4.3.3 and let you know.

Andrea


