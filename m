Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1J3Wv3-0001Kt-AR
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2007 14:19:05 +0100
Received: by an-out-0708.google.com with SMTP id b33so356077ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2007 05:14:28 -0800 (PST)
Received: by 10.100.251.5 with SMTP id y5mr1085333anh.75.1197724468089;
	Sat, 15 Dec 2007 05:14:28 -0800 (PST)
Received: by 10.90.29.19 with HTTP; Sat, 15 Dec 2007 05:14:28 -0800 (PST)
Message-ID: <c384c5ea0712150514k6511e6d2j1d1ce3061e78d6e2@mail.gmail.com>
Date: Sat, 15 Dec 2007 14:14:28 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4762E496.1040806@student.utwente.nl>
MIME-Version: 1.0
References: <4762095D.4060505@protium.com>
	<4762E496.1040806@student.utwente.nl>
Subject: Re: RFC: Renaming uboot-utils
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
X-List-Received-Date: Sat, 15 Dec 2007 13:19:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On Dec 14, 2007 9:16 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Andy Wilcox schreef:
> > Since uboot-utils builds a native binary (mkImage) it should really be
> > called uboot-utils-native.
>
> That part makes sense. FWIW, we already have a uboot-mkimage-native
> recipe in OE.
>
Also, consider u-boot-utils instead of uboot-utils. The project is
called u-boot and I thought I saw both namespaces appear in the u-boot
dir?
(If I'm too late, probably forget this).

Also +1 from me.

> > My motivation is (a) I'd really like to build a few tools from uboot
> > which are cross-compiled
>
> And now you're talking about uboot-utils-cross, not uboot-utils-native
>
Not necessarely.

Anything *-cross is a tool that is built for, and runs on one platform
and generates output for another.

Andy said a few tools which *are* cross-compiled, so he I think he
wants to cross-compile tools, which are deployed on the target and as
such do not generate output for another target.

u-boot-utils-cross would be a package that generates tools, of which
the output only can run on a target.

I think some of the tools in u-boot are cross tools, some are not, and
some are agnostic (the output from mkimage can be interpreted on any
host AFAIK).

Regards,

Leon.


