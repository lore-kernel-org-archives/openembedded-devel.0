Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMqkL-0003Vm-Ek
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 01:01:14 +0200
Received: by iwn39 with SMTP id 39so500399iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 15:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=m0/JsqafKaKLGLpI1zJZcjKyBAbEZkAXLcmUONBiXb4=;
	b=CM/yd5STLeIXRl8WSDnfDFU7bZ7jMYGZ6iNcjMi+CQ1NLzqbp6zAExhSviOwR7Cs4O
	+kSg1pIO4cdQH9CBcTw1Ouqx+cCRDWtFg+jrwbrrvTleAVhhy+TUYhZFERIKIQ0kYxof
	35u6ZK9GaQOt58bJ0G8mNppSIKSD/aHcfv8l8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=uys2n8lAxFq1Z/81NsbHOmaJW0UO40Aju7CgjTnBMq6H+9tb24xgW5dskgOXneaPsq
	sYU3hEMmZ8m2jbQjywhcbyGX/4TC3mgMPYIx9/gCrqSBMfUByvnPKsCedU7jFZPr0lSM
	yP3+NLBJFX3qhBLYibagrnC3Wc4KXGQ2BoRKI=
Received: by 10.231.194.196 with SMTP id dz4mr836778ibb.66.1276210610906; Thu, 
	10 Jun 2010 15:56:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Thu, 10 Jun 2010 15:56:30 -0700 (PDT)
In-Reply-To: <AANLkTinAFdiBJ6jN3WwY75KsNwTPmkyoOL0iTgJ8UPFC@mail.gmail.com>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com> 
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com> 
	<AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com> 
	<1276201371.13179.20.camel@lenovo.internal.reciva.com>
	<AANLkTinAFdiBJ6jN3WwY75KsNwTPmkyoOL0iTgJ8UPFC@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jun 2010 15:56:30 -0700
Message-ID: <AANLkTineM41WJ4f65imRWGkml5-dbdFvHG842UlYkgUQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Thu, 10 Jun 2010 23:01:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2010 at 1:27 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Thu, Jun 10, 2010 at 1:22 PM, Phil Blundell <philb@gnu.org> wrote:
>
>> On Thu, 2010-06-10 at 12:55 -0700, Chris Larson wrote:
>> > Should this (ipv6 at least) use COMBINED_FEATURES, since it requires
>> > kernel/machine support for it to be useful, along with distro support?
>>
>> I don't think it's machine dependent in any meaningful way; there is, to
>> my knowledge, no OE-supported hardware which is actually incapable of
>> supporting ipv6. =A0Any distro that wants to use it just needs to make
>> sure that the kernel support is present (either built-in or as a module)
>> on all the supported targets. =A0In any case, most packages will cope
>> gracefully with ipv6 being selected on in the configuration and then
>> found to be absent at runtime.
>>
>> If you start factoring MACHINE_FEATURES into that kind of decision then,
>> logically, the package needs to have PACKAGE_ARCH=3D${MACHINE}. =A0I don=
't
>> think it would be a very good thing to start forcing packages down that
>> path unnecessarily.
>
>
> Fair enough, that seems reasonable for this particular case. =A0Now that =
you
> bring it up, we adjust package arch to machine when we use a machine
> specific file:// file, but maybe we need to teach it to check for referen=
ces
> to MACHINE_FEATURES or COMBINED_FEATURES, somehow.

will it force recompile then if I choose a similar arch but different
machine say (qemuarm, osk5912 both are armv5te)

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


