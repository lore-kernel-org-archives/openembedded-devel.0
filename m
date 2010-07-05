Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OVZiG-000714-Tm
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jul 2010 02:39:15 +0200
Received: by iwn34 with SMTP id 34so5016098iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jul 2010 17:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=oZrEea8Knq6VqX3C0NZSBKWvEjGAYVN1//OyYSO3gok=;
	b=j757p2R87+BAe00cMpZyaWMDKCKSJhmz5qb0u9vBmypudS7nz7hIxnAt+V9wkN6qd+
	WfyAt6p07JAmAp22xzHRJC4m1RL0rZyTRFtJVuRXQfwx4/TdxbRThmZGg3gwSMrYpXzW
	sCylREnfsN+HOmjsixfQBCSkahMXQmvRMYkPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=io3jXQxjx/KwyfbQgOGEQUAUmc80bHuA+NWgDRdwOqveyTwNYvopnfbQMLniG9LTbw
	NA6xzzvi9VPFU34Zzy2YmvDbTrZnKjNmRnyb3BjvEUroMi/3rb1MBWcvmLUxkaiwVTq0
	vlHdzBul0OwrjOllhulRi7S/21K6WcwZ2N8wA=
Received: by 10.231.13.65 with SMTP id b1mr2485990iba.185.1278290059453; Sun, 
	04 Jul 2010 17:34:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Sun, 4 Jul 2010 17:33:59 -0700 (PDT)
In-Reply-To: <4C30FDBB.2090900@station51.net>
References: <4C2CE2E6.3050708@station51.net> <4C3092C5.5060606@station51.net> 
	<AANLkTil9SMIAhB8Z7wEJ8uzgIT0aVpbK8R6CNgKzc6mu@mail.gmail.com> 
	<4C30FDBB.2090900@station51.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Jul 2010 17:33:59 -0700
Message-ID: <AANLkTimAw443ZvzI1_ukdZIPq1zz0zSDFI4y2zO_O4gf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenLDAP 2.4.21. doesn't create packages
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
X-List-Received-Date: Mon, 05 Jul 2010 00:39:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 4, 2010 at 2:31 PM, Bill Sargent <butters@station51.net> wrote:
> =A0On 7/4/2010 7:58 PM, Khem Raj wrote:
>>
>> suppose your image is console-image then you can add something like
>> below to your local.conf
>>
>> IMAGE_INSTALL_append_pn-console-image =3D " libldap-2.4-slapd
>> libldap-2.4-bin"
>>
>>
>>
>
> I get this:
>
> ERROR: [/home/bill/oe/openembedded/recipes/images/console-image.bb]
> RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
> 'libldap-2.4-slapd' but it wasn't found in any PACKAGE or RPROVIDES
> variables.
> NOTE: Runtime target libldap-2.4-slapd =A0is unbuildable, removing ...
> Missing or unbuildable dependency chain was: [libldap-2.4-slapd]
> ERROR: Required build target 'console-image=E4 has no buildable providers=
.
> Missing or unbuilding depenency chain was: [console-image,
> libldap-2.4-slapd]

well I guess you need openldap-slapd instead of libldap-2.4-slapd and
same for other packages

-Khem


