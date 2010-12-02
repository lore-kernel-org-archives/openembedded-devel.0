Received: from ns1.gatteins.it ([193.58.239.94])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matteo.facchinetti@sirius-es.it>) id 1PO9Ni-0006UK-TE
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 14:39:31 +0100
X-Virus-Scanned: amavisd-new at gattei.com
Received: from [10.16.100.77] (89-96-49-192.ip10.fastwebnet.it [89.96.49.192])
	by ns1.gatteins.it (Postfix) with ESMTPA id 48DD1DEF26
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Dec 2010 14:38:20 +0100 (MET)
Message-ID: <4CF7A13D.2060309@sirius-es.it>
Date: Thu, 02 Dec 2010 14:38:05 +0100
From: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290790442-28006-1-git-send-email-matteo.facchinetti@sirius-es.it>
	<icoqf5$9n4$1@dough.gmane.org>
In-Reply-To: <icoqf5$9n4$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 193.58.239.94
X-SA-Exim-Mail-From: matteo.facchinetti@sirius-es.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sysvinit_2.86.bb: add possibility to use USB Serial Console with only rx/tx.
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
X-List-Received-Date: Thu, 02 Dec 2010 13:39:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

USB_SERIAL_CONSOLE is similar to SERIAL_CONSOLE but SERIAL_CONSOLE 
variabile isn't described too.

IMHO could be need to add a new paragraph describing all kind of CONSOLE 
available for machine conf file.

Where's the right place to add these variabiles in usermanual?



On 11/26/2010 06:23 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Where's the patch that adds this new var to the usermanual?
>
> On 26-11-10 17:54, matteo.facchinetti@sirius-es.it wrote:
>    
>> From: Matteo Facchinetti<engineering@sirius-es.it>
>>
>> There are many evaluationboard that use mini-usb port like as
>> a serial port + power supply. Using it as serial console have
>> to force getty with no need for carrier detect.
>>
>> Signed-off-by: Matteo Facchinetti<engineering@sirius-es.it>
>> ---
>>   recipes/sysvinit/sysvinit_2.86.bb |    5 +++++
>>   1 files changed, 5 insertions(+), 0 deletions(-)
>>
>> diff --git a/recipes/sysvinit/sysvinit_2.86.bb b/recipes/sysvinit/sysvinit_2.86.bb
>> index 6ab5290..c34cbc9 100644
>> --- a/recipes/sysvinit/sysvinit_2.86.bb
>> +++ b/recipes/sysvinit/sysvinit_2.86.bb
>> @@ -65,6 +65,11 @@ do_install () {
>>   	install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
>>   	if [ ! -z "${SERIAL_CONSOLE}" ]; then
>>   		echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}">>  ${D}${sysconfdir}/inittab
>> +	else
>> +		
>> +		if [ ! -z "${USB_SERIAL_CONSOLE}" ]; then
>> +			echo "S:2345:respawn:${base_sbindir}/getty -L ${USB_SERIAL_CONSOLE}">>  ${D}${sysconfdir}/inittab
>> +		fi
>>   	fi
>>   	if [ "${USE_VT}" = "1" ]; then
>>   		cat<<EOF>>${D}${sysconfdir}/inittab
>>      
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFM7+0kMkyGM64RGpERAtPZAKCSHvZA9Eko51AqkoVR476+5tWoIQCgr1/Z
> kxtr+B+5lfr+vqIxh6o5qGA=
> =JSd7
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>    



