Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UDcEn-00077H-IS
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 15:56:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 3871031E42B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2013 15:33:05 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lZsx-uE07fzP
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2013 15:32:55 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.16.199])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id DBB2F31E42AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2013 15:32:54 +0100 (CET)
Message-ID: <5138A514.3080303@opendreambox.org>
Date: Thu, 07 Mar 2013 15:32:52 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1362662097-13544-1-git-send-email-obi@opendreambox.org>
	<20130307134831.GL32228@jama.dyndns-home.com>
In-Reply-To: <20130307134831.GL32228@jama.dyndns-home.com>
Subject: Re: [meta-oe][PATCH] samba: fix install for older samba versions
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
X-List-Received-Date: Thu, 07 Mar 2013 14:56:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07.03.2013 14:48, Martin Jansa wrote:
> On Thu, Mar 07, 2013 at 02:14:56PM +0100, Andreas Oberritter wrote:
>> * Samba 3.0 doesn't build libbss_*.so
> 
> libnss_*.so
> 
>> * base_sbindir may contain mount.cifs
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  meta-oe/recipes-connectivity/samba/samba.inc |    8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
>> index 3ee43ad..a151b16 100644
>> --- a/meta-oe/recipes-connectivity/samba/samba.inc
>> +++ b/meta-oe/recipes-connectivity/samba/samba.inc
>> @@ -87,10 +87,12 @@ do_install_append() {
>>  	install -d ${D}/var/spool/samba
>>  
>>  	# Install other stuff not installed by "make install"
>> -	install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so ${D}${libdir}/libnss_winbind.so.2
>> -	install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${libdir}/libnss_wins.so.2
>> +	if [ -d ${WORKDIR}/${PN}-${PV}/nsswitch ]; then
>> +		install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so ${D}${libdir}/libnss_winbind.so.2
>> +		install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${libdir}/libnss_wins.so.2
>> +	fi
> 
> It looks weird, but ${S}/../nsswitch won't be much better I guess.

Yes, that's what I thought, so I chose to keep it unchanged.

>> -	rmdir ${D}${base_sbindir}
>> +	rmdir ${D}${base_sbindir} || true
> 
> Maybe use
>               --ignore-fail-on-non-empty
> 
> instead of || true.

Thanks, I will send v2 shortly.

Regards,
Andreas



