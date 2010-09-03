Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OrXWa-0006Kq-Gu
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 16:45:56 +0200
Received: by wye20 with SMTP id 20so1701525wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=+AwrJ/VUyQXp/LOVfsacIoQFubIwqK/jYgVMMjl6aHs=;
	b=rUAHUtMLEvcTuZWhBQ5mz6HsrtItndgOKo+OEEvbGiE6WOoL4/L2edcKMDMr+lagUG
	sCQapC0fVTF7EJEJ2YYPPWPjE5R9iUAnwyIjRe0e83l/DaMwuh9enqnYsD2J4UewbYr+
	bI22VZg/Z0ZWjiCpkUoPUhPVi6m7zfxFg2Rn0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=Hk9lSoPqojMHfXwhofnMU3Kt32k0D3OMRQYYcIAwCL+H4ZAoIfhrouYf8ishtNU4Q7
	fL0lxCRG6NPmSb9zpA0jqq+spQR6REyvdIMhP3euhVoncK0vMPNVAJLzqQKKPnDLYbzu
	gVZ8tJbgrQxDowTi4hQM7U7LITn6rt8B/nAYE=
Received: by 10.227.155.70 with SMTP id r6mr127397wbw.26.1283525115203; Fri,
	03 Sep 2010 07:45:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Fri, 3 Sep 2010 07:44:55 -0700 (PDT)
In-Reply-To: <20100903111210.GA17702@game.jcrosoft.org>
References: <20100903111210.GA17702@game.jcrosoft.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 3 Sep 2010 07:44:55 -0700
X-Google-Sender-Auth: LC8J1beIU9RmU9wP31gjHZh2I3E
Message-ID: <AANLkTin7HBBUQk0STC=zAPgbceC+dfLFB=3eaYORr7Ws@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: How to extend SRC_URI_append?
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
X-List-Received-Date: Fri, 03 Sep 2010 14:45:56 -0000
Content-Type: text/plain; charset=UTF-8

The append syntax you're referring to uses OVERRIDES.  FOO_somevalue
replaces FOO if somevalue is in OVERRIDES.  FOO_append_somevalue is added to
FOO if somevalue is in OVERRIDES.  I don't think SOC_FAMILY is in overrides
at this time.

On Fri, Sep 3, 2010 at 4:12 AM, Jean-Christophe PLAGNIOL-VILLARD <
plagnioj@jcrosoft.com> wrote:

> Hi,
>
>        I'm currently working on the adding of a sub SH arch the st40
>
>        for this I've define the SOC_FAMILY as SOC_FAMILY="st40"
>
>        but now I want to apply some patch to gcc, binutils and others
>
>        via SRC_URI_append_st40 or SRC_URI_append_sh_st40
>
>        how can i do it?
>
> Best Regards,
> J.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

