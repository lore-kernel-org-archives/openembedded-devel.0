Received: from [209.85.132.242] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1J3X6r-00069Z-9L
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2007 14:31:19 +0100
Received: by an-out-0708.google.com with SMTP id b33so356741ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2007 05:26:40 -0800 (PST)
Received: by 10.100.241.17 with SMTP id o17mr9637444anh.21.1197725200152;
	Sat, 15 Dec 2007 05:26:40 -0800 (PST)
Received: by 10.90.29.19 with HTTP; Sat, 15 Dec 2007 05:26:40 -0800 (PST)
Message-ID: <c384c5ea0712150526i2a8147c5ud43b5e79c52a7feb@mail.gmail.com>
Date: Sat, 15 Dec 2007 14:26:40 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <164348748.20071215043923@gmail.com>
MIME-Version: 1.0
References: <164348748.20071215043923@gmail.com>
Subject: Re: [RFC] ANGSTROM_MODE -> SYSTYPE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Dec 2007 13:31:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On Dec 15, 2007 3:39 AM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
>    ANGSTROM_MODE config variable has proven to be very useful and
> successful feature during the Angstrom evolution. IMHO, it is worth
> generalization of its meaning and naming to become a generic
> additional OE distro configuration parameter. So, I'd like to propose
> it to be renamed to SYSTYPE, with the description "Select particular
> system variant of a distribution which supports such feature, e.g.,
> underlying libc type."
>
NAK on the name and the combination with other settings:

>   Obviously, it wouldn't be limited to libc type, but intended to be a
> generic sub-parameter of a distro, it could be debug/release type,
> size type (minimal/standard/extended), whatever. The usage idea is to
>
C library selection is mostly orthogonal from the
debug/profile/test/release/whatever type.
Also, C library selection is mostly orthogonal from the size type (in
fact, that's a target, not
a property of it).

> have standard name for such generic parameter, plus semantically it
> should be expected that a distro allows to build different SYSTYPE's
> side-by-side in the same build dir (like Angstrom does for libc
> variants).
>
*If* you want to go for this, I would propose DISTRO_LIBC instead and
NOT mix this with any other settings, which are orthogonal and mostly
unrelated.

(I.e. the fact that I want to profile my image, is independent on
whether I built with eglibc or glibc).

Also, I agree with Koen that we then end up in the situation where
people may assume this flag is always respected, while it's dependent
on the distro.

-1 for the proposal

+0 for the making DISTRO_LIBC a global C library selector.

Regards,
-- 
Leon


