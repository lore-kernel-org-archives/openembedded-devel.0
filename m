Received: from [195.238.6.171] (helo=mailrelay005.isp.belgacom.be)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jpa@mgb-tech.com>) id 1LSXFr-0005j0-S8
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jan 2009 14:48:27 +0100
X-Belgacom-Dynamic: yes
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtwEAJA/gUlbsllk/2dsb2JhbACBbso3hA4G
Received: from 100.89-178-91.adsl-dyn.isp.belgacom.be (HELO
	hermes.mgb-tech.com) ([91.178.89.100])
	by relay.skynet.be with ESMTP; 29 Jan 2009 14:40:41 +0100
Received: from [192.168.1.23] (gandalf.mgb-tech.com [192.168.1.23])
	by hermes.mgb-tech.com (Postfix) with ESMTP id 6AA43117FE2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2009 19:19:30 +0100 (CET)
Message-ID: <4981B266.6010501@mgb-tech.com>
Date: Thu, 29 Jan 2009 14:43:02 +0100
From: Jan Pannecoeck <jpa@mgb-tech.com>
User-Agent: Thunderbird 2.0.0.19 (Windows/20081209)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: GNU Classpath and the XMPP Smack API
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
X-List-Received-Date: Thu, 29 Jan 2009 13:48:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

No clue where the fire this question, but since I'm using OE with GNU 
Classpath and JamVM 1.5 I thought I could ask my question here... Since 
finding a solution for my problem is quite hard. And maybe someone who 
is reading this mailinglist has had this problem before.

As the subject is already telling you, I'm stuck trying to get the Smack 
API working on my embedded device. The Smack library is written to 
communicate using XMPP. I know already that smack is developed to work 
under the Java Sun library, and that using GNU Classpath could cause 
problems. But since they have managed to get it working at Android, with 
the GNU Classpath, I think that it should be possible to run it also on 
an OpenEmbedded device.

I've got the latest version of the smack.jar that was patched for the 
Android, but that still isn't working. I have had a bunch of different 
errors like:

- OEFException during the SSLSocket doHandshake method.
- KeyStoreException: jks during an SALSAuthentication

And now I'm having a "No response from the server" exception during the 
NonSASLAuthentication.authenticate method.

I know this problem is quite big and my explanation is probably not that 
great neither, but still I hope that someone has done this before and 
succeeded in his mission. If someone could send me some more information 
about this, or a working smack.jar (if possible with source code) that 
would be great!!

All help is welcome ofcourse!

Thanks in advance,
Jan Pannecoeck


