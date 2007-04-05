Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HZZmL-0003fi-72
	for openembedded-devel@openembedded.org; Thu, 05 Apr 2007 23:46:01 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l35Ljsox028673 for <openembedded-devel@openembedded.org>;
	Thu, 5 Apr 2007 23:45:55 +0200
Message-ID: <46156E12.9090002@dominion.kabel.utwente.nl>
Date: Thu, 05 Apr 2007 23:45:54 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1597775703.20070405182752@gmail.com>
	<46156BCD.6060407@whitby.id.au>
In-Reply-To: <46156BCD.6060407@whitby.id.au>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] Adding sanity to OE startup process
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
X-List-Received-Date: Thu, 05 Apr 2007 21:46:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> Paul Sokolovsky wrote:
>>   So, to start with, I'd like to propose to make it possible for boot
>> process to log to syslog. I have following in mind:
>>
>> 4. Make /etc/init.d/syslogd.sh start earlier so it could capture as
>> mush output as possible.
> 
> This is something that the syslog.file, syslog.buffer and syslog.network
> scripts in packages/slugos-init/files/initscripts try to do.  Syslog to
> buffer is started *as* *early* as possible.  Syslog to file is started
> as soon as filesystems are mounted, and Syslog to network is started as
> soon as the network is up.

Sounds pretty neat, does the buffer get flushed to file as well?

Speaking of the initsystem, can we make them more upstart/init-ng/system-du-jour friendly?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGFW4SMkyGM64RGpERAlAZAKC5eS8M6hegNb8m/foqaQWwr2BcbwCeLaBF
3gwAI3XSdLSk8h72HZcVHyA=
=u3vx
-----END PGP SIGNATURE-----


