Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <brandhetlampje@gmail.com>) id 1OTxXf-0003GJ-Nt
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 15:41:32 +0200
Received: by fxm12 with SMTP id 12so476440fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=rWOJURw6Xz4/r6+jpQEhUwcvR57xH5YTowIw8sKxLnA=;
	b=QVfj0+k2zzkq3yApc9SLE3SOVjkHT+myGYFfzf4UXvmUieWJB/sNxZq+/GRmOmLKY+
	c29YHJrqx3aSfk+rmPd+zePz35OvTKErugZfwDURzzfFeoIZzt6luCMW167GeGdEAzba
	bA4PJ2+CNpn2lKYFpUeRI1HNs/jrUj+Ar+5hY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jSRJUI1lVMiVKz93pQn8YvBpF9wXQg2wFF3YElDLa/yHOvsz5/VAHQwfpzWZO2uipG
	Djn4WgJ59ii/eP/Lpp1qWwfUf6xGaLZiy+MGRpWVD570BuQSlsJiIt+J38kw446ROGcS
	VKeR/37MvI8nKe5IME4cPWTwsmWaQIyPPSZ8U=
MIME-Version: 1.0
Received: by 10.103.37.24 with SMTP id p24mr2886583muj.47.1277905005436; Wed, 
	30 Jun 2010 06:36:45 -0700 (PDT)
Received: by 10.42.9.39 with HTTP; Wed, 30 Jun 2010 06:36:45 -0700 (PDT)
In-Reply-To: <4C2B4663.6040901@tycoelectronics.com>
References: <mailman.15797.1277902454.24517.openembedded-devel@lists.openembedded.org>
	<4C2B4663.6040901@tycoelectronics.com>
Date: Wed, 30 Jun 2010 15:36:45 +0200
Message-ID: <AANLkTilwZNeViddUi29oTxOxtFnh_rreI4I0drPbNQC2@mail.gmail.com>
From: s hakkesteegt <brandhetlampje@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: brandhetlampje@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: angstrom-version.bb broken: lsb_release: No such file or directory
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
X-List-Received-Date: Wed, 30 Jun 2010 13:41:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 30, 2010 at 3:28 PM, Jay Snyder
<jay.snyder@tycoelectronics.com>wrote:

> This recipe was committed without a required file.
>
> Sometime the following lines where added to this bb:
>
>
> SRC_URI = "file://lsb_release"
>
> install -m 0755 ${WORKDIR}/lsb_release ${D}${bindir}/
>
>
> But the file lsb_release wasn't added to the git repository.
>
> This, of course has broken the angstrom build.
>


http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/angstrom/angstrom-version/lsb_release

It seems to be in the right place?

regards,
Siebren

