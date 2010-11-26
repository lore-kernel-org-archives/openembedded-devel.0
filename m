Received: from ns1.gatteins.it ([193.58.239.94])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matteo.facchinetti@sirius-es.it>) id 1PM1F6-0000Im-HT
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 17:33:48 +0100
X-Virus-Scanned: amavisd-new at gattei.com
Received: from [10.16.100.80] (89-96-49-192.ip10.fastwebnet.it [89.96.49.192])
	by ns1.gatteins.it (Postfix) with ESMTPA id 29BC4DEF26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 17:32:42 +0100 (MET)
Message-ID: <4CEFE120.2040701@sirius-es.it>
Date: Fri, 26 Nov 2010 17:32:32 +0100
From: Matteo Facchinetti <matteo.facchinetti@sirius-es.it>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290787158-26726-1-git-send-email-matteo.facchinetti@sirius-es.it>
In-Reply-To: <1290787158-26726-1-git-send-email-matteo.facchinetti@sirius-es.it>
X-SA-Exim-Connect-IP: 193.58.239.94
X-SA-Exim-Mail-From: matteo.facchinetti@sirius-es.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sysvinit_2.86.bb: add possibility to use USB Serial Console with only rx/tx.
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
X-List-Received-Date: Fri, 26 Nov 2010 16:33:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry at all list... I made another error making this pach.




On 11/26/2010 04:59 PM, matteo.facchinetti@sirius-es.it wrote:
> From: Matteo Facchinetti<engineering@sirius-es.it>
>
> There are many evaluationboard that use mini-usb port like as
> a serial port + power supply. Using it as serial console have
> to force getty with no need for carrier detect.
> ---
>   recipes/sysvinit/sysvinit_2.86.bb |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/sysvinit/sysvinit_2.86.bb b/recipes/sysvinit/sysvinit_2.86.bb
> index 6ab5290..c34cbc9 100644
> --- a/recipes/sysvinit/sysvinit_2.86.bb
> +++ b/recipes/sysvinit/sysvinit_2.86.bb
> @@ -65,6 +65,11 @@ do_install () {
>   	install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
>   	if [ ! -z "${SERIAL_CONSOLE}" ]; then
>   		echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}">>  ${D}${sysconfdir}/inittab
> +	else
> +		
> +		if [ ! -z "${USB_SERIAL_CONSOLE}" ]; then
> +			echo "S:2345:respawn:${base_sbindir}/getty -L ${USB_SERIAL_CONSOLE}">>  ${D}${sysconfdir}/inittab
> +		fi
>   	fi
>   	if [ "${USE_VT}" = "1" ]; then
>   		cat<<EOF>>${D}${sysconfdir}/inittab
>    



