Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OAp5Z-0004U1-Fs
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 20:49:26 +0200
Received: by wwc33 with SMTP id 33so36557wwc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 11:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7RZVOLCRdkmsGZ0iFiCPy4BO/ae8WSSKX4Au518Y3eE=;
	b=lN+zQcj1YyOZ9+fVVbqslRFV9Cl+S/lc8IoY96FfkPHaQ4vIG8orKc5lXIwnATcjGF
	m5peP1YqonJBpL1TsvVUY3jKqh7B4YMF0P0aLrCGLUi1ZRkUmRzIvLhnYPfAK6nuIQNC
	quiyh6Kq0QbBTR8Pu35p/VCn6zCWPZVyPvJUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nuCMlm/Q+tLua3QdIoc1xAvJQg2shodVIPKzg3Jtn8kwjKKknRJe6NzqtX91Ts4F/V
	7VtneRtiG+GH/I1CFPCHPmgB8xZGhQ4j0YKVLTYuyvyCM97Tc8WCVU5J8JfkI54ecCMI
	mXS8n+gSH6K0rbyxILoWeo8oPpOf40bynYc6I=
MIME-Version: 1.0
Received: by 10.216.188.201 with SMTP id a51mr1048684wen.224.1273344334879; 
	Sat, 08 May 2010 11:45:34 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Sat, 8 May 2010 11:45:34 -0700 (PDT)
In-Reply-To: <AANLkTin_ibS2jkoYBHmAkt4loIh2LCTSJsdsEaXKJdqZ@mail.gmail.com>
References: <f96d234e1002250719v2c996ba4kd631051f29cba633@mail.gmail.com>
	<AANLkTin_ibS2jkoYBHmAkt4loIh2LCTSJsdsEaXKJdqZ@mail.gmail.com>
Date: Sat, 8 May 2010 14:45:34 -0400
Message-ID: <AANLkTilbQeH5oSXPNqdZAOuVL2PTYYd-dypNI6pbP_KY@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: make explosion while building attr
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
X-List-Received-Date: Sat, 08 May 2010 18:49:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, May 8, 2010 at 2:28 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> It would be really nice to be able to rename TOPDIR in bitbake to
> something like BB_TOPDIR, so we don't run into this problem. =A0Perhaps
> it is not necessary to whitelist TOPDIR to get BB to use it -- guess I
> need to try that as well.

It looks like the TOPDIR env variable does not need to be white-listed
in order for BB to use it, so that is the correct solution.

Cliff


