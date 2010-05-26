Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OHEjC-0008Fc-Jz
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 13:30:25 +0200
Received: by gya1 with SMTP id 1so2133596gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 04:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Nrvt5V53yGUcmiEwjc4q73YnWZapgy0slzxljZEj/tA=;
	b=xMXNBmGb2PMcQ97oPSBIBShV1DYJWW4GvjPx3wEvVw7zKORgjJNPViH7LFYq2dhVJN
	ZdkF7Poig1eJUT4mBB3yEsb3imV9F+E3nV1/X1qjUDyLczBfRC7zuMyNjSuiVjyEb1mo
	oC+oikGscNSNZhFIaxW0dsY/rc00c5eKdm9qM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=nJn2ehGavGEG9qNRKC7LeeGtSTpH0kS6T1l2MPrR1Xh57j8oRDcoXcFGvDeQgFQT0Y
	XUx9q2OUuB6v+O34XhCpC+LHRgp/szHlK0xmVD1QBmA/ZGVyRLb5l15GaGONx5LY1PDe
	8RPn3XjykA/tVGQ5nemvgkMVx7Rny8XVkROeM=
Received: by 10.231.149.12 with SMTP id r12mr2449927ibv.57.1274872841178; Wed, 
	26 May 2010 04:20:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.30.67 with HTTP; Wed, 26 May 2010 04:20:21 -0700 (PDT)
In-Reply-To: <1274869581.6382.27.camel@mill.internal.reciva.com>
References: <1274859584-8442-1-git-send-email-raj.khem@gmail.com> 
	<1274863471.6452.54.camel@lenovo.internal.reciva.com>
	<AANLkTilPhweXZYpmrBRRlW5uHJazro_WcZ5k1C10KqXN@mail.gmail.com> 
	<1274869581.6382.27.camel@mill.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 May 2010 04:20:21 -0700
Message-ID: <AANLkTimvCkUCUWKoYhjOvNF79wZbwYphZYvOmX6KMCsl@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sanity.bbclass: Barf if TMPDIR has trailing forward slash
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
X-List-Received-Date: Wed, 26 May 2010 11:36:47 -0000
X-List-Received-Date: Wed, 26 May 2010 11:36:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2010 at 3:26 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2010-05-26 at 02:12 -0700, Khem Raj wrote:
>> Yes I thought about it but did not know where to start.
>> I guess that would be bitbake which has to quickly remove the trailing
>> space just after parsing
>> in TMPDIR before it gets expanded into other parts of metadata. would
>> it be OK for bitbake to treat TMPDIR special ? or may be bitbake
>> should just get rid of more than one slashes in dir paths as a whole.
>> when concatenating two paths it should merge the slashes may be.
>
> I'm not sure that bitbake itself ought to be taking any special action.
> Which piece of code is it that chokes on the extra slashes, exactly?
> Can that not be fixed? =A0POSIX is fairly clear that multiple slashes are
> allowed in pathnames so anything that doesn't work with them seems like
> it must be broken.

autotools_prepackage_lamangler () in classes/autotools.bbclass.
see http://www.mail-archive.com/angstrom-distro-devel@linuxtogo.org/msg0292=
2.html
for more details. Thats one known case so far.

Thx
-Khem


