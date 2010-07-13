Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OYYfW-0007w5-Qt
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 08:08:39 +0200
Received: by iwn34 with SMTP id 34so5596441iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 23:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=vqP0wA/cfccyM+Rbrgbo1G24/vIYeXGoRAdQVYY6Z0o=;
	b=e1YZL3NaLDS0mqKG9WjPrzsp7yAQS5zH2YULUvTD47CfovTmD+BgSY9BySm1abYblO
	b7fyKY8KEjKuKb+H3F8dVdBnlhF0tSdcJtCjwth2JoEU6BYj1mebJmw9hST6Y1bl57wP
	3ThHrsHmJsT6wUPc/kIJEx3zOC+u04PkuXkVc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=l6rZHSghHc8LD1OcaTC6aTp0u5Rv+3GNi+X0Cz3IT80K81oFqJuC3dC3y/UicVVyS7
	Q08OAlvs9he1FwP9hR/UTVJ49hq7oTp+j3NOtl9+UDyNM11D04qmEc6NBeDo9s/JmwkB
	8dF0KtNDQGWGPvJsp7cV1fnWVCQ9hVmfU5sAs=
Received: by 10.231.119.229 with SMTP id a37mr15126363ibr.169.1279001022173; 
	Mon, 12 Jul 2010 23:03:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.11.12 with HTTP; Mon, 12 Jul 2010 23:03:22 -0700 (PDT)
In-Reply-To: <113134CF306E8E4CACC27BE5937261B20931BF14A7@AUSX7MCPS303.AMER.DELL.COM>
References: <AcsiE3tIy8VpAAlrQiyyzbOb0c/t7w==>
	<113134CF306E8E4CACC27BE5937261B20931BF14A7@AUSX7MCPS303.AMER.DELL.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jul 2010 23:03:22 -0700
Message-ID: <AANLkTilaDl7gXH2rDTlpJEr52nJz2O9I6rKCzeFWmoLb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SSH configuration question.
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
X-List-Received-Date: Tue, 13 Jul 2010 06:08:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2010 at 3:42 PM,  <Sean_Hudson@dell.com> wrote:
> All,
>
> =A0What is the best way to update the configuration used to build SSH?
>
> =A0Specifically, I'd like to build SSH with pam enabled, however, the con=
figuration in the recipes/openssh/openssh.inc specifies "-without-pam".
>

in your case you could use DISTRO_FEATURE to check if pam is available
and set the option accordingly. something like below

EXTRA_OECONF +=3D ${@base_contains('DISTRO_FEATURES', 'pam',
'--with-pam', '--without-pam', d)


Thx
-Khem

> Regards,
> =A0 =A0 -Sean
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


