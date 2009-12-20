Received: from vs148181.vserver.de ([62.75.148.181])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Florian.Mayer@mayer-electronics.de>)
	id 1NMMgt-00005z-3s for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 15:23:26 +0100
Received: from [62.224.48.196] (helo=[192.168.100.22])
	by vs148181.vserver.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <Florian.Mayer@mayer-electronics.de>)
	id 1NMMf7-0000S7-Tr for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 14:21:34 +0000
Message-ID: <4B2E32E7.8020702@mayer-electronics.de>
Date: Sun, 20 Dec 2009 15:21:27 +0100
From: "Florian Mayer (Mayer Electronics)" <Florian.Mayer@mayer-electronics.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B2B7131.6020604@mayer-electronics.de>	<4B2D3E19.6010402@mayer-electronics.de>
	<200912192350.39349.marcin@juszkiewicz.com.pl>
In-Reply-To: <200912192350.39349.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 62.75.148.181
X-SA-Exim-Mail-From: Florian.Mayer@mayer-electronics.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: init becomes a zombie process on ARM device
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
X-List-Received-Date: Sun, 20 Dec 2009 14:23:26 -0000
X-Groupsio-MsgNum: 15143
Content-Type: multipart/mixed; boundary="------------040504030403090400000608"

--------------040504030403090400000608
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit

Marcin Juszkiewicz schrieb:
> Dnia sobota, 19 grudnia 2009 o 21:56:57 Florian Mayer (Mayer Electronics) 
> napisa³(a):
>   
>> I found out why the system behaves such strange (thanks to Florian Boor 
>> for pulling me in the right direction). In my constellation thumb 
>> interworking does not work. glibc is arm compiled, the rest is thumb 
>> format. To test it I added
>>
>> ARM_INSTRUCTION_SET="arm"
>> THUMB_INTERWORK="no"
>>
>> to my machine configuration. But that did not help!
>>
>> Both variables are overwritten in 
>> openembedded/conf/dist/include/angstrom.inc. So I commented it out in 
>> that file and voila, the result boots correctly. Is there a more elegant 
>> way to solve this? Perhaps allow to configure this in the machine conf?
>>     
>
> Start using OE to build your kernel and let your kernel recipe use linux.inc 
> file. This will automatically enable Thumb support for your ARM cpu and 
> Angstrom will start working without those hacks. 
>
>
> Regards, 
>   
Thank you for the tip with using linux.inc That works now.


--------------040504030403090400000608
Content-Type: text/x-vcard; charset=utf-8;
 name="Florian_Mayer.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Florian_Mayer.vcf"

begin:vcard
fn:Florian Mayer (Mayer Electronics)
n:Mayer;Florian
adr:;;Hohenzollernstr. 20;Messkirch;;88605;Deutschland
email;internet:Florian.Mayer@mayer-electronics.de
title:Dipl. Ing. (BA)
tel;work:++49 (0) 7575/924940
tel;cell:++49 (0) 176/22209624
version:2.1
end:vcard


--------------040504030403090400000608--
