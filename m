Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OlyE8-0000T4-KS
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 08:03:50 +0200
Received: by iwn38 with SMTP id 38so1450537iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 23:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=NEk5URJnj4q8+PpIlYlhT9Sh2RZqp/s8n6XwOBr8lI8=;
	b=szlHEB0W76pbbiJE0kWhCLXFgf8y9YTlS2+Z4PMoqOmpO16zcqHVzsAIUgbdLOntwC
	gZQWuJnROM5naSZ0pm5dzFLjOy6R4iYDfSqvv/VkWJFtcVPtMAok2SGsQFhxHQpDsvsY
	RJ1PhwM7p/z2wGpnyq8En75GveniRyhbYGx84=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=b0k6aigbQH+BySf4JG4TyYD59ewLB76AjoZw+BYzOxq01YkMzmuO7wrn741Rj05Igp
	l5PI6HymbcVctb+OzUhqIYWTjtunKF06PfGKEcnvZnUsF/hTAKSpyFa+8mBhLL5CXd9t
	oa4NOsJTk5cMNe0QXNi37pHdf5haTyQqoqOBM=
Received: by 10.231.183.81 with SMTP id cf17mr10828554ibb.32.1282197806482;
	Wed, 18 Aug 2010 23:03:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Wed, 18 Aug 2010 23:02:59 -0700 (PDT)
In-Reply-To: <AANLkTiktUAR5vEATH0ZoeOLHcM0zJf4i3oCXqpyJfZnd@mail.gmail.com>
References: <AANLkTiktUAR5vEATH0ZoeOLHcM0zJf4i3oCXqpyJfZnd@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Aug 2010 23:02:59 -0700
Message-ID: <AANLkTi=jJL-sjcN1eOmFaj1JUro5cPja7Ps0iQ+mbn-9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: tinderbox packages
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
X-List-Received-Date: Thu, 19 Aug 2010 06:03:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 18, 2010 at 10:37 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> In my dir I have these bb files:
> docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
> docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
> docbook-sgml-dtd/docbook-sgml-dtd-4.4-native.bb
> docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
>
> However tinderbox only shows the first one in the list of packages.
> Does this mean the other ones are never build?
> Or does something need to be done to add them to tinderbox?
> Or is this a bug ?
>

we may not have them in DEPENDS but they will be needed in docbook
document generation.
the formats are different. see bus-java/dbus-java_2.5.1.bb needs 4.1
but 4.4 and 4.5 looks
not used thus far but they are later versions so I would intend to
keep them for future use


> Any wiz around who can shed a light?
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


