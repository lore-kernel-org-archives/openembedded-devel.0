Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OzDw5-0000Tf-92
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 21:27:57 +0200
Received: by wwb18 with SMTP id 18so322415wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 12:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Ob3YXJQTrn72wwjKEZ7CcpCHm2Gb68F73769/w6+JNs=;
	b=mlj6sYAkDPjd2TpUtePxE6vuQw0cLqQeMEDBpAWMIR0G/t4ROEwaEbsfkk37+6Fcul
	s0O5JRnhFkOhE0tukq2VhCPwdPMg86q19is6ol0YeEpJT1F8ygWblEEA2K4G58zqP6aJ
	NPmjNPV8Jyd2TrXmD1E+cQULzdk9uDdB77rW8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=amu4/So1uC6FWi9gMYyTNqL0wtj9+rb4QQPedY4DGNTGOkrzh+d6K7wa+tQlTk5BUB
	Go7sL763vqLuFAY2dZ9HOZtEPUodXOVbDhCBR3CTJVl0zlVDdQvt/EKfSMfnUTT5ruYk
	UbB0LdIShPH/3GawOVcrcKwgBQnAHm3QgkzME=
Received: by 10.216.154.131 with SMTP id h3mr9845975wek.74.1285356470058; Fri,
	24 Sep 2010 12:27:50 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.169 with HTTP; Fri, 24 Sep 2010 12:27:29 -0700 (PDT)
In-Reply-To: <1285355453-14622-1-git-send-email-msmith@cbnco.com>
References: <1285355453-14622-1-git-send-email-msmith@cbnco.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 24 Sep 2010 12:27:29 -0700
X-Google-Sender-Auth: Jk2r_37qfuLkyC5CNLrssiOEasc
Message-ID: <AANLkTimK4J6UZo_Ob7xhe9pL5Fy9BjQpUvAqC++yUZd5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Fri, 24 Sep 2010 19:27:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 24, 2010 at 12:10 PM, Michael Smith <msmith@cbnco.com> wrote:

> Use shtuil.copytree() to copy D ("image") to PKGD ("package"). The
> previous system("cp %s/* ...") missed dotfiles/dirs at the top-level.
>
> Relies on Python 2.5+ version of copytree() to create missing path
> components.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>
>

Acked-by: Chris Larson <chris_larson@mentor.com>

-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

