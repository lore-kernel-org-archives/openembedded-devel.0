Received: from [195.238.6.171] (helo=mailrelay005.isp.belgacom.be)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jpa@mgb-tech.com>) id 1LSZRk-0005Jr-Ar
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jan 2009 17:08:52 +0100
X-Belgacom-Dynamic: yes
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ag4FAGpggUlbsllk/2dsb2JhbACBbssXhBAG
Received: from 100.89-178-91.adsl-dyn.isp.belgacom.be (HELO
	hermes.mgb-tech.com) ([91.178.89.100])
	by relay.skynet.be with ESMTP; 29 Jan 2009 17:01:08 +0100
Received: from [192.168.1.23] (gandalf.mgb-tech.com [192.168.1.23])
	by hermes.mgb-tech.com (Postfix) with ESMTP id D6CC3117FE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2009 21:39:56 +0100 (CET)
Message-ID: <4981D342.9090209@mgb-tech.com>
Date: Thu, 29 Jan 2009 17:03:14 +0100
From: Jan Pannecoeck <jpa@mgb-tech.com>
User-Agent: Thunderbird 2.0.0.19 (Windows/20081209)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4981B266.6010501@mgb-tech.com> <4981C586.4080202@gmx.net>
In-Reply-To: <4981C586.4080202@gmx.net>
Subject: Re: GNU Classpath and the XMPP Smack API
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
X-List-Received-Date: Thu, 29 Jan 2009 16:08:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Thansk for the reply, I've tried OpenJDK and Cacao before, but that was 
a little bit to adventures for me... :-) Maybe I'll try again later, if 
there really isn't a solution to get Smack working with GNU Classpath. 
So I'll wait a few days to see if someone here knows some solution ... I 
hope someone does! :-)

Jan Pannecoeck

Robert Schuster wrote:
> Hi,
>
> Jan Pannecoeck schrieb:
>   
>> As the subject is already telling you, I'm stuck trying to get the Smack
>> API working on my embedded device. The Smack library is written to
>> communicate using XMPP. I know already that smack is developed to work
>> under the Java Sun library, and that using GNU Classpath could cause
>> problems. But since they have managed to get it working at Android, with
>> the GNU Classpath, I think that it should be possible to run it also on
>> an OpenEmbedded device.
>>     
> Android is using Apache's JavaSE library called Harmony.
>
>
>   
>> I've got the latest version of the smack.jar that was patched for the
>> Android, but that still isn't working. I have had a bunch of different
>> errors like:
>>
>> - OEFException during the SSLSocket doHandshake method.
>> - KeyStoreException: jks during an SALSAuthentication
>>     
> First of all, the "Java Keystore" (jks) format isn't supported by GNU
> Classpath.
>
> Furthermore I know that SSL stuff often caused trouble but do not
> understand this enough to fix it on my own.
>
>   
>> I know this problem is quite big and my explanation is probably not that
>> great neither, but still I hope that someone has done this before and
>> succeeded in his mission. If someone could send me some more information
>> about this, or a working smack.jar (if possible with source code) that
>> would be great!!
>>
>> All help is welcome ofcourse!
>>     
> If you are adventurous you might try the Cacao+OpenJDK solution for your
> device.
> That would give you OpenJDK class library plus Cacao as the VM.
>
> In order to build it you need to add the Jalimo SVN repo as an overlay
> to OE. Disable the strict md5sum checking for now, since the files
> mentioned in the overlay are not in OE's official checksum.ini .
>
> Regards
> Robert
>
>
>
>   
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


