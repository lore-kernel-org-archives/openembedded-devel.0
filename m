Received: from [74.125.44.153] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M52ka-0002oC-6n
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 21:07:20 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1194219yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2PxpRFMDH93ShyMlkIVz44Fwq0sLixCx8u08GxxGCos=;
	b=lInbQBBx9336NeSQf/zqfsk6ezuO1pDa1AdKjgr+ZX7uLx+gPEf/gvDTVkHbTewLws
	bMYEjdpJt5dTNmDD2OHtTF2P4I5TSfx5vWrPn6fBQlz4y5C52S+R76/mmMbrXThpgRR3
	i3t91QIGA+SqvNq1Qh/UH6Q4wskhocoqVanks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kDbeMr0Ekglobik1/RBN67fG08bLLTVetlb8UuZEQcg/tcvaBuucH2UvqYywHWIYML
	Yf52Ybfaqb0doWOazJTY5QT5WaOT3pZdoPo9ONQdSYeOHIIVKc4P2ScvkEK63xQXebtp
	mVpELzfbevoCJkrCzDEvU4CnbWerWP/KFLNyo=
MIME-Version: 1.0
Received: by 10.150.53.20 with SMTP id b20mr6420763yba.271.1242414021742; Fri, 
	15 May 2009 12:00:21 -0700 (PDT)
In-Reply-To: <6C2434209962DC46B88345CA85C334A240C119E053@Courier.syntech.org>
References: <6C2434209962DC46B88345CA85C334A240C119E053@Courier.syntech.org>
Date: Fri, 15 May 2009 15:00:21 -0400
Message-ID: <f96d234e0905151200l59bf337dwa8f3e4c1f1462c87@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: minimo: task do_configure failed
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
X-List-Received-Date: Fri, 15 May 2009 19:07:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Fri, May 15, 2009 at 12:28 PM, Mark Butsch
<mbutsch@syntech-fuelmaster.com> wrote:
> Hello,
>
> I asked this question back in March but never saw a response.
>
> I am trying to build minimo (angstrom distro) and it is failing in do_configure.

I'll try a build for a i686 machine and see what happens here.


> For my education, what are 'build', 'host' and 'target' referring to in this case?

http://www.gnu.org/software/autoconf/manual/autoconf.html#Manual-Configuration

--build=build-type the type of system on which the package is being
configured and compiled. It defaults to the result of running
config.guess.
--host=host-type the type of system on which the package runs. By
default it is the same as the build machine. Specifying it enables the
cross-compilation mode.
--target=target-type the type of system for which any compiler tools
in the package produce code (rarely needed). By default, it is the
same as host.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


