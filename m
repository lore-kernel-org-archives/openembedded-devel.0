Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9OVb-0008Eu-1T
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 22:46:40 +0200
Received: by ywa8 with SMTP id 8so1094456ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=2fEzud/vfq4ZVA+d0EgwqXcJWwvRfaFyqQ9Ol2BggwQ=;
	b=IAI5ey17EU2ZigruoXRh/ZUosRhszs8KIgN+Eo4q0gNOp1CL+vLLwvbWD0MaL0UJn+
	Z31AdEZzkpOWgRKK9kaH022TFD6QVpynNXo7rM8EPYHRFaMYUpct8PHgxOd1k4P6K+IG
	OoLDoc4403P5XnHMSQi23rpKTWxEt4QTVRX9w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=AphOBPy7fiV43IRvPWJzsv73TW9FuTUWeFurzVq3/yULFymwHMSNOEIKJyVKcehARV
	BOHN0XEUB4S42SOXU8l3Dqv9bDhA/TYoG8+NlvXnV8lmc8otMv/dKi+qw0xCSP/tnXPe
	QfnnLrozQlIb/w1kdjtpMCLeXCKnptQAXwc2Q=
Received: by 10.42.171.10 with SMTP id h10mr2451415icz.458.1287780360196; Fri,
	22 Oct 2010 13:46:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Fri, 22 Oct 2010 13:45:40 -0700 (PDT)
In-Reply-To: <20101022064239.GB3527@jama>
References: <4CC04756.2020004@nedap.com> <4CC13039.4020002@nedap.com>
	<20101022064239.GB3527@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Oct 2010 13:45:40 -0700
Message-ID: <AANLkTikh_HJ9JMvn_AQ2vseERS2jTgiAhpd=EE+57Xys@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building cacaoh-native
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
X-List-Received-Date: Fri, 22 Oct 2010 20:46:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2010 at 11:42 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Fri, Oct 22, 2010 at 08:33:29AM +0200, Jaap de Jong wrote:
>> The same applies for cacaoh-openjdk-native.inc and probably also for
>> cacaoh-cldc-native_0.98.bb
>> Patch will be:
>
> Can you send it as proper patch?

this time I did a manual import as we needed this patch next time
I will ignore patches which can not be applied straight away.

 Also please for previous cacaoh-native
> patch.
>
> http://wiki.openembedded.net/index.php/How_to_submit_a_patch_for_dummies
>
> BTW: are you using libtool-2.4 or old libtool-2.2.6b? Because I
> see this only since using libtool-2.4 and someone should check that this
> patch wont break build for people using 2.2.6b.
>

Works ok with both libtools.

> Regards,
>
> --
> Martin 'JaMa' Jansa =C2=A0 =C2=A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


