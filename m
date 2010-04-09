Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1O0Emk-0006cw-9C
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 16:02:14 +0200
Received: by wwb13 with SMTP id 13so908712wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 06:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=X2CqUlSB4BThJuMkOFHu7/mHx85zIUi3pb4OdUuzagI=;
	b=lymYt4O6pIOF8VsRlDufeKtlixkaY4ouscqxJrxmVt/idzcAuEPuekq6kqMswhySP1
	mRn1hpAZv72iZ3XEGb7crHwP/AxjflyjneYr/fkz+b8mRTqZkDKOJ5CwIE7oaP1IhbcP
	kaKc/Kk/42R39tUJ0AMcBlsxQ1RJM+U57NHtw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FrD7h6d8COK+IUAnJIdLYGGEt22jjZ014GeaMlQ6smXSxQ0b8DxVAivgL4v0fkQpz+
	d42KL7k1Izj2o5eK0wRyGfGWvtaLaZ8LukhJbCJz50DDNrAF5gCDsDcIXhIlkTDg20tB
	yIp7TYNdvnMFmo/BU+qRgVb+j4QcCyqn4yT8U=
MIME-Version: 1.0
Received: by 10.216.169.77 with HTTP; Fri, 9 Apr 2010 06:58:48 -0700 (PDT)
In-Reply-To: <201004091526.53400.khimov@altell.ru>
References: <r2u48239d391004090326qb2a80dd6ic11530d737c6edde@mail.gmail.com>
	<201004091439.53806.khimov@altell.ru>
	<k2j48239d391004090353mcc7c01a0o4bc58d8c1efd5c27@mail.gmail.com>
	<201004091526.53400.khimov@altell.ru>
Date: Fri, 9 Apr 2010 17:58:48 +0400
Received: by 10.216.182.142 with SMTP id o14mr46999wem.146.1270821528441; Fri, 
	09 Apr 2010 06:58:48 -0700 (PDT)
Message-ID: <q2r48239d391004090658m577b6d71vcde72629078be670@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: postinst scripts and opkg configure
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
X-List-Received-Date: Fri, 09 Apr 2010 14:02:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> Actually, update-rc.d scripts should work on build host (that "$OPT" in script
> is exactly for that purpose) and so are update-alternatives (thanks to
> OPKG_OFFLINE_ROOT magic), so there might be something wrong with your setup.
I found the reason for that error - update-rc.d is not being staged,
so scripts fail.
bitbake update-rc.d update-rc.d-native -c rebuild doesn't help either.
Can't see why, because copying it from workdir to staging bin fixes
this problem.
Any ideas?

S.


