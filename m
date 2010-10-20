Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P8WFr-00035R-Ae
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 12:50:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 25E2C3149F6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 12:50:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id HCk-7ictBib8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 12:50:07 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 882DC3149E6F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 12:50:07 +0200 (CEST)
Message-ID: <4CBEC95F.1000807@opendreambox.org>
Date: Wed, 20 Oct 2010 12:50:07 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287353716-27717-1-git-send-email-obi@opendreambox.org>	<i9gsjn$8r0$3@dough.gmane.org>	<4CBC1FBE.9020808@opendreambox.org>	<i9h8mg$sg1$1@dough.gmane.org>	<4CBC3255.3040007@opendreambox.org>	<4CBDDD0D.1080303@opendreambox.org>
	<i9m6q5$qme$1@dough.gmane.org>
In-Reply-To: <i9m6q5$qme$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] update lib_package.bbclass
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
X-List-Received-Date: Wed, 20 Oct 2010 10:50:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/20/2010 09:47 AM, Koen Kooi wrote:
> On 19-10-10 20:01, Andreas Oberritter wrote:
>> So, my current proposal looks like this:
> 
>> -
>> inherit binconfig	# ... or not
> 
>> PACKAGES += "${PN}-bin"
> 
>> FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
>>             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>>             ${base_libdir}/*${SOLIBS} \
>>             ${datadir}/${PN} ${libdir}/${PN}/*"
> 
>> FILES_${PN}-bin = "${bindir}/* ${sbindir}/* \
>>                 ${base_bindir}/* ${base_sbindir}/*"
>> -
> 
> 
> How about this one:
> 
> inherit binconfig
> 
> PACKAGES =+ "${PN}-bin"
> FILES_${PN}-bin = "${bindir}/* ${sbindir}/* \
>                    ${base_bindir}* ${base_sbindir}/*"
> 
> 
> Does that work for you?

This would package ${bindir}/*-config into -bin instead of -dev.

Regards,
Andreas


