Received: from [212.227.126.177] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <robert@linuxdevelopment.de>) id 1Grbpx-0000Bk-9r
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Dec 2006 16:04:01 +0100
Received: from [84.155.135.48] (helo=[172.16.0.14])
	by mrelayeu.kundenserver.de (node=mrelayeu6) with ESMTP (Nemesis),
	id 0ML29c-1Grbp23wu7-0008UY; Tue, 05 Dec 2006 16:03:07 +0100
Message-ID: <45758A01.1030203@linuxdevelopment.de>
Date: Tue, 05 Dec 2006 16:02:25 +0100
From: =?ISO-8859-1?Q?Robert_W=F6rle?= <robert@linuxdevelopment.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; de-AT; rv:1.7.13) Gecko/20060411
X-Accept-Language: de, en
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <d46153c40612041402o2e1ed6fdmdd1a8fa8261d15ce@mail.gmail.com>	<432beae0612050150u64499772m14fefdeb8ccd6e2f@mail.gmail.com>
	<d46153c40612050629v8bdfcd2i32fa9858f916605f@mail.gmail.com>
In-Reply-To: <d46153c40612050629v8bdfcd2i32fa9858f916605f@mail.gmail.com>
X-Provags-ID: kundenserver.de abuse@kundenserver.de
	login:3a738c603c23670681f156cc7e748d26
Subject: Re: madwifi
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
X-List-Received-Date: Tue, 05 Dec 2006 15:04:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Dear Andrew

Is there a specific reason why you work with the .oz354 tree ?
This tree is old and i think not maintained anymore ,, ( people correct
me if am wrong )

Also that you miss tmp/work/ARCHITECURE directory tells me that you
should consider a
mtn update in order to sync your tree to the current state .. then
please use .dev tree .

btw : how is your compulab ?  we also evaluate it here and i am getting
good results also using the current .dev tree

rob_w
> Ok, I tried a few more things this morning, but I'm still getting
> errors.  Here's what I'm working with:
>
> OE Build Configuration:
> BB_VERSION     = "1.6.3"
> OE_REVISION    = "dbe2d7e445c33fd9403d6edaf6ec36d1857ada98"
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux"
> MACHINE        = "compulab-pxa270"
> DISTRO         = "generic"
> DISTRO_VERSION = ".dev-snapshot-20061205"
> TARGET_FPU     = "soft"
> I am using the .oz354x branch of OE.
>
> I first tried adding the following to my machine.conf file:
> BOOTSTRAP_EXTRA_RDEPENDS = "madwifi-ng"
> DEPENDS += "madwifi-ng"
>
> Which promptly broke my build with a circular dependency:
> ERROR: /stuff/org.openembedded.dev/packages/quilt/quilt-native_0.45.bb
> depends on itself (eventually)
> ERROR: upwards chain is: gpe-image (gpe-image) -> ipkg-native
> (ipkg-native) -> pkgconfig-native (pkgconfig-native) ->
> autoconf-native (autoconf-native) -> quilt-native (quilt-native) ->
> madwifi-ng (madwifi-ng) -> ipkg-utils-native (ipkg-utils-native)
>
> I then tried adding the following to my gpe-image.bb file:
> GPE_EXTRA_INSTALL += "madwifi-ng"
> DEPENDS += "madwifi-ng"
>
> I also tried a few combinations of adding madwifi-ng to
> GPE_EXTRA_INSTALL, DEPENDS, and RDEPENDS to gpe-image.bb to see if
> dumb luck would help ... it didn't.
>
> Other than the circular dependency error, I always get:
> ERROR: Nothing provides runtime dependency madwifi-ng
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>   



