Received: from exprod5og112.obsmtp.com ([64.18.0.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NpN1Z-00036y-87
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 15:36:41 +0100
Received: from source ([12.71.149.1]) (using TLSv1) by
	exprod5ob112.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5etxBFhrt8BbuRG8t2pfdBVo07OLu0v@postini.com;
	Wed, 10 Mar 2010 06:33:42 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip04.e2k.ad.ge.com with ESMTP; 10 Mar 2010 09:33:40 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 10 Mar 2010 09:33:35 -0500
Message-ID: <4B97AE80.5090409@ge.com>
Date: Wed, 10 Mar 2010 14:36:48 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100310135425.31263.61632.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<201003101508.35525.marcin@juszkiewicz.com.pl>
In-Reply-To: <201003101508.35525.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 64.18.0.24
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale P2020DS Demo Board
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
X-List-Received-Date: Wed, 10 Mar 2010 14:36:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Marcin Juszkiewicz wrote:
> Dnia środa, 10 marca 2010 o 14:54:25 Martyn Welch napisał(a):
>   
>> --- a/recipes/linux/linux_2.6.33.bb
>> +++ b/recipes/linux/linux_2.6.33.bb
>> @@ -2,9 +2,14 @@ require linux.inc
>>  
>>  # Mark archs/machines that this kernel supports
>>  DEFAULT_PREFERENCE = "-1"
>> +DEFAULT_PREFERENCE_p2020ds = "1"
>>  
>>  SRC_URI =
>> "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=kernel \
>> file://defconfig"
>>  
>>  SRC_URI[kernel.md5sum] = "c3883760b18d50e8d78819c54d579b00"
>>  SRC_URI[kernel.sha256sum] =
>> "63e237de3b3c4c46a21833b9ce7e20574548d52dabbd1a8bf376041e4455d5c6" +
>> +do_configure_p2020ds() {
>> +       oe_runmake mpc85xx_defconfig
>> +}
>>     
>
> OE policy is to keep defconfig inside of OE tree. Please add mpc85xx_defconfig 
> as recipes/linux/linux-2.6.33/p2020ds/defconfig and resubmit.
>   

Will do. Out of interest, what's the rationale for this?

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



