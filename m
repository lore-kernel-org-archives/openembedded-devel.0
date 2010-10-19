Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P8GW4-00041s-DD
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 20:02:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 3422F3149E3A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 20:01:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id CE-5J+1R1Cxm
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 20:01:49 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id D54433149151
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 20:01:49 +0200 (CEST)
Message-ID: <4CBDDD0D.1080303@opendreambox.org>
Date: Tue, 19 Oct 2010 20:01:49 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287353716-27717-1-git-send-email-obi@opendreambox.org>	<i9gsjn$8r0$3@dough.gmane.org>	<4CBC1FBE.9020808@opendreambox.org>	<i9h8mg$sg1$1@dough.gmane.org>
	<4CBC3255.3040007@opendreambox.org>
In-Reply-To: <4CBC3255.3040007@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] update lib_package.bbclass
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
X-List-Received-Date: Tue, 19 Oct 2010 18:02:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/18/2010 01:41 PM, Andreas Oberritter wrote:
> On 10/18/2010 12:48 PM, Koen Kooi wrote:
>>
>> Well, .a files are supposed to go into -static, not into -dev.
>>

[...]

> The problem was that I trusted lib_package to do the right thing. So the
> real fix would be to add a -static package to lib_package.bbclass and to
> add RDEPENDS_${PN}-static += "${PN}-dev" somewhere, because static libs
> don't make much sense without develompent headers, right?
> 
> Of course, this would create a different problem with upgrades, but I
> would suspect that the number of users of static libraries on their
> target machines is relatively small and, because a disappearing static
> library doesn't create runtime problems, the installation of a new
> -static package wouldn't impose a huge burden to the user.
> 
> In case this solution was accepted: What's the policy for changing files
> like lib_package.bbclass, in order to trigger an update of all relevant
> packages? To bump every single PR?

I looked deeper into lib_package.bbclass and its history and I saw that
it wasn't updated very often during the last years. It still uses
hardcoded paths and doesn't include some files which would get packaged
without lib_package.bbclass.

What lib_package.bbclass does now, compared to the defaults from
bitbake.conf:

1.) It adds ${libdir}/*.a and /lib/*.a to FILES_${PN}-dev.

2.) It adds ${bindir}/*-config to FILES_${PN}-dev.

3.) It creates an additional package ${PN}-bin, which contains all other
executables: ${bindir}/* ${sbindir}/* /bin/* /sbin/*

4.) It doesn't package any of the following:
            ${datadir}/pixmaps ${datadir}/applications \
            ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
            ${libdir}/bonobo/servers

In f624db1d3c7de3fcb3a9e76d388a8f9f8fedcf5c, Koen introduced
${PN}-static packages, but lib_package.bbclass has not been updated
since then, which was one year ago.

Although it packages ${bindir}/*-config into FILES_${PN}-dev, it does
not include the required mangling applied by binconfig.bbclass. I think
that's wrong and just causes unnecessary confusion. IMO, lib_package
should either inherit binconfig or not, but leave FILES_${PN}-dev
untouched in any case.

Leaving FILES_${PN}-dev untouched would also allow lib_package to
automatically inherit some updates from bitbake.conf and to create
non-empty ${PN}-static packages.

I don't know whether #4 should be changed or whether those directories
were left out on purpose.

So, my current proposal looks like this:

-
inherit binconfig	# ... or not

PACKAGES += "${PN}-bin"

FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
            ${base_libdir}/*${SOLIBS} \
            ${datadir}/${PN} ${libdir}/${PN}/*"

FILES_${PN}-bin = "${bindir}/* ${sbindir}/* \
                ${base_bindir}/* ${base_sbindir}/*"
-

Any opinions?

Regards,
Andreas


