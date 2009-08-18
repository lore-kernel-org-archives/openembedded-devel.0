Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MdPh0-0007SX-0r
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 16:29:42 +0200
Received: by ewy21 with SMTP id 21so3698504ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 07:12:36 -0700 (PDT)
Received: by 10.210.119.5 with SMTP id r5mr1673374ebc.50.1250604755864;
	Tue, 18 Aug 2009 07:12:35 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-242-65.zone7.bethere.co.uk
	[94.193.242.65])
	by mx.google.com with ESMTPS id 24sm19028eyx.53.2009.08.18.07.12.34
	(version=SSLv3 cipher=RC4-MD5); Tue, 18 Aug 2009 07:12:34 -0700 (PDT)
Message-ID: <4A8AB6C4.8040805@xora.org.uk>
Date: Tue, 18 Aug 2009 15:12:20 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
In-Reply-To: <6978a1740908180652y36467f0evcfc467153cf9ac64@mail.gmail.com>
Subject: Re: Create dir with 700 permissions from recipe
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
X-List-Received-Date: Tue, 18 Aug 2009 14:29:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

s hakkesteegt wrote:
> Hi,
>
> For a recipe I want to use locally to enable public key authentication on my
> images, I'm trying to create the .ssh dir with 700 permissions. But this
> doesn't seem to work. It ends up in the rootfs and in the ipk with 775
> permissions, although in the work dir it has the correct 700 permissions.
> This is the recipe I created:
>
>
> SRC_URI=" \
>                     file://authorized_keys \
>        "
>
> FILES_${PN}=" /home/root/.ssh \
>                        /home/root/.ssh/authorized_keys \
>            "
>
> do_install(){
>        install -m 0700 -d ${D}/home/root/.ssh
>        install -m 0600 ${WORKDIR}/authorized_keys
> ${D}/home/root/.ssh/authorized_keys
> }
>
>
> On irc was suggested to use postinst script. So I tried to add the next at
> the end of the recipe.:
>
>
> pkg_postinst_${PN}-chmodsshdir () {
>         chmod 700 /home/root/.ssh
> }
>
>   
You above recipe doesnt create a package called.

${PN}-chmodsshdir

you also need to add something like

if test "x$D" != "x"; then
    exit
fi

to the beginning of the postinst to stop it running during image creation.

Graeme



